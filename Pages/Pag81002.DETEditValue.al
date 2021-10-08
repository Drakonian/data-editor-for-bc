page 81002 "DET Edit Value"
{

    Caption = 'Edit Value';
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            group("DET Text")
            {
                Visible = IsTextValue;
                ShowCaption = false;
                field(TextValue; TextValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    trigger OnLookup(var text: Text): Boolean
                    begin
                        text := TextValue;
                        CustomTableRelation(text);
                        TextValue := CopyStr(text, 1, MaxStrLen(TextValue));
                    end;
                }
            }
            group("DET Code")
            {
                Visible = isCodeValue;
                ShowCaption = false;
                field(CodeValue; CodeValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    trigger OnLookup(var text: Text): Boolean
                    begin
                        text := CodeValue;
                        CustomTableRelation(text);
                        CodeValue := CopyStr(text, 1, MaxStrLen(CodeValue));
                    end;
                }
            }
            group("DET Decimal")
            {
                Visible = IsDecimalValue;
                ShowCaption = false;
                field(DecimalValue; DecimalValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group("DET Integer")
            {
                Visible = IsIntegerValue;
                ShowCaption = false;
                field(IntegerValue; IntegerValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    trigger OnLookup(var text: Text): Boolean
                    begin
                        text := Format(IntegerValue);
                        CustomTableRelation(text);
                        if Evaluate(IntegerValue, text) then;
                    end;
                }
            }
            group("DET Date")
            {
                Visible = IsDateValue;
                ShowCaption = false;
                field(DateValue; DateValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group("DET Date Formula")
            {
                Visible = IsDateFormulaValue;
                ShowCaption = false;
                field(DateFormulaValue; DateFormulaValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group("DET Time")
            {
                Visible = IsTimeValue;
                ShowCaption = false;
                field(TimeValue; TimeValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group("DET Date Time")
            {
                Visible = IsDateTimeValue;
                ShowCaption = false;
                field(DateTimeValue; DateTimeValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group("DET Boolean")
            {
                Visible = IsBooleanValue;
                ShowCaption = false;
                field(BooleanValue; BooleanValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group("DET Guid")
            {
                Visible = IsGuidValue;
                ShowCaption = false;
                field(GuidValue; GuidValue)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
        }
    }

    local procedure CustomTableRelation(var NewValue: Text)
    var
        SourceFieldInfo: Record Field;
        RecRef: RecordRef;
        FieldRefVar: FieldRef;
        VariantRecord: Variant;
        RelationFieldId: Integer;
    begin
        if FieldInfo.RelationTableNo = 0 then
            exit;
        RecRef.Open(FieldInfo.RelationTableNo);
        VariantRecord := RecRef;
        if not (Page.RunModal(0, VariantRecord) in [Action::LookupOK, Action::OK]) then
            exit;
        RecRef.GetTable(VariantRecord);
        if FieldInfo.RelationFieldNo = 0 then begin
            SourceFieldInfo.SetRange(TableNo, FieldInfo.RelationTableNo);
            SourceFieldInfo.SetRange(IsPartOfPrimaryKey, true);
            SourceFieldInfo.FindFirst();
            RelationFieldId := SourceFieldInfo."No.";
        end else
            RelationFieldId := FieldInfo.RelationFieldNo;

        FieldRefVar := RecRef.Field(RelationFieldId);
        if FieldRefVar.Class() = FieldClass::FlowField then
            FieldRefVar.CalcField();
        NewValue := Format(FieldRefVar.Value);
    end;

    procedure SetInitValue(InitValue: Text)
    begin
        case FieldInfo.Type of
            FieldInfo.Type::Text:
                begin
                    Evaluate(TextValue, InitValue);
                    IsTextValue := true;
                end;
            FieldInfo.Type::Code:
                begin
                    Evaluate(CodeValue, InitValue);
                    isCodeValue := true;
                end;
            FieldInfo.Type::Boolean:
                begin
                    Evaluate(BooleanValue, InitValue);
                    IsBooleanValue := true;
                end;
            FieldInfo.Type::Integer:
                begin
                    Evaluate(IntegerValue, InitValue);
                    IsIntegerValue := true;
                end;
            FieldInfo.Type::Decimal:
                begin
                    Evaluate(DecimalValue, InitValue);
                    IsDecimalValue := true;
                end;
            FieldInfo.Type::Date:
                begin
                    Evaluate(DateValue, InitValue);
                    IsDateValue := true;
                end;
            FieldInfo.Type::DateFormula:
                begin
                    Evaluate(DateFormulaValue, InitValue);
                    IsDateFormulaValue := true;
                end;
            FieldInfo.Type::DateTime:
                begin
                    Evaluate(DateTimeValue, InitValue);
                    IsDateTimeValue := true;
                end;
            FieldInfo.Type::Time:
                begin
                    Evaluate(TimeValue, InitValue);
                    IsTimeValue := true;
                end;
            FieldInfo.Type::GUID:
                begin
                    Evaluate(GuidValue, InitValue);
                    IsGuidValue := true;
                end;
        end;
    end;

    procedure GetResult(var result: Variant)
    begin
        case true of
            IsBooleanValue:
                result := BooleanValue;
            isCodeValue:
                result := CodeValue;
            IsTextValue:
                result := TextValue;
            IsIntegerValue:
                result := IntegerValue;
            IsDecimalValue:
                result := DecimalValue;
            IsDateValue:
                result := DateValue;
            IsDateFormulaValue:
                result := DateFormulaValue;
            IsDateTimeValue:
                result := DateTimeValue;
            IsTimeValue:
                result := TimeValue;
            IsGuidValue:
                result := GuidValue;
        end;
    end;

    procedure SetFieldInfo(inFieldInfo: Record Field)
    begin
        FieldInfo := inFieldInfo;
    end;

    var
        FieldInfo: Record Field;
        DateFormulaValue: DateFormula;
        BooleanValue: Boolean;
        CodeValue: code[2048];
        TextValue: Text[2048];
        IntegerValue: Integer;
        DecimalValue: Decimal;
        DateValue: Date;
        DateTimeValue: DateTime;
        TimeValue: Time;
        GuidValue: Guid;
        [InDataSet]
        IsBooleanValue, isCodeValue, IsTextValue, IsIntegerValue, IsDecimalValue, IsDateValue, IsDateFormulaValue, IsDateTimeValue, IsTimeValue, IsGuidValue : Boolean;

}
