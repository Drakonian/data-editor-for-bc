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
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
