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
     tabledata "G/L Entry - VAT Entry Link" = RMID;

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
            ListOfOptions := FieldRefVar.OptionMembers().Split(',');
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
                    FieldRefVar.Validate(TempNameValueBuffer.Value)
                else
                    FieldRefVar.Value(TempNameValueBuffer.Value);
            end else
                if WithValidate then
                    FieldRefVar.Validate(format(ResultVariant))
                else
                    FieldRefVar.Value(format(ResultVariant));
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
                    KeyValueIndexRelDict.Add(KeyCount, Format(FieldRefVar2.OptionMembers().Split(',').IndexOf(FieldRefVar2.Value()) - 1))
                else
                    KeyValueIndexRelDict.Add(KeyCount, Format(FieldRefVar2.Value()))
            else
                KeyValueIndexRelDict.Add(KeyCount, Format(NewValueAsVariant));
            DictOfFieldKeyType.Add(KeyCount, Format(FieldRefVar2.Type));
        end;

        if BindSubscription(SingleInstanceStorage) then;

        RecordRefTemp := inRecRef.Duplicate();
        RecordRefTemp.Field(FieldRefVar.Number()).Value(NewValueAsVariant);

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
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRef: FieldRef;
        CellValueInStream: InStream;
        TableNo: Integer;
        ColumnFieldNoDict: Dictionary of [Integer, Integer];
        Skipped, Inserted, Modified : Integer;
        IsPKReady, IsRecordExist : Boolean;
        ResultMsg: TextBuilder;
        ValueAsTxt: Text;
        ErrorText: Text;
    begin
        TempExcelBuffer.GetSheetsNameListFromStream(FileInStream, TempNameValueBuffer);

        TempNameValueBuffer.SetRange(Value, 'Data');
        TempNameValueBuffer.FindFirst();

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

        TempExcelBuffer.SetCurrentKey("Row No.");
        if TempExcelBuffer.FindSet() then begin
            repeat
                TempExcelBuffer.SetRange("Row No.", TempExcelBuffer."Row No.");
                Clear(IsPKReady);
                Clear(IsRecordExist);

                RecRef.Init();

                repeat
                    Clear(ValueAsTxt);
                    if TempExcelBuffer."Cell Value as Blob".HasValue() then begin
                        TempExcelBuffer.CalcFields("Cell Value as Blob");
                        TempExcelBuffer."Cell Value as Blob".CreateInStream(CellValueInStream, TextEncoding::Windows);
                        CellValueInStream.ReadText(ValueAsTxt);
                    end else
                        ValueAsTxt := TempExcelBuffer."Cell Value as Text";

                    case true of
                        TempExcelBuffer."Row No." = 3:
                            begin
                                FieldRef := RecRef.Field(GetFieldNoFromName(TableNo, ValueAsTxt));
                                if FieldRef.Class() = FieldRef.Class() ::Normal then
                                    ColumnFieldNoDict.Add(TempExcelBuffer."Column No.", FieldRef.Number());
                            end;

                        TempExcelBuffer."Row No." > 3:
                            if ColumnFieldNoDict.ContainsKey(TempExcelBuffer."Column No.") then begin
                                FieldRef := RecRef.Field(ColumnFieldNoDict.Get(TempExcelBuffer."Column No."));
                                UpdateRecord(ValueAsTxt, RecRef, xRecRef, FieldRef, ImportOnFind, IsPKReady, IsRecordExist, WithValidation);
                            end;
                    end;
                until TempExcelBuffer.Next() = 0;

                if TempExcelBuffer."Row No." > 3 then
                    SaveRecord(RecRef, ImportOnFind, WithValidation, IsRecordExist, Inserted, Skipped, Modified);

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
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRef: FieldRef;
        JObject: JsonObject;
        JToken: JsonToken;
        JTokenField: JsonToken;
        JArray: JsonArray;
        ListOfTables: List of [Text];
        ListOfFields: List of [Text];
        TableNoAsTxt, FieldNoAsTxt : Text;
        TableNo, FieldNo : Integer;
        Skipped, Inserted, Modified : Integer;
        IsPKReady, IsRecordExist : Boolean;
        ResultMsg: TextBuilder;
    begin
        JObject.ReadFrom(FileInStream);

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
                Clear(IsPKReady);
                Clear(IsRecordExist);

                RecRef.Init();
                ListOfFields := JToken.AsObject().Keys();

                foreach FieldNoAsTxt in ListOfFields do begin
                    JToken.AsObject().Get(FieldNoAsTxt, JTokenField);
                    Evaluate(FieldNo, FieldNoAsTxt);
                    FieldRef := RecRef.Field(FieldNo);

                    UpdateRecord(JTokenField.AsValue().AsText(), RecRef, xRecRef, FieldRef, ImportOnFind, IsPKReady, IsRecordExist, WithValidation);
                end;

                SaveRecord(RecRef, ImportOnFind, WithValidation, IsRecordExist, Inserted, Skipped, Modified);
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

    local procedure UpdateRecord(ValueAsTxt: Text; var RecRef: RecordRef; var xRecRef: RecordRef; var FieldRef: FieldRef; ImportOnFind: Enum "DET Import On Find"; var IsPKReady: Boolean; var IsRecordExist: Boolean; WithValidation: Boolean)
    var
        xFieldRef: FieldRef;
    begin
        if not IsPKReady then
            if not IsFieldIsPartOfPK(RecRef, FieldRef) then begin
                IsRecordExist := xRecRef.Get(RecRef.RecordId());
                IsPKReady := true;
            end;

        if IsRecordExist and (ImportOnFind = ImportOnFind::Skip) then
            exit;

        if IsRecordExist then
            xFieldRef := xRecRef.Field(FieldRef.Number());

        if WithValidation then
            FieldRef.Validate(TextValueAsVariant(FieldRef.Type, CopyStr(ValueAsTxt, 1, 2048)))
        else
            FieldRef.Value(TextValueAsVariant(FieldRef.Type, CopyStr(ValueAsTxt, 1, 2048)));

        if IsRecordExist and (ImportOnFind = ImportOnFind::Modify) then
            LogModify(RecRef.Number(), FieldRef.Number(), RecRef.RecordId(), xFieldRef, FieldRef, WithValidation);
    end;

    local procedure SaveRecord(var RecRef: RecordRef; ImportOnFind: Enum "DET Import On Find"; WithValidation: Boolean; IsRecordExist: Boolean; var Inserted: Integer; var Skipped: Integer; var Modified: Integer)
    begin
        case ImportOnFind of
            ImportOnFind::Error:
                begin
                    RecRef.Insert(WithValidation);
                    LogInsert(RecRef.Number(), RecRef.RecordId(), WithValidation);
                    Inserted += 1;
                end;
            ImportOnFind::Skip:
                if IsRecordExist then
                    Skipped += 1
                else begin
                    RecRef.Insert(WithValidation);
                    LogInsert(RecRef.Number(), RecRef.RecordId(), WithValidation);
                    Inserted += 1;
                end;
            ImportOnFind::Modify:
                if IsRecordExist then begin
                    RecRef.Modify(WithValidation);
                    Modified += 1
                end else begin
                    RecRef.Insert(WithValidation);
                    LogInsert(RecRef.Number(), RecRef.RecordId(), WithValidation);
                    Inserted += 1;
                end;
        end;
    end;

    procedure ExportTable(var DataEditorBuffer: Record "DET Data Editor Buffer"; FieldIdsToExport: List of [Integer])
    var
        ImportExportDialog: Page "DET Import/Export Dialog";
        FileFormat: Enum "DET File Format";
    begin
        if DataEditorBuffer.IsEmpty() then
            exit;

        ImportExportDialog.Caption('Export Dialog');
        if not (ImportExportDialog.RunModal() in [Action::OK, Action::LookupOK]) then
            exit;
        FileFormat := ImportExportDialog.GetFileFormat();

        case FileFormat of
            FileFormat::JSON:
                ExportJSON(DataEditorBuffer, FieldIdsToExport);
            FileFormat::Excel:
                ExportExcel(DataEditorBuffer, FieldIdsToExport);
        end;
    end;

    local procedure ExportExcel(var DataEditorBuffer: Record "DET Data Editor Buffer"; FieldIdsToExport: List of [Integer])
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

            CreateExcelHeader(RecRef, TempExcelBuffer, FieldIdsToExport);

            repeat
                RecRef.Get(DataEditorBuffer."Source Record ID");
                CreateExcelRow(RecRef, TempExcelBuffer, FieldIdsToExport);
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

    local procedure CreateExcelHeader(var RecRef: RecordRef; var TempExcelBuffer: Record "Excel Buffer" temporary; FieldIdsToExport: List of [Integer])
    var
        FieldRefVar: FieldRef;
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
            if FieldIdsToExport.Contains(FieldRefVar.Number()) then
                if (FieldRefVar.Class = FieldClass::Normal) and not (FieldRefVar.Type in [FieldType::Blob, FieldType::Media, FieldType::MediaSet]) then
                    TempExcelBuffer.AddColumn(FieldRefVar.Name(), false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        end;
    end;

    local procedure CreateExcelRow(var RecRef: RecordRef; var TempExcelBuffer: Record "Excel Buffer" temporary; FieldIdsToExport: List of [Integer])
    var
        FieldRefVar: FieldRef;
        i: Integer;
    begin
        TempExcelBuffer.NewRow();

        for i := 1 to RecRef.FieldCount() do begin
            FieldRefVar := RecRef.FieldIndex(i);
            if FieldIdsToExport.Contains(FieldRefVar.Number()) then
                if (FieldRefVar.Class = FieldClass::Normal) and not (FieldRefVar.Type in [FieldType::Blob, FieldType::Media, FieldType::MediaSet]) then
                    case FieldRefVar.Type() of
                        FieldRefVar.Type::Option:
                            TempExcelBuffer.AddColumn(FieldRefVar.OptionMembers.Split(',').IndexOf(FieldRefVar.Value) - 1,
                                false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                        FieldRefVar.Type::Integer, FieldRefVar.Type::BigInteger, FieldRefVar.Type::Decimal, FieldRefVar.Type::Boolean:
                            TempExcelBuffer.AddColumn(FieldRefVar.Value(), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                        FieldRefVar.Type::Date, FieldRefVar.Type::DateTime:
                            TempExcelBuffer.AddColumn(FieldRefVar.Value(), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                        FieldRefVar.Type::Time:
                            TempExcelBuffer.AddColumn(FieldRefVar.Value(), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Time);
                        else
                            TempExcelBuffer.AddColumn(FieldRefVar.Value(), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    end;
        end;
    end;

    local procedure ExportJSON(var DataEditorBuffer: Record "DET Data Editor Buffer"; FieldIdsToExport: List of [Integer])
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
                JArray.Add(CreateJSONObjectFromRecord(RecRef, FieldIdsToExport));
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

    local procedure CreateJSONObjectFromRecord(RecRef: RecordRef; FieldIdsToExport: List of [Integer]) JObject: JsonObject
    var
        FieldRefVar: FieldRef;
        BooleanValue: Boolean;
        i: Integer;
    begin
        for i := 1 to RecRef.FieldCount() do begin
            FieldRefVar := RecRef.FieldIndex(i);
            if FieldIdsToExport.Contains(FieldRefVar.Number()) then
                if (FieldRefVar.Class = FieldClass::Normal) and not (FieldRefVar.Type in [FieldType::Blob, FieldType::Media, FieldType::MediaSet]) then
                    case FieldRefVar.Type() of
                        FieldRefVar.Type::Option:
                            JObject.Add(Format(FieldRefVar.Number()), FieldRefVar.OptionMembers.Split(',').IndexOf(FieldRefVar.Value) - 1);
                        FieldRefVar.Type::Boolean:
                            begin
                                Evaluate(BooleanValue, format(FieldRefVar.Value, 0, 9));
                                JObject.Add(Format(FieldRefVar.Number()), BooleanValue);
                            end;
                        else
                            JObject.Add(Format(FieldRefVar.Number()), Format(FieldRefVar.Value));
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

    procedure Log(ActionType: Enum "DET Log Action Type"; SourceRecordId: RecordId; TableNo: Integer; FieldNo: Integer; OldValue: FieldRef; NewValue: FieldRef; WithValidation: Boolean; HasValues: Boolean)
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
        DataEditorLog."Entry No." := NumberSequence.Next(LogNumberSequenceLbl);
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

    procedure TextValueAsVariant(FieldTypeVar: FieldType; ValueAsText: Text[2048]): Variant
    var
        DateFormulaValue: DateFormula;
        IntegerValue: Integer;
        DecimalValue: Decimal;
        BooleanValue: Boolean;
        DateValue: Date;
        DateTimeValue: DateTime;
        TimeValue: Time;
        GuidValue: Guid;
        BigIntegerValue: BigInteger;
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
            else
                exit(ValueAsText);
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
}