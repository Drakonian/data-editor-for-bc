codeunit 81130 "TDET DE Buffer Test Mode"
{
    EventSubscriberInstance = Manual;

    var
        IsProductionEnvironment: Boolean;

    procedure SetProductionEnvironment(NewIsProductionEnvironment: Boolean)
    begin
        IsProductionEnvironment := NewIsProductionEnvironment;
    end;

    [EventSubscriber(ObjectType::Page, Page::"DET Data Editor Buffer", 'OnPageInitialization', '', false, false)]
    local procedure OnPageInitialization(var IsTestMode: Boolean)
    begin
        IsTestMode := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"DET Data Editor Mgt.", 'OnAfterIsProduction', '', false, false)]
    local procedure DataEditorMgt_OnAfterIsProduction(var IsProduction: Boolean)
    begin
        IsProduction := IsProductionEnvironment;
    end;

    [EventSubscriber(ObjectType::Table, Database::"DET Data Editor Buffer", 'OnBeforeModifyEvent', '', false, false)]
    local procedure DataEditorBuffer_OnBeforeModifyEvent(RunTrigger: Boolean; var Rec: Record "DET Data Editor Buffer")
    begin
        Rec."Modified At" := CurrentDateTime();
    end;

    [EventSubscriber(ObjectType::Table, Database::"DET Data Editor Buffer", 'OnBeforeInsertEvent', '', false, false)]
    local procedure DataEditorBuffer_OnBeforeInsertEvent(RunTrigger: Boolean; var Rec: Record "DET Data Editor Buffer")
    begin
        Rec."Modified At" := CurrentDateTime();
    end;
}
