page 81009 "DET Data Editor Setup"
{
    ApplicationArea = All;
    Caption = 'Data Editor Setup';
    PageType = Card;
    SourceTable = "DET Data Editor Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Enable Data Editor Log"; Rec."Enable Data Editor Log")
                {
                    ToolTip = 'May adversely affect performance.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(DataEditorLog)
            {
                ApplicationArea = All;
                Caption = 'Data Editor Log';
                ToolTip = 'Data Editor Log';
                Image = ShowList;
                RunObject = page "DET Data Editor Log";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
    end;
}
