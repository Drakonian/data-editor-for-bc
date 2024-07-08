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

    procedure GetNewColumnValue(var RecRef: RecordRef; var FieldRefVar: FieldRef; var SourceRecordId: RecordId; var TempNameValueBuffer: Record "Name/Value Buffer" temporary): Boolean
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
            if FieldRefVar.Type() = FieldRefVar.Type::Option then
                FieldRefVar.Value(TempNameValueBuffer.Value)
            else
                FieldRefVar.Value(format(ResultVariant));
            if DataEditorSetup.Get() then
                if DataEditorSetup."Enable Data Editor Log" then
                    LogRename(RecRef.Number(), FieldRefVar.Number(), RecRef.RecordId(), xFieldRefVar, FieldRefVar, true);
            exit(true);
        end;
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
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRef: FieldRef;
        xFieldRef: FieldRef;
        ImportOnFind: Enum "DET Import On Find";
        InStreamVar: InStream;
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
        ImportExportDialog.Caption('Import Dialog');
        if not (ImportExportDialog.RunModal() in [Action::OK, Action::LookupOK]) then
            exit;
        ImportOnFind := ImportExportDialog.GetImportOnFind();

        TempBlob.CreateInStream(InStreamVar, TextEncoding::UTF8);
        if not UploadIntoStream(JSONFilterLbl, InStreamVar) then
            exit;

        JObject.ReadFrom(InStreamVar);
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
                RecRef.Init();
                ListOfFields := JToken.AsObject().Keys();

                foreach FieldNoAsTxt in ListOfFields do begin
                    JToken.AsObject().Get(FieldNoAsTxt, JTokenField);
                    Evaluate(FieldNo, FieldNoAsTxt);
                    FieldRef := RecRef.Field(FieldNo);

                    if not IsPKReady then
                        if not IsFieldIsPartOfPK(RecRef, FieldRef) then begin
                            IsRecordExist := xRecRef.Get(RecRef.RecordId());
                            IsPKReady := true;
                        end;

                    if IsRecordExist then
                        xFieldRef := xRecRef.Field(FieldNo);

                    FieldRef.Value(TextValueAsVariant(FieldRef.Type, CopyStr(JTokenField.AsValue().AsText(), 1, 2048)));
                    if WithValidation then
                        FieldRef.Validate();

                    if IsRecordExist and (ImportOnFind = ImportOnFind::Modify) then
                        LogModify(RecRef.Number(), FieldNo, RecRef.RecordId(), xFieldRef, FieldRef, WithValidation);
                end;

                case ImportOnFind of
                    ImportOnFind::Error:
                        begin
                            RecRef.Insert(WithValidation);
                            LogInsert(RecRef.Number(), RecRef.RecordId(), WithValidation);
                            Inserted += 1;
                        end;
                    ImportOnFind::Skip:
                        if RecRef.Insert(WithValidation) then begin
                            LogInsert(RecRef.Number(), RecRef.RecordId(), WithValidation);
                            Inserted += 1;
                        end else
                            Skipped += 1;
                    ImportOnFind::Modify:
                        if RecRef.Insert(WithValidation) then begin
                            LogInsert(RecRef.Number(), RecRef.RecordId(), WithValidation);
                            Inserted += 1;
                        end else begin
                            RecRef.Modify(WithValidation);
                            Modified += 1;
                        end;
                end;

            end;
            RecRef.Close();
        end;
        ResultMsg.AppendLine(ImportFinishedLbl);
        ResultMsg.AppendLine(StrSubstNo(InsertedLbl, Inserted));
        ResultMsg.AppendLine(StrSubstNo(ModifiedLbl, Modified));
        ResultMsg.AppendLine(StrSubstNo(SkippedLbl, Skipped));

        if GuiAllowed() then
            Message(ResultMsg.ToText());
    end;

    procedure ExportTable(var DataEditorBuffer: Record "DET Data Editor Buffer"; FieldIdsToExport: List of [Integer])
    var
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        JArray: JsonArray;
        JObjectRoot: JsonObject;
        InStreamVar: InStream;
        OutStreamVar: OutStream;
        FileName: Text;
    begin
        if DataEditorBuffer.IsEmpty() then
            exit;

        if DataEditorBuffer.FindSet() then begin
            RecRef.Open(DataEditorBuffer."Source Record ID".TableNo());
            RecRef.ReadIsolation := RecRef.ReadIsolation::ReadCommitted;
            repeat
                RecRef.Get(DataEditorBuffer."Source Record ID");
                JArray.Add(CreateJSONObjectFromRecord(RecRef, FieldIdsToExport));
            until DataEditorBuffer.Next() = 0;
        end;

        JObjectRoot.Add(Format(RecRef.Number()), JArray);

        FileName := StrSubstNo(FileNameLbl, RecRef.Caption(), Format(CurrentDateTime, 0, '<Day,2>-<Month,2>-<Year>_<Hours24,2>.<Minutes,2>.<Seconds,2>'), 'json');

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
}