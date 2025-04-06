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
                field("Number of Threads"; Rec."Number of Threads")
                {
                    ToolTip = 'Specify the number of parallel threads to load the data. From 2 to 8.', Comment = '%';
                }
                field("Show Run After"; Rec."Show Run After")
                {
                    ToolTip = 'Specifies the value of the Show Run After field.', Comment = '%';
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
