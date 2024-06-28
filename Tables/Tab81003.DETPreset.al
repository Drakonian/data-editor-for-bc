table 81003 "DET Query Preset"
{
    Caption = 'Preset';
    DataClassification = CustomerContent;
    LookupPageId = "DET Query Preset";
    DataCaptionFields = Code, Name;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; "Preset Json"; Blob)
        {
            Caption = 'Preset Json';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    internal procedure SetJson(PresetJsonString: Text): Boolean
    var
        OutStream: Outstream;
    begin
        Rec."Preset Json".CreateOutStream(OutStream);
        if (OutStream.WriteText(PresetJsonString) > 0) then
            exit(true);

        exit(false);
    end;

    internal procedure GetJson(var PresetJsonString: Text): Boolean
    var
        InStream: Instream;
    begin
        Rec.CalcFields("Preset Json");
        Rec."Preset Json".CreateInStream(InStream);
        if (InStream.ReadText(PresetJsonString) > 0) then
            exit(true);

        exit(false);
    end;

    internal procedure GetJsonObject(var PresetJsonObject: JsonObject): Boolean
    var
        PresetJsonString: Text;
    begin
        GetJson(PresetJsonString);
        PresetJsonObject.ReadFrom(PresetJsonString);
    end;

    internal procedure IsEmptyJson(): Boolean
    begin
        Rec.CalcFields("Preset Json");
        exit(Rec."Preset Json".Length = 0);
    end;
}
