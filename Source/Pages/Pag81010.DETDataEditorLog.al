// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
page 81010 "DET Data Editor Log"
{
    ApplicationArea = All;
    Caption = 'Data Editor Log';
    PageType = List;
    SourceTable = "DET Data Editor Log";
    UsageCategory = Lists;
    ModifyAllowed = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTableView = sorting("Entry No.") order(descending);

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Record Id"; Format(Rec."Record Id"))
                {
                    Caption = 'Record Id';
                    ToolTip = 'Specifies the value of the Record Id field.', Comment = '%';
                }
                field("Table No."; Rec."Table No.")
                {
                    ToolTip = 'Specifies the value of the Table No. field.', Comment = '%';
                }
                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the value of the Table Name field.', Comment = '%';
                }
                field("Field No."; Rec."Field No.")
                {
                    ToolTip = 'Specifies the value of the Field No. field.', Comment = '%';
                }
                field("Field Name"; Rec."Field Name")
                {
                    ToolTip = 'Specifies the value of the Field Name field.', Comment = '%';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ToolTip = 'Specifies the value of the Action Type field.', Comment = '%';
                }
                field("Old Value"; Rec."Old Value")
                {
                    ToolTip = 'Specifies the value of the Old Value field.', Comment = '%';
                }
                field("New Value"; Rec."New Value")
                {
                    ToolTip = 'Specifies the value of the New Value field.', Comment = '%';
                }
                field("With Validation"; Rec."With Validation")
                {
                    ToolTip = 'Specifies the value of the With Validation field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'Created At';
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.GetUserName())
                {
                    Caption = 'Created By';
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Promoted)
        {
            actionref(ShowOldValue_promoted; ShowOldValue)
            {

            }
            actionref(ShowNewValue_promoted; ShowNewValue)
            {

            }
        }
        area(Processing)
        {
            action(ShowOldValue)
            {
                ApplicationArea = All;
                Caption = 'Show Old Value';
                ToolTip = 'Show Old Value';
                Image = ShowList;
                trigger OnAction()
                begin
                    Message(Rec.GetBLOBDataAsTxt(Rec.FieldNo("Old Value BLOB"), TextEncoding::UTF8));
                end;
            }
            action(ShowNewValue)
            {
                ApplicationArea = All;
                Caption = 'Show New Value';
                ToolTip = 'Show New Value';
                Image = ShowList;
                trigger OnAction()
                begin
                    Message(Rec.GetBLOBDataAsTxt(Rec.FieldNo("New Value BLOB"), TextEncoding::UTF8));
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if Rec.FindFirst() then; // For some reason, the page shows the last record when we use descending sorting. This is a hotfix.
    end;
}
