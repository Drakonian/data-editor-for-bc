page 81003 "DET Run Editor From Filter"
{

    Caption = 'Close Me';
    PageType = ConfirmationDialog;
    SourceTable = "DET Data Editor Buffer";
    SourceTableTemporary = true;


    trigger OnOpenPage()
    begin
        RunDataEditorList();
    end;

    local procedure RunDataEditorList()
    var
        DataEditorBufferList: Page "DET Data Editor Buffer";
    begin
        if Rec.GetFilter("Table Number") = '' then
            exit;
        Evaluate(SourceTableNo, Rec.GetFilter("Table Number"));
        DataEditorBufferList.LoadRecords(SourceTableNo, false);
        DataEditorBufferList.Run();
        CurrPage.Close();
    end;

    var
        SourceTableNo: Integer;
}
