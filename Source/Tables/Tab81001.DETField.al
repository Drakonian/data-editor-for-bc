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
        field(60; "App Package ID"; Guid)
        {
            Caption = 'App Package ID';
        }

        field(1000; "App Name"; Text[250])
        {
            Caption = 'App Name';
            CalcFormula = lookup("NAV App Installed App".Name where("Package ID" = field("App Package ID")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(1001; "App Publisher"; Text[250])
        {
            Caption = 'Publisher';
            CalcFormula = lookup("NAV App Installed App".Publisher where("Package ID" = field("App Package ID")));
            FieldClass = FlowField;
            Editable = false;
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
