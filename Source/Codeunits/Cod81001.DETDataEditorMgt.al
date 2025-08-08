// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
codeunit 81001 "DET Data Editor Mgt."
{
    Permissions = tabledata "Vendor Ledger Entry" = RMID, tabledata "FA Ledger Entry" = RMID, tabledata "Job Ledger Entry" = RMID, tabledata "Item Ledger Entry" = RMID,
     tabledata "Res. Ledger Entry" = RMID, tabledata "Check Ledger Entry" = RMID, tabledata "Cust. Ledger Entry" = RMID, tabledata "Service Ledger Entry" = RMID,
     tabledata "Capacity Ledger Entry" = RMID, tabledata "Employee Ledger Entry" = RMID, tabledata "Warranty Ledger Entry" = RMID, tabledata "Maintenance Ledger Entry" = RMID,
     tabledata "Bank Account Ledger Entry" = RMID, tabledata "Ins. Coverage Ledger Entry" = RMID, tabledata "Payable Vendor Ledger Entry" = RMID, tabledata "Phys. Inventory Ledger Entry" = RMID,
     tabledata "Payable Employee Ledger Entry" = RMID, tabledata "Detailed Employee Ledger Entry" = RMID, tabledata "Detailed Cust. Ledg. Entry" = RMID, tabledata "Detailed Vendor Ledg. Entry" = RMID,
     tabledata "Sales Invoice Header" = RMID, tabledata "Sales Invoice Line" = RMID, tabledata "Sales Shipment Header" = RMID, tabledata "Sales Shipment Line" = RMID,
     tabledata "Sales Cr.Memo Header" = RMID, tabledata "Sales Cr.Memo Line" = RMID, tabledata "Purch. Cr. Memo Hdr." = RMID, tabledata "Purch. Cr. Memo Line" = RMID,
     tabledata "Purch. Inv. Header" = RMID, tabledata "Purch. Inv. Line" = RMID, tabledata "Purch. Rcpt. Header" = RMID, tabledata "Purch. Rcpt. Line" = RMID,
     tabledata "Purchase Header Archive" = RMID, tabledata "Sales Line Archive" = RMID, tabledata "Sales Header Archive" = RMID, tabledata "Purchase Line Archive" = RMID,
     tabledata "Sales Comment Line Archive" = RMID, tabledata "Purch. Comment Line Archive" = RMID, tabledata "Workflow Step Argument Archive" = RMID, tabledata "Workflow Record Change Archive" = RMID,
     tabledata "Workflow Step Instance Archive" = RMID, tabledata "G/L Entry" = RMID, tabledata "Approval Entry" = RMID, tabledata "Warehouse Entry" = RMID,
     tabledata "Value Entry" = RMID, tabledata "Item Register" = RMID, tabledata "G/L Register" = RIMD, tabledata "Vat Entry" = RMID, tabledata "Dimension Set Entry" = RIMD,
     tabledata "Service Invoice Header" = RMID, TableData "Service Cr.Memo Header" = RMID, TableData "Issued Reminder Header" = RMID, TableData "Issued Fin. Charge Memo Header" = RMID,
     tabledata "G/L Entry - VAT Entry Link" = RMID, tabledata "Item Application Entry" = RMID, tabledata "Item Application Entry History" = RMID,
     tabledata "Return Shipment Header" = RMID, tabledata "Return Shipment Line" = RMID, tabledata "Return Receipt Header" = RMID, tabledata "Return Receipt Line" = RMID,
     tabledata "Invt. Receipt Header" = RMID, tabledata "Invt. Receipt Line" = RMID, tabledata "Invt. Shipment Header" = RMID, tabledata "Invt. Shipment Line" = RMID,
     tabledata "Pstd. Phys. Invt. Record Hdr" = RMID, tabledata "Pstd. Phys. Invt. Record Line" = RMID, tabledata "Pstd. Phys. Invt. Order Hdr" = RMID, tabledata "Pstd. Phys. Invt. Order Line" = RMID,
     tabledata "Bank Account Statement Line" = RMID, tabledata "Change Log Entry" = RIMD, tabledata "Posted Approval Entry" = RIMD, tabledata "FA Register" = RIMD, tabledata "Post Value Entry to G/L" = RIMD,
     tabledata "Job Register" = RMID;

    procedure GetNewColumnValue(var RecRef: RecordRef; var FieldRefVar: FieldRef; var SourceRecordId: RecordId; var TempNameValueBuffer: Record "Name/Value Buffer" temporary; WithValidate: Boolean): Boolean
    var
        FieldRec: Record Field;
        DataEditorSetup: Record "DET Data Editor Setup";
        EditValue: page "DET Edit Value";
        NameValueLookup: Page "Name/Value Lookup";
        xRecRef: RecordRef;
        xFieldRefVar: FieldRef;
        OptionValue: Text;
        ListOfOptions: List of [Text];
        FieldNo: Integer;
        ResultVariant: Variant;
    begin
        if not RecRef.Get(SourceRecordId) then
            exit;

        if FieldRefVar.Class <> FieldClass::Normal then
            exit;

        if FieldRefVar.Type() = FieldRefVar.Type::Option then begin
            ListOfOptions := FieldRefVar.OptionCaption().Split(',');
            foreach OptionValue in ListOfOptions do
                NameValueLookup.AddItem(Format(FieldRefVar.GetEnumValueOrdinal(ListOfOptions.IndexOf(OptionValue))), CopyStr(OptionValue, 1, MaxStrLen(TempNameValueBuffer.Value)));
            NameValueLookup.Caption(FieldRefVar.Caption());
            NameValueLookup.Editable(false);
            NameValueLookup.LookupMode(true);
            if NameValueLookup.RunModal() <> Action::LookupOK then
                exit(false);
            NameValueLookup.GetRecord(TempNameValueBuffer);
            ResultVariant := TempNameValueBuffer.Name;
        end else begin
            FieldRec.get(RecRef.Number(), FieldRefVar.Number());
            EditValue.SetFieldInfo(FieldRec);
            EditValue.SetInitValue(FieldRefVar.Value());
            EditValue.Caption(FieldRefVar.Caption());
            EditValue.LookupMode(true);
            if not (EditValue.RunModal() in [Action::OK, Action::LookupOK]) then
                exit(false);
            EditValue.GetResult(ResultVariant);
        end;

        if IsFieldIsPartOfPK(RecRef, FieldRefVar) then begin
            xRecRef := RecRef.Duplicate();
            xFieldRefVar := RecRef.Field(FieldRefVar.Number());
            if FieldRefVar.Type() = FieldRefVar.Type::Option then begin
                Evaluate(FieldNo, TempNameValueBuffer.Name);
                ResultVariant := FieldNo;
            end;
            RenamePKField(RecRef, FieldRefVar, SourceRecordId, ResultVariant);
            if FieldRefVar.Type() = FieldRefVar.Type::Option then begin
                if WithValidate then
                    FieldRefVar.Validate(TempNameValueBuffer.Name)
                else
                    FieldRefVar.Value(TempNameValueBuffer.Name);
            end else
                if WithValidate then
                    FieldRefVar.Validate(ResultVariant)
                else
                    FieldRefVar.Value(ResultVariant);
            if DataEditorSetup.Get() then
                if DataEditorSetup."Enable Data Editor Log" then
                    LogRename(RecRef.Number(), FieldRefVar.Number(), RecRef.RecordId(), xFieldRefVar, FieldRefVar, true);
            exit(true);
        end;
        if WithValidate then
            FieldRefVar.Validate(ResultVariant)
        else
            FieldRefVar.Value(ResultVariant);
        exit(true);
    end;

    procedure IsFieldIsPartOfPK(var inRecRef: RecordRef; var FieldRefVar: FieldRef): Boolean
    var
        FieldRefVar2: FieldRef;
        KeyRefVar: KeyRef;
        ListOfPK: List of [Integer];
        KeyCount: Integer;
    begin
        KeyRefVar := inRecRef.KeyIndex(1);
        for KeyCount := 1 to KeyRefVar.FieldCount() do begin
            FieldRefVar2 := KeyRefVar.FieldIndex(KeyCount);
            ListOfPK.Add(FieldRefVar2.Number());
        end;
        if ListOfPK.Contains(FieldRefVar.Number()) then
            exit(true);
    end;

    procedure GetPKFieldNoListAsTxt(inRecRef: RecordRef) PKFieldNoList: List of [Text]
    var
        FieldRefVar2: FieldRef;
        KeyRefVar: KeyRef;
        KeyCount: Integer;
    begin
        KeyRefVar := inRecRef.KeyIndex(1);
        for KeyCount := 1 to KeyRefVar.FieldCount() do begin
            FieldRefVar2 := KeyRefVar.FieldIndex(KeyCount);
            PKFieldNoList.Add(Format(FieldRefVar2.Number()));
        end;
    end;

    local procedure FindxRecRef(var xRecRef: RecordRef; PKFieldNoValueDict: Dictionary of [Integer, Text]) IsFound: Boolean
    var
        FieldRefVar: FieldRef;
        ListOfFieldNo: List of [Integer];
        FieldNo: Integer;
    begin
        ListOfFieldNo := PKFieldNoValueDict.Keys();
        foreach FieldNo in ListOfFieldNo do begin
            FieldRefVar := xRecRef.Field(FieldNo);
            FieldRefVar.Value(TextValueAsVariant(FieldRefVar.Type, PKFieldNoValueDict.Get(FieldNo)));
        end;
        IsFound := xRecRef.Find();
    end;

    procedure RenamePKField(var inRecRef: RecordRef; var FieldRefVar: FieldRef; var SourceRecordId: RecordId; NewValueAsVariant: Variant)
    var
        SingleInstanceStorage: Codeunit "DET Single Instance Storage";
        RecordRefTemp: RecordRef;
        xRecRef: RecordRef;
        FieldRefVar2: FieldRef;
        xFieldRefVar: FieldRef;
        KeyRefVar: KeyRef;
        KeyCount: Integer;
        DictOfFieldKeyType: Dictionary of [Integer, Text];
        KeyValueIndexRelDict: Dictionary of [Integer, Text[2048]];
    begin
        KeyRefVar := inRecRef.KeyIndex(1);
        xRecRef := inRecRef.Duplicate();
        xFieldRefVar := xRecRef.Field(FieldRefVar.Number());
        for KeyCount := 1 to KeyRefVar.FieldCount() do begin
            FieldRefVar2 := KeyRefVar.FieldIndex(KeyCount);
            if FieldRefVar2.Number() <> FieldRefVar.Number() then
                if FieldRefVar2.Type() = FieldRefVar2.Type::Option then
                    KeyValueIndexRelDict.Add(KeyCount, Format(FieldRefVar2.OptionCaption().Split(',').IndexOf(FieldRefVar2.Value()) - 1))
                else
                    KeyValueIndexRelDict.Add(KeyCount, Format(FieldRefVar2.Value()))
            else
                KeyValueIndexRelDict.Add(KeyCount, Format(NewValueAsVariant));
            DictOfFieldKeyType.Add(KeyCount, Format(FieldRefVar2.Type));
        end;

        if BindSubscription(SingleInstanceStorage) then;

        RecordRefTemp := inRecRef.Duplicate();
        RecordRefTemp.Field(FieldRefVar.Number()).Value(TextValueAsVariant(FieldRefVar.Type(), Format(NewValueAsVariant)));

        case KeyValueIndexRelDict.Count() of
            1:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value());
            2:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value());
            3:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value()
                    );
            4:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value()
                    );
            5:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value()
                    );
            6:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value()
                    );
            7:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value()
                    );
            8:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value()
                    );
            9:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value()
                    );
            10:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value()
                    );
            11:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value()
                    );
            12:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value()
                    );
            13:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(13)).Value()
                    );
            14:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(13)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(14)).Value()
                    );
            15:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(13)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(14)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(15)).Value()
                    );
            else
                Error(RenamePKNotSuppErr);
        end;

        if UnbindSubscription(SingleInstanceStorage) then;
        SourceRecordId := inRecRef.RecordId();
    end;

    procedure ImportTable(WithValidation: Boolean)
    var
        TempBlob: Codeunit "Temp Blob";
        ImportExportDialog: Page "DET Import/Export Dialog";
        ImportOnFind: Enum "DET Import On Find";
        FileFormat: Enum "DET File Format";
        FileInStream: InStream;
        FileFilter: Text;
    begin
        ImportExportDialog.Caption('Import Dialog');
        ImportExportDialog.SetIsImport(true);
        if GuiAllowed() then
            if not (ImportExportDialog.RunModal() in [Action::OK, Action::LookupOK]) then
                exit;
        ImportOnFind := ImportExportDialog.GetImportOnFind();
        FileFormat := ImportExportDialog.GetFileFormat();

        case FileFormat of
            FileFormat::JSON:
                FileFilter := JSONFilterLbl;
            FileFormat::Excel:
                FileFilter := ExcelFilterLbl;
        end;

        TempBlob.CreateInStream(FileInStream, TextEncoding::UTF8);
        if not UploadIntoStream(FileFilter, FileInStream) then
            exit;

        case FileFormat of
            FileFormat::JSON:
                ImportJSON(FileInStream, ImportOnFind, WithValidation);
            FileFormat::Excel:
                ImportExcel(FileInStream, ImportOnFind, WithValidation);
        end;
    end;

    local procedure ImportExcel(var FileInStream: InStream; ImportOnFind: Enum "DET Import On Find"; WithValidation: Boolean)
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
        DataEditorSetup: Record "DET Data Editor Setup";
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRef: FieldRef;
        CellValueInStream: InStream;
        TableNo, ColumnCount, ColumnNumber : Integer;
        ColumnFieldNoDict: Dictionary of [Integer, Integer];
        PKColumnFieldNoDict: Dictionary of [Integer, Integer];
        PKFieldNoValueDict: Dictionary of [Integer, Text];
        ToChangeFieldNoList: List of [Integer];
        Skipped, Inserted, Modified : Integer;
        IsRecordExist, IsLogEnabled : Boolean;
        ResultMsg: TextBuilder;
        ValueAsTxt: Text;
        ErrorText: Text;
    begin
        TempExcelBuffer.GetSheetsNameListFromStream(FileInStream, TempNameValueBuffer);

        TempNameValueBuffer.SetRange(Value, 'Data');
        TempNameValueBuffer.FindFirst();

        if DataEditorSetup.Get() then
            IsLogEnabled := DataEditorSetup."Enable Data Editor Log";

        ClearLastError();
        ErrorText := TempExcelBuffer.OpenBookStream(FileInStream, TempNameValueBuffer.Value);
        if ErrorText <> '' then
            Error(ErrorText);

        TempExcelBuffer.ReadSheetContinous('Data', true);

        Evaluate(TableNo, TempExcelBuffer.GetValueByCellName('B1'));

        RecRef.Open(TableNo);
        RecRef.ReadIsolation := RecRef.ReadIsolation::ReadCommitted;

        xRecRef.Open(TableNo);
        xRecRef.ReadIsolation := xRecRef.ReadIsolation::ReadCommitted;

        TempExcelBuffer.SetRange("Row No.", 3);
        ColumnCount := TempExcelBuffer.Count();
        if TempExcelBuffer.FindSet() then
            repeat
                FieldRef := RecRef.Field(GetFieldNoFromName(TableNo, TempExcelBuffer."Cell Value as Text"));
                if IsFieldIsPartOfPK(RecRef, FieldRef) then
                    PKColumnFieldNoDict.Add(TempExcelBuffer."Column No.", FieldRef.Number());
                ToChangeFieldNoList.Add(FieldRef.Number);
            until TempExcelBuffer.Next() = 0;
        TempExcelBuffer.SetRange("Row No.");

        TempExcelBuffer.SetCurrentKey("Row No.", "Column No.");
        if TempExcelBuffer.FindSet() then begin
            repeat
                TempExcelBuffer.SetRange("Row No.", TempExcelBuffer."Row No.");
                Clear(IsRecordExist);
                Clear(PKFieldNoValueDict);

                RecRef.Init();

                if TempExcelBuffer."Row No." > 3 then begin
                    foreach ColumnNumber in PKColumnFieldNoDict.Keys() do begin
                        TempExcelBuffer.Get(TempExcelBuffer."Row No.", ColumnNumber);
                        PKFieldNoValueDict.Add(PKColumnFieldNoDict.Get(ColumnNumber), TempExcelBuffer."Cell Value as Text");
                    end;
                    TempExcelBuffer.FindFirst();
                    IsRecordExist := FindxRecRef(xRecRef, PKFieldNoValueDict);
                    if IsRecordExist then
                        InitUnchangedFields(RecRef, xRecRef, ToChangeFieldNoList);
                end;

                for ColumnNumber := 1 to ColumnCount do begin

                    Clear(ValueAsTxt);

                    if TempExcelBuffer.Get(TempExcelBuffer."Row No.", ColumnNumber) then begin
                        if TempExcelBuffer."Cell Value as Blob".HasValue() then begin
                            TempExcelBuffer.CalcFields("Cell Value as Blob");
                            TempExcelBuffer."Cell Value as Blob".CreateInStream(CellValueInStream, TextEncoding::Windows);
                            CellValueInStream.ReadText(ValueAsTxt);
                        end else
                            ValueAsTxt := TempExcelBuffer."Cell Value as Text";

                        if TempExcelBuffer."Row No." = 3 then begin
                            FieldRef := RecRef.Field(GetFieldNoFromName(TableNo, ValueAsTxt));
                            if (FieldRef.Class() = FieldClass::Normal) and (FieldRef.Type <> FieldType::MediaSet) then
                                ColumnFieldNoDict.Add(TempExcelBuffer."Column No.", FieldRef.Number());
                        end;
                    end else
                        ValueAsTxt := '';

                    if TempExcelBuffer."Row No." > 3 then
                        if ColumnFieldNoDict.ContainsKey(ColumnNumber) then begin
                            FieldRef := RecRef.Field(ColumnFieldNoDict.Get(ColumnNumber));
                            UpdateRecord(ValueAsTxt, RecRef, xRecRef, FieldRef, ImportOnFind, IsRecordExist, WithValidation, IsLogEnabled);
                        end;
                end;

                if TempExcelBuffer."Row No." > 3 then
                    SaveRecord(RecRef, ImportOnFind, WithValidation, IsRecordExist, Inserted, Skipped, Modified, IsLogEnabled);

                TempExcelBuffer.SetRange("Row No.");
            until TempExcelBuffer.Next() = 0;

            RecRef.Close();
            xRecRef.Close();
        end;

        ResultMsg.AppendLine(ImportFinishedLbl);
        ResultMsg.AppendLine(StrSubstNo(InsertedLbl, Inserted));
        ResultMsg.AppendLine(StrSubstNo(ModifiedLbl, Modified));
        ResultMsg.AppendLine(StrSubstNo(SkippedLbl, Skipped));

        if GuiAllowed() then
            Message(ResultMsg.ToText());
    end;

    local procedure GetFieldNoFromName(TableNo: Integer; FieldName: Text): Integer
    var
        FieldRec: Record Field;
    begin
        FieldRec.SetRange(TableNo, TableNo);
        FieldRec.SetRange(FieldName, FieldName);
        FieldRec.FindFirst();
        exit(FieldRec."No.");
    end;

    local procedure ImportJSON(var FileInStream: InStream; ImportOnFind: Enum "DET Import On Find"; WithValidation: Boolean)
    var
        DataEditorSetup: Record "DET Data Editor Setup";
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRef: FieldRef;
        JObject: JsonObject;
        JToken: JsonToken;
        JTokenField: JsonToken;
        JArray: JsonArray;
        ListOfTables: List of [Text];
        ListOfFields: List of [Text];
        ToChangeFieldNoList: List of [Integer];
        PKFieldNoList: List of [Text];
        PKFieldNoValueDict: Dictionary of [Integer, Text];
        TableNoAsTxt, FieldNoAsTxt : Text;
        TableNo, FieldNo : Integer;
        Skipped, Inserted, Modified : Integer;
        IsRecordExist, IsLogEnabled : Boolean;
        ResultMsg: TextBuilder;
    begin
        JObject.ReadFrom(FileInStream);

        if DataEditorSetup.Get() then
            IsLogEnabled := DataEditorSetup."Enable Data Editor Log";

        ListOfTables := JObject.Keys();
        foreach TableNoAsTxt in ListOfTables do begin
            JObject.Get(TableNoAsTxt, JToken);
            Evaluate(TableNo, TableNoAsTxt);
            Clear(RecRef);

            RecRef.Open(TableNo);
            RecRef.ReadIsolation := RecRef.ReadIsolation::ReadCommitted;

            xRecRef.Open(TableNo);
            xRecRef.ReadIsolation := xRecRef.ReadIsolation::ReadCommitted;

            JArray := JToken.AsArray();

            foreach JToken in JArray do begin
                Clear(IsRecordExist);
                Clear(PKFieldNoValueDict);

                RecRef.Init();
                ListOfFields := JToken.AsObject().Keys();

                PKFieldNoList := GetPKFieldNoListAsTxt(RecRef);
                foreach FieldNoAsTxt in PKFieldNoList do begin
                    JToken.AsObject().Get(FieldNoAsTxt, JTokenField);
                    Evaluate(FieldNo, FieldNoAsTxt);
                    PKFieldNoValueDict.Add(FieldNo, JTokenField.AsValue().AsText());
                end;
                ToChangeFieldNoList := ConvertListTextToListInteger(ListOfFields);
                IsRecordExist := FindxRecRef(xRecRef, PKFieldNoValueDict);
                if IsRecordExist then
                    InitUnchangedFields(RecRef, xRecRef, ToChangeFieldNoList);

                foreach FieldNoAsTxt in ListOfFields do begin
                    JToken.AsObject().Get(FieldNoAsTxt, JTokenField);
                    Evaluate(FieldNo, FieldNoAsTxt);
                    FieldRef := RecRef.Field(FieldNo);

                    UpdateRecord(JTokenField.AsValue().AsText(), RecRef, xRecRef, FieldRef, ImportOnFind, IsRecordExist, WithValidation, IsLogEnabled);
                end;

                SaveRecord(RecRef, ImportOnFind, WithValidation, IsRecordExist, Inserted, Skipped, Modified, IsLogEnabled);
            end;
            RecRef.Close();
            xRecRef.Close();
        end;

        ResultMsg.AppendLine(ImportFinishedLbl);
        ResultMsg.AppendLine(StrSubstNo(InsertedLbl, Inserted));
        ResultMsg.AppendLine(StrSubstNo(ModifiedLbl, Modified));
        ResultMsg.AppendLine(StrSubstNo(SkippedLbl, Skipped));

        if GuiAllowed() then
            Message(ResultMsg.ToText());
    end;

    local procedure UpdateRecord(ValueAsTxt: Text; var RecRef: RecordRef; var xRecRef: RecordRef; var FieldRef: FieldRef; ImportOnFind: Enum "DET Import On Find"; IsRecordExist: Boolean; WithValidation: Boolean; IsLogEnabled: Boolean)
    var
        xFieldRef: FieldRef;
    begin
        if IsRecordExist and (ImportOnFind = ImportOnFind::Skip) then
            exit;

        if IsRecordExist then
            xFieldRef := xRecRef.Field(FieldRef.Number());

        if WithValidation then
            FieldRef.Validate(TextValueAsVariant(FieldRef.Type, ValueAsTxt))
        else
            FieldRef.Value(TextValueAsVariant(FieldRef.Type, ValueAsTxt));

        if not IsLogEnabled then
            exit;

        if IsRecordExist and (ImportOnFind = ImportOnFind::Modify) then
            LogModify(RecRef.Number(), FieldRef.Number(), RecRef.RecordId(), xFieldRef, FieldRef, WithValidation);
    end;

    local procedure SaveRecord(var RecRef: RecordRef; ImportOnFind: Enum "DET Import On Find"; WithValidation: Boolean; IsRecordExist: Boolean; var Inserted: Integer; var Skipped: Integer; var Modified: Integer; IsLogEnabled: Boolean)
    begin
        case ImportOnFind of
            ImportOnFind::Error:
                begin
                    RecRef.Insert(WithValidation);
                    if IsLogEnabled then
                        LogInsert(RecRef.Number(), RecRef.RecordId(), WithValidation);
                    Inserted += 1;
                end;
            ImportOnFind::Skip:
                if IsRecordExist then
                    Skipped += 1
                else begin
                    RecRef.Insert(WithValidation);
                    if IsLogEnabled then
                        LogInsert(RecRef.Number(), RecRef.RecordId(), WithValidation);
                    Inserted += 1;
                end;
            ImportOnFind::Modify:
                if IsRecordExist then begin
                    RecRef.Modify(WithValidation);
                    Modified += 1
                end else begin
                    RecRef.Insert(WithValidation);
                    if IsLogEnabled then
                        LogInsert(RecRef.Number(), RecRef.RecordId(), WithValidation);
                    Inserted += 1;
                end;
        end;
    end;

    local procedure InitUnchangedFields(var RecRef: RecordRef; xRecRef: RecordRef; ToChangeFieldNoList: List of [Integer])
    var
        FieldRefVar: FieldRef;
        xFieldRefVar: FieldRef;
        i: Integer;
    begin
        for i := 1 to RecRef.FieldCount() do begin
            FieldRefVar := RecRef.FieldIndex(i);
            if not ToChangeFieldNoList.Contains(FieldRefVar.Number()) then begin
                xFieldRefVar := xRecRef.Field(FieldRefVar.Number());
                FieldRefVar.Value(xFieldRefVar.Value());
            end;
        end;
    end;

    procedure ExportTable(var DataEditorBuffer: Record "DET Data Editor Buffer"; FieldIdsToExport: List of [Integer])
    var
        ImportExportDialog: Page "DET Import/Export Dialog";
        FileFormat: Enum "DET File Format";
        ExportBLOB, ExportMedia : Boolean;
    begin
        if DataEditorBuffer.IsEmpty() then
            exit;

        ImportExportDialog.Caption('Export Dialog');
        if not (ImportExportDialog.RunModal() in [Action::OK, Action::LookupOK]) then
            exit;
        FileFormat := ImportExportDialog.GetFileFormat();
        ExportBLOB := ImportExportDialog.GetExportBLOB();
        ExportMedia := ImportExportDialog.GetExportMedia();

        case FileFormat of
            FileFormat::JSON:
                ExportJSON(DataEditorBuffer, FieldIdsToExport, ExportBLOB, ExportMedia);
            FileFormat::Excel:
                ExportExcel(DataEditorBuffer, FieldIdsToExport, ExportBLOB, ExportMedia);
        end;
    end;

    local procedure ExportExcel(var DataEditorBuffer: Record "DET Data Editor Buffer"; FieldIdsToExport: List of [Integer]; ExportBLOB: Boolean; ExportMedia: Boolean)
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        InStreamVar: InStream;
        OutStreamVar: OutStream;
        FileName: Text;
    begin
        if DataEditorBuffer.FindSet() then begin
            RecRef.Open(DataEditorBuffer."Source Record ID".TableNo());
            RecRef.ReadIsolation := RecRef.ReadIsolation::ReadCommitted;

            CreateExcelHeader(RecRef, TempExcelBuffer, FieldIdsToExport, ExportBLOB, ExportMedia);

            repeat
                RecRef.Get(DataEditorBuffer."Source Record ID");
                CreateExcelRow(RecRef, TempExcelBuffer, FieldIdsToExport, ExportBLOB, ExportMedia);
            until DataEditorBuffer.Next() = 0;
        end;

        FileName := StrSubstNo(FileNameLbl, RecRef.Caption(),
            Format(CurrentDateTime, 0, '<Day,2>-<Month,2>-<Year>_<Hours24,2>.<Minutes,2>.<Seconds,2>'), 'xlsx');

        RecRef.Close();

        TempBlob.CreateInStream(InStreamVar);
        TempBlob.CreateOutStream(OutStreamVar);

        TempExcelBuffer.CreateNewBook('Data');
        TempExcelBuffer.WriteSheet('Data', CompanyName(), UserId());
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(FileName);
        TempExcelBuffer.SaveToStream(OutStreamVar, true);

        DownloadFromStream(InStreamVar, '', '', '', FileName);
    end;

    local procedure CreateExcelHeader(var RecRef: RecordRef; var TempExcelBuffer: Record "Excel Buffer" temporary; FieldIdsToExport: List of [Integer]; ExportBLOB: Boolean; ExportMedia: Boolean)
    var
        FieldRefVar: FieldRef;
        AddColumn: Boolean;
        i: Integer;
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Table Number', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(RecRef.Number(), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Table Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(RecRef.Name(), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();

        for i := 1 to RecRef.FieldCount() do begin
            FieldRefVar := RecRef.FieldIndex(i);
            if FieldIdsToExport.Contains(FieldRefVar.Number()) then begin
                AddColumn := ((FieldRefVar.Class = FieldClass::Normal) and
                             (FieldRefVar.Type <> FieldType::MediaSet));

                if AddColumn then
                    if ((FieldRefVar.Type = FieldType::Blob) and not ExportBLOB) or ((FieldRefVar.Type = FieldType::Media) and not ExportMedia) then
                        AddColumn := false;

                if AddColumn then
                    TempExcelBuffer.AddColumn(FieldRefVar.Name(), false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
            end;
        end;
    end;

    local procedure CreateExcelRow(var RecRef: RecordRef; var TempExcelBuffer: Record "Excel Buffer" temporary; FieldIdsToExport: List of [Integer]; ExportBLOB: Boolean; ExportMedia: Boolean)
    var
        TempBinaryDataBuffer: Record "DET Binary Data Buffer" temporary;
        TempBlob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        FieldRefVar: FieldRef;
        TxtBuilder: TextBuilder;
        DataAsInStream: InStream;
        DataAsOutStream: OutStream;
        i: Integer;
    begin
        TempExcelBuffer.NewRow();

        for i := 1 to RecRef.FieldCount() do begin
            Clear(TempBlob);
            Clear(FieldRefVar);
            Clear(DataAsInStream);
            Clear(TxtBuilder);
            FieldRefVar := RecRef.FieldIndex(i);
            if FieldIdsToExport.Contains(FieldRefVar.Number()) then
                if (FieldRefVar.Class = FieldClass::Normal) and (FieldRefVar.Type <> FieldType::MediaSet) then
                    case FieldRefVar.Type() of
                        FieldRefVar.Type::Option:
                            TempExcelBuffer.AddColumn(FieldRefVar.OptionCaption().Split(',').IndexOf(FieldRefVar.Value()) - 1,
                                false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                        FieldRefVar.Type::Integer, FieldRefVar.Type::BigInteger, FieldRefVar.Type::Decimal, FieldRefVar.Type::Boolean:
                            TempExcelBuffer.AddColumn(FieldRefVar.Value(), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                        FieldRefVar.Type::Time:
                            TempExcelBuffer.AddColumn(FieldRefVar.Value(), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Time);
                        FieldRefVar.Type::Media:
                            if ExportMedia then begin
                                TempBinaryDataBuffer."Some Media" := FieldRefVar.Value();
                                TempExcelBuffer.AddColumn('', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                                TempExcelBuffer."Cell Value as Blob".CreateOutStream(DataAsOutStream);
                                DataAsOutStream.Write(ConvertMediaToBase64(TempBinaryDataBuffer."Some Media".MediaId()));
                                TempExcelBuffer.Modify();
                            end;
                        FieldRefVar.Type::Blob:
                            if ExportBLOB then begin
                                FieldRefVar.CalcField();
                                TempBlob.FromFieldRef(FieldRefVar);
                                TempExcelBuffer.AddColumn('', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                                TempExcelBuffer."Cell Value as Blob".CreateOutStream(DataAsOutStream);
                                DataAsOutStream.Write(Base64Convert.ToBase64(TempBlob.CreateInStream()));
                                TempExcelBuffer.Modify();
                            end;
                        else
                            TempExcelBuffer.AddColumn(FieldRefVar.Value(), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    end;
        end;
    end;

    local procedure ExportJSON(var DataEditorBuffer: Record "DET Data Editor Buffer"; FieldIdsToExport: List of [Integer]; ExportBLOB: Boolean; ExportMedia: Boolean)
    var
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        JObjectRoot: JsonObject;
        JArray: JsonArray;
        InStreamVar: InStream;
        OutStreamVar: OutStream;
        FileName: Text;
    begin
        if DataEditorBuffer.FindSet() then begin
            RecRef.Open(DataEditorBuffer."Source Record ID".TableNo());
            RecRef.ReadIsolation := RecRef.ReadIsolation::ReadCommitted;
            repeat
                RecRef.Get(DataEditorBuffer."Source Record ID");
                JArray.Add(CreateJSONObjectFromRecord(RecRef, FieldIdsToExport, ExportBLOB, ExportMedia));
            until DataEditorBuffer.Next() = 0;
        end;

        JObjectRoot.Add(Format(RecRef.Number()), JArray);

        FileName := StrSubstNo(FileNameLbl, RecRef.Caption(),
            Format(CurrentDateTime, 0, '<Day,2>-<Month,2>-<Year>_<Hours24,2>.<Minutes,2>.<Seconds,2>'), 'json');

        RecRef.Close();

        TempBlob.CreateInStream(InStreamVar, TextEncoding::UTF8);
        TempBlob.CreateOutStream(OutStreamVar, TextEncoding::UTF8);
        JObjectRoot.WriteTo(OutStreamVar);
        DownloadFromStream(InStreamVar, '', '', '', FileName);
    end;

    local procedure CreateJSONObjectFromRecord(RecRef: RecordRef; FieldIdsToExport: List of [Integer]; ExportBLOB: Boolean; ExportMedia: Boolean) JObject: JsonObject
    var
        TempBinaryDataBuffer: Record "DET Binary Data Buffer" temporary;
        TempBlob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        FieldRefVar: FieldRef;
        BooleanValue: Boolean;
        i: Integer;
    begin
        for i := 1 to RecRef.FieldCount() do begin
            FieldRefVar := RecRef.FieldIndex(i);
            if FieldIdsToExport.Contains(FieldRefVar.Number()) then
                if (FieldRefVar.Class = FieldClass::Normal) and (FieldRefVar.Type <> FieldType::MediaSet) then
                    case FieldRefVar.Type() of
                        FieldRefVar.Type::Option:
                            JObject.Add(Format(FieldRefVar.Number()), FieldRefVar.OptionCaption().Split(',').IndexOf(FieldRefVar.Value()) - 1);
                        FieldRefVar.Type::Boolean:
                            begin
                                Evaluate(BooleanValue, format(FieldRefVar.Value, 0, 9));
                                JObject.Add(Format(FieldRefVar.Number()), BooleanValue);
                            end;
                        else
                            case FieldRefVar.Type of
                                FieldRefVar.Type::Media:
                                    if ExportMedia then begin
                                        TempBinaryDataBuffer."Some Media" := FieldRefVar.Value();
                                        JObject.Add(Format(FieldRefVar.Number()), ConvertMediaToBase64(TempBinaryDataBuffer."Some Media".MediaId()));
                                    end;
                                FieldRefVar.Type::Blob:
                                    if ExportBLOB then begin
                                        FieldRefVar.CalcField();
                                        TempBlob.FromFieldRef(FieldRefVar);
                                        JObject.Add(Format(FieldRefVar.Number()), Base64Convert.ToBase64(TempBlob.CreateInStream()));
                                    end;
                                else
                                    JObject.Add(Format(FieldRefVar.Number()), Format(FieldRefVar.Value));
                            end;
                    end;
        end;
    end;

    procedure LogInsert(TableNo: Integer; SourceRecordId: RecordId; WithValidation: Boolean)
    var
        OldValue: FieldRef;
        NewValue: FieldRef;
    begin
        Log(Enum::"DET Log Action Type"::Insert, SourceRecordId, TableNo, 0, OldValue, NewValue, WithValidation, false);
    end;

    procedure LogDelete(TableNo: Integer; SourceRecordId: RecordId; WithValidation: Boolean)
    var
        OldValue: FieldRef;
        NewValue: FieldRef;
    begin
        Log(Enum::"DET Log Action Type"::Delete, SourceRecordId, TableNo, 0, OldValue, NewValue, WithValidation, false);
    end;

    procedure LogModify(TableNo: Integer; FieldNo: Integer; SourceRecordId: RecordId; OldValue: FieldRef; NewValue: FieldRef; WithValidation: Boolean)
    begin
        Log(Enum::"DET Log Action Type"::Modify, SourceRecordId, TableNo, FieldNo, OldValue, NewValue, WithValidation, true);
    end;

    procedure LogRename(TableNo: Integer; FieldNo: Integer; SourceRecordId: RecordId; OldValue: FieldRef; NewValue: FieldRef; WithValidation: Boolean)
    begin
        Log(Enum::"DET Log Action Type"::Rename, SourceRecordId, TableNo, FieldNo, OldValue, NewValue, WithValidation, true);
    end;

    procedure Log(ActionType: Enum "DET Log Action Type"; SourceRecordId: RecordId;
                                  TableNo: Integer;
                                  FieldNo: Integer;
                                  OldValue: FieldRef;
                                  NewValue: FieldRef;
                                  WithValidation: Boolean;
                                  HasValues: Boolean)
    var
        DataEditorLog: Record "DET Data Editor Log";
    begin
        if HasValues then begin
            if (OldValue.Class() = FieldClass::FlowField) or (OldValue.Type() = FieldType::Blob) then
                OldValue.CalcField();

            if (NewValue.Class() = FieldClass::FlowField) or (NewValue.Type() = FieldType::Blob) then
                NewValue.CalcField();
        end;

        if not NumberSequence.Exists(LogNumberSequenceLbl) then
            NumberSequence.Insert(LogNumberSequenceLbl);

        DataEditorLog.Init();
        DataEditorLog."Entry No." := NumberSequence.Next(LogNumberSequenceLbl) + 1;
        DataEditorLog."Action Type" := ActionType;
        DataEditorLog."Record Id" := SourceRecordId;
        DataEditorLog."Table No." := TableNo;
        DataEditorLog."Field No." := FieldNo;
        DataEditorLog."With Validation" := WithValidation;
        if HasValues then begin
            DataEditorLog."New Value" := CopyStr(Format(NewValue.Value()), 1, MaxStrLen(DataEditorLog."New Value"));
            DataEditorLog."Old Value" := CopyStr(Format(OldValue.Value()), 1, MaxStrLen(DataEditorLog."Old Value"));
        end;
        DataEditorLog.Insert(true);

        if not HasValues then
            exit;

        if OldValue.Type() = FieldType::Blob then
            DataEditorLog."Old Value BLOB" := OldValue.Value()
        else
            DataEditorLog.SetBLOBTextData(DataEditorLog.FieldNo("Old Value BLOB"), Format(OldValue.Value()), TextEncoding::UTF8);

        if NewValue.Type() = FieldType::Blob then
            DataEditorLog."New Value BLOB" := NewValue.Value()
        else
            DataEditorLog.SetBLOBTextData(DataEditorLog.FieldNo("New Value BLOB"), Format(NewValue.Value()), TextEncoding::UTF8);
    end;

    procedure TextValueAsVariant(FieldTypeVar: FieldType; ValueAsText: Text): Variant
    var
        TempBinaryDataBuffer: Record "DET Binary Data Buffer" temporary;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        DateFormulaValue: DateFormula;
        IntegerValue: Integer;
        DecimalValue: Decimal;
        BooleanValue: Boolean;
        DateValue: Date;
        DateTimeValue: DateTime;
        TimeValue: Time;
        GuidValue: Guid;
        BigIntegerValue: BigInteger;
        ValueOutStream: OutStream;
        ValueInStream: InStream;
    begin
        case FieldTypeVar of
            FieldTypeVar::Code, FieldTypeVar::Text:
                exit(ValueAsText);
            FieldTypeVar::Integer:
                begin
                    Evaluate(IntegerValue, ValueAsText);
                    exit(IntegerValue);
                end;
            FieldTypeVar::Decimal:
                begin
                    Evaluate(DecimalValue, ValueAsText);
                    exit(DecimalValue);
                end;
            FieldTypeVar::Boolean:
                begin
                    Evaluate(BooleanValue, ValueAsText);
                    exit(BooleanValue);
                end;
            FieldTypeVar::Date:
                begin
                    Evaluate(DateValue, ValueAsText);
                    exit(DateValue);
                end;
            FieldTypeVar::DateFormula:
                begin
                    Evaluate(DateFormulaValue, ValueAsText);
                    exit(DateFormulaValue);
                end;
            FieldTypeVar::DateTime:
                begin
                    Evaluate(DateTimeValue, ValueAsText);
                    exit(DateTimeValue);
                end;
            FieldTypeVar::Time:
                begin
                    Evaluate(TimeValue, ValueAsText);
                    exit(TimeValue);
                end;
            FieldTypeVar::Guid:
                begin
                    Evaluate(GuidValue, ValueAsText);
                    exit(GuidValue);
                end;
            FieldTypeVar::BigInteger:
                begin
                    Evaluate(BigIntegerValue, ValueAsText);
                    exit(BigIntegerValue);
                end;
            FieldTypeVar::Option:
                begin
                    Evaluate(IntegerValue, ValueAsText);
                    exit(IntegerValue);
                end;
            FieldTypeVar::Blob:
                begin
                    TempBinaryDataBuffer."Some BLOB".CreateOutStream(ValueOutStream);
                    Base64Convert.FromBase64(ValueAsText, ValueOutStream);
                    exit(TempBinaryDataBuffer."Some BLOB");
                end;
            FieldTypeVar::Media:
                begin
                    TempBlob.CreateOutStream(ValueOutStream);
                    Base64Convert.FromBase64(ValueAsText, ValueOutStream);
                    TempBlob.CreateInStream(ValueInStream);
                    TempBinaryDataBuffer."Some Media".ImportStream(ValueInStream, '');
                    exit(TempBinaryDataBuffer."Some Media");
                end;
            else
                exit(ValueAsText);
        end;
    end;

    procedure TestTableEditable(TableNo: Integer)
    begin
        if TableNo in [Database::"DET Data Editor Setup", Database::"DET Data Editor Log"] then
            Error(TableNotEditableErr);
    end;

    procedure ConvertMediaToBase64(MediaId: Guid) MediaBase64: Text
    var
        TenantMedia: Record "Tenant Media";
        Base64Convert: Codeunit "Base64 Convert";
        MediaInStream: InStream;
    begin
        TenantMedia.Get(MediaId);
        TenantMedia.CalcFields(Content);
        TenantMedia.Content.CreateInStream(MediaInStream);
        MediaBase64 := Base64Convert.ToBase64(MediaInStream);
        exit(MediaBase64);
    end;

    procedure ConvertListTextToListInteger(ListOfText: List of [Text]) ListOfInteger: List of [Integer]
    var
        EntryAsTxt: Text;
        EntryAsInteger: Integer;
    begin
        foreach EntryAsTxt in ListOfText do
            if Evaluate(EntryAsInteger, EntryAsTxt) then
                ListOfInteger.Add(EntryAsInteger);
    end;

    procedure ConvertIntegerListToText(ListToConvert: List of [Integer]; Separator: Text) Response: Text
    var
        Entry: Integer;
    begin
        foreach Entry in ListToConvert do
            if Response = '' then
                Response := Format(Entry)
            else
                Response += Separator + Format(Entry);
    end;

    procedure SplitTextIntoChunks(TextToSplit: Text; ChunkSize: Integer) Result: List of [text]
    var
        Chunk: Text;
        Position: Integer;
    begin
        if TextToSplit = '' then
            exit;

        if StrLen(TextToSplit) <= ChunkSize then begin
            Result.Add(TextToSplit);
            exit;
        end;

        Position := 1;
        while Position <= StrLen(TextToSplit) do begin
            Chunk := CopyStr(TextToSplit, Position, ChunkSize);
            Result.Add(Chunk);
            Position += ChunkSize;
        end;
    end;

    procedure ReadRecord(var TempDataEditorBuffer: Record "DET Data Editor Buffer" temporary; JObject: JsonObject; NumberOfThreads: Integer; TotalRecordCount: Integer) ActiveSessionId: Integer
    var
        OutStreamToProcess: OutStream;
    begin
        if not TempDataEditorBuffer.Get(0) then begin
            TempDataEditorBuffer.Init();
            TempDataEditorBuffer."Entry No." := 0;
            TempDataEditorBuffer."Data To Process".CreateOutStream(OutStreamToProcess, TextEncoding::UTF8);
            JObject.WriteTo(OutStreamToProcess);
            TempDataEditorBuffer.Insert();
        end else begin
            TempDataEditorBuffer."Data To Process".CreateOutStream(OutStreamToProcess, TextEncoding::UTF8);
            JObject.WriteTo(OutStreamToProcess);
            TempDataEditorBuffer.Modify();
        end;

        TempDataEditorBuffer.CalcFields("Data To Process");

        //There is no point to run process in background session if there is only 1 thread or small amount of records
        if (NumberOfThreads > 1) and (TotalRecordCount > 500) then
            StartSession(ActiveSessionId, Codeunit::"DET Read Data Batch", CompanyName(), TempDataEditorBuffer)
        else
            Codeunit.Run(Codeunit::"DET Read Data Batch", TempDataEditorBuffer);
    end;

    procedure MergeBufferData(var TempDataEditorBufferResult: Record "DET Data Editor Buffer" temporary;
        var TempDataEditorBuffer1: Record "DET Data Editor Buffer" temporary;
        var TempDataEditorBuffer2: Record "DET Data Editor Buffer" temporary;
        var TempDataEditorBuffer3: Record "DET Data Editor Buffer" temporary;
        var TempDataEditorBuffer4: Record "DET Data Editor Buffer" temporary;
        var TempDataEditorBuffer5: Record "DET Data Editor Buffer" temporary;
        var TempDataEditorBuffer6: Record "DET Data Editor Buffer" temporary;
        var TempDataEditorBuffer7: Record "DET Data Editor Buffer" temporary;
        var TempDataEditorBuffer8: Record "DET Data Editor Buffer" temporary)
    var
        PrevFilters: Text;
    begin
        PrevFilters := TempDataEditorBufferResult.GetView(false);
        TempDataEditorBufferResult.Reset();
        TempDataEditorBufferResult.DeleteAll();

        TempDataEditorBuffer1.SetFilter("Entry No.", '<>%1', 0);
        if TempDataEditorBuffer1.FindSet() then
            repeat
                TempDataEditorBufferResult.Init();
                TempDataEditorBufferResult := TempDataEditorBuffer1;
                TempDataEditorBufferResult.Insert();
            until TempDataEditorBuffer1.Next() = 0;

        TempDataEditorBuffer2.SetFilter("Entry No.", '<>%1', 0);
        if TempDataEditorBuffer2.FindSet() then
            repeat
                TempDataEditorBufferResult.Init();
                TempDataEditorBufferResult := TempDataEditorBuffer2;
                TempDataEditorBufferResult.Insert();
            until TempDataEditorBuffer2.Next() = 0;

        TempDataEditorBuffer3.SetFilter("Entry No.", '<>%1', 0);
        if TempDataEditorBuffer3.FindSet() then
            repeat
                TempDataEditorBufferResult.Init();
                TempDataEditorBufferResult := TempDataEditorBuffer3;
                TempDataEditorBufferResult.Insert();
            until TempDataEditorBuffer3.Next() = 0;

        TempDataEditorBuffer4.SetFilter("Entry No.", '<>%1', 0);
        if TempDataEditorBuffer4.FindSet() then
            repeat
                TempDataEditorBufferResult.Init();
                TempDataEditorBufferResult := TempDataEditorBuffer4;
                TempDataEditorBufferResult.Insert();
            until TempDataEditorBuffer4.Next() = 0;

        TempDataEditorBuffer5.SetFilter("Entry No.", '<>%1', 0);
        if TempDataEditorBuffer5.FindSet() then
            repeat
                TempDataEditorBufferResult.Init();
                TempDataEditorBufferResult := TempDataEditorBuffer5;
                TempDataEditorBufferResult.Insert();
            until TempDataEditorBuffer5.Next() = 0;

        TempDataEditorBuffer6.SetFilter("Entry No.", '<>%1', 0);
        if TempDataEditorBuffer6.FindSet() then
            repeat
                TempDataEditorBufferResult.Init();
                TempDataEditorBufferResult := TempDataEditorBuffer6;
                TempDataEditorBufferResult.Insert();
            until TempDataEditorBuffer6.Next() = 0;

        TempDataEditorBuffer7.SetFilter("Entry No.", '<>%1', 0);
        if TempDataEditorBuffer7.FindSet() then
            repeat
                TempDataEditorBufferResult.Init();
                TempDataEditorBufferResult := TempDataEditorBuffer7;
                TempDataEditorBufferResult.Insert();
            until TempDataEditorBuffer7.Next() = 0;

        TempDataEditorBuffer8.SetFilter("Entry No.", '<>%1', 0);
        if TempDataEditorBuffer8.FindSet() then
            repeat
                TempDataEditorBufferResult.Init();
                TempDataEditorBufferResult := TempDataEditorBuffer8;
                TempDataEditorBufferResult.Insert();
            until TempDataEditorBuffer8.Next() = 0;

        TempDataEditorBufferResult.SetView(PrevFilters);
    end;

    procedure IsSystemField(SourceFieldRef: FieldRef): Boolean
    var
        RecRef: RecordRef;
    begin
        exit(SourceFieldRef.Number() in [RecRef.SystemIdNo(), RecRef.SystemCreatedAtNo(),
            RecRef.SystemCreatedByNo(), RecRef.SystemModifiedAtNo(), RecRef.SystemModifiedByNo()]);
    end;

    procedure UpdateFieldByRecordIdFromText(SourceRecordId: RecordId; FieldNo: Integer; NewValueAsText: Text; WithValidation: Boolean; IsLogEnabled: Boolean)
    var
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRefVar: FieldRef;
        xFieldRefVar: FieldRef;
    begin
        if not RecRef.Get(SourceRecordId) then
            exit;

        xRecRef := RecRef.Duplicate();
        FieldRefVar := RecRef.Field(FieldNo);
        xFieldRefVar := xRecRef.Field(FieldNo);

        if IsFieldIsPartOfPK(RecRef, FieldRefVar) then begin
            RenamePKField(RecRef, FieldRefVar, SourceRecordId, NewValueAsText);
            if IsLogEnabled then
                LogRename(RecRef.Number(), FieldRefVar.Number(), RecRef.RecordId(), xFieldRefVar, FieldRefVar, WithValidation);
            exit;
        end;

        if WithValidation then
            FieldRefVar.Validate(TextValueAsVariant(FieldRefVar.Type, NewValueAsText))
        else
            FieldRefVar.Value(TextValueAsVariant(FieldRefVar.Type, NewValueAsText));

        RecRef.Modify(WithValidation);

        if IsLogEnabled then
            LogModify(RecRef.Number(), FieldRefVar.Number(), RecRef.RecordId(), xFieldRefVar, FieldRefVar, WithValidation);
    end;

    procedure UpdateFieldByRecordIdFromVariant(SourceRecordId: RecordId; FieldNo: Integer; NewValue: Variant; WithValidation: Boolean; IsLogEnabled: Boolean)
    var
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRefVar: FieldRef;
        xFieldRefVar: FieldRef;
    begin
        if not RecRef.Get(SourceRecordId) then
            exit;

        xRecRef := RecRef.Duplicate();
        FieldRefVar := RecRef.Field(FieldNo);
        xFieldRefVar := xRecRef.Field(FieldNo);

        if IsFieldIsPartOfPK(RecRef, FieldRefVar) then begin
            RenamePKField(RecRef, FieldRefVar, SourceRecordId, NewValue);
            if IsLogEnabled then
                LogRename(RecRef.Number(), FieldRefVar.Number(), RecRef.RecordId(), xFieldRefVar, FieldRefVar, WithValidation);
            exit;
        end;

        if WithValidation then
            FieldRefVar.Validate(NewValue)
        else
            FieldRefVar.Value(NewValue);

        RecRef.Modify(WithValidation);

        if IsLogEnabled then
            LogModify(RecRef.Number(), FieldRefVar.Number(), RecRef.RecordId(), xFieldRefVar, FieldRefVar, WithValidation);
    end;

    procedure CopyFieldValueByRecordId(SourceRecordId: RecordId; FromFieldNo: Integer; ToFieldNo: Integer; WithValidation: Boolean; IsLogEnabled: Boolean)
    var
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FromFieldRef: FieldRef;
        ToFieldRef: FieldRef;
        xToFieldRef: FieldRef;
    begin
        if not RecRef.Get(SourceRecordId) then
            exit;

        xRecRef := RecRef.Duplicate();
        FromFieldRef := RecRef.Field(FromFieldNo);
        if FromFieldRef.Class() = FieldClass::FlowField then
            FromFieldRef.CalcField();
        ToFieldRef := RecRef.Field(ToFieldNo);
        xToFieldRef := xRecRef.Field(ToFieldNo);

        if WithValidation then
            ToFieldRef.Validate(FromFieldRef.Value())
        else
            ToFieldRef.Value(FromFieldRef.Value());

        RecRef.Modify(WithValidation);

        if IsLogEnabled then
            LogModify(RecRef.Number(), ToFieldRef.Number(), RecRef.RecordId(), xToFieldRef, ToFieldRef, WithValidation);
    end;

    procedure DeleteRecordByRecordId(SourceRecordId: RecordId; WithValidation: Boolean; IsLogEnabled: Boolean)
    var
        RecRef: RecordRef;
        TableNo: Integer;
    begin
        if not RecRef.Get(SourceRecordId) then
            exit;

        TableNo := RecRef.Number();
        RecRef.Delete(WithValidation);

        if IsLogEnabled then
            LogDelete(TableNo, SourceRecordId, WithValidation);
    end;

    procedure SetFieldValueOnRecRef(var RecRef: RecordRef; FieldNo: Integer; NewValue: Variant; WithValidation: Boolean)
    var
        FieldRefVar: FieldRef;
    begin
        FieldRefVar := RecRef.Field(FieldNo);
        if WithValidation then
            FieldRefVar.Validate(NewValue)
        else
            FieldRefVar.Value(NewValue);
    end;

    procedure InsertRecordFromRecRef(var RecRef: RecordRef; WithValidation: Boolean)
    begin
        RecRef.Insert(WithValidation);
    end;

    procedure GetRecordCount(TableNo: Integer; ViewText: Text) CountResult: Integer
    var
        RecRef: RecordRef;
    begin
        RecRef.Open(TableNo);
        if ViewText <> '' then
            RecRef.SetView(ViewText);
        RecRef.ReadIsolation := RecRef.ReadIsolation::ReadCommitted;
        CountResult := RecRef.Count();
    end;

    procedure GetAndApplyNewFieldValueByRecordId(SourceRecordId: RecordId; FieldNo: Integer; WithValidation: Boolean; IsLogEnabled: Boolean) NewValueAsText: Text
    var
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRefVar: FieldRef;
        xFieldRefVar: FieldRef;
    begin
        if not RecRef.Get(SourceRecordId) then
            exit('');

        xRecRef := RecRef.Duplicate();
        FieldRefVar := RecRef.Field(FieldNo);
        xFieldRefVar := xRecRef.Field(FieldNo);

        if IsSystemField(FieldRefVar) then
            exit('');

        if not GetNewColumnValue(RecRef, FieldRefVar, SourceRecordId, TempNameValueBuffer, WithValidation) then
            exit('');

        RecRef.Modify(WithValidation);

        if FieldRefVar.Type() = FieldRefVar.Type::Option then
            NewValueAsText := TempNameValueBuffer.Value
        else
            NewValueAsText := Format(FieldRefVar.Value());

        if IsLogEnabled then
            LogModify(RecRef.Number(), FieldRefVar.Number(), RecRef.RecordId(), xFieldRefVar, FieldRefVar, WithValidation);
    end;

    procedure RefreshBufferAfterInit(var TempDataEditorBufferRec: Record "DET Data Editor Buffer" temporary; TableNo: Integer; CustomTableView: Text; LoadFieldNoList: List of [Integer]; var InitLoadDateTime: DateTime)
    var
        ConfigProgressBar: Codeunit "Config. Progress Bar";
        TempDataEditorBufferRecRef: RecordRef;
        LocalRecRef: RecordRef;
        SystemModifiedAtFieldRef: FieldRef;
        LocalFieldRefVar: FieldRef;
        TempDataEditorBufferFieldRefVar: FieldRef;
        IsRecordCached: Boolean;
        FieldNumber: Integer;
        Counter: Integer;
        LastEntryNo: Integer;
        PrevView: Text;
    begin
        LocalRecRef.Open(TableNo);
        if CustomTableView <> '' then
            LocalRecRef.SetView(CustomTableView);
        LocalRecRef.ReadIsolation := LocalRecRef.ReadIsolation::ReadCommitted;

        TempDataEditorBufferRecRef.GetTable(TempDataEditorBufferRec);
        TempDataEditorBufferRecRef.FilterGroup(10);

        SystemModifiedAtFieldRef := LocalRecRef.Field(LocalRecRef.SystemModifiedAtNo());
        SystemModifiedAtFieldRef.SetFilter('>=%1', InitLoadDateTime);
        if LocalRecRef.FindSet() then begin
            PrevView := TempDataEditorBufferRec.GetView();
            TempDataEditorBufferRec.Reset();
            if TempDataEditorBufferRec.FindLast() then
                LastEntryNo := TempDataEditorBufferRec."Entry No.";
            if GuiAllowed() then
                ConfigProgressBar.Init(LocalRecRef.Count(), 1, LocalRecRef.Caption());
            repeat
                Counter := 0;

                TempDataEditorBufferFieldRefVar := TempDataEditorBufferRecRef.Field(TempDataEditorBufferRec.FieldNo("Source Record ID"));
                TempDataEditorBufferFieldRefVar.SetRange(LocalRecRef.RecordId());
                IsRecordCached := TempDataEditorBufferRecRef.FindFirst();

                if not IsRecordCached then begin
                    LastEntryNo += 1;
                    TempDataEditorBufferRecRef.Init();
                    TempDataEditorBufferFieldRefVar := TempDataEditorBufferRecRef.FieldIndex(1);
                    TempDataEditorBufferFieldRefVar.Value(LastEntryNo);
                    TempDataEditorBufferFieldRefVar := TempDataEditorBufferRecRef.FieldIndex(2);
                    TempDataEditorBufferFieldRefVar.Value(LocalRecRef.RecordId());
                end;

                foreach FieldNumber in LoadFieldNoList do begin
                    Counter += 1;
                    LocalFieldRefVar := LocalRecRef.Field(FieldNumber);

                    if LocalFieldRefVar.Class() = FieldClass::FlowField then
                        LocalFieldRefVar.CalcField();

                    TempDataEditorBufferFieldRefVar := TempDataEditorBufferRecRef.FieldIndex(Counter + 2);
                    TempDataEditorBufferFieldRefVar.Value(LocalFieldRefVar.Value());
                end;

                if IsRecordCached then
                    TempDataEditorBufferRecRef.Modify()
                else
                    TempDataEditorBufferRecRef.Insert();

                if GuiAllowed() then
                    ConfigProgressBar.UpdateCount(ProcessingLbl, 1);
            until LocalRecRef.Next() = 0;
            InitLoadDateTime := CurrentDateTime();

            if GuiAllowed() then
                ConfigProgressBar.Close();

            TempDataEditorBufferRec.SetView(PrevView);
            if TempDataEditorBufferRec.FindFirst() then;
        end;
    end;

    procedure RunReadDataBatch(var TempBufferRec: Record "DET Data Editor Buffer")
    var
        TempBlob: Codeunit "Temp Blob";
        ConfigProgressBar: Codeunit "Config. Progress Bar";
        RecRef: RecordRef;
        TempDataEditorBufferRecRef: RecordRef;
        FieldRefVar: FieldRef;
        FieldRefVar2: FieldRef;
        JObject: JsonObject;
        JToken: JsonToken;
        JObjectAsTxt: Text;
        StartIndex, EndIndex, TableNo, Counter, TotalCount, FieldNumber : Integer;
        IsParallelRun: Boolean;
        FilterView: Text;
        LoadFieldNoList: List of [Integer];
    begin
        TempBlob.FromRecord(TempBufferRec, TempBufferRec.FieldNo("Data To Process"));

        JObjectAsTxt := GetTempBlobAsTxt(TempBlob);
        JObject.ReadFrom(JObjectAsTxt);

        JObject.Get('StartIndex', JToken);
        StartIndex := JToken.AsValue().AsInteger();

        JObject.Get('EndIndex', JToken);
        EndIndex := JToken.AsValue().AsInteger();

        JObject.Get('FilterView', JToken);
        FilterView := JToken.AsValue().AsText();

        JObject.Get('TableNo', JToken);
        TableNo := JToken.AsValue().AsInteger();

        JObject.Get('FieldNumbersToRead', JToken);
        LoadFieldNoList := ConvertListTextToListInteger(JToken.AsValue().AsText().Split(','));

        JObject.Get('IsParallelRun', JToken);
        IsParallelRun := JToken.AsValue().AsBoolean();

        RecRef.Open(TableNo);
        RecRef.SetView(FilterView);
        RecRef.ReadIsolation := RecRef.ReadIsolation::ReadCommitted;
        InitLoadFields(RecRef, LoadFieldNoList);

        TempDataEditorBufferRecRef.GetTable(TempBufferRec);

        TotalCount := EndIndex - StartIndex + 1;

        if GuiAllowed() then
            ConfigProgressBar.Init(TotalCount, 1, RecRef.Caption());

        if StartIndex = 1 then
            RecRef.FindSet()
        else
            RecRef.Next(StartIndex);

        repeat
            Counter := 0;
            TempDataEditorBufferRecRef.Init();
            FieldRefVar2 := TempDataEditorBufferRecRef.FieldIndex(1);
            FieldRefVar2.Value(StartIndex);
            FieldRefVar2 := TempDataEditorBufferRecRef.FieldIndex(2);
            FieldRefVar2.Value(RecRef.RecordId());

            foreach FieldNumber in LoadFieldNoList do begin
                Counter += 1;
                FieldRefVar := RecRef.Field(FieldNumber);

                if FieldRefVar.Class() = FieldClass::FlowField then
                    FieldRefVar.CalcField();

                FieldRefVar2 := TempDataEditorBufferRecRef.FieldIndex(Counter + 2);
                FieldRefVar2.Value(FieldRefVar.Value());
            end;

            TempDataEditorBufferRecRef.Insert();
            StartIndex += 1;

            if GuiAllowed() then
                ConfigProgressBar.UpdateCount(StrSubstNo(ProgressStatusTxt, StartIndex, TotalCount), StartIndex - 1);
        until (RecRef.Next() = 0) or (StartIndex > EndIndex);

        if GuiAllowed() then
            ConfigProgressBar.Close();
    end;

    local procedure InitLoadFields(var inRecRef: RecordRef; FieldNoList: List of [Integer])
    begin
        TempLoadFieldNoList := FieldNoList;
        inRecRef.SetLoadFields(TryGetFieldNo(1), TryGetFieldNo(2), TryGetFieldNo(3), TryGetFieldNo(4), TryGetFieldNo(5), TryGetFieldNo(6),
            TryGetFieldNo(7), TryGetFieldNo(8), TryGetFieldNo(9), TryGetFieldNo(10), TryGetFieldNo(11), TryGetFieldNo(12), TryGetFieldNo(13),
            TryGetFieldNo(14), TryGetFieldNo(15), TryGetFieldNo(16), TryGetFieldNo(17), TryGetFieldNo(18), TryGetFieldNo(19), TryGetFieldNo(20),
            TryGetFieldNo(21), TryGetFieldNo(22), TryGetFieldNo(23), TryGetFieldNo(24), TryGetFieldNo(25), TryGetFieldNo(26), TryGetFieldNo(27),
            TryGetFieldNo(28), TryGetFieldNo(29), TryGetFieldNo(30), TryGetFieldNo(31), TryGetFieldNo(32), TryGetFieldNo(33), TryGetFieldNo(34),
            TryGetFieldNo(35), TryGetFieldNo(36), TryGetFieldNo(37), TryGetFieldNo(38), TryGetFieldNo(39), TryGetFieldNo(40), TryGetFieldNo(41),
            TryGetFieldNo(42), TryGetFieldNo(43), TryGetFieldNo(44), TryGetFieldNo(45), TryGetFieldNo(46), TryGetFieldNo(47), TryGetFieldNo(48),
            TryGetFieldNo(49), TryGetFieldNo(50), TryGetFieldNo(51), TryGetFieldNo(52), TryGetFieldNo(53), TryGetFieldNo(54), TryGetFieldNo(55),
            TryGetFieldNo(56), TryGetFieldNo(57), TryGetFieldNo(58), TryGetFieldNo(59), TryGetFieldNo(60), TryGetFieldNo(61), TryGetFieldNo(62),
            TryGetFieldNo(63), TryGetFieldNo(64), TryGetFieldNo(65), TryGetFieldNo(66), TryGetFieldNo(67), TryGetFieldNo(68), TryGetFieldNo(69),
            TryGetFieldNo(70), TryGetFieldNo(71), TryGetFieldNo(72), TryGetFieldNo(73), TryGetFieldNo(74), TryGetFieldNo(75), TryGetFieldNo(76),
            TryGetFieldNo(77), TryGetFieldNo(78), TryGetFieldNo(79), TryGetFieldNo(80), TryGetFieldNo(81), TryGetFieldNo(82), TryGetFieldNo(83),
            TryGetFieldNo(84), TryGetFieldNo(85), TryGetFieldNo(86), TryGetFieldNo(87), TryGetFieldNo(88), TryGetFieldNo(89), TryGetFieldNo(90),
            TryGetFieldNo(91), TryGetFieldNo(92), TryGetFieldNo(93), TryGetFieldNo(94), TryGetFieldNo(95), TryGetFieldNo(96), TryGetFieldNo(97),
            TryGetFieldNo(98), TryGetFieldNo(99), TryGetFieldNo(100), TryGetFieldNo(101), TryGetFieldNo(102), TryGetFieldNo(103), TryGetFieldNo(104),
            TryGetFieldNo(105), TryGetFieldNo(106), TryGetFieldNo(107), TryGetFieldNo(108), TryGetFieldNo(109), TryGetFieldNo(110), TryGetFieldNo(111),
            TryGetFieldNo(112), TryGetFieldNo(113), TryGetFieldNo(114), TryGetFieldNo(115), TryGetFieldNo(116), TryGetFieldNo(117), TryGetFieldNo(118),
            TryGetFieldNo(119), TryGetFieldNo(120), TryGetFieldNo(121), TryGetFieldNo(122), TryGetFieldNo(123), TryGetFieldNo(124), TryGetFieldNo(125),
            TryGetFieldNo(126), TryGetFieldNo(127), TryGetFieldNo(128), TryGetFieldNo(129), TryGetFieldNo(130), TryGetFieldNo(131), TryGetFieldNo(132),
            TryGetFieldNo(133), TryGetFieldNo(134), TryGetFieldNo(135), TryGetFieldNo(136), TryGetFieldNo(137), TryGetFieldNo(138), TryGetFieldNo(139),
            TryGetFieldNo(140), TryGetFieldNo(141), TryGetFieldNo(142), TryGetFieldNo(143), TryGetFieldNo(144), TryGetFieldNo(145), TryGetFieldNo(146),
            TryGetFieldNo(147), TryGetFieldNo(148), TryGetFieldNo(149), TryGetFieldNo(150), TryGetFieldNo(151), TryGetFieldNo(152), TryGetFieldNo(153),
            TryGetFieldNo(154), TryGetFieldNo(155), TryGetFieldNo(156), TryGetFieldNo(157), TryGetFieldNo(158), TryGetFieldNo(159), TryGetFieldNo(160),
            TryGetFieldNo(161), TryGetFieldNo(162), TryGetFieldNo(163), TryGetFieldNo(164), TryGetFieldNo(165), TryGetFieldNo(166), TryGetFieldNo(167),
            TryGetFieldNo(168), TryGetFieldNo(169), TryGetFieldNo(170), TryGetFieldNo(171), TryGetFieldNo(172), TryGetFieldNo(173), TryGetFieldNo(174),
            TryGetFieldNo(175), TryGetFieldNo(176), TryGetFieldNo(177), TryGetFieldNo(178), TryGetFieldNo(179), TryGetFieldNo(180), TryGetFieldNo(181),
            TryGetFieldNo(182), TryGetFieldNo(183), TryGetFieldNo(184), TryGetFieldNo(185), TryGetFieldNo(186), TryGetFieldNo(187), TryGetFieldNo(188),
            TryGetFieldNo(189), TryGetFieldNo(190), TryGetFieldNo(191), TryGetFieldNo(192), TryGetFieldNo(193), TryGetFieldNo(194), TryGetFieldNo(195),
            TryGetFieldNo(196), TryGetFieldNo(197), TryGetFieldNo(198), TryGetFieldNo(199), TryGetFieldNo(200), TryGetFieldNo(201), TryGetFieldNo(202),
            TryGetFieldNo(203), TryGetFieldNo(204), TryGetFieldNo(205), TryGetFieldNo(206), TryGetFieldNo(207), TryGetFieldNo(208), TryGetFieldNo(209),
            TryGetFieldNo(210), TryGetFieldNo(211), TryGetFieldNo(212), TryGetFieldNo(213), TryGetFieldNo(214), TryGetFieldNo(215), TryGetFieldNo(216),
            TryGetFieldNo(217), TryGetFieldNo(218), TryGetFieldNo(219), TryGetFieldNo(220), TryGetFieldNo(221), TryGetFieldNo(222), TryGetFieldNo(223),
            TryGetFieldNo(224), TryGetFieldNo(225), TryGetFieldNo(226), TryGetFieldNo(227), TryGetFieldNo(228), TryGetFieldNo(229), TryGetFieldNo(230),
            TryGetFieldNo(231), TryGetFieldNo(232), TryGetFieldNo(233), TryGetFieldNo(234), TryGetFieldNo(235), TryGetFieldNo(236), TryGetFieldNo(237),
            TryGetFieldNo(238), TryGetFieldNo(239), TryGetFieldNo(240), TryGetFieldNo(241), TryGetFieldNo(242), TryGetFieldNo(243), TryGetFieldNo(244),
            TryGetFieldNo(245), TryGetFieldNo(246), TryGetFieldNo(247), TryGetFieldNo(248), TryGetFieldNo(249), TryGetFieldNo(250), TryGetFieldNo(251),
            TryGetFieldNo(252), TryGetFieldNo(253), TryGetFieldNo(254), TryGetFieldNo(255), TryGetFieldNo(256), TryGetFieldNo(257), TryGetFieldNo(258),
            TryGetFieldNo(259), TryGetFieldNo(260), TryGetFieldNo(261), TryGetFieldNo(262), TryGetFieldNo(263), TryGetFieldNo(264), TryGetFieldNo(265),
            TryGetFieldNo(266), TryGetFieldNo(267), TryGetFieldNo(268), TryGetFieldNo(269), TryGetFieldNo(270), TryGetFieldNo(271), TryGetFieldNo(272),
            TryGetFieldNo(273), TryGetFieldNo(274), TryGetFieldNo(275), TryGetFieldNo(276), TryGetFieldNo(277), TryGetFieldNo(278), TryGetFieldNo(279),
            TryGetFieldNo(280), TryGetFieldNo(281), TryGetFieldNo(282), TryGetFieldNo(283), TryGetFieldNo(284), TryGetFieldNo(285), TryGetFieldNo(286),
            TryGetFieldNo(287), TryGetFieldNo(288), TryGetFieldNo(289), TryGetFieldNo(290), TryGetFieldNo(291), TryGetFieldNo(292), TryGetFieldNo(293),
            TryGetFieldNo(294), TryGetFieldNo(295), TryGetFieldNo(296), TryGetFieldNo(297), TryGetFieldNo(298), TryGetFieldNo(299), TryGetFieldNo(300),
            TryGetFieldNo(301), TryGetFieldNo(302), TryGetFieldNo(303), TryGetFieldNo(304), TryGetFieldNo(305), TryGetFieldNo(306), TryGetFieldNo(307),
            TryGetFieldNo(308), TryGetFieldNo(309), TryGetFieldNo(310), TryGetFieldNo(311), TryGetFieldNo(312), TryGetFieldNo(313), TryGetFieldNo(314),
            TryGetFieldNo(315), TryGetFieldNo(316), TryGetFieldNo(317), TryGetFieldNo(318), TryGetFieldNo(319), TryGetFieldNo(320), TryGetFieldNo(321),
            TryGetFieldNo(322), TryGetFieldNo(323), TryGetFieldNo(324), TryGetFieldNo(325), TryGetFieldNo(326), TryGetFieldNo(327), TryGetFieldNo(328),
            TryGetFieldNo(329), TryGetFieldNo(330), TryGetFieldNo(331), TryGetFieldNo(332), TryGetFieldNo(333), TryGetFieldNo(334), TryGetFieldNo(335),
            TryGetFieldNo(336), TryGetFieldNo(337), TryGetFieldNo(338), TryGetFieldNo(339), TryGetFieldNo(340), TryGetFieldNo(341), TryGetFieldNo(342),
            TryGetFieldNo(343), TryGetFieldNo(344), TryGetFieldNo(345), TryGetFieldNo(346), TryGetFieldNo(347), TryGetFieldNo(348), TryGetFieldNo(349),
            TryGetFieldNo(350), TryGetFieldNo(351), TryGetFieldNo(352), TryGetFieldNo(353), TryGetFieldNo(354), TryGetFieldNo(355), TryGetFieldNo(356),
            TryGetFieldNo(357), TryGetFieldNo(358), TryGetFieldNo(359), TryGetFieldNo(360), TryGetFieldNo(361), TryGetFieldNo(362), TryGetFieldNo(363),
            TryGetFieldNo(364), TryGetFieldNo(365), TryGetFieldNo(366), TryGetFieldNo(367), TryGetFieldNo(368), TryGetFieldNo(369), TryGetFieldNo(370),
            TryGetFieldNo(371), TryGetFieldNo(372), TryGetFieldNo(373), TryGetFieldNo(374), TryGetFieldNo(375), TryGetFieldNo(376), TryGetFieldNo(377),
            TryGetFieldNo(378), TryGetFieldNo(379), TryGetFieldNo(380), TryGetFieldNo(381), TryGetFieldNo(382), TryGetFieldNo(383), TryGetFieldNo(384),
            TryGetFieldNo(385), TryGetFieldNo(386), TryGetFieldNo(387), TryGetFieldNo(388), TryGetFieldNo(389), TryGetFieldNo(390), TryGetFieldNo(391),
            TryGetFieldNo(392), TryGetFieldNo(393), TryGetFieldNo(394), TryGetFieldNo(395), TryGetFieldNo(396), TryGetFieldNo(397), TryGetFieldNo(398),
            TryGetFieldNo(399), TryGetFieldNo(400));
    end;

    local procedure TryGetFieldNo(Index: Integer): Integer
    begin
        if TempLoadFieldNoList.Count() < Index then
            exit(0);
        exit(TempLoadFieldNoList.Get(Index));
    end;

    local procedure GetTempBlobAsTxt(var TempBlob: Codeunit "Temp Blob") Response: Text
    var
        ValueInStream: InStream;
        BufferTxt: Text;
    begin
        TempBlob.CreateInStream(ValueInStream, TextEncoding::UTF8);
        while not ValueInStream.EOS() do begin
            ValueInStream.Read(BufferTxt);
            Response += BufferTxt;
        end;
    end;

    var
        RenamePKNotSuppErr: Label 'Changing the primary key for >15 values is not supported.';
        ImportFinishedLbl: Label 'Import is finished.';
        InsertedLbl: Label 'Inserted: %1', Comment = '%1 = Inserted record count';
        ModifiedLbl: Label 'Modified: %1', Comment = '%1 = Modified record count';
        SkippedLbl: Label 'Skipped: %1', Comment = '%1 = Skipped record count';
        LogNumberSequenceLbl: Label 'DETNSqwerty', Locked = true;
        FileNameLbl: Label '%1_%2.%3', Locked = true;
        JSONFilterLbl: Label 'JSON files (*.json, *.txt)|*.json;*.txt', Locked = true;
        ExcelFilterLbl: Label 'Excel files (*.xlsx)|*.xlsx', Locked = true;
        TableNotEditableErr: Label 'This table is protected from editing.';
        TempLoadFieldNoList: List of [Integer];
        ProcessingLbl: Label 'Processing', Locked = true;
        ProgressStatusTxt: Label 'Processing %1 records out of %2', Comment = '%1 = current; %2 = total';
}