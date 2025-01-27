table 81006 "DET Binary Data Buffer"
{
    Caption = 'Binary Data Buffer';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Some BLOB"; Blob)
        {
            Caption = 'Some BLOB';
        }
        field(3; "Some Media"; Media)
        {
            Caption = 'Some Media';
        }
        field(4; "Some Media Set"; MediaSet)
        {
            Caption = 'Some Media Set';
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
