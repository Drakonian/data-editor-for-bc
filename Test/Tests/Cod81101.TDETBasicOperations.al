codeunit 81101 "TDET Basic Operations"
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        LibrarySales: Codeunit "Library - Sales";
        LibraryRandom: Codeunit "Library - Random";
        LibraryDataEditor: Codeunit "TDET Library - Data Editor";
        LibraryDialogHandler: Codeunit "Library - Dialog Handler";
        LibraryVariableStorage: Codeunit "Library - Variable Storage";
        Assert: Codeunit "Library Assert";
        CustomerNo1, CustomerNo2 : Code[20];
        PageCaptionLbl: Label '%1 (%2)', Locked = true, Comment = '%1 = Table Caption, %2 = Table Number';

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure LoadTableCompanyInformation()
    var
        CompanyInformation: Record "Company Information";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
    begin
        Init();
        CompanyInformation.Get();

        ListOfRecorIds.Add(CompanyInformation.RecordId());

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Company Information");
        DataEditor.ExcludeFlowFieldsField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, CompanyInformation.TableCaption(), Database::"Company Information"), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure LoadTableCustomer()
    var
        Customer: Record Customer;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        RecordsToGenerate: Integer;
        i: Integer;
    begin
        Init();
        Customer.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandInt(100);

        for i := 1 to RecordsToGenerate do begin
            LibrarySales.CreateCustomer(Customer);
            ListOfRecorIds.Add(Customer.RecordId());
        end;

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Customer);
        DataEditor.ExcludeFlowFieldsField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Customer.TableCaption(), Database::Customer), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure LoadTableCustomerWithoutFlowFields()
    var
        Customer: Record Customer;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        RecordsToGenerate: Integer;
        i: Integer;
    begin
        Init();
        Customer.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandInt(100);

        for i := 1 to RecordsToGenerate do begin
            LibrarySales.CreateCustomer(Customer);
            ListOfRecorIds.Add(Customer.RecordId());
        end;

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Customer);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Customer.TableCaption(), Database::Customer), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, true);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure LoadTableCustomerWithoutFlowFieldsWithFieldFilter()
    var
        Customer: Record Customer;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        RecordsToGenerate: Integer;
        i: Integer;
    begin
        Init();
        Customer.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandInt(100);

        FieldNoFilter.Add(Customer.FieldNo("No."));
        FieldNoFilter.Add(Customer.FieldNo(Name));
        FieldNoFilter.Add(Customer.FieldNo("Collection Method"));

        for i := 1 to RecordsToGenerate do begin
            LibrarySales.CreateCustomer(Customer);
            Customer."Collection Method" := CopyStr(LibraryRandom.RandText(20), 1, MaxStrLen(Customer."Collection Method"));
            Customer.Modify(true);
            ListOfRecorIds.Add(Customer.RecordId());
        end;

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Customer);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Customer.TableCaption(), Database::Customer), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, true);
    end;

    [Test]
    procedure LoadTableInParallel()
    var
        StandardText: Record "Standard Text";
        DataEditorSetup: Record "DET Data Editor Setup";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        RecordsToGenerate: Integer;
        i: Integer;
    begin
        Init();
        StandardText.DeleteAll();
        DataEditorSetup.DeleteAll();

        DataEditorSetup.Init();
        DataEditorSetup.Validate("Number of Threads", 6);
        DataEditorSetup.Insert(true);

        RecordsToGenerate := LibraryRandom.RandIntInRange(1000, 2000);

        for i := 1 to RecordsToGenerate do begin
            LibrarySales.CreateStandardText(StandardText);
            ListOfRecorIds.Add(StandardText.RecordId());
        end;

        Commit();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Standard Text");
        DataEditor.ReadInParallel.SetValue(true);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, StandardText.TableCaption(), Database::"Standard Text"), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);

        StandardText.DeleteAll();
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure LoadTableSalesHeader()
    var
        SalesHeader: Record "Sales Header";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        RecordsToGenerate: Integer;
        i: Integer;
    begin
        Init();
        SalesHeader.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandInt(30);

        for i := 1 to RecordsToGenerate do begin
            LibrarySales.CreateSalesInvoice(SalesHeader);
            ListOfRecorIds.Add(SalesHeader.RecordId());
        end;

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Header");
        DataEditor.ExcludeFlowFieldsField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesHeader.TableCaption(), Database::"Sales Header"), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);
    end;

    [Test]
    [HandlerFunctions('EditSellToCustomerNo,SelectNewCustomerLookup,GenericConfirmationHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EditTableRelation()
    var
        SalesHeader: Record "Sales Header";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();
        SalesHeader.DeleteAll();

        LibrarySales.CreateSalesInvoice(SalesHeader);

        CustomerNo1 := SalesHeader."Sell-to Customer No.";
        CustomerNo2 := LibrarySales.CreateCustomerNo();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Header");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesHeader.TableCaption(), Database::"Sales Header"), DataEditorBuffer.Caption(), '');

        DataEditorBuffer."Text Value 4".Drilldown();

        Assert.AreEqual(CustomerNo2, DataEditorBuffer."Text Value 4".Value(), '');
    end;

    [Test]
    [HandlerFunctions('EditICDirectionType')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EditEnumOrOption()
    var
        SalesHeader: Record "Sales Header";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();
        SalesHeader.DeleteAll();

        LibrarySales.CreateSalesInvoice(SalesHeader);
        SalesHeader."IC Direction" := SalesHeader."IC Direction"::Outgoing;
        SalesHeader.Modify();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Header");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        LibraryVariableStorage.Enqueue(SalesHeader.FieldCaption("IC Direction"));

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesHeader.TableCaption(), Database::"Sales Header"), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(SalesHeader.FieldCaption("IC Direction"), DataEditorBuffer."Text Value 110".Caption(), '');
        Assert.AreEqual(Format(Enum::"IC Direction Type"::Outgoing), DataEditorBuffer."Text Value 110".Value(), '');

        DataEditorBuffer."Text Value 110".Drilldown();

        Assert.AreEqual(Format(Enum::"IC Direction Type"::Incoming), DataEditorBuffer."Text Value 110".Value(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DirectEditText()
    var
        SalesHeader: Record "Sales Header";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();
        SalesHeader.DeleteAll();

        LibrarySales.CreateSalesInvoice(SalesHeader);
        SalesHeader."Posting Description" := CopyStr(LibraryRandom.RandText(MaxStrLen(SalesHeader."Posting Description")), 1,
                                                        MaxStrLen(SalesHeader."Posting Description"));
        SalesHeader.Modify();

        LibraryVariableStorage.Enqueue(SalesHeader."Posting Description");

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Header");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        LibraryVariableStorage.Enqueue(SalesHeader.FieldCaption("IC Direction"));

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesHeader.TableCaption(), Database::"Sales Header"), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(SalesHeader.FieldCaption("Posting Description"), DataEditorBuffer."Text Value 23".Caption(), '');
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 23".Value(), '');

        DataEditorBuffer."Text Value 23".SetValue('new value');

        Assert.AreEqual('new value', DataEditorBuffer."Text Value 23".Value(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DirectEditWithoutValidation()
    var
        Customer: Record Customer;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();
        Customer.DeleteAll();

        LibrarySales.CreateCustomer(Customer);

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Customer);
        DataEditor.WithoutValidationField.SetValue(true);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Customer.TableCaption(), Database::Customer), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(Customer.FieldCaption("Phone No."), DataEditorBuffer."Text Value 10".Caption(), '');

        asserterror Customer.Validate("Phone No.", 'incorrect phone');

        DataEditorBuffer."Text Value 10".SetValue('incorrect phone');

        Assert.AreEqual('incorrect phone', DataEditorBuffer."Text Value 10".Value(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DirectEditWithValidation()
    var
        Customer: Record Customer;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        PhoneNoCannotContainLettersErr: Label '%1 must not contain letters', Comment = '%1 FieldCaption';
    begin
        Init();
        Customer.DeleteAll();

        LibrarySales.CreateCustomer(Customer);

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Customer);
        DataEditor.WithoutValidationField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Customer.TableCaption(), Database::Customer), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(Customer.FieldCaption("Phone No."), DataEditorBuffer."Text Value 10".Caption(), '');

        asserterror DataEditorBuffer."Text Value 10".SetValue('incorrect phone');

        Assert.ExpectedError(StrSubstNo(PhoneNoCannotContainLettersErr, Customer.FieldCaption("Phone No.")));
    end;

    [Test]
    [HandlerFunctions('GenericConfirmationHandler,GenericMessageHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DeleteAllRecordsWithValiation()
    var
        Customer: Record Customer;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        MsgOnCustomerDelete: Codeunit "TDET Msg On Customer Delete";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        RecordsToGenerate, i : Integer;
        DeleteAllLbl: Label 'Are sure you want to delete %1 entries?', Comment = '%1 = Count of entries.';
    begin
        Init();
        Customer.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandInt(20);

        for i := 1 to RecordsToGenerate do
            LibrarySales.CreateCustomer(Customer);

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Customer);
        DataEditor.WithoutValidationField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Customer.TableCaption(), Database::Customer), DataEditorBuffer.Caption(), '');

        LibraryDialogHandler.SetExpectedConfirm(DeleteAllLbl, true);

        for i := 1 to RecordsToGenerate do
            LibraryDialogHandler.SetExpectedMessage('test');

        BindSubscription(MsgOnCustomerDelete);
        DataEditorBuffer."DET Delete All_Promoted".Invoke();
        UnBindSubscription(MsgOnCustomerDelete);

        Assert.IsFalse(DataEditorBuffer.First(), '');
        Assert.RecordIsEmpty(Customer);
    end;

    [Test]
    [HandlerFunctions('GenericConfirmationHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DeleteAllRecordsWithoutValiation()
    var
        Customer: Record Customer;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        MsgOnCustomerDelete: Codeunit "TDET Msg On Customer Delete";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        RecordsToGenerate, i : Integer;
        DeleteAllLbl: Label 'Are sure you want to delete %1 entries?', Comment = '%1 = Count of entries.';
    begin
        Init();
        Customer.DeleteAll();

        RecordsToGenerate := LibraryRandom.RandInt(20);

        for i := 1 to RecordsToGenerate do
            LibrarySales.CreateCustomer(Customer);

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Customer);
        DataEditor.WithoutValidationField.SetValue(true);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Customer.TableCaption(), Database::Customer), DataEditorBuffer.Caption(), '');

        LibraryDialogHandler.SetExpectedConfirm(DeleteAllLbl, true);

        BindSubscription(MsgOnCustomerDelete);
        DataEditorBuffer."DET Delete All_Promoted".Invoke();
        UnBindSubscription(MsgOnCustomerDelete);

        Assert.IsFalse(DataEditorBuffer.First(), '');
        Assert.RecordIsEmpty(Customer);
    end;

    [Test]
    [HandlerFunctions('SetCustomerFilter')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure FilterWithNonASCIISymbols()
    var
        Customer: Record Customer;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
        UTF8String: Text[100];
    begin
        Init();
        Customer.DeleteAll();

        UTF8String := '☀Ü☁';

        LibrarySales.CreateCustomer(Customer);
        Customer.Name := UTF8String;
        Customer.Modify(true);

        ListOfRecorIds.Add(Customer.RecordId());

        DataEditorBuffer.Trap();

        LibraryVariableStorage.Enqueue(Customer.FieldNo(Name));
        LibraryVariableStorage.Enqueue(UTF8String);

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Customer);
        DataEditor.CustomTableViewField.Drilldown();
        DataEditor.ExcludeFlowFieldsField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Customer.TableCaption(), Database::Customer), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure LoadTableWithSystemFields()
    var
        Language: Record Language;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
    begin
        Init();

        if Language.FindSet() then
            repeat
                ListOfRecorIds.Add(Language.RecordId());
            until Language.Next() = 0;

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Language);
        DataEditor.ExcludeFlowFieldsField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Language.TableCaption(), Database::Language), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);

        //Check that last record is match system field values and captions
        Assert.AreEqual(Language.FieldCaption(SystemId), DataEditorBuffer."Text Value 6".Caption(), '');
        Assert.AreEqual(Language.FieldCaption(SystemCreatedAt), DataEditorBuffer."Text Value 7".Caption(), '');
        Assert.AreEqual(Language.FieldCaption(SystemCreatedBy), DataEditorBuffer."Text Value 8".Caption(), '');
        Assert.AreEqual(Language.FieldCaption(SystemModifiedAt), DataEditorBuffer."Text Value 9".Caption(), '');
        Assert.AreEqual(Language.FieldCaption(SystemModifiedBy), DataEditorBuffer."Text Value 10".Caption(), '');

        Assert.IsFalse(DataEditorBuffer."Text Value 6".Editable(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 7".Editable(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 8".Editable(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 9".Editable(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 10".Editable(), '');

        Assert.AreEqual(Format(Language.SystemId), DataEditorBuffer."Text Value 6".Value(), '');
        Assert.AreEqual(Format(Language.SystemCreatedAt), DataEditorBuffer."Text Value 7".Value(), '');
        Assert.AreEqual(Format(Language.SystemCreatedBy), DataEditorBuffer."Text Value 8".Value(), '');
        Assert.AreEqual(Format(Language.SystemModifiedAt), DataEditorBuffer."Text Value 9".Value(), '');
        Assert.AreEqual(Format(Language.SystemModifiedBy), DataEditorBuffer."Text Value 10".Value(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure LoadTableWithoutSystemFields()
    var
        Language: Record Language;
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
        ListOfRecorIds: List of [RecordId];
        FieldNoFilter: List of [Integer];
    begin
        Init();

        if Language.FindSet() then
            repeat
                ListOfRecorIds.Add(Language.RecordId());
            until Language.Next() = 0;

        FieldNoFilter.Add(Language.FieldNo(Code));
        FieldNoFilter.Add(Language.FieldNo(Name));

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::Language);
        DataEditor.ExcludeFlowFieldsField.SetValue(false);
        DataEditor.FieldFilter.SetValue(StrSubstNo('%1|%2', FieldNoFilter.Get(1), FieldNoFilter.Get(2)));
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Language.TableCaption(), Database::Language), DataEditorBuffer.Caption(), '');

        LibraryDataEditor.VerifyBufferFieldsWithSourceRecord(DataEditorBuffer, ListOfRecorIds, FieldNoFilter, false);

        //Check that field filter correctly excluding other fields and system fields
        Assert.AreEqual('', DataEditorBuffer."Text Value 4".Value(), '');
        Assert.AreEqual('', DataEditorBuffer."Text Value 5".Value(), '');
        Assert.AreEqual('', DataEditorBuffer."Text Value 6".Value(), '');
        Assert.AreEqual('', DataEditorBuffer."Text Value 7".Value(), '');
        Assert.AreEqual('', DataEditorBuffer."Text Value 8".Value(), '');
        Assert.AreEqual('', DataEditorBuffer."Text Value 9".Value(), '');
        Assert.AreEqual('', DataEditorBuffer."Text Value 10".Value(), '');

        Assert.IsFalse(DataEditorBuffer."Text Value 4".Visible(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 5".Visible(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 6".Visible(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 7".Visible(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 8".Visible(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 9".Visible(), '');
        Assert.IsFalse(DataEditorBuffer."Text Value 10".Visible(), '');
    end;

    [ModalPageHandler]
    procedure EditICDirectionType(var NameValueLookup: TestPage "Name/Value Lookup")
    begin
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), NameValueLookup.Caption(), '');
        NameValueLookup.GoToKey(2);
        NameValueLookup.OK().Invoke();
    end;

    [ModalPageHandler]
    procedure EditSellToCustomerNo(var EditValue: TestPage "DET Edit Value")
    begin
        Assert.AreEqual(CustomerNo1, EditValue.CodeValue.Value(), '');
        EditValue.CodeValue.Lookup();
        Assert.AreEqual(CustomerNo2, EditValue.CodeValue.Value(), '');
        EditValue.OK().Invoke();
    end;

    [ModalPageHandler]
    procedure SelectNewCustomerLookup(var CustomerLookup: TestPage "Customer Lookup")
    var
        ConfirmChangeQst: Label 'Do you want to change %1?', Comment = '%1 = a Field Caption like Currency Code';
        RecreateSalesLinesMsg: Label 'If you change %1, the existing sales lines will be deleted and new sales lines based on the new information on the header will be created.\\Do you want to continue?', Comment = '%1: FieldCaption';
    begin
        LibraryDialogHandler.SetExpectedConfirm(ConfirmChangeQst, true);
        LibraryDialogHandler.SetExpectedConfirm(ConfirmChangeQst, true);
        LibraryDialogHandler.SetExpectedConfirm(RecreateSalesLinesMsg, true);
        CustomerLookup.GoToKey(CustomerNo2);
        CustomerLookup.OK().Invoke();
    end;

    [ConfirmHandler]
    procedure GenericConfirmationHandler(Question: Text[1024]; var Reply: Boolean)
    begin
        LibraryDialogHandler.HandleConfirm(Question, Reply);
    end;

    [StrMenuHandler]
    procedure GenericStrMenuHandler(Options: Text[1024]; var Choice: Integer; Instruction: Text[1024])
    begin
        LibraryDialogHandler.HandleStrMenu(Options, Choice, Instruction);
    end;

    [MessageHandler]
    procedure GenericMessageHandler(Message: Text)
    begin
        LibraryDialogHandler.HandleMessage(Message);
    end;

    [FilterPageHandler]
    procedure SetCustomerFilter(var Record1: RecordRef): Boolean
    var
        FieldRefToFilter: FieldRef;
    begin
        FieldRefToFilter := Record1.Field(LibraryVariableStorage.DequeueInteger());
        FieldRefToFilter.SetFilter(LibraryVariableStorage.DequeueText());
    end;

    local procedure Init()
    begin
        LibraryRandom.Init();
        LibraryVariableStorage.Clear();
    end;
}
