table 81001 "DET Field"
{
    Caption = 'Field';
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "Field Id"; Integer)
        {
            Caption = 'Field Id';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[2048])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; Included; Boolean)
        {
            Caption = 'Included';
            DataClassification = CustomerContent;
        }
        field(4; IsPartOfPrimaryKey; Boolean)
        {
            Caption = 'IsPartOfPrimaryKey';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Field Id")
        {
            Clustered = true;
        }
    }
}
