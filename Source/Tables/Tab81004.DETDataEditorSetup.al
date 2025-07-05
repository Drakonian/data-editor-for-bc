// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
table 81004 "DET Data Editor Setup"
{
    Caption = 'Data Editor Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Enable Data Editor Log"; Boolean)
        {
            Caption = 'Enable Data Editor Log';
            trigger OnValidate()
            var
                DataEditorMgt: Codeunit "DET Data Editor Mgt.";
                RecRef: RecordRef;
                xRecRef: RecordRef;
                FieldRef: FieldRef;
                xFieldRef: FieldRef;
            begin
                RecRef.GetTable(Rec);
                xRecRef.GetTable(xRec);

                FieldRef := RecRef.Field(Rec.FieldNo("Enable Data Editor Log"));
                xFieldRef := xRecRef.Field(Rec.FieldNo("Enable Data Editor Log"));

                DataEditorMgt.LogModify(RecRef.Number(), Rec.FieldNo("Enable Data Editor Log"), Rec.RecordId(), xFieldRef, FieldRef, true);
            end;
        }
        field(3; "Number of Threads"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Number of Threads';
            MinValue = 2;
            MaxValue = 8;
            InitValue = 6;
        }
        field(4; "Show Run After"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Show Run After';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
