page 81005 "DET Select Fields"
{
    Caption = 'Select Fields';
    PageType = List;
    SourceTable = "DET Field";
    SourceTableTemporary = true;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field(IncludedField; Rec.Included)
                {
                    ApplicationArea = All;
                    Caption = 'Included';
                    ToolTip = 'Included';
                    Enabled = not Rec.IsPartOfPrimaryKey;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                    ApplicationArea = All;
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
                ApplicationArea = All;
                Caption = 'Set Included';
                ToolTip = 'Set Included';
                Image = Completed;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Rec.ModifyAll(Included, true);
                    Rec.Reset();
                end;
            }
            action("Clear Included")
            {
                ApplicationArea = All;
                Caption = 'Clear Included';
                ToolTip = 'Clear Included';
                Image = ResetStatus;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

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
                end;
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
}

