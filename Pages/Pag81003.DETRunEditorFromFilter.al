page 81003 "DET Run Editor From Filter"
{
    //Used for call Data Editor directly without Dialog window
    //Example of usage call page via link: 
    //&page=81003&filter='Table Number' is '18' and 'Exclude FlowFields' is '1' and 'Without Validate' is '0'
    Caption = 'Close Me';
    PageType = ConfirmationDialog;
    SourceTable = "DET Data Editor Buffer";
    SourceTableTemporary = true;


    trigger OnOpenPage()
    begin
        RunDataEditorList();
        Error('');
    end;

    local procedure RunDataEditorList()
    var
        DataEditorBufferList: Page "DET Data Editor Buffer";
        SourceTableNo: Integer;
        ExcludeFlowFields: Boolean;
        WithoutValidate: Boolean;
    begin
        if Rec.GetFilter("Table Number") = '' then
            exit;
        Evaluate(SourceTableNo, Rec.GetFilter("Table Number"));
        if Rec.GetFilter("Without Validate") <> '' then
            Evaluate(WithoutValidate, Rec.GetFilter("Without Validate"));
        if Rec.GetFilter("Exclude FlowFields") <> '' then
            Evaluate(ExcludeFlowFields, Rec.GetFilter("Exclude FlowFields"));
        DataEditorBufferList.LoadRecords(SourceTableNo, '', WithoutValidate, ExcludeFlowFields);
        DataEditorBufferList.Run();
    end;
}
