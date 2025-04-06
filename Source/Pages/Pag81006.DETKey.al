page 81006 "DET Key"
{
    Caption = 'Key';
    PageType = List;
    SourceTable = "Key";
    UsageCategory = None;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Key"; Rec."Key")
                {
                    ToolTip = 'Specifies the key.';
                    ApplicationArea = All;
                }
                field(SumIndexFields; Rec.SumIndexFields)
                {
                    ToolTip = 'Specifies the value of the SumIndexFields field.';
                    ApplicationArea = All;
                }
                field(SQLIndex; Rec.SQLIndex)
                {
                    ToolTip = 'Specifies the value of the SQLIndex field.';
                    ApplicationArea = All;
                }
                field(MaintainSQLIndex; Rec.MaintainSQLIndex)
                {
                    ToolTip = 'Specifies the value of the MaintainSQLIndex field.';
                    ApplicationArea = All;
                }
                field(MaintainSIFTIndex; Rec.MaintainSIFTIndex)
                {
                    ToolTip = 'Specifies the value of the MaintainSIFTIndex field.';
                    ApplicationArea = All;
                }
                field(Clustered; Rec.Clustered)
                {
                    ToolTip = 'Specifies if the table data is clustered.';
                    ApplicationArea = All;
                }
                field(Unique; Rec.Unique)
                {
                    ToolTip = 'Specifies the value of the Unique field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
