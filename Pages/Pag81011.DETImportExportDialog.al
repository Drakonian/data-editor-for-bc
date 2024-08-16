page 81011 "DET Import/Export Dialog"
{
    Caption = 'Import/Export Dialog';
    PageType = StandardDialog;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(FileFormat; FileFormat)
                {
                    ApplicationArea = All;
                    Caption = 'File Format';
                    ToolTip = 'File Format';
                }
                field(ImportOnFind; ImportOnFind)
                {
                    ApplicationArea = All;
                    Caption = 'Import On Find';
                    ToolTip = 'Action to do when imported record is already exist in database';
                    Visible = IsImport;
                }
            }
        }
    }
    procedure SetIsImport(inIsImport: Boolean)
    begin
        IsImport := inIsImport;
    end;

    procedure GetImportOnFind(): Enum "DET Import On Find"
    begin
        exit(ImportOnFind);
    end;

    procedure GetFileFormat(): Enum "DET File Format"
    begin
        exit(FileFormat);
    end;

    var
        IsImport: Boolean;
        ImportOnFind: Enum "DET Import On Find";
        FileFormat: Enum "DET File Format";
}
