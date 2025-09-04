// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
page 72995584 "VDV Data Editor Setup"
{
    ApplicationArea = All;
    Caption = 'Data Editor Setup';
    PageType = Card;
    SourceTable = "VDV Data Editor Setup";
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
        area(Promoted)
        {
            actionref(DataEditorLog_promoted; DataEditorLog)
            {

            }
        }
        area(Processing)
        {
            action(DataEditorLog)
            {
                ApplicationArea = All;
                Caption = 'Data Editor Log';
                ToolTip = 'Data Editor Log';
                Image = ShowList;
                RunObject = page "VDV Data Editor Log";
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
