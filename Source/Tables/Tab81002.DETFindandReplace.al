table 81002 "DET Find and Replace"
{
    Caption = 'Find and Replace';
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Record PK"; Text[2048])
        {
            Caption = 'Record PK';
            DataClassification = CustomerContent;
        }
        field(3; "Field Number"; Integer)
        {
            Caption = 'Field Number';
            DataClassification = CustomerContent;
        }
        field(4; "Field Value"; Text[2048])
        {
            Caption = 'Field Value';
            DataClassification = CustomerContent;
        }
        field(5; "Record Id"; RecordId)
        {
            Caption = 'Record Id';
            DataClassification = CustomerContent;
        }
        field(6; "Field Caption"; Text[2048])
        {
            Caption = 'Field Caption';
            DataClassification = CustomerContent;
        }
        field(7; "Is Editable"; Boolean)
        {
            Caption = 'Is Editable';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
