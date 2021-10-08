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
                    var
                        AllObjWithCaption: Record AllObjWithCaption;
                    begin
                        if SourceTableNo = 0 then begin
                            SourceTableName := '';
                            exit;
                        end;
                        AllObjWithCaption.Get(AllObjWithCaption."Object Type"::Table, SourceTableNo);
                        SourceTableName := AllObjWithCaption."Object Name";
                        CustomTableView := '';
                        SetNumberOfRecords('');
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
                        CustomTableView := '';
                        SetNumberOfRecords('');
                    end;
                }
                field(SourceTableNameField; SourceTableName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Source Table Name';
                    Caption = 'Source Table Name';
                    Editable = false;
                }
                field(CustomTableViewField; CustomTableView)
                {
                    ApplicationArea = All;
                    ToolTip = 'Set Initial Table Filter';
                    Caption = 'Table Filter';
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        SetCustomFilter();
                    end;
                }
                field(NumberOfRecordsField; NumberOfRecords)
                {
                    ApplicationArea = All;
                    ToolTip = 'Number Of Filtered Records';
                    Caption = 'Number Of Records';
                    Editable = false;
                }
                field(WithoutValidationField; WithoutValidation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Without Validation';
                    Caption = 'Without Validation (Warning!)';
                }
                field(ExcludeFlowFieldsField; ExcludeFlowFields)
                {
                    ApplicationArea = All;
                    ToolTip = 'Exclude FlowField''s from loading';
                    Caption = 'Exclude FlowField''s';
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
        DataEditorBufferList.LoadRecords(SourceTableNo, CustomTableView, WithoutValidation, ExcludeFlowFields);
        DataEditorBufferList.Run();
    end;

    local procedure SetNumberOfRecords(TableView: Text)
    var
        RecRef: RecordRef;
    begin
        if SourceTableNo = 0 then
            exit;
        RecRef.Open(SourceTableNo);
        if TableView <> '' then
            RecRef.SetView(TableView);
        NumberOfRecords := RecRef.Count();
    end;

    local procedure SetCustomFilter()
    var
        CustomFilterPageBuilder: FilterPageBuilder;
    begin
        if SourceTableNo = 0 then
            exit;
        CustomFilterPageBuilder.AddTable(SourceTableName, SourceTableNo);
        if CustomTableView <> '' then
            CustomFilterPageBuilder.SetView(SourceTableName, CustomTableView);
        CustomFilterPageBuilder.RunModal();
        CustomTableView := CustomFilterPageBuilder.GetView(SourceTableName);
        SetNumberOfRecords(CustomTableView);
    end;

    var
        WithoutValidation: Boolean;
        ExcludeFlowFields: Boolean;
        SourceTableNo: Integer;
        NumberOfRecords: Integer;
        SourceTableName: Text;
        CustomTableView: Text;
}
