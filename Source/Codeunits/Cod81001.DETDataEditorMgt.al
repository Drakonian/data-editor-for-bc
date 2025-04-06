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
     tabledata "Bank Account Statement Line" = RMID, tabledata "Change Log Entry" = RIMD, tabledata "Posted Approval Entry" = RIMD, tabledata "FA Register" = RIMD, tabledata "Post Value Entry to G/L" = RIMD;

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
        xRecRef.Open(TableNo);

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

    local procedure GetFieldNoFromName(TableNo: Integer;
FieldName: Text): Integer
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

            xRecRef.Open(TableNo);

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

    local procedure UpdateRecord(ValueAsTxt: Text; var RecRef: RecordRef; var xRecRef: RecordRef; var FieldRef: FieldRef; ImportOnFind: Enum "DET Import On Find"; IsRecordExist: Boolean;
                                                                                                                                            WithValidation: Boolean;
                                                                                                                                            IsLogEnabled: Boolean)
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

        if not IsLogEnabled then
            exit;

        if IsRecordExist and (ImportOnFind = ImportOnFind::Modify) then
            LogModify(RecRef.Number(), FieldRef.Number(), RecRef.RecordId(), xFieldRef, FieldRef, WithValidation);
    end;

    local procedure SaveRecord(var RecRef: RecordRef; ImportOnFind: Enum "DET Import On Find"; WithValidation: Boolean;
                                                                        IsRecordExist: Boolean; var Inserted: Integer; var Skipped: Integer; var Modified: Integer; IsLogEnabled: Boolean)
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
}