// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
enum 81001 "DET Import On Find"
{
    Extensible = true;

    value(0; Error)
    {
        Caption = 'Error';
    }
    value(1; "Modify")
    {
        Caption = 'Modify';
    }
    value(2; Skip)
    {
        Caption = 'Skip';
    }
}
