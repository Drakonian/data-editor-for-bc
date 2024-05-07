page 81005 "DET Select Fields"
{
    Caption = 'Select Fields';
    PageType = List;
    SourceTable = "DET Field";
    SourceTableTemporary = true;
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = None;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field(IncludedField; Rec.Included)
                {
                    Caption = 'Included';
                    ToolTip = 'Included';
                    Enabled = not Rec.IsPartOfPrimaryKey;
                    Visible = not OneFieldMode;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Field Id"; Rec."Field Id")
                {
                    ToolTip = 'Specifies the value of the Field Id field.';
                }

                field(Name; Rec.Name)
                {
                    Editable = false;
                    Caption = 'Name';
                    ToolTip = 'Specifies the names of the available Windows languages.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Set Included")
            {
                Caption = 'Set Included';
                ToolTip = 'Set Included';
                Image = Completed;
                Visible = not OneFieldMode;
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Rec.ModifyAll(Included, true);
                    Rec.Reset();
                    CurrPage.Update(false);
                end;
            }
            action("Clear Included")
            {
                Caption = 'Clear Included';
                ToolTip = 'Clear Included';
                Image = ResetStatus;
                Visible = not OneFieldMode;
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    if Rec.FindSet() then
                        repeat
                            if not Rec.IsPartOfPrimaryKey then begin
                                Rec.Included := false;
                                Rec.Modify();
                            end;
                        until Rec.Next() = 0;
                    Rec.Reset();
                    CurrPage.Update(false);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Set Included_Promoted"; "Set Included")
                {
                }
                actionref("Clear Included_Promoted"; "Clear Included")
                {
                }
            }
        }
    }
    procedure LoadFields(SourceTableNo: Integer; CurrentIdFilter: Text)
    var
        FieldRec: Record Field;
        FieldRec2: Record Field;
    begin
        FieldRec2.FilterGroup(10);
        FieldRec2.SetRange(TableNo, SourceTableNo);
        if CurrentIdFilter <> '' then
            FieldRec2.SetFilter("No.", CurrentIdFilter);
        FieldRec2.FilterGroup(0);
        FieldRec.SetRange(TableNo, SourceTableNo);
        FieldRec.SetFilter(ObsoleteState, '<>%1', FieldRec.ObsoleteState::Removed);
        FieldRec.SetRange(Enabled, true);
        if ShowOnlyFilteredFields then
            FieldRec.SetFilter("No.", CurrentIdFilter);
        if FilterOnlyNormalFields then begin
            FieldRec.SetRange(Class, FieldRec.Class::Normal);
            FieldRec.SetFilter(Type, '<>%1&<>%2&<>%3&<>4', FieldRec.Type::Binary, FieldRec.Type::BLOB, FieldRec.Type::Media, FieldRec.Type::MediaSet);
        end;
        if FieldRec.FindSet() then
            repeat
                FieldRec2.SetRange("No.", FieldRec."No.");
                Rec.Init();
                Rec."Field Id" := FieldRec."No.";
                Rec.IsPartOfPrimaryKey := FieldRec.IsPartOfPrimaryKey;
                Rec.Included := FieldRec.IsPartOfPrimaryKey or not FieldRec2.IsEmpty();
                Rec.Name := FieldRec."Field Caption";
                Rec.Insert();
            until FieldRec.Next() = 0;

        Rec.FindFirst();
    end;

    procedure GetFieldIdFilter() FieldIdFilter: Text
    var
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
        RecRef: RecordRef;
    begin
        Rec.SetRange(Included, true);
        RecRef.GetTable(Rec);
        FieldIdFilter := SelectionFilterManagement.GetSelectionFilter(RecRef, Rec.FieldNo("Field Id"));
        Rec.Reset();
    end;

    procedure SetOneFieldMode(NewValue: Boolean)
    begin
        OneFieldMode := NewValue;
    end;

    procedure SetFilterOnlyNormalFields(NewValue: Boolean)
    begin
        FilterOnlyNormalFields := NewValue;
    end;

    procedure SetShowOnlyFilteredFields(NewValue: Boolean)
    begin
        ShowOnlyFilteredFields := NewValue;
    end;

    var
        OneFieldMode: Boolean;
        FilterOnlyNormalFields: Boolean;
        ShowOnlyFilteredFields: Boolean;
}

