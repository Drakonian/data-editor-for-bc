// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
permissionset 72995575 "VDV Data Editor Tool"
{
    Assignable = true;
    Caption = 'Data Editor Tool';
    Permissions = table "VDV Data Editor Buffer" = X,
        tabledata "VDV Data Editor Buffer" = RMID,
        tabledata "VDV Field" = RIMD,
        table "VDV Field" = X,
        codeunit "VDV Single Instance Storage" = X,
        page "VDV Data Editor" = X,
        page "VDV Data Editor Buffer" = X,
        page "VDV Edit Value" = X,
        page "VDV Insert New Record" = X,
        page "VDV Run Editor From Filter" = X,
        page "VDV Select Fields" = X,
        tabledata "VDV Find and Replace" = RIMD,
        table "VDV Find and Replace" = X,
        codeunit "VDV Data Editor Mgt." = X,
        page "VDV Find and Replace" = X,
        page "VDV Key" = X,
        table "VDV Query Preset" = X,
        tabledata "VDV Query Preset" = RMID,
        page "VDV Query Preset" = X,
        tabledata "VDV Data Editor Setup" = RIMD,
        table "VDV Data Editor Setup" = X,
        tabledata "VDV Data Editor Log" = RIMD,
        table "VDV Data Editor Log" = X,
        page "VDV Data Editor Setup" = X,
        tabledata "VDV Binary Data Buffer" = RIMD,
        table "VDV Binary Data Buffer" = X,
        page "VDV Data Editor Log" = X,
        page "VDV Import/Export Dialog" = X,
        codeunit "VDV Data Operations" = X,
        codeunit "VDV Read Data Batch" = X;
}