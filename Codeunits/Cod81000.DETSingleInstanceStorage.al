codeunit 81000 "DET Single Instance Storage"
{
    SingleInstance = true;
    procedure SetCaptionDictionary(var inCaptionDictionary: Dictionary of [Integer, Text])
    begin
        CaptionDictionary := inCaptionDictionary;
    end;

    procedure GetCaption(FieldNo: Integer) Caption: Text
    begin
        if not CaptionDictionary.Get(FieldNo, Caption) then
            exit;
    end;

    var
        CaptionDictionary: Dictionary of [Integer, Text];
}