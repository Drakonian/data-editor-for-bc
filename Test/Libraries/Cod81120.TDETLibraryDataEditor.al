codeunit 81120 "TDET Library - Data Editor"
{
    procedure VerifyBufferFieldsWithSourceRecord(var DataEditorBuffer: TestPage "DET Data Editor Buffer"; ListOfRecordIds: List of [RecordId]; FieldNoFilter: List of [Integer]; ExcludeFlowFields: Boolean)
    var
        Assert: Codeunit "Library Assert";
        DataEditorBufferHelper: Codeunit "TDET Data Editor Buffer Helper";
        SourceRecRef: RecordRef;
        SourceFieldRef: FieldRef;
        CurrentRecordId: RecordId;
        SkipField: Boolean;
        i, j, k : Integer;
    begin
        if DataEditorBuffer.First() then
            repeat
                k := 0;
                i += 1;
                CurrentRecordId := ListOfRecordIds.Get(i);
                DataEditorBuffer."Source Record ID".AssertEquals(CurrentRecordId);

                SourceRecRef.Get(CurrentRecordId);

                for j := 1 to SourceRecRef.FieldCount() do begin
                    SourceFieldRef := SourceRecRef.FieldIndex(j);
                    SkipField := (SourceFieldRef.Class() = FieldClass::FlowFilter) or
                        ((SourceFieldRef.Class() = FieldClass::FlowField) and ExcludeFlowFields);
                    if not SkipField then begin
                        if SourceFieldRef.Class() = FieldClass::FlowField then
                            SourceFieldRef.CalcField();
                        k += 1;
                        if (FieldNoFilter.Count() = 0) or (FieldNoFilter.Contains(SourceFieldRef.Number())) then
                            DataEditorBufferHelper.AssertBufferFieldValue(DataEditorBuffer, k, SourceFieldRef.Value());
                    end;
                end;
            until not DataEditorBuffer.Next();

        Assert.AreEqual(ListOfRecordIds.Count(), i, '');
    end;


}
