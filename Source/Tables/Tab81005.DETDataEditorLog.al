table 81005 "DET Data Editor Log"
{
    Caption = 'Data Editor Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
        }
        field(2; "Table No."; Integer)
        {
            Caption = 'Table No.';
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Table));
        }
        field(3; "Table Name"; Text[300])
        {
            Caption = 'Table Name';
            CalcFormula = lookup(AllObjWithCaption."Object Name" where("Object Type" = const(Table), "Object ID" = field("Table No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(4; "Field No."; Integer)
        {
            Caption = 'Field No.';
            TableRelation = Field."No." where(TableNo = field("Table No."));
        }
        field(5; "Field Name"; Text[300])
        {
            Caption = 'Field Name';
            CalcFormula = lookup(Field.FieldName where(TableNo = field("Table No."), "No." = field("Field No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(6; "Action Type"; Enum "DET Log Action Type")
        {
            Caption = 'Action Type';
        }
        field(7; "Old Value"; Text[2048])
        {
            Caption = 'Old Value';
        }
        field(8; "New Value"; Text[2048])
        {
            Caption = 'New Value';
        }
        field(9; "Old Value BLOB"; Blob)
        {
            Caption = 'Old Value BLOB';
        }
        field(10; "New Value BLOB"; Blob)
        {
            Caption = 'New Value BLOB';
        }
        field(11; "With Validation"; Boolean)
        {
            Caption = 'With Validation';
        }
        field(12; "Record Id"; RecordId)
        {
            Caption = 'Record Id';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(ModifiedKey; SystemModifiedAt)
        {

        }
    }

    procedure GetBLOBDataAsTxt(FieldNo: Integer; Encoding: TextEncoding) Result: Text
    var
        TempBlob: Codeunit "Temp Blob";
        TypeHelper: Codeunit "Type Helper";
        RecRef: RecordRef;
        DataFieldRef: FieldRef;
        ResponseInStream: InStream;
        TextBuffer: Text;
    begin
        RecRef.GetTable(Rec);
        DataFieldRef := RecRef.Field(FieldNo);
        if DataFieldRef.Type <> DataFieldRef.Type::Blob then
            exit;
        DataFieldRef.CalcField();

        TempBlob.FromFieldRef(DataFieldRef);

        if not TempBlob.HasValue() then
            exit;

        TempBlob.CreateInStream(ResponseInStream, Encoding);
        while not ResponseInStream.EOS() do begin
            ResponseInStream.ReadText(TextBuffer);
            Result += TextBuffer + TypeHelper.CRLFSeparator();
        end;
    end;


    procedure SetBLOBTextData(FieldNo: Integer; TextData: Text; Encoding: TextEncoding)
    var
        ResponseOutStream: OutStream;
    begin
        case FieldNo of
            Rec.FieldNo("Old Value BLOB"):
                Rec."Old Value BLOB".CreateOutStream(ResponseOutStream, Encoding);
            Rec.FieldNo("New Value BLOB"):
                Rec."New Value BLOB".CreateOutStream(ResponseOutStream, Encoding);
        end;

        ResponseOutStream.WriteText(TextData);

        Rec.Modify(true);
    end;

    procedure GetUserName(): Text
    var
        User: Record User;
    begin
        if User.Get(Rec.SystemCreatedBy) then
            exit(User."User Name");
    end;
}
