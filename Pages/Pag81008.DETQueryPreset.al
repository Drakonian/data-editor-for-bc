page 81008 "DET Query Preset"
{
    ApplicationArea = All;
    Caption = 'Data Editor Preset';
    PageType = List;
    SourceTable = "DET Query Preset";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(EmptyField; Rec.IsEmptyJson())
                {
                    Caption = 'Is Empty';
                    Editable = false;
                    ToolTip = 'Specifies wether the json data of this record is empty.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Show Json String")
            {
                ApplicationArea = All;
                Caption = 'Show Json';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Show Json';

                trigger OnAction()
                var
                    PresetJsonString: Text;
                begin
                    Rec.GetJson(PresetJsonString);
                    Message(PresetJsonString);
                end;
            }
            action("Export Json")
            {
                ApplicationArea = All;
                Caption = 'Export Json';
                ToolTip = 'Export Json';

                trigger OnAction()
                var
                    FileNamePatternLbl: Label 'DET_Preset_%1.json', Locked = true;
                    JsonIsEmptyErr: Label 'Json is empty.';
                    FileName: Text;
                    InStream: InStream;
                begin
                    if Rec.IsEmptyJson() then
                        Error(JsonIsEmptyErr);

                    Rec.CalcFields("Preset Json");
                    Rec."Preset Json".CreateInStream(InStream);

                    FileName := StrSubstNo(FileNamePatternLbl, Rec.Code);
                    if not DownloadFromStream(InStream, '', '', '', FileName) then
                        exit;
                end;
            }

            action("Import Json")
            {
                ApplicationArea = All;
                Caption = 'Import Json';
                ToolTip = 'Import Json';

                trigger OnAction()
                var
                    WantToOverwriteExistingDataQst: Label 'Do you want to overwrite existing data for %1', Comment = '%1 = Preset Code';
                    ImportJsonDialogTxt: Label 'Import Json';
                    ImportFilterTxt: Label 'Json files (*.json)|*.json';
                    FileName: Text;
                    InStream: InStream;
                    OutStream: OutStream;
                begin
                    if not Rec.IsEmptyJson() then
                        if not Confirm(WantToOverwriteExistingDataQst, false, Rec.Code) then
                            exit;

                    Rec."Preset Json".CreateOutStream(OutStream);

                    if not UploadIntoStream(ImportJsonDialogTxt, '', ImportFilterTxt, FileName, InStream) then
                        exit;

                    CopyStream(OutStream, InStream);
                    Rec.Modify(true);
                    Message('File has been imported.');
                end;
            }
        }
    }
}
