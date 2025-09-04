codeunit 72996803 "VDVT Data Editor Permissions"
{
    Subtype = Test;
    TestPermissions = Restrictive;

    var
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        LibraryVariableStorage: Codeunit "Library - Variable Storage";
        LibraryDialogHandler: Codeunit "Library - Dialog Handler";
        LibraryRandom: Codeunit "Library - Random";
        LibrarySales: Codeunit "Library - Sales";
        LibraryPurchase: Codeunit "Library - Purchase";
        LibraryUtility: Codeunit "Library - Utility";
        NewCustomerNo, OldCustomerNo : Code[20];
        NewVendorNo, OldVendorNo : Code[20];
        DataEditorPermissionSetIdLbl: Label 'VDV DATA EDITOR TOOL', Locked = true;
        DeleteAllLbl: Label 'Are sure you want to delete %1 entries?', Comment = '%1 = Count of entries.';
        RecordIsInsertedMsg: Label 'Record %1 is inserted.', Comment = '%1 = Record Id';
        CustLedgerEntryPKLbl: Label 'Cust. Ledger Entry: %1', Comment = '%1 = Entry No.';
        VendorLedgerEntryPKLbl: Label 'Vendor Ledger Entry: %1', Comment = '%1 = Entry No.';
        PageCaptionLbl: Label '%1 (%2)', Locked = true, Comment = '%1 = Table Caption, %2 = Table Number';

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DirectEditSalesInvoiceHeaderMinimumPermissions()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        SetUpperPermissions();

        MockSalesInvoiceHeader(SalesInvoiceHeader);

        SetMinimumPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Invoice Header");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Text Value 2", SalesInvoiceHeader."No.");
        DataEditorBuffer.First();

        LibraryVariableStorage.Enqueue(SalesInvoiceHeader."Posting Description");

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesInvoiceHeader.TableCaption(), Database::"Sales invoice Header"), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(SalesInvoiceHeader.FieldCaption("Posting Description"), DataEditorBuffer."Text Value 22".Caption(), '');
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 22".Value(), '');

        DataEditorBuffer."Text Value 22".SetValue('new value');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DirectEditCustLedgerEntryMinimumPermissions()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        SetUpperPermissions();

        LibrarySales.MockCustLedgerEntryWithAmount(CustLedgerEntry, LibrarySales.CreateCustomerNo());
        CustLedgerEntry.Description := LibraryRandom.RandText(MaxStrLen(CustLedgerEntry.Description)).Substring(1, MaxStrLen(CustLedgerEntry.Description));
        CustLedgerEntry.Modify();

        SetMinimumPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Cust. Ledger Entry");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Text Value 2", Format(CustLedgerEntry."Entry No."));
        Assert.IsTrue(DataEditorBuffer.First(), '');

        LibraryVariableStorage.Enqueue(CustLedgerEntry.Description);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, CustLedgerEntry.TableCaption(), Database::"Cust. Ledger Entry"), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(CustLedgerEntry.FieldCaption(Description), DataEditorBuffer."Text Value 7".Caption(), '');
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 7".Value(), '');

        asserterror DataEditorBuffer."Text Value 7".SetValue('new value');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DirectEditSalesInvoiceHeader()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        SetUpperPermissions();

        MockSalesInvoiceHeader(SalesInvoiceHeader);

        SetLowerPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Sales Invoice Header");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Text Value 2", SalesInvoiceHeader."No.");
        DataEditorBuffer.First();

        LibraryVariableStorage.Enqueue(SalesInvoiceHeader."Posting Description");

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, SalesInvoiceHeader.TableCaption(), Database::"Sales invoice Header"), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(SalesInvoiceHeader.FieldCaption("Posting Description"), DataEditorBuffer."Text Value 22".Caption(), '');
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 22".Value(), '');

        DataEditorBuffer."Text Value 22".SetValue('new value');

        Assert.AreEqual('new value', DataEditorBuffer."Text Value 22".Value(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DirectEditCustLedgerEntry()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        SetUpperPermissions();

        LibrarySales.MockCustLedgerEntryWithAmount(CustLedgerEntry, LibrarySales.CreateCustomerNo());
        CustLedgerEntry.Description := LibraryRandom.RandText(MaxStrLen(CustLedgerEntry.Description)).Substring(1, MaxStrLen(CustLedgerEntry.Description));
        CustLedgerEntry.Modify();

        SetLowerPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Cust. Ledger Entry");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Text Value 2", Format(CustLedgerEntry."Entry No."));
        Assert.IsTrue(DataEditorBuffer.First(), '');

        LibraryVariableStorage.Enqueue(CustLedgerEntry.Description);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, CustLedgerEntry.TableCaption(), Database::"Cust. Ledger Entry"), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(CustLedgerEntry.FieldCaption(Description), DataEditorBuffer."Text Value 7".Caption(), '');
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 7".Value(), '');

        DataEditorBuffer."Text Value 7".SetValue('new value');

        Assert.AreEqual('new value', DataEditorBuffer."Text Value 7".Value(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    [HandlerFunctions('EditSellToCustomerNo,SelectNewCustomerLookup')]
    procedure EditTableRelationCustLedgerEntry()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        SetUpperPermissions();

        LibrarySales.MockCustLedgerEntryWithAmount(CustLedgerEntry, LibrarySales.CreateCustomerNo());
        CustLedgerEntry.Description := LibraryRandom.RandText(MaxStrLen(CustLedgerEntry.Description)).Substring(1, MaxStrLen(CustLedgerEntry.Description));
        CustLedgerEntry.Modify();

        OldCustomerNo := CustLedgerEntry."Customer No.";
        NewCustomerNo := LibrarySales.CreateCustomerNo();

        SetLowerPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Cust. Ledger Entry");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Text Value 2", Format(CustLedgerEntry."Entry No."));
        Assert.IsTrue(DataEditorBuffer.First(), '');

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, CustLedgerEntry.TableCaption(), Database::"Cust. Ledger Entry"), DataEditorBuffer.Caption(), '');

        DataEditorBuffer."Text Value 3".Drilldown();

        Assert.AreEqual(NewCustomerNo, DataEditorBuffer."Text Value 3".Value(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    [HandlerFunctions('EditBuyFromVendorNo,SelectNewVendorLookup')]
    procedure EditTableRelationVendorLedgerEntry()
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        SetUpperPermissions();

        MockVendorLedgerEntryWithAmount(VendorLedgerEntry, LibraryPurchase.CreateVendorNo());
        VendorLedgerEntry.Description := LibraryRandom.RandText(MaxStrLen(VendorLedgerEntry.Description)).Substring(1, MaxStrLen(VendorLedgerEntry.Description));
        VendorLedgerEntry.Modify();

        OldVendorNo := VendorLedgerEntry."Vendor No.";
        NewVendorNo := LibraryPurchase.CreateVendorNo();

        SetLowerPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Vendor Ledger Entry");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Text Value 2", Format(VendorLedgerEntry."Entry No."));
        Assert.IsTrue(DataEditorBuffer.First(), '');

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, VendorLedgerEntry.TableCaption(), Database::"Vendor Ledger Entry"), DataEditorBuffer.Caption(), '');

        DataEditorBuffer."Text Value 3".Drilldown();

        Assert.AreEqual(NewVendorNo, DataEditorBuffer."Text Value 3".Value(), '');
    end;

    [Test]
    [HandlerFunctions('SelectEnum')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EditEnumCustLedgerEntry()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        SetUpperPermissions();

        LibrarySales.MockCustLedgerEntryWithAmount(CustLedgerEntry, LibrarySales.CreateCustomerNo());
        CustLedgerEntry.Description := LibraryRandom.RandText(MaxStrLen(CustLedgerEntry.Description)).Substring(1, MaxStrLen(CustLedgerEntry.Description));
        CustLedgerEntry."Document Type" := CustLedgerEntry."Document Type"::Invoice;
        CustLedgerEntry.Modify();

        SetLowerPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Cust. Ledger Entry");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Text Value 2", Format(CustLedgerEntry."Entry No."));
        Assert.IsTrue(DataEditorBuffer.First(), '');

        LibraryVariableStorage.Enqueue(CustLedgerEntry.FieldCaption("Document Type"));

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, CustLedgerEntry.TableCaption(), Database::"Cust. Ledger Entry"), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(CustLedgerEntry.FieldCaption("Document Type"), DataEditorBuffer."Text Value 5".Caption(), '');
        Assert.AreEqual(Format(Enum::"Gen. Journal Document Type"::Invoice), DataEditorBuffer."Text Value 5".Value(), '');

        LibraryVariableStorage.Enqueue(Enum::"Gen. Journal Document Type"::"Credit Memo".AsInteger() + 1);

        DataEditorBuffer."Text Value 5".Drilldown();

        Assert.AreEqual(Format(Enum::"Gen. Journal Document Type"::"Credit Memo"), DataEditorBuffer."Text Value 5".Value(), '');
    end;

    [Test]
    [HandlerFunctions('SelectEnum')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EditEnumVendorLedgerEntry()
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        SetUpperPermissions();

        MockVendorLedgerEntryWithAmount(VendorLedgerEntry, LibraryPurchase.CreateVendorNo());
        VendorLedgerEntry.Description := LibraryRandom.RandText(MaxStrLen(VendorLedgerEntry.Description)).Substring(1, MaxStrLen(VendorLedgerEntry.Description));
        VendorLedgerEntry."Document Type" := VendorLedgerEntry."Document Type"::Invoice;
        VendorLedgerEntry.Modify();

        OldVendorNo := VendorLedgerEntry."Vendor No.";
        NewVendorNo := LibraryPurchase.CreateVendorNo();

        SetLowerPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Vendor Ledger Entry");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Text Value 2", Format(VendorLedgerEntry."Entry No."));
        Assert.IsTrue(DataEditorBuffer.First(), '');

        LibraryVariableStorage.Enqueue(VendorLedgerEntry.FieldCaption("Document Type"));

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, VendorLedgerEntry.TableCaption(), Database::"Vendor Ledger Entry"), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(VendorLedgerEntry.FieldCaption("Document Type"), DataEditorBuffer."Text Value 5".Caption(), '');
        Assert.AreEqual(Format(Enum::"Gen. Journal Document Type"::Invoice), DataEditorBuffer."Text Value 5".Value(), '');

        LibraryVariableStorage.Enqueue(Enum::"Gen. Journal Document Type"::"Credit Memo".AsInteger() + 1);

        DataEditorBuffer."Text Value 5".Drilldown();

        Assert.AreEqual(Format(Enum::"Gen. Journal Document Type"::"Credit Memo"), DataEditorBuffer."Text Value 5".Value(), '');
    end;

    [Test]
    [HandlerFunctions('GenericMessageHandler,InsertNewRecordHandler,GenericConfirmationHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure InsertAndDeleteCustLedgerEntry()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
        LastEntryNo: Integer;
    begin
        Init();

        SetUpperPermissions();

        if CustLedgerEntry.FindLast() then
            LastEntryNo := CustLedgerEntry."Entry No.";

        SetLowerPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Cust. Ledger Entry");
        DataEditor.WithoutValidationField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, CustLedgerEntry.TableCaption(), Database::"Cust. Ledger Entry"), DataEditorBuffer.Caption(), '');

        LibraryVariableStorage.Enqueue(Format(LastEntryNo + 1));
        LibraryDialogHandler.SetExpectedMessage(StrSubstNo(RecordIsInsertedMsg, StrSubstNo(CustLedgerEntryPKLbl, LastEntryNo + 1)));

        DataEditorBuffer.InsertNew_promoted.Invoke();

        Assert.IsTrue(CustLedgerEntry.Get(LastEntryNo + 1), '');

        DataEditorBuffer.Filter.SetFilter("Text Value 2", Format(LastEntryNo + 1));
        Assert.IsTrue(DataEditorBuffer.First(), '');

        LibraryDialogHandler.SetExpectedConfirm(DeleteAllLbl, true);

        DataEditorBuffer."VDV Delete All_Promoted".Invoke();

        Assert.IsFalse(CustLedgerEntry.Get(LastEntryNo + 1), '');
    end;

    [Test]
    [HandlerFunctions('GenericMessageHandler,InsertNewRecordHandler,GenericConfirmationHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure InsertAndDeleteVendorLedgerEntry()
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
        LastEntryNo: Integer;
    begin
        Init();

        SetUpperPermissions();

        if VendorLedgerEntry.FindLast() then
            LastEntryNo := VendorLedgerEntry."Entry No.";

        SetLowerPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Vendor Ledger Entry");
        DataEditor.WithoutValidationField.SetValue(false);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, VendorLedgerEntry.TableCaption(), Database::"Vendor Ledger Entry"), DataEditorBuffer.Caption(), '');

        LibraryVariableStorage.Enqueue(Format(LastEntryNo + 1));
        LibraryDialogHandler.SetExpectedMessage(StrSubstNo(RecordIsInsertedMsg, StrSubstNo(VendorLedgerEntryPKLbl, LastEntryNo + 1)));

        DataEditorBuffer.InsertNew_promoted.Invoke();

        Assert.IsTrue(VendorLedgerEntry.Get(LastEntryNo + 1), '');

        DataEditorBuffer.Filter.SetFilter("Text Value 2", Format(LastEntryNo + 1));
        Assert.IsTrue(DataEditorBuffer.First(), '');

        LibraryDialogHandler.SetExpectedConfirm(DeleteAllLbl, true);

        DataEditorBuffer."VDV Delete All_Promoted".Invoke();

        Assert.IsFalse(VendorLedgerEntry.Get(LastEntryNo + 1), '');
    end;

    [ModalPageHandler]
    procedure EditSellToCustomerNo(var EditValue: TestPage "VDV Edit Value")
    begin
        Assert.AreEqual(OldCustomerNo, EditValue.CodeValue.Value(), '');
        EditValue.CodeValue.Lookup();
        Assert.AreEqual(NewCustomerNo, EditValue.CodeValue.Value(), '');
        EditValue.OK().Invoke();
    end;

    [ModalPageHandler]
    procedure SelectNewCustomerLookup(var CustomerLookup: TestPage "Customer Lookup")
    begin
        CustomerLookup.GoToKey(NewCustomerNo);
        CustomerLookup.OK().Invoke();
    end;

    [ModalPageHandler]
    procedure EditBuyFromVendorNo(var EditValue: TestPage "VDV Edit Value")
    begin
        Assert.AreEqual(OldVendorNo, EditValue.CodeValue.Value(), '');
        EditValue.CodeValue.Lookup();
        Assert.AreEqual(NewVendorNo, EditValue.CodeValue.Value(), '');
        EditValue.OK().Invoke();
    end;

    [ModalPageHandler]
    procedure SelectNewVendorLookup(var VendorLookup: TestPage "Vendor Lookup")
    begin
        VendorLookup.GoToKey(NewVendorNo);
        VendorLookup.OK().Invoke();
    end;

    [ModalPageHandler]
    procedure SelectEnum(var NameValueLookup: TestPage "Name/Value Lookup")
    begin
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), NameValueLookup.Caption(), '');
        NameValueLookup.GoToKey(LibraryVariableStorage.DequeueInteger());
        NameValueLookup.OK().Invoke();
    end;

    [MessageHandler]
    procedure GenericMessageHandler(Message: Text)
    begin
        LibraryDialogHandler.HandleMessage(Message);
    end;

    [ModalPageHandler]
    procedure InsertNewRecordHandler(var InsertNewRecord: TestPage "VDV Insert New Record")
    begin
        InsertNewRecord."Text Value 2".SetValue(LibraryVariableStorage.DequeueText());
        InsertNewRecord.OK().Invoke();
    end;

    [ConfirmHandler]
    procedure GenericConfirmationHandler(Question: Text[1024]; var Reply: Boolean)
    begin
        LibraryDialogHandler.HandleConfirm(Question, Reply);
    end;


    local procedure Init()
    begin
        LibraryRandom.Init();
        LibraryVariableStorage.Clear();
        LibraryDialogHandler.ClearVariableStorage();
    end;

    local procedure SetMinimumPermissions()
    begin
        LibraryLowerPermissions.SetLocal();
        LibraryLowerPermissions.AddeRead();
        LibraryLowerPermissions.AddPermissionSet(DataEditorPermissionSetIdLbl);
    end;

    local procedure SetLowerPermissions()
    begin
        LibraryLowerPermissions.SetLocal();
        LibraryLowerPermissions.AddO365Basic();
        LibraryLowerPermissions.AddBanking();
        LibraryLowerPermissions.AddPermissionSet(DataEditorPermissionSetIdLbl);
    end;

    local procedure SetUpperPermissions()
    begin
        LibraryLowerPermissions.SetOutsideO365Scope();
        LibraryLowerPermissions.AddPermissionSet(DataEditorPermissionSetIdLbl);
    end;

    local procedure MockSalesInvoiceHeader(var SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        SalesInvoiceHeader.Init();
        SalesInvoiceHeader."No." := LibraryRandom.RandText(MaxStrLen(SalesInvoiceHeader."No.")).Substring(1, MaxStrLen(SalesInvoiceHeader."No."));
        SalesInvoiceHeader."Posting Description" := LibraryRandom.RandText(MaxStrLen(SalesInvoiceHeader."Posting Description")).Substring(1, MaxStrLen(SalesInvoiceHeader."Posting Description"));
        SalesInvoiceHeader."Sell-to Customer No." := LibrarySales.CreateCustomerNo();
        SalesInvoiceHeader.Insert();
    end;

    procedure MockVendorLedgerEntryWithAmount(var VendorLedgerEntry: Record "Vendor Ledger Entry"; VendorNo: Code[20])
    begin
        MockVendLedgerEntry(VendorLedgerEntry, VendorNo);
        MockDetailedVendLedgEntry(VendorLedgerEntry);
    end;

    procedure MockDetailedVendLedgerEntryWithAmount(var DetailedVendorLedgerEntry: Record "Detailed Vendor Ledg. Entry"; VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
        DetailedVendorLedgerEntry.Init();
        DetailedVendorLedgerEntry."Entry No." := LibraryUtility.GetNewRecNo(DetailedVendorLedgerEntry, DetailedVendorLedgerEntry.FieldNo("Entry No."));
        DetailedVendorLedgerEntry."Vendor Ledger Entry No." := VendorLedgerEntry."Entry No.";
        DetailedVendorLedgerEntry."Vendor No." := VendorLedgerEntry."Vendor No.";
        DetailedVendorLedgerEntry."Posting Date" := WorkDate();
        DetailedVendorLedgerEntry."Entry Type" := DetailedVendorLedgerEntry."Entry Type"::"Initial Entry";
        DetailedVendorLedgerEntry."Document Type" := DetailedVendorLedgerEntry."Document Type"::Invoice;
        DetailedVendorLedgerEntry.Amount := LibraryRandom.RandDec(100, 2);
        DetailedVendorLedgerEntry."Amount (LCY)" := DetailedVendorLedgerEntry.Amount;
        DetailedVendorLedgerEntry.Insert();
    end;

    procedure MockDetailedVendLedgEntry(VendorLedgerEntry: Record "Vendor Ledger Entry")
    var
        DetailedVendLedgEntry: Record "Detailed Vendor Ledg. Entry";
    begin
        MockDetailedVendLedgerEntryWithAmount(DetailedVendLedgEntry, VendorLedgerEntry);
        MockApplnDetailedVendLedgerEntry(DetailedVendLedgEntry, true, WorkDate());
        MockApplnDetailedVendLedgerEntry(DetailedVendLedgEntry, false, WorkDate());
    end;

    procedure MockApplnDetailedVendLedgerEntry(DetailedVendLedgEntry: Record "Detailed Vendor Ledg. Entry"; UnappliedEntry: Boolean; PostingDate: Date)
    var
        ApplnDetailedVendLedgEntry: Record "Detailed Vendor Ledg. Entry";
    begin
        ApplnDetailedVendLedgEntry.Init();
        ApplnDetailedVendLedgEntry.Copy(DetailedVendLedgEntry);
        ApplnDetailedVendLedgEntry."Entry No." := LibraryUtility.GetNewRecNo(DetailedVendLedgEntry, DetailedVendLedgEntry.FieldNo("Entry No."));
        ApplnDetailedVendLedgEntry."Entry Type" := ApplnDetailedVendLedgEntry."Entry Type"::Application;
        ApplnDetailedVendLedgEntry."Posting Date" := PostingDate;
        ApplnDetailedVendLedgEntry.Amount := -ApplnDetailedVendLedgEntry.Amount;
        ApplnDetailedVendLedgEntry."Amount (LCY)" := ApplnDetailedVendLedgEntry.Amount;
        ApplnDetailedVendLedgEntry.Unapplied := UnappliedEntry;
        ApplnDetailedVendLedgEntry.Insert();
    end;

    procedure MockVendLedgerEntry(var VendorLedgerEntry: Record "Vendor Ledger Entry"; VendorNo: Code[20])
    begin
        VendorLedgerEntry.Init();
        VendorLedgerEntry."Entry No." := LibraryUtility.GetNewRecNo(VendorLedgerEntry, VendorLedgerEntry.FieldNo("Entry No."));
        VendorLedgerEntry."Vendor No." := VendorNo;
        VendorLedgerEntry."Posting Date" := WorkDate();
        VendorLedgerEntry.Insert();
    end;
}