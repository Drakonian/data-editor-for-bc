// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
codeunit 81002 "DET Read Data Batch"
{
    TableNo = "DET Data Editor Buffer";

    trigger OnRun()
    var
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
    begin
        DataEditorMgt.RunReadDataBatch(Rec);
    end;
}