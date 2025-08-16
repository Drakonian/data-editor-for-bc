codeunit 81104 "TDET Data Editor Permissions"
{
    Subtype = Test;
    TestPermissions = Restrictive;

    var
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        LibraryVariableStorage: Codeunit "Library - Variable Storage";
        LibraryRandom: Codeunit "Library - Random";
        LibrarySales: Codeunit "Library - Sales";
        DataEditorPermissionSetIdTxt: Label 'DET DATA EDITOR TOOL', Locked = true;
        PageCaptionLbl: Label '%1 (%2)', Locked = true, Comment = '%1 = Table Caption, %2 = Table Number';

    [Test]
    procedure EditSalesInvoiceHeader()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesHeader: Record "Sales Header";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();

        LibrarySales.CreateSalesInvoice(SalesHeader);

        SalesInvoiceHeader.Get(LibrarySales.PostSalesDocument(SalesHeader, true, true));

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
    procedure EditCustLedgerEntry()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesHeader: Record "Sales Header";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DataEditorBufferTestMode: Codeunit "TDET DE Buffer Test Mode";
        DataEditor: TestPage "DET Data Editor";
        DataEditorBuffer: TestPage "DET Data Editor Buffer";
    begin
        Init();

        LibrarySales.CreateSalesInvoice(SalesHeader);

        SalesInvoiceHeader.Get(LibrarySales.PostSalesDocument(SalesHeader, true, true));

        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SetRange("Posting Date", SalesInvoiceHeader."Posting Date");
        CustLedgerEntry.SetRange("Document No.", SalesInvoiceHeader."No.");
        CustLedgerEntry.FindFirst();

        SetLowerPermissions();

        DataEditorBuffer.Trap();

        DataEditor.OpenEdit();
        DataEditor.SourceTableNoField.SetValue(Database::"Cust. Ledger Entry");
        BindSubscription(DataEditorBufferTestMode);
        DataEditor.OK().Invoke();
        UnbindSubscription(DataEditorBufferTestMode);

        DataEditorBuffer.Filter.SetFilter("Text Value 6", SalesInvoiceHeader."No.");
        DataEditorBuffer.First();

        LibraryVariableStorage.Enqueue(CustLedgerEntry.Description);

        Assert.AreEqual(StrSubstNo(PageCaptionLbl, CustLedgerEntry.TableCaption(), Database::"Cust. Ledger Entry"), DataEditorBuffer.Caption(), '');
        Assert.AreEqual(CustLedgerEntry.FieldCaption(Description), DataEditorBuffer."Text Value 7".Caption(), '');
        Assert.AreEqual(LibraryVariableStorage.DequeueText(), DataEditorBuffer."Text Value 7".Value(), '');

        DataEditorBuffer."Text Value 7".SetValue('new value');

        Assert.AreEqual('new value', DataEditorBuffer."Text Value 7".Value(), '');
    end;

    local procedure Init()
    begin
        LibraryRandom.Init();
    end;

    local procedure SetLowerPermissions()
    begin
        LibraryLowerPermissions.SetLocal();
        LibraryLowerPermissions.AddO365Basic();
        LibraryLowerPermissions.AddeRead();
        LibraryLowerPermissions.AddPermissionSet(DataEditorPermissionSetIdTxt);
    end;
}


