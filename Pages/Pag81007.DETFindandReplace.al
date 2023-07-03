page 81007 "DET Find and Replace"
{
    ApplicationArea = All;
    Caption = 'Find and Replace';
    PageType = Worksheet;
    SourceTable = "DET Find and Replace";
    InsertAllowed = false;
    DeleteAllowed = false;

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
            }
            field(ReplaceWith; ReplaceWith)
            {
                ToolTip = 'Replace With';
                Caption = 'Replace With';
            }
            field(MatchCase; MatchCase)
            {
                ToolTip = 'Match Case';
                Caption = 'Match Case';
            }
            field(MatchEntireFieldValue; MatchEntireFieldValue)
            {
                ToolTip = 'Match Entire Field Value';
                Caption = 'Match Entire Field Value';
            }
            repeater(General)
            {
                field("Record PK"; Rec."Record PK")
                {
                    ToolTip = 'Specifies the value of the Record PK field.';
                    Editable = false;
                }
                field("Field Number"; Rec."Field Number")
                {
                    ToolTip = 'Specifies the value of the Field Number field.';
                    Editable = false;
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ToolTip = 'Specifies the value of the Field Caption field.';
                    Editable = false;
                }
                field("Field Value"; Rec."Field Value")
                {
                    ToolTip = 'Specifies the value of the Field Value field.';
                    Style = Strong;
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
                trigger OnAction()
                begin
                    FindAndReplaceAll(true);
                end;
            }

        }
        area(Promoted)
        {
            actionref(FindAllRef; FindAll)
            {
            }
            actionref(FindReplaceAllRef; FindReplaceAll)
            {
            }
        }

    }

    local procedure FindAndReplaceAll(Replace: Boolean)
    var
        ResultNotification: Notification;
        RecRef: RecordRef;
        RecRefToFilter: RecordRef;
        FieldRefToModify: FieldRef;
        FieldRefVar: FieldRef;
        EntryNo: Integer;
        FieldCounter: Integer;
        FindWhatFilter: Text;
        FoundFieldList: List of [Integer];
        ReplacedCounter: Integer;
        ReplacedTotal: Integer;
        FieldNo: Integer;
    begin
        Rec.Reset();
        Rec.DeleteAll();
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
                        Rec."Field Caption" := FieldRefVar.Caption();
                        Rec."Is Editable" := (FieldRefVar.Class = FieldRefVar.Class::Normal);
                        if Replace and Rec."Is Editable" then begin
                            FieldRefToModify := RecRef.Field(Rec."Field Number");
                            FieldRefToModify.Value(ReplaceWith);
                            Rec."Field Value" := ReplaceWith;
                            if not GlobalWithoutValidate then
                                FieldRefToModify.Validate();
                            ReplacedCounter += 1;
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
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
        RecRef: RecordRef;
        FieldRefVar: FieldRef;
    begin
        if not RecRef.Get(Rec."Record Id") then
            exit;
        FieldRefVar := RecRef.Field(FieldNo);

        if not IsDrillDown then
            FieldRefVar.Value(NewValue)
        else
            if not DataEditorMgt.GetNewColumnValue(RecRef, FieldRefVar, Rec."Record Id", TempNameValueBuffer) then
                exit;

        if not GlobalWithoutValidate then
            FieldRefVar.Validate();
        RecRef.Modify(not GlobalWithoutValidate);

        if FieldRefVar.Type() = FieldRefVar.Type::Option then
            NewValue := TempNameValueBuffer.Value
        else
            NewValue := format(FieldRefVar.Value());
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
        GlobalGuid: Guid;
}
