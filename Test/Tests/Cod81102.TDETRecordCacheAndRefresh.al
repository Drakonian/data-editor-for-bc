codeunit 81102 "TDET Record Cache And Refresh"
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        LibrarySales: Codeunit "Library - Sales";
        LibraryRandom: Codeunit "Library - Random";
        LibraryDataEditor: Codeunit "TDET Library - Data Editor";
        LibraryVariableStorage: Codeunit "Library - Variable Storage";
        Assert: Codeunit "Library Assert";

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure RefreshNoChanges()
    var
        StandardText: Record "Standard Text";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        LatestModifiedDT: DateTime;
        RecordsToGenerate: Integer;
        i: Integer;
    begin
        Init();
        StandardText.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandInt(100);

        for i := 1 to RecordsToGenerate do begin
            LibrarySales.CreateStandardText(StandardText);
            ListOfRecorIds.Add(StandardText.RecordId());
        end;

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Standard Text");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StandardText.TableCaption(), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);

        LatestModifiedDT := 0DT;
        if DataEditorBuffer.First() then
            repeat
                if LatestModifiedDT < DataEditorBuffer.SystemModifiedAt.AsDateTime() then
                    LatestModifiedDT := DataEditorBuffer.SystemModifiedAt.AsDateTime();
            until not DataEditorBuffer.Next();

        DataEditorBuffer.Refresh.Invoke();

        DataEditorBuffer.Filter.SetFilter(SystemModifiedAt, StrSubstNo('>%1', LatestModifiedDT));
        Assert.IsFalse(DataEditorBuffer.First(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure RefreshRecordsModified()
    var
        StandardText: Record "Standard Text";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        LatestModifiedDT: DateTime;
        RecordsToGenerate: Integer;
        i: Integer;
    begin
        Init();
        StandardText.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandIntInRange(15, 100);

        for i := 1 to RecordsToGenerate do begin
            LibrarySales.CreateStandardText(StandardText);
            ListOfRecorIds.Add(StandardText.RecordId());
        end;

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Standard Text");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();

        Assert.AreEqual(StandardText.TableCaption(), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);

        Sleep(1000);
        LatestModifiedDT := CurrentDateTime();

        StandardText.Get(ListOfRecorIds.Get(3));
        StandardText.Description := CopyStr(LibraryRandom.RandText(10), 1, 10);
        StandardText.Modify(true);
        LibraryVariableStorage.Enqueue(StandardText.Description);

        StandardText.Get(ListOfRecorIds.Get(5));
        StandardText.Description := CopyStr(LibraryRandom.RandText(10), 1, 10);
        StandardText.Modify(true);
        LibraryVariableStorage.Enqueue(StandardText.Description);

        StandardText.Get(ListOfRecorIds.Get(10));
        StandardText.Description := CopyStr(LibraryRandom.RandText(10), 1, 10);
        StandardText.Modify(true);
        LibraryVariableStorage.Enqueue(StandardText.Description);

        DataEditorBuffer.Refresh.Invoke();

        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Modified At", StrSubstNo('>%1', Format(LatestModifiedDT, 0, 3)));

        Assert.IsTrue(DataEditorBuffer.First(), '');
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 3".Value(), '');
        Assert.IsTrue(DataEditorBuffer.Next(), '');
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 3".Value(), '');
        Assert.IsTrue(DataEditorBuffer.Next(), '');
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 3".Value(), '');
        Assert.IsFalse(DataEditorBuffer.Next(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure RefreshRecordsAdded()
    var
        StandardText: Record "Standard Text";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        LatestModifiedDT: DateTime;
        RecordsToGenerate: Integer;
        i: Integer;
    begin
        Init();
        StandardText.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandIntInRange(15, 100);

        for i := 1 to RecordsToGenerate do begin
            LibrarySales.CreateStandardText(StandardText);
            ListOfRecorIds.Add(StandardText.RecordId());
        end;

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Standard Text");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();

        Assert.AreEqual(StandardText.TableCaption(), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);

        Sleep(1000);
        LatestModifiedDT := CurrentDateTime();

        for i := 1 to 10 do begin
            LibrarySales.CreateStandardText(StandardText);
            LibraryVariableStorage.Enqueue(StandardText.Description);
        end;

        DataEditorBuffer.Refresh.Invoke();

        UnbindSubscription(DataEditorBufferTestMode);

        i := 0;
        DataEditorBuffer.Filter.SetFilter("Modified At", StrSubstNo('>%1', Format(LatestModifiedDT, 0, 3)));
        if DataEditorBuffer.First() then
            repeat
                i += 1;
                Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 3".Value(), '');
            until not DataEditorBuffer.Next();

        Assert.AreEqual(10, i, '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure RefreshRecordsModifiedAndAdded()
    var
        StandardText: Record "Standard Text";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        LatestModifiedDT: DateTime;
        RecordsToGenerate: Integer;
        i: Integer;
    begin
        Init();
        StandardText.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandIntInRange(15, 100);

        for i := 1 to RecordsToGenerate do begin
            LibrarySales.CreateStandardText(StandardText);
            ListOfRecorIds.Add(StandardText.RecordId());
        end;

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Standard Text");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();

        Assert.AreEqual(StandardText.TableCaption(), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);

        Sleep(1000);
        LatestModifiedDT := CurrentDateTime();

        StandardText.Get(ListOfRecorIds.Get(3));
        StandardText.Description := CopyStr(LibraryRandom.RandText(10), 1, 10);
        StandardText.Modify(true);
        LibraryVariableStorage.Enqueue(StandardText.Description);

        StandardText.Get(ListOfRecorIds.Get(5));
        StandardText.Description := CopyStr(LibraryRandom.RandText(10), 1, 10);
        StandardText.Modify(true);
        LibraryVariableStorage.Enqueue(StandardText.Description);

        StandardText.Get(ListOfRecorIds.Get(10));
        StandardText.Description := CopyStr(LibraryRandom.RandText(10), 1, 10);
        StandardText.Modify(true);
        LibraryVariableStorage.Enqueue(StandardText.Description);

        for i := 1 to 10 do begin
            LibrarySales.CreateStandardText(StandardText);
            LibraryVariableStorage.Enqueue(StandardText.Description);
        end;

        DataEditorBuffer.Refresh.Invoke();

        UnbindSubscription(DataEditorBufferTestMode);

        i := 0;
        DataEditorBuffer.Filter.SetFilter("Modified At", StrSubstNo('>%1', Format(LatestModifiedDT, 0, 3)));
        if DataEditorBuffer.First() then
            repeat
                i += 1;
                Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 3".Value(), '');
            until not DataEditorBuffer.Next();

        Assert.AreEqual(13, i, '');
    end;

    local procedure Init()
    begin
        LibraryRandom.Init();
        LibraryVariableStorage.Clear();
    end;
}