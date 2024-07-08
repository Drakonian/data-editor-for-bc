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
