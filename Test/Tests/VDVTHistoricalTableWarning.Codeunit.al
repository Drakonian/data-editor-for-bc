codeunit 72996804 "VDVT Historical Table Warning"
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit "Library Assert";
        LibraryDialogHandler: Codeunit "Library - Dialog Handler";
        PageCaptionLbl: Label '%1 (%2)', Locked = true, Comment = '%1 = Table Caption, %2 = Table Number';
        HistoricalTableWarningMsg: Label 'Warning: you are opening a table with posted historical entries in a production environment.\\Changing, inserting, or deleting these records bypasses the standard posting logic and can break data consistency between ledgers, which is very difficult to reverse.\\Proceed only if you fully understand the consequences.';
        TableMustBeHistoricalErr: Label 'Table %1 must be treated as historical.', Locked = true, Comment = '%1 = Table Number';
        TableMustNotBeHistoricalErr: Label 'Table %1 must not be treated as historical.', Locked = true, Comment = '%1 = Table Number';

    [Test]
    procedure PostedEntryTablesAreHistorical()
    var
        DataEditorMgt: Codeunit "VDV Data Editor Mgt.";
        TableNos: List of [Integer];
        TableNo: Integer;
    begin
        TableNos.AddRange(
            Database::"G/L Entry", Database::"Cust. Ledger Entry", Database::"Vendor Ledger Entry", Database::"Employee Ledger Entry",
            Database::"Item Ledger Entry", Database::"Value Entry", Database::"Bank Account Ledger Entry", Database::"Check Ledger Entry",
            Database::"FA Ledger Entry", Database::"Maintenance Ledger Entry", Database::"Ins. Coverage Ledger Entry", Database::"Job Ledger Entry",
            Database::"Res. Ledger Entry", Database::"Service Ledger Entry", Database::"Warranty Ledger Entry", Database::"Capacity Ledger Entry",
            Database::"Phys. Inventory Ledger Entry", Database::"Payable Vendor Ledger Entry", Database::"Payable Employee Ledger Entry",
            Database::"Detailed Cust. Ledg. Entry", Database::"Detailed Vendor Ledg. Entry", Database::"Detailed Employee Ledger Entry",
            Database::"VAT Entry", Database::"G/L Entry - VAT Entry Link", Database::"Warehouse Entry", Database::"Dimension Set Entry",
            Database::"Item Application Entry", Database::"Item Application Entry History", Database::"Post Value Entry to G/L",
            Database::"Inventory Adjmt. Entry (Order)", Database::"Approval Entry", Database::"Posted Approval Entry",
            Database::"Change Log Entry", Database::"Reminder/Fin. Charge Entry");

        foreach TableNo in TableNos do
            Assert.IsTrue(DataEditorMgt.IsHistoricalTable(TableNo), StrSubstNo(TableMustBeHistoricalErr, TableNo));
    end;

    [Test]
    procedure MasterDataDocumentAndJournalTablesAreNotHistorical()
    var
        DataEditorMgt: Codeunit "VDV Data Editor Mgt.";
        TableNos: List of [Integer];
        TableNo: Integer;
    begin
        TableNos.AddRange(
            Database::Customer, Database::Vendor, Database::Item, Database::"G/L Account",
            Database::"Sales Header", Database::"Purchase Header", Database::"Gen. Journal Line", Database::"Item Journal Line");

        foreach TableNo in TableNos do
            Assert.IsFalse(DataEditorMgt.IsHistoricalTable(TableNo), StrSubstNo(TableMustNotBeHistoricalErr, TableNo));
    end;

    [Test]
    [HandlerFunctions('GenericMessageHandler')]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure OpenHistoricalTableInProductionShowsWarning()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        LibraryDialogHandler.SetExpectedMessage(HistoricalTableWarningMsg);

        OpenDataEditorBuffer(DataEditorBuffer, Database::"Cust. Ledger Entry", true);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, CustLedgerEntry.TableCaption(), Database::"Cust. Ledger Entry"), DataEditorBuffer.Caption(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure OpenHistoricalTableOutsideProductionShowsNoWarning()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        OpenDataEditorBuffer(DataEditorBuffer, Database::"Cust. Ledger Entry", false);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, CustLedgerEntry.TableCaption(), Database::"Cust. Ledger Entry"), DataEditorBuffer.Caption(), '');
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure OpenNonHistoricalTableInProductionShowsNoWarning()
    var
        Customer: Record Customer;
        DataEditorBuffer: TestPage "VDV Data Editor Buffer";
    begin
        Init();

        OpenDataEditorBuffer(DataEditorBuffer, Database::Customer, true);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, Customer.TableCaption(), Database::Customer), DataEditorBuffer.Caption(), '');
    end;

    [MessageHandler]
    procedure GenericMessageHandler(Message: Text)
    begin
        LibraryDialogHandler.HandleMessage(Message);
    end;

    local procedure Init()
    begin
        LibraryDialogHandler.ClearVariableStorage();
    end;

    local procedure OpenDataEditorBuffer(var DataEditorBuffer: TestPage "VDV Data Editor Buffer"; TableNo: Integer; IsProductionEnvironment: Boolean)
    var
        DataEditorBufferTestMode: Codeunit "VDVT DE Buffer Test Mode";
        DataEditor: TestPage "VDV Data Editor";
    begin
        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(TableNo);
        DataEditorBufferTestMode.SetProductionEnvironment(IsProductionEnvironment);
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);
    end;
}