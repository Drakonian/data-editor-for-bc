page 81004 "DET Insert New Record"
{
    Caption = 'Insert New Record';
    PageType = StandardDialog;
    SourceTable = "DET Data Editor Buffer";
    SourceTableTemporary = true;
    DeleteAllowed = false;
    InsertAllowed = false;
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
     tabledata "Workflow Step Instance Archive" = RMID, tabledata "G/L Entry" = RMID, tabledata "Warehouse Entry" = RMID, tabledata "Value Entry" = RMID, tabledata "Item Register" = RMID, tabledata "G/L Register" = RIMD,
     tabledata "Vat Entry" = RMID, TableData "Service Invoice Header" = RMID, TableData "Service Cr.Memo Header" = RMID, TableData "Issued Reminder Header" = RMID, TableData "Issued Fin. Charge Memo Header" = RMID;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Text Value 2"; Rec."Text Value 2")
                {
                    ToolTip = 'Specifies the value of the Value 2 field';
                    ApplicationArea = All;
                    Visible = FieldVisible1;
                    CaptionClass = FieldCaption1;
                    trigger OnValidate()
                    begin
                        OnValidateField(1, rec."Text Value 2");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(1, Rec."Text Value 2");
                    end;
                }

                field("Text Value 3"; Rec."Text Value 3")
                {
                    ToolTip = 'Specifies the value of the Value 3 field';
                    ApplicationArea = All;
                    Visible = FieldVisible2;
                    CaptionClass = FieldCaption2;
                    trigger OnValidate()
                    begin
                        OnValidateField(2, rec."Text Value 3");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(2, Rec."Text Value 3");
                    end;
                }
                field("Text Value 4"; Rec."Text Value 4")
                {
                    ToolTip = 'Specifies the value of the Value 4 field';
                    ApplicationArea = All;
                    Visible = FieldVisible3;
                    CaptionClass = FieldCaption3;
                    trigger OnValidate()
                    begin
                        OnValidateField(3, rec."Text Value 4");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(3, Rec."Text Value 4");
                    end;
                }
                field("Text Value 5"; Rec."Text Value 5")
                {
                    ToolTip = 'Specifies the value of the Value 5 field';
                    ApplicationArea = All;
                    Visible = FieldVisible4;
                    CaptionClass = FieldCaption4;
                    trigger OnValidate()
                    begin
                        OnValidateField(4, rec."Text Value 5");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(4, Rec."Text Value 5");
                    end;
                }
                field("Text Value 6"; Rec."Text Value 6")
                {
                    ToolTip = 'Specifies the value of the Value 6 field';
                    ApplicationArea = All;
                    Visible = FieldVisible5;
                    CaptionClass = FieldCaption5;
                    trigger OnValidate()
                    begin
                        OnValidateField(5, rec."Text Value 6");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(5, Rec."Text Value 6");
                    end;
                }
                field("Text Value 7"; Rec."Text Value 7")
                {
                    ToolTip = 'Specifies the value of the Value 7 field';
                    ApplicationArea = All;
                    Visible = FieldVisible6;
                    CaptionClass = FieldCaption6;
                    trigger OnValidate()
                    begin
                        OnValidateField(6, rec."Text Value 7");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(6, Rec."Text Value 7");
                    end;
                }
                field("Text Value 8"; Rec."Text Value 8")
                {
                    ToolTip = 'Specifies the value of the Value 8 field';
                    ApplicationArea = All;
                    Visible = FieldVisible7;
                    CaptionClass = FieldCaption7;
                    trigger OnValidate()
                    begin
                        OnValidateField(7, rec."Text Value 8");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(7, Rec."Text Value 8");
                    end;
                }
                field("Text Value 9"; Rec."Text Value 9")
                {
                    ToolTip = 'Specifies the value of the Value 9 field';
                    ApplicationArea = All;
                    Visible = FieldVisible8;
                    CaptionClass = FieldCaption8;
                    trigger OnValidate()
                    begin
                        OnValidateField(8, rec."Text Value 9");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(8, Rec."Text Value 9");
                    end;
                }
                field("Text Value 10"; Rec."Text Value 10")
                {
                    ToolTip = 'Specifies the value of the Value 10 field';
                    ApplicationArea = All;
                    Visible = FieldVisible9;
                    CaptionClass = FieldCaption9;
                    trigger OnValidate()
                    begin
                        OnValidateField(9, rec."Text Value 10");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(9, Rec."Text Value 10");
                    end;
                }
                field("Text Value 11"; Rec."Text Value 11")
                {
                    ToolTip = 'Specifies the value of the Value 11 field';
                    ApplicationArea = All;
                    Visible = FieldVisible10;
                    CaptionClass = FieldCaption10;
                    trigger OnValidate()
                    begin
                        OnValidateField(10, rec."Text Value 11");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(10, Rec."Text Value 11");
                    end;
                }
                field("Text Value 12"; Rec."Text Value 12")
                {
                    ToolTip = 'Specifies the value of the Value 12 field';
                    ApplicationArea = All;
                    Visible = FieldVisible11;
                    CaptionClass = FieldCaption11;
                    trigger OnValidate()
                    begin
                        OnValidateField(11, rec."Text Value 12");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(11, Rec."Text Value 12");
                    end;
                }
                field("Text Value 13"; Rec."Text Value 13")
                {
                    ToolTip = 'Specifies the value of the Value 13 field';
                    ApplicationArea = All;
                    Visible = FieldVisible12;
                    CaptionClass = FieldCaption12;
                    trigger OnValidate()
                    begin
                        OnValidateField(12, rec."Text Value 13");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(12, Rec."Text Value 13");
                    end;
                }
                field("Text Value 14"; Rec."Text Value 14")
                {
                    ToolTip = 'Specifies the value of the Value 14 field';
                    ApplicationArea = All;
                    Visible = FieldVisible13;
                    CaptionClass = FieldCaption13;
                    trigger OnValidate()
                    begin
                        OnValidateField(13, rec."Text Value 14");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(13, Rec."Text Value 14");
                    end;
                }
                field("Text Value 15"; Rec."Text Value 15")
                {
                    ToolTip = 'Specifies the value of the Value 15 field';
                    ApplicationArea = All;
                    Visible = FieldVisible14;
                    CaptionClass = FieldCaption14;
                    trigger OnValidate()
                    begin
                        OnValidateField(14, rec."Text Value 15");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(14, Rec."Text Value 15");
                    end;
                }
                field("Text Value 16"; Rec."Text Value 16")
                {
                    ToolTip = 'Specifies the value of the Value 16 field';
                    ApplicationArea = All;
                    Visible = FieldVisible15;
                    CaptionClass = FieldCaption15;
                    trigger OnValidate()
                    begin
                        OnValidateField(15, rec."Text Value 16");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(15, Rec."Text Value 16");
                    end;
                }
            }
        }
    }
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        FieldRefToInsert: FieldRef;
    begin
        if not (CloseAction in [CloseAction::OK, CloseAction::LookupOK]) then
            exit;

        if FieldVisible1 then begin
            FieldRefToInsert := GetFieldRefByCounter(1);
            FieldRefToInsert.Value(VariantValue1);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible2 then begin
            FieldRefToInsert := GetFieldRefByCounter(2);
            FieldRefToInsert.Value(VariantValue2);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible3 then begin
            FieldRefToInsert := GetFieldRefByCounter(3);
            FieldRefToInsert.Value(VariantValue3);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible4 then begin
            FieldRefToInsert := GetFieldRefByCounter(4);
            FieldRefToInsert.Value(VariantValue4);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible5 then begin
            FieldRefToInsert := GetFieldRefByCounter(5);
            FieldRefToInsert.Value(VariantValue5);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible6 then begin
            FieldRefToInsert := GetFieldRefByCounter(6);
            FieldRefToInsert.Value(VariantValue6);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible7 then begin
            FieldRefToInsert := GetFieldRefByCounter(7);
            FieldRefToInsert.Value(VariantValue7);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible8 then begin
            FieldRefToInsert := GetFieldRefByCounter(8);
            FieldRefToInsert.Value(VariantValue8);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible9 then begin
            FieldRefToInsert := GetFieldRefByCounter(9);
            FieldRefToInsert.Value(VariantValue9);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible10 then begin
            FieldRefToInsert := GetFieldRefByCounter(10);
            FieldRefToInsert.Value(VariantValue10);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible11 then begin
            FieldRefToInsert := GetFieldRefByCounter(11);
            FieldRefToInsert.Value(VariantValue11);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible12 then begin
            FieldRefToInsert := GetFieldRefByCounter(12);
            FieldRefToInsert.Value(VariantValue12);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible13 then begin
            FieldRefToInsert := GetFieldRefByCounter(13);
            FieldRefToInsert.Value(VariantValue13);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible14 then begin
            FieldRefToInsert := GetFieldRefByCounter(14);
            FieldRefToInsert.Value(VariantValue14);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        if FieldVisible15 then begin
            FieldRefToInsert := GetFieldRefByCounter(15);
            FieldRefToInsert.Value(VariantValue15);
            if not WithoutValidation then
                FieldRefToInsert.Validate();
        end;
        GlobalRecRef.Insert(not WithoutValidation);
    end;

    procedure SetInitData(TableNo: Integer; inWithoutValidation: Boolean)
    var
        FieldRefVar: FieldRef;
        KeyRefVar: KeyRef;
        FieldCount: Integer;
        FieldInfoDictionaty: Dictionary of [Integer, Text];
    begin
        Rec.Init();
        Rec."Entry No." := 1;
        Rec.Insert();

        GlobalRecRef.Open(TableNo);

        WithoutValidation := inWithoutValidation;

        KeyRefVar := GlobalRecRef.KeyIndex(1);
        for FieldCount := 1 to KeyRefVar.FieldCount() do begin
            Clear(FieldInfoDictionaty);
            FieldRefVar := KeyRefVar.FieldIndex(FieldCount);
            FieldInfoDictionaty.Add(FieldRefVar.Number(), Format(FieldRefVar.Type()));
            GenFieldInfoDict.Add(FieldCount, FieldInfoDictionaty);
            case FieldCount of
                1:
                    begin
                        FieldVisible1 := true;
                        FieldCaption1 := FieldRefVar.Caption();
                    end;
                2:
                    begin
                        FieldVisible2 := true;
                        FieldCaption2 := FieldRefVar.Caption();
                    end;
                3:
                    begin
                        FieldVisible3 := true;
                        FieldCaption3 := FieldRefVar.Caption();
                    end;
                4:
                    begin
                        FieldVisible4 := true;
                        FieldCaption4 := FieldRefVar.Caption();
                    end;
                5:
                    begin
                        FieldVisible5 := true;
                        FieldCaption5 := FieldRefVar.Caption();
                    end;
                6:
                    begin
                        FieldVisible6 := true;
                        FieldCaption6 := FieldRefVar.Caption();
                    end;
                7:
                    begin
                        FieldVisible7 := true;
                        FieldCaption7 := FieldRefVar.Caption();
                    end;
                8:
                    begin
                        FieldVisible8 := true;
                        FieldCaption8 := FieldRefVar.Caption();
                    end;
                9:
                    begin
                        FieldVisible9 := true;
                        FieldCaption9 := FieldRefVar.Caption();
                    end;
                10:
                    begin
                        FieldVisible10 := true;
                        FieldCaption10 := FieldRefVar.Caption();
                    end;
                11:
                    begin
                        FieldVisible11 := true;
                        FieldCaption11 := FieldRefVar.Caption();
                    end;
                12:
                    begin
                        FieldVisible12 := true;
                        FieldCaption12 := FieldRefVar.Caption();
                    end;
                13:
                    begin
                        FieldVisible13 := true;
                        FieldCaption13 := FieldRefVar.Caption();
                    end;
                14:
                    begin
                        FieldVisible14 := true;
                        FieldCaption14 := FieldRefVar.Caption();
                    end;
                15:
                    begin
                        FieldVisible15 := true;
                        FieldCaption15 := FieldRefVar.Caption();
                    end;
                else
                    Error(InsertPKNotSuppErr);
            end;
        end;

    end;

    local procedure OnDrillDownField(FieldCounter: Integer; var NewValue: Text[2048])
    var
        FieldRec: Record Field;
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
        EditValue: page "DET Edit Value";
        NameValueLookup: Page "Name/Value Lookup";
        FieldRefVar: FieldRef;
        OptionValue: Text;
        ListOfOptions: List of [Text];
        ResultVariant: Variant;
        OriginalFieldNo: Integer;
        FieldInfoDictionaty: Dictionary of [Integer, Text];
    begin
        if GlobalRecRef.Number() = 0 then
            exit;
        FieldInfoDictionaty := GenFieldInfoDict.Get(FieldCounter);
        foreach OriginalFieldNo in FieldInfoDictionaty.Keys() do
            FieldRefVar := GlobalRecRef.Field(OriginalFieldNo);

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
                exit;
            NameValueLookup.GetRecord(TempNameValueBuffer);
            ResultVariant := TempNameValueBuffer.Name;
        end else begin
            FieldRec.get(GlobalRecRef.Number(), FieldRefVar.Number());
            EditValue.SetFieldInfo(FieldRec);
            EditValue.SetInitValue(NewValue);
            EditValue.Caption(FieldRefVar.Caption());
            EditValue.LookupMode(true);
            if not (EditValue.RunModal() in [Action::OK, Action::LookupOK]) then
                exit;
            EditValue.GetResult(ResultVariant);
        end;

        case FieldCounter of
            1:
                VariantValue1 := ResultVariant;
            2:
                VariantValue2 := ResultVariant;
            3:
                VariantValue3 := ResultVariant;
            4:
                VariantValue4 := ResultVariant;
            5:
                VariantValue5 := ResultVariant;
            6:
                VariantValue6 := ResultVariant;
            7:
                VariantValue7 := ResultVariant;
            8:
                VariantValue8 := ResultVariant;
            9:
                VariantValue9 := ResultVariant;
            10:
                VariantValue10 := ResultVariant;
            11:
                VariantValue11 := ResultVariant;
            12:
                VariantValue12 := ResultVariant;
            13:
                VariantValue13 := ResultVariant;
            14:
                VariantValue14 := ResultVariant;
            15:
                VariantValue15 := ResultVariant;
        end;

        if FieldRefVar.Type() = FieldRefVar.Type::Option then
            NewValue := TempNameValueBuffer.Value
        else
            NewValue := format(ResultVariant);
    end;

    local procedure OnValidateField(FieldCounter: Integer; NewValue: Text[2048])
    var
        DataEditorBufferPage: Page "DET Data Editor Buffer";
        FieldRefVar: FieldRef;
        FieldInfoDictionaty: Dictionary of [Integer, Text];
        OriginalFieldNo: Integer;
    begin
        if GlobalRecRef.Number() = 0 then
            exit;
        FieldInfoDictionaty := GenFieldInfoDict.Get(FieldCounter);
        foreach OriginalFieldNo in FieldInfoDictionaty.Keys() do
            FieldRefVar := GlobalRecRef.Field(OriginalFieldNo);

        case FieldCounter of
            1:
                VariantValue1 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            2:
                VariantValue2 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            3:
                VariantValue3 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            4:
                VariantValue4 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            5:
                VariantValue5 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            6:
                VariantValue6 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            7:
                VariantValue7 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            8:
                VariantValue8 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            9:
                VariantValue9 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            10:
                VariantValue10 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            11:
                VariantValue11 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            12:
                VariantValue12 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            13:
                VariantValue13 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            14:
                VariantValue14 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
            15:
                VariantValue15 := DataEditorBufferPage.TextValueAsVariant(FieldRefVar.Type(), NewValue);
        end;
    end;

    local procedure GetFieldRefByCounter(FieldCounter: Integer): FieldRef
    var
        OriginalFieldNo: Integer;
        FieldInfoDictionaty: Dictionary of [Integer, Text];
    begin
        FieldInfoDictionaty := GenFieldInfoDict.Get(FieldCounter);
        foreach OriginalFieldNo in FieldInfoDictionaty.Keys() do
            exit(GlobalRecRef.Field(OriginalFieldNo));
    end;

    procedure GetResultRecordID(): RecordId
    begin
        exit(GlobalRecRef.RecordId());
    end;

    var
        GlobalRecRef: RecordRef;
        FieldVisible1, FieldVisible2, FieldVisible3, FieldVisible4, FieldVisible5, FieldVisible6, FieldVisible7, FieldVisible8, FieldVisible9, FieldVisible10, FieldVisible11, FieldVisible12, FieldVisible13, FieldVisible14, FieldVisible15 : boolean;
        FieldCaption1, FieldCaption2, FieldCaption3, FieldCaption4, FieldCaption5, FieldCaption6, FieldCaption7, FieldCaption8, FieldCaption9, FieldCaption10, FieldCaption11, FieldCaption12, FieldCaption13, FieldCaption14, FieldCaption15 : text;
        GenFieldInfoDict: Dictionary of [Integer, Dictionary of [Integer, Text]];
        VariantValue1, VariantValue2, VariantValue3, VariantValue4, VariantValue5, VariantValue6, VariantValue7, VariantValue8, VariantValue9, VariantValue10, VariantValue11, VariantValue12, VariantValue13, VariantValue14, VariantValue15 : Variant;
        InsertPKNotSuppErr: Label 'Inserting the primary key for >15 values is not supported.';
        WithoutValidation: Boolean;
}