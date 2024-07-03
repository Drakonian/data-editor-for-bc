page 81001 "DET Data Editor"
{
    Caption = 'Data Editor';
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Tasks;
    InsertAllowed = false;
    AccessByPermission = tabledata "DET Data Editor Buffer" = RIMD;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(PresetCodeField; PresetCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Preset';
                    Caption = 'Preset';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        QueryPreset: Record "DET Query Preset";
                        QueryPresetList: Page "DET Query Preset";
                    begin
                        QueryPresetList.LookupMode(true);
                        if (QueryPresetList.RunModal() in [Action::LookupOK, Action::OK]) then begin
                            QueryPresetList.GetRecord(QueryPreset);
                            PresetCode := QueryPreset.Code;
                            EnteredQueryPresetCode(PresetCode);
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        EnteredQueryPresetCode(PresetCode);
                    end;
                }
                field(PresetNameField; PresetName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Preset Name';
                    Caption = 'Preset Name';
                    Editable = false;
                }
                field(SourceTableNoField; SourceTableNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Source Table No.';
                    Caption = 'Source Table No.';
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        if SourceTableNo = 0 then begin
                            SourceTableName := '';
                            exit;
                        end;
                        SetTableCaption();
                        CustomTableView := '';
                        SetNumberOfRecords('');
                        SetDirty();
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
                        FieldFilter := '';
                        SetNumberOfRecords('');
                        SetDirty();
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
                        SetDirty();
                    end;
                }
                field(NumberOfRecordsField; NumberOfRecords)
                {
                    ApplicationArea = All;
                    ToolTip = 'Number Of Filtered Records';
                    Caption = 'Number Of Records';
                    Editable = false;
                }
                field(FieldFilter; FieldFilter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Set Initial Field Filter';
                    Caption = 'Field Filter';
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        SetFieldFilter();
                        SetDirty();
                    end;
                }
                field(WithoutValidationField; WithoutValidation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Without Validation';
                    Caption = 'Without Validation (Warning!)';
                    trigger OnValidate()
                    begin
                        SetDirty();
                    end;
                }
                field(ExcludeFlowFieldsField; ExcludeFlowFields)
                {
                    ApplicationArea = All;
                    ToolTip = 'Exclude FlowField''s from loading';
                    Caption = 'Exclude FlowField''s';

                    trigger OnValidate()
                    begin
                        SetDirty();
                    end;
                }
                field(SavePresetField; SavePreset)
                {
                    ApplicationArea = All;
                    Enabled = IsDirty and (PresetCode <> '');
                    ToolTip = 'Save Preset';
                    Caption = 'Save Preset';
                }
            }
        }

    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if not (CloseAction in [CloseAction::OK, CloseAction::LookupOK]) then
            exit;

        if IsDirty and SavePreset then
            DoSavePreset();

        if SourceTableNo <> 0 then
            RunDataEditorList();
    end;

    local procedure RunDataEditorList()
    var
        DataEditorBufferList: Page "DET Data Editor Buffer";
    begin
        DataEditorBufferList.LoadRecords(SourceTableNo, CustomTableView, FieldFilter, WithoutValidation, ExcludeFlowFields);
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
        CustomTableView := CustomFilterPageBuilder.GetView(SourceTableName, false);
        SetNumberOfRecords(CustomTableView);
    end;

    local procedure SetFieldFilter()
    var
        SelectFields: Page "DET Select Fields";
    begin
        if SourceTableNo = 0 then
            exit;
        SelectFields.LoadFields(SourceTableNo, FieldFilter);
        SelectFields.LookupMode(true);
        SelectFields.Editable(true);
        if SelectFields.RunModal() <> Action::LookupOK then
            exit;
        FieldFilter := SelectFields.GetFieldIdFilter();
    end;

    local procedure EnteredQueryPresetCode(QueryPresetCode: Code[20])
    var
        QueryPreset: Record "DET Query Preset";
        CreateNewPresetQst: Label 'Do you want to create a new preset %1?', Comment = '%1 = Preset Code';
    begin
        PresetName := '';
        if QueryPreset.Get(QueryPresetCode) then begin
            PresetName := QueryPreset.Name;
            if ShouldLoadPreset() then
                LoadPreset(QueryPreset);
        end else
            if Confirm(CreateNewPresetQst, false, QueryPresetCode) then begin
                QueryPreset.Init();
                QueryPreset.Code := QueryPresetCode;
                QueryPreset.Insert(true);
                SavePreset := true;
            end;
    end;

    local procedure LoadPreset(var QueryPreset: Record "DET Query Preset")
    var
        PresetJsonObject: JsonObject;
        PresetJsonToken: JsonToken;
    begin
        if QueryPreset.IsEmptyJson() then begin
            IsDirty := true;
            SavePreset := true;
            exit;
        end;

        QueryPreset.GetJsonObject(PresetJsonObject);

        if PresetJsonObject.Get('SourceTableNo', PresetJsonToken) then
            SourceTableNo := PresetJsonToken.AsValue().AsInteger();
        if PresetJsonObject.Get('CustomTableView', PresetJsonToken) then
            CustomTableView := PresetJsonToken.AsValue().AsText();
        if PresetJsonObject.Get('FieldFilter', PresetJsonToken) then
            FieldFilter := PresetJsonToken.AsValue().AsText();
        if PresetJsonObject.Get('ExcludeFlowFields', PresetJsonToken) then
            ExcludeFlowFields := PresetJsonToken.AsValue().AsBoolean();
        if PresetJsonObject.Get('WithoutValidation', PresetJsonToken) then
            WithoutValidation := PresetJsonToken.AsValue().AsBoolean();

        IsDirty := false;
        SetTableCaption();
        SetNumberOfRecords(CustomTableView);
    end;

    local procedure DoSavePreset()
    var
        QueryPreset: Record "DET Query Preset";
        PresetNameCanNotBeEmptyErr: Label 'Preset name can not be empty.';
        SourceTableNoCantBeEmptyErr: Label 'Source Table No. can''t be empty.';
        PresetJson: JsonObject;
        PresetJsonString: Text;
    begin
        if PresetCode = '' then
            Error(PresetNameCanNotBeEmptyErr);

        QueryPreset.Get(PresetCode);

        if SourceTableNo = 0 then
            Error(SourceTableNoCantBeEmptyErr);

        PresetJson.Add('SourceTableNo', SourceTableNo);
        PresetJson.Add('CustomTableView', CustomTableView);
        PresetJson.Add('FieldFilter', FieldFilter);
        PresetJson.Add('ExcludeFlowFields', ExcludeFlowFields);
        PresetJson.Add('WithoutValidation', WithoutValidation);
        PresetJson.WriteTo(PresetJsonString);

        QueryPreset.SetJson(PresetJsonString);

        IsDirty := false;
    end;

    local procedure ShouldLoadPreset(): Boolean
    var
        WantToLoadPresetExistingSettingsOverwrittenQst: Label 'Do you really want to load the preset?\Existing settings will be overwritten.';
    begin
        if not IsDirty then
            exit(true);

        if IsDirty then
            if Confirm(WantToLoadPresetExistingSettingsOverwrittenQst, false) then
                exit(true);

        exit(false);
    end;

    local procedure SetDirty()
    begin
        IsDirty := true;
    end;


    local procedure SetTableCaption()
    var
        AllObjWithCaption: Record AllObjWithCaption;
    begin
        AllObjWithCaption.Get(AllObjWithCaption."Object Type"::Table, SourceTableNo);
        SourceTableName := AllObjWithCaption."Object Name";
    end;

    var
        WithoutValidation: Boolean;
        ExcludeFlowFields: Boolean;
        SourceTableNo: Integer;
        NumberOfRecords: Integer;
        SourceTableName: Text;
        CustomTableView: Text;
        FieldFilter: Text;
        PresetCode: Code[20];
        SavePreset: Boolean;
        IsDirty: Boolean;
        PresetName: Text;
}
