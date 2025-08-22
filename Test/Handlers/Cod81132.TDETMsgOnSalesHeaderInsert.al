codeunit 81132 "TDET Msg On SalesHeader Insert"
{
    EventSubscriberInstance = Manual;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure SalesHeader_OnAfterInsertEvent(var Rec: Record "Sales Header"; RunTrigger: Boolean)
    begin
        if RunTrigger then
            Message('test');
    end;
}