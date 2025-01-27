page 81006 "DET Key"
{
    ApplicationArea = All;
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
                }
                field(SumIndexFields; Rec.SumIndexFields)
                {
                    ToolTip = 'Specifies the value of the SumIndexFields field.';
                }
                field(SQLIndex; Rec.SQLIndex)
                {
                    ToolTip = 'Specifies the value of the SQLIndex field.';
                }
                field(MaintainSQLIndex; Rec.MaintainSQLIndex)
                {
                    ToolTip = 'Specifies the value of the MaintainSQLIndex field.';
                }
                field(MaintainSIFTIndex; Rec.MaintainSIFTIndex)
                {
                    ToolTip = 'Specifies the value of the MaintainSIFTIndex field.';
                }
                field(Clustered; Rec.Clustered)
                {
                    ToolTip = 'Specifies if the table data is clustered.';
                }
                field(Unique; Rec.Unique)
                {
                    ToolTip = 'Specifies the value of the Unique field.';
                }
            }
        }
    }
}
