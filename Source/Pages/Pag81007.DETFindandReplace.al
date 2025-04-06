page 81007 "DET Find and Replace"
{
    Caption = 'Find and Replace';
    PageType = Worksheet;
    SourceTable = "DET Find and Replace";
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            field(CustomTableViewField; GlobalTableView)
            {
                ApplicationArea = All;
                ToolTip = 'Set Table Filter';
                Caption = 'Table Filter';
                Editable = false;
                trigger OnDrillDown()
                begin
                    SetCustomFilter();
                end;
            }
            field(FindWhat; FindWhat)
            {
                ToolTip = 'Find What';
                Caption = 'Find What';
                ApplicationArea = All;
            }
            field(ReplaceWith; ReplaceWith)
            {
                ToolTip = 'Replace With';
                Caption = 'Replace With';
                ApplicationArea = All;
            }
            field(ReplaceEntireValue; ReplaceEntireValue)
            {
                ToolTip = 'Replace Entire Field Value';
                Caption = 'Replace Entire Field Value';
            }
            field(MatchCase; MatchCase)
            {
                ToolTip = 'Match Case';
                Caption = 'Match Case';
                ApplicationArea = All;
            }
            field(MatchEntireFieldValue; MatchEntireFieldValue)
            {
                ToolTip = 'Match Entire Field Value';
                Caption = 'Match Entire Field Value';
                ApplicationArea = All;
            }
            repeater(General)
            {
                field("Record PK"; Rec."Record PK")
                {
                    ToolTip = 'Specifies the value of the Record PK field.';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Field Number"; Rec."Field Number")
                {
                    ToolTip = 'Specifies the value of the Field Number field.';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ToolTip = 'Specifies the value of the Field Caption field.';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Field Value"; Rec."Field Value")
                {
                    ToolTip = 'Specifies the value of the Field Value field.';
                    Style = Strong;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        OnFieldEdit(false, Rec."Field Number", Rec."Field Value");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnFieldEdit(true, Rec."Field Number", Rec."Field Value");
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(FindAll)
            {
                ApplicationArea = All;
                Image = Find;
                Caption = 'Find All';
                ToolTip = 'Find All';
                ShortcutKey = F9;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    FindAndReplaceAll(false);
                end;
            }
            action(FindReplaceAll)
            {
                ApplicationArea = All;
                Image = EditLines;
                Caption = 'Find & Replace All';
                ToolTip = 'Find & Replace All';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    FindAndReplaceAll(true);
                end;
            }

        }

    }

    local procedure FindAndReplaceAll(Replace: Boolean)
    var
        DataEditorSetup: Record "DET Data Editor Setup";
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
        ResultNotification: Notification;
        RecRef: RecordRef;
        xRecRef: RecordRef;
        RecRefToFilter: RecordRef;
        FieldRefToModify: FieldRef;
        xFieldRefToModify: FieldRef;
        FieldRefVar: FieldRef;
        EntryNo: Integer;
        FieldCounter: Integer;
        FieldValueAsTxt: Text;
        FindWhatFilter: Text;
        FoundFieldList: List of [Integer];
        ReplacedCounter: Integer;
        ReplacedTotal: Integer;
        FieldNo: Integer;
        IsLogEnabled: Boolean;
    begin
        Rec.Reset();
        Rec.DeleteAll();

        if DataEditorSetup.Get() then
            IsLogEnabled := DataEditorSetup."Enable Data Editor Log";

        case true of
            MatchCase and MatchEntireFieldValue:
                FindWhatFilter := FindWhat;
            MatchCase:
                FindWhatFilter := '*' + FindWhat + '*';
            MatchEntireFieldValue:
                FindWhatFilter := '@' + FindWhat;
            else
                FindWhatFilter := '@*' + FindWhat + '*';
        end;

        RecRef.Open(GlobalTableNo);
        RecRef.FilterGroup(10);
        if GlobalTableView <> '' then
            RecRef.SetView(GlobalTableView);
        RecRef.FilterGroup(0);
        for FieldCounter := 1 to RecRef.FieldCount() do begin
            Clear(FieldRefVar);
            FieldRefVar := RecRef.FieldIndex(FieldCounter);
            if FieldRefVar.Class() <> FieldClass::FlowFilter then
                if (FieldRefVar.Type() in [FieldType::Text, FieldType::Code])
                 and (FieldRefVar.Length() >= StrLen(FindWhat)) then begin
                    if FieldRefVar.Class() = FieldClass::FlowField then
                        FieldRefVar.CalcField();
                    FieldRefVar.SETFILTER(FindWhatFilter);
                    if not RecRef.IsEmpty() then
                        FoundFieldList.Add(FieldRefVar.Number());
                    FieldRefVar.SetRange();
                end;
        end;

        if RecRef.FindSet() then
            repeat
                Clear(ReplacedCounter);
                foreach FieldNo in FoundFieldList do begin
                    Clear(FieldRefVar);
                    Clear(RecRefToFilter);
                    RecRefToFilter := RecRef.Duplicate();
                    xRecRef := RecRef.Duplicate();
                    RecRefToFilter.FilterGroup(20);
                    RecRefToFilter.SetRecFilter();
                    FieldRefVar := RecRefToFilter.Field(FieldNo);
                    FieldRefVar.SetFilter(FindWhatFilter);
                    if not RecRefToFilter.IsEmpty() then begin
                        EntryNo += 1;
                        Rec.Init();
                        Rec."Entry No." := EntryNo;
                        Rec."Record Id" := RecRefToFilter.RecordId();
                        Rec."Record PK" := Format(Rec."Record Id");
                        Rec."Field Number" := FieldRefVar.Number();
                        Rec."Field Value" := FieldRefVar.Value();
                        Rec."Field Caption" := CopyStr(FieldRefVar.Caption(), 1, MaxStrLen(Rec."Field Caption"));
                        Rec."Is Editable" := (FieldRefVar.Class = FieldRefVar.Class::Normal);
                        if Replace and Rec."Is Editable" then begin
                            FieldRefToModify := RecRef.Field(Rec."Field Number");
                            xFieldRefToModify := xRecRef.Field(Rec."Field Number");

                            FieldValueAsTxt := Format(FieldRefToModify.Value());
                            if ReplaceEntireValue then
                                FieldValueAsTxt := ReplaceWith
                            else
                                ReplaceNoCase(FieldValueAsTxt, FindWhat, ReplaceWith);

                            if GlobalWithoutValidate then
                                FieldRefToModify.Value(FieldValueAsTxt)
                            else
                                FieldRefToModify.Validate(FieldValueAsTxt);

                            Rec."Field Value" := CopyStr(FieldValueAsTxt, 1, MaxStrLen(Rec."Field Value"));
                            ReplacedCounter += 1;
                            if IsLogEnabled then
                                DataEditorMgt.LogModify(RecRef.Number(), FieldRefToModify.Number(), RecRef.RecordId(), xFieldRefToModify,
                                    FieldRefToModify, not GlobalWithoutValidate);
                        end;
                        Rec.Insert();
                    end;
                    FieldRefVar.SetRange();
                end;
                if ReplacedCounter <> 0 then
                    RecRef.Modify(not GlobalWithoutValidate);
                ReplacedTotal += ReplacedCounter;
            until RecRef.Next() = 0;

        ResultNotification.Id := GlobalGuid;
        if Replace then
            ResultNotification.Message := StrSubstNo(FieldsFoundLbl, ReplacedTotal, 'found and replaced')
        else
            ResultNotification.Message := StrSubstNo(FieldsFoundLbl, EntryNo, 'found');
        ResultNotification.Scope := NotificationScope::LocalScope;
        ResultNotification.Send();
    end;

    procedure ReplaceNoCase(var TextVariable: Text; OldValue: Text; NewValue: Text)
    var
        Position: Integer;
        OldValueLen: Integer;
    begin
        if OldValue = '' then
            exit;

        OldValueLen := StrLen(OldValue);

        repeat
            Position := StrPos(LowerCase(TextVariable), LowerCase(OldValue));

            if Position > 0 then
                TextVariable :=
                    CopyStr(TextVariable, 1, Position - 1) +
                    NewValue +
                    CopyStr(TextVariable, Position + OldValueLen);
        until Position = 0;
    end;


    local procedure SetCustomFilter()
    var
        CustomFilterPageBuilder: FilterPageBuilder;
    begin
        if GlobalTableNo = 0 then
            exit;
        CustomFilterPageBuilder.AddTable(GlobalTableName, GlobalTableNo);
        if GlobalTableView <> '' then
            CustomFilterPageBuilder.SetView(GlobalTableName, GlobalTableView);
        CustomFilterPageBuilder.RunModal();
        GlobalTableView := CustomFilterPageBuilder.GetView(GlobalTableName);
    end;

    local procedure OnFieldEdit(IsDrillDown: Boolean; FieldNo: Integer; var NewValue: Text[2048])
    var
        DataEditorSetup: Record "DET Data Editor Setup";
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
        RecRef: RecordRef;
        xRecRef: RecordRef;
        FieldRefVar: FieldRef;
        xFieldRefVar: FieldRef;
    begin
        if not RecRef.Get(Rec."Record Id") then
            exit;
        xRecRef := RecRef.Duplicate();
        FieldRefVar := RecRef.Field(FieldNo);
        xFieldRefVar := xRecRef.Field(FieldNo);

        if not IsDrillDown then begin
            if GlobalWithoutValidate then
                FieldRefVar.Value(NewValue)
            else
                FieldRefVar.Validate(NewValue);
        end else
            if not DataEditorMgt.GetNewColumnValue(RecRef, FieldRefVar, Rec."Record Id", TempNameValueBuffer, not GlobalWithoutValidate) then
                exit;

        RecRef.Modify(not GlobalWithoutValidate);

        if FieldRefVar.Type() = FieldRefVar.Type::Option then
            NewValue := TempNameValueBuffer.Value
        else
            NewValue := format(FieldRefVar.Value());

        if not DataEditorSetup.Get() then
            exit;

        if DataEditorSetup."Enable Data Editor Log" then
            DataEditorMgt.LogModify(RecRef.Number(), FieldRefVar.Number(), RecRef.RecordId(), xFieldRefVar,
                FieldRefVar, not GlobalWithoutValidate);
    end;

    procedure SetRecordInfo(TableNo: Integer; TableName: Text; WithoutValidate: Boolean; TableView: Text)
    begin
        GlobalTableNo := TableNo;
        GlobalTableView := TableView;
        GlobalTableName := TableName;
        GlobalWithoutValidate := WithoutValidate;
        GlobalGuid := CreateGuid();
    end;

    var
        FieldsFoundLbl: Label '%1 field(s) %2.', Comment = '%1 = Number of entries, %2 Found or Found & Replaced';
        FindWhat: Text;
        ReplaceWith: Text;
        GlobalTableView: Text;
        GlobalTableName: Text;
        GlobalTableNo: Integer;
        GlobalWithoutValidate: Boolean;
        MatchCase: Boolean;
        MatchEntireFieldValue: Boolean;
        ReplaceEntireValue: Boolean;
        GlobalGuid: Guid;
}
