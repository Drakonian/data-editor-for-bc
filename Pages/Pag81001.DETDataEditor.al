page 81001 "DET Data Editor"
{

    Caption = 'Data Editor';
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Tasks;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(SourceTableNoField; SourceTableNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Source Table No.';
                    Caption = 'Source Table No.';
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        Error('');
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        AllObjWithCaption: Record AllObjWithCaption;
                        AllObjWithCaptionPage: Page "All Objects with Caption";
                    begin
                        AllObjWithCaption.SetRange("Object Type", AllObjWithCaption."Object Type"::Table);
                        AllObjWithCaptionPage.SetTableView(AllObjWithCaption);
                        AllObjWithCaptionPage.LookupMode(true);
                        AllObjWithCaptionPage.Editable(false);
                        if AllObjWithCaptionPage.RunModal() <> Action::LookupOK then
                            exit;
                        AllObjWithCaptionPage.GetRecord(AllObjWithCaption);
                        SourceTableNo := AllObjWithCaption."Object ID";
                        SourceTableName := AllObjWithCaption."Object Name";
                    end;
                }
                field(SourceTableNameField; SourceTableName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Source Table Name';
                    Caption = 'Source Table Name';
                    Editable = false;
                }
                field(WithoutValidationField; WithoutValidation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Without Validation';
                    Caption = 'Without Validation (Warning!)';
                }
            }
        }

    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if not (CloseAction in [CloseAction::OK, CloseAction::LookupOK]) then
            exit;
        if SourceTableNo <> 0 then
            RunDataEditorList();
    end;

    local procedure RunDataEditorList()
    var
        DataEditorBufferList: Page "DET Data Editor Buffer";
    begin
        DataEditorBufferList.LoadRecords(SourceTableNo, WithoutValidation);
        DataEditorBufferList.Run();
    end;

    var
        WithoutValidation: Boolean;
        SourceTableNo: Integer;
        SourceTableName: Text;
}
