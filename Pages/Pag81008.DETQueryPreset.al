page 81008 "DET Query Preset"
{
    Caption = 'Data Editor Preset';
    PageType = Worksheet;
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
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(EmptyField; Rec.IsEmptyJson())
                {
                    Caption = 'Is Empty';
                    Editable = false;
                    ToolTip = 'Specifies wether the json data of this record is empty.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowJSONString)
            {
                ApplicationArea = All;
                Caption = 'Show Json';
                ToolTip = 'Show Json';
                Image = ShowList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    PresetJsonString: Text;
                begin
                    Rec.GetJson(PresetJsonString);
                    Message(PresetJsonString);
                end;
            }
            action(ImportJSON)
            {
                ApplicationArea = All;
                Caption = 'Import Json';
                ToolTip = 'Import Json';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

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

                    Rec."Preset Json".CreateOutStream(OutStream, TextEncoding::UTF8);

                    if not UploadIntoStream(ImportJsonDialogTxt, '', ImportFilterTxt, FileName, InStream) then
                        exit;

                    CopyStream(OutStream, InStream);
                    Rec.Modify(true);
                    Message('File has been imported.');
                end;
            }
            action(ExportJSON)
            {
                ApplicationArea = All;
                Caption = 'Export Json';
                ToolTip = 'Export Json';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
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
                    Rec."Preset Json".CreateInStream(InStream, TextEncoding::UTF8);

                    FileName := StrSubstNo(FileNamePatternLbl, Rec.Code);
                    if not DownloadFromStream(InStream, '', '', '', FileName) then
                        exit;
                end;
            }
        }
    }
}
