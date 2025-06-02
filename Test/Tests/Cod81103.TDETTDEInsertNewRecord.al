codeunit 81103 "TDET TDE Insert New Record"
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        LibraryRandom: Codeunit "Library - Random";
        LibraryDialogHandler: Codeunit "Library - Dialog Handler";
        LibraryVariableStorage: Codeunit "Library - Variable Storage";
        Assert: Codeunit "Library Assert";
        PageCaptionLbl: Label '%1 (%2)', Locked = true, Comment = '%1 = Table Caption, %2 = Table Number';
        RecordIsInsertedMsg: Label 'Record %1 is inserted.', Comment = '%1 = Record Id';
        IsTempRecordErr: Label 'You cannot create records in the temporary table.';

    [Test]
    [HandlerFunctions('GenericMessageHandler,InsertNewRecordHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure InsertRecordWithValiation()
    var
        SalesHeader: Record "Sales Header";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        MsgOnSalesHeaderInsert: Codeunit "TDET Msg On SalesHeader Insert";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Header");
        DataEditor.WithoutValidationField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesHeader.TableCaption(), Database::"Sales Header"), DataEditorBuffer.Caption(), '');

        LibraryDialogHandler.SetExpectedMessage('test');
        LibraryDialogHandler.SetExpectedMessage(StrSubstNo(RecordIsInsertedMsg, 'Sales Header: Order,TEST1'));

        BindSubscription(MsgOnSalesHeaderInsert);
        LibraryVariableStorage.Enqueue(1);
        LibraryVariableStorage.Enqueue('test1');
        DataEditorBuffer.InsertNew_promoted.Invoke();
        UnBindSubscription(MsgOnSalesHeaderInsert);

        Assert.IsTrue(SalesHeader.Get(SalesHeader."Document Type"::Order, 'test1'), '');
    end;

    [Test]
    [HandlerFunctions('GenericMessageHandler,InsertNewRecordHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure InsertRecordWithoutValiation()
    var
        SalesHeader: Record "Sales Header";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        MsgOnSalesHeaderInsert: Codeunit "TDET Msg On SalesHeader Insert";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Header");
        DataEditor.WithoutValidationField.SetValue(true);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesHeader.TableCaption(), Database::"Sales Header"), DataEditorBuffer.Caption(), '');

        LibraryDialogHandler.SetExpectedMessage(StrSubstNo(RecordIsInsertedMsg, 'Sales Header: Order,TEST1'));

        BindSubscription(MsgOnSalesHeaderInsert);
        LibraryVariableStorage.Enqueue(1);
        LibraryVariableStorage.Enqueue('test1');
        DataEditorBuffer.InsertNew_promoted.Invoke();
        UnBindSubscription(MsgOnSalesHeaderInsert);

        Assert.IsTrue(SalesHeader.Get(SalesHeader."Document Type"::Order, 'test1'), '');
    end;

    [Test]
    [HandlerFunctions('GenericMessageHandler,InsertNewRecordHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure InsertRecordPartiallyFilledPK()
    var
        SalesHeaderArchive: Record "Sales Header Archive";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        MsgOnSalesHeaderInsert: Codeunit "TDET Msg On SalesHeader Insert";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Header Archive");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesHeaderArchive.TableCaption(), Database::"Sales Header Archive"), DataEditorBuffer.Caption(), '');

        LibraryDialogHandler.SetExpectedMessage(StrSubstNo(RecordIsInsertedMsg, 'Sales Header Archive: Order,TEST2,0,0'));

        BindSubscription(MsgOnSalesHeaderInsert);
        LibraryVariableStorage.Enqueue(1);
        LibraryVariableStorage.Enqueue('test2');
        DataEditorBuffer.InsertNew_promoted.Invoke();
        UnBindSubscription(MsgOnSalesHeaderInsert);

        Assert.IsTrue(SalesHeaderArchive.Get(SalesHeaderArchive."Document Type"::Order, 'test2', 0, 0), '');
    end;

    [Test]
    [HandlerFunctions('GenericMessageHandler,InsertNewRecordTestPKHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure InsertRecordNotFilledPK()
    var
        SalesHeaderArchive: Record "Sales Header Archive";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        MsgOnSalesHeaderInsert: Codeunit "TDET Msg On SalesHeader Insert";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Header Archive");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesHeaderArchive.TableCaption(), Database::"Sales Header Archive"), DataEditorBuffer.Caption(), '');

        LibraryDialogHandler.SetExpectedMessage(StrSubstNo(RecordIsInsertedMsg, 'Sales Header Archive: Quote,"",0,0'));

        BindSubscription(MsgOnSalesHeaderInsert);
        DataEditorBuffer.InsertNew_promoted.Invoke();
        UnBindSubscription(MsgOnSalesHeaderInsert);

        Assert.IsTrue(SalesHeaderArchive.Get(SalesHeaderArchive."Document Type"::Quote, '', 0, 0), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure InsertRecordForTempRecordIsNotPossible()
    var
        InvoicePostingBuffer: Record "Invoice Posting Buffer";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Invoice Posting Buffer");
        DataEditor.WithoutValidationField.SetValue(true);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, InvoicePostingBuffer.TableCaption(), Database::"Invoice Posting Buffer"), DataEditorBuffer.Caption(), '');

        asserterror DataEditorBuffer.InsertNew_promoted.Invoke();

        Assert.ExpectedError(IsTempRecordErr);
    end;

    [ModalPageHandler]
    procedure InsertNewRecordHandler(var InsertNewRecord: TestPage "DET Insert New Record")
    begin
        InsertNewRecord."Text Value 2".SetValue(LibraryVariableStorage.DequeueText());
        InsertNewRecord."Text Value 3".SetValue(LibraryVariableStorage.DequeueText());
        InsertNewRecord.OK().Invoke();
    end;

    [ModalPageHandler]
    procedure InsertNewRecordTestPKHandler(var InsertNewRecord: TestPage "DET Insert New Record")
    begin
        InsertNewRecord.OK().Invoke();
    end;

    [MessageHandler]
    procedure GenericMessageHandler(Message: Text)
    begin
        LibraryDialogHandler.HandleMessage(Message);
    end;


    local procedure Init()
    begin
        LibraryRandom.Init();
        LibraryVariableStorage.Clear();
    end;
}