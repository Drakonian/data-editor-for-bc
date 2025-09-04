// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
codeunit 72995575 "VDV Single Instance Storage"
{
    SingleInstance = true;
    EventSubscriberInstance = Manual;
    procedure SetCaptionDictionary(var inCaptionDictionary: Dictionary of [Integer, Text])
    begin
        CaptionDictionary := inCaptionDictionary;
    end;

    procedure GetCaption(FieldNo: Integer) Caption: Text
    begin
        if not CaptionDictionary.Get(FieldNo, Caption) then
            exit;
    end;

    [EventSubscriber(ObjectType::table, database::"Sales Header", 'OnBeforeRename', '', false, false)]
    local procedure SalesHeader_OnBeforeRename(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::table, database::"Purchase Header", 'OnBeforeOnRename', '', false, false)]
    local procedure PurchaseHeader_OnBeforeOnRename(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;

    var
        CaptionDictionary: Dictionary of [Integer, Text];
}