page 81011 "DET Import/Export Dialog"
{
    ApplicationArea = All;
    Caption = 'Import/Export Dialog';
    PageType = StandardDialog;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ImportOnFind; ImportOnFind)
                {
                    ApplicationArea = All;
                    Caption = 'Import On Find';
                    ToolTip = 'Action to do when imported record is already exist in database';
                }
            }
        }
    }

    procedure GetImportOnFind(): Enum "DET Import On Find"
    begin
        exit(ImportOnFind);
    end;

    var
        ImportOnFind: Enum "DET Import On Find";
}
