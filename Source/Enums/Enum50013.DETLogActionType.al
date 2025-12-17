// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
enum 50013 "DET Log Action Type"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Insert)
    {
        Caption = 'Insert';
    }
    value(2; "Modify")
    {
        Caption = 'Modify';
    }
    value(3; Delete)
    {
        Caption = 'Delete';
    }
    value(4; Rename)
    {
        Caption = 'Rename';
    }
}
