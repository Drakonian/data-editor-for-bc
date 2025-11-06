// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
codeunit 72995578 "VDV Data Operations"
{
    Permissions = tabledata "Vendor Ledger Entry" = rimd, tabledata "FA Ledger Entry" = rimd, tabledata "Job Ledger Entry" = rimd, tabledata "Item Ledger Entry" = rimd,
     tabledata "Res. Ledger Entry" = rimd, tabledata "Check Ledger Entry" = rimd, tabledata "Cust. Ledger Entry" = rimd, tabledata "Service Ledger Entry" = rimd,
     tabledata "Capacity Ledger Entry" = rimd, tabledata "Employee Ledger Entry" = rimd, tabledata "Warranty Ledger Entry" = rimd, tabledata "Maintenance Ledger Entry" = rimd,
     tabledata "Bank Account Ledger Entry" = rimd, tabledata "Ins. Coverage Ledger Entry" = rimd, tabledata "Payable Vendor Ledger Entry" = rimd, tabledata "Phys. Inventory Ledger Entry" = rimd,
     tabledata "Payable Employee Ledger Entry" = rimd, tabledata "Detailed Employee Ledger Entry" = rimd, tabledata "Detailed Cust. Ledg. Entry" = rimd, tabledata "Detailed Vendor Ledg. Entry" = rimd,
     tabledata "Sales Invoice Header" = rimd, tabledata "Sales Invoice Line" = rimd, tabledata "Sales Shipment Header" = rimd, tabledata "Sales Shipment Line" = rimd,
     tabledata "Sales Cr.Memo Header" = rimd, tabledata "Sales Cr.Memo Line" = rimd, tabledata "Purch. Cr. Memo Hdr." = rimd, tabledata "Purch. Cr. Memo Line" = rimd,
     tabledata "Purch. Inv. Header" = rimd, tabledata "Purch. Inv. Line" = rimd, tabledata "Purch. Rcpt. Header" = rimd, tabledata "Purch. Rcpt. Line" = rimd,
     tabledata "Purchase Header Archive" = rimd, tabledata "Sales Line Archive" = rimd, tabledata "Sales Header Archive" = rimd, tabledata "Purchase Line Archive" = rimd,
     tabledata "Sales Comment Line Archive" = rimd, tabledata "Purch. Comment Line Archive" = rimd, tabledata "Workflow Step Argument Archive" = rimd, tabledata "Workflow Record Change Archive" = rimd,
     tabledata "Workflow Step Instance Archive" = rimd, tabledata "G/L Entry" = rimd, tabledata "Approval Entry" = rimd, tabledata "Warehouse Entry" = rimd,
     tabledata "Value Entry" = rimd, tabledata "Item Register" = rimd, tabledata "G/L Register" = rimd, tabledata "Vat Entry" = rimd, tabledata "Dimension Set Entry" = rimd,
     tabledata "Service Invoice Header" = rimd, tabledata "Service Cr.Memo Header" = rimd, TableData "Issued Reminder Header" = rimd, TableData "Issued Fin. Charge Memo Header" = rimd,
     tabledata "G/L Entry - VAT Entry Link" = rimd, tabledata "Item Application Entry" = rimd, tabledata "Item Application Entry History" = rimd,
     tabledata "Return Shipment Header" = rimd, tabledata "Return Shipment Line" = rimd, tabledata "Return Receipt Header" = rimd, tabledata "Return Receipt Line" = rimd,
     tabledata "Invt. Receipt Header" = rimd, tabledata "Invt. Receipt Line" = rimd, tabledata "Invt. Shipment Header" = rimd, tabledata "Invt. Shipment Line" = rimd,
     tabledata "Pstd. Phys. Invt. Record Hdr" = rimd, tabledata "Pstd. Phys. Invt. Record Line" = rimd, tabledata "Pstd. Phys. Invt. Order Hdr" = rimd, tabledata "Pstd. Phys. Invt. Order Line" = rimd,
     tabledata "Bank Account Statement Line" = rimd, tabledata "Change Log Entry" = rimd, tabledata "Posted Approval Entry" = rimd, tabledata "FA Register" = rimd, tabledata "Post Value Entry to G/L" = rimd,
     tabledata "Job Register" = rimd, tabledata "Cancelled Document" = rimd;

    var
        RenamePKNotSuppErr: Label 'Changing the primary key for >15 values is not supported.';

    procedure SetFieldRefValue(var FieldRefVar: FieldRef; NewValue: Variant)
    begin
        FieldRefVar.Value(NewValue);
    end;

    procedure ValidateFieldRefValue(var FieldRefVar: FieldRef; NewValue: Variant)
    begin
        FieldRefVar.Validate(NewValue)
    end;

    procedure ValidateFieldRefValue(var FieldRefVar: FieldRef)
    begin
        FieldRefVar.Validate();
    end;

    procedure SetFieldRefToFieldRef(var SourceFieldRef: FieldRef; var TargetFieldRef: FieldRef)
    begin
        TargetFieldRef.Value(SourceFieldRef.Value());
    end;

    procedure ValidateFieldRefToFieldRef(var SourceFieldRef: FieldRef; var TargetFieldRef: FieldRef)
    begin
        TargetFieldRef.Validate(SourceFieldRef.Value());
    end;

    procedure InsertRecord(var RecRef: RecordRef; RunTrigger: Boolean): Boolean
    begin
        exit(RecRef.Insert(RunTrigger));
    end;

    procedure ModifyRecord(var RecRef: RecordRef; RunTrigger: Boolean): Boolean
    begin
        exit(RecRef.Modify(RunTrigger));
    end;

    procedure DeleteRecord(var RecRef: RecordRef; RunTrigger: Boolean): Boolean
    begin
        exit(RecRef.Delete(RunTrigger));
    end;

    procedure FindRecord(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.Find());
    end;

    procedure NextRecord(var RecRef: RecordRef; Steps: Integer): Integer
    begin
        exit(RecRef.Next(Steps));
    end;

    procedure NextRecord(var RecRef: RecordRef): Integer
    begin
        exit(RecRef.Next());
    end;

    procedure FindSetRecord(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.FindSet());
    end;

    procedure FindFirstRecord(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.FindFirst());
    end;

    procedure FindLastRecord(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.FindLast());
    end;

    procedure GetTable(var RecRef: RecordRef; VariantRecord: Variant): Boolean
    begin
        RecRef.GetTable(VariantRecord);
    end;

    procedure GetRecord(var RecRef: RecordRef; SourceRecordId: RecordId): Boolean
    begin
        exit(RecRef.Get(SourceRecordId));
    end;

    procedure Count(var RecRef: RecordRef): Integer
    begin
        exit(RecRef.Count());
    end;


    procedure CalcFieldRef(var FieldRefVar: FieldRef)
    begin
        FieldRefVar.CalcField();
    end;

    procedure RenamePKField(var inRecRef: RecordRef; var FieldRefVar: FieldRef; var SourceRecordId: RecordId; NewValueAsVariant: Variant)
    var
        SingleInstanceStorage: Codeunit "VDV Single Instance Storage";
        DataEditorMgt: Codeunit "VDV Data Editor Mgt.";
        RecordRefTemp: RecordRef;
        xRecRef: RecordRef;
        FieldRefVar2: FieldRef;
        xFieldRefVar: FieldRef;
        KeyRefVar: KeyRef;
        KeyCount: Integer;
        DictOfFieldKeyType: Dictionary of [Integer, Text];
        KeyValueIndexRelDict: Dictionary of [Integer, Text[2048]];
    begin
        KeyRefVar := inRecRef.KeyIndex(1);
        xRecRef := inRecRef.Duplicate();
        xFieldRefVar := xRecRef.Field(FieldRefVar.Number());
        for KeyCount := 1 to KeyRefVar.FieldCount() do begin
            FieldRefVar2 := KeyRefVar.FieldIndex(KeyCount);
            if FieldRefVar2.Number() <> FieldRefVar.Number() then
                if FieldRefVar2.Type() = FieldRefVar2.Type::Option then
                    KeyValueIndexRelDict.Add(KeyCount, Format(FieldRefVar2.OptionCaption().Split(',').IndexOf(FieldRefVar2.Value()) - 1))
                else
                    KeyValueIndexRelDict.Add(KeyCount, Format(FieldRefVar2.Value()))
            else
                KeyValueIndexRelDict.Add(KeyCount, Format(NewValueAsVariant));
            DictOfFieldKeyType.Add(KeyCount, Format(FieldRefVar2.Type));
        end;

        if BindSubscription(SingleInstanceStorage) then;

        RecordRefTemp := inRecRef.Duplicate();
        RecordRefTemp.Field(FieldRefVar.Number()).Value(DataEditorMgt.TextValueAsVariant(FieldRefVar.Type(), Format(NewValueAsVariant))); //why?

        case KeyValueIndexRelDict.Count() of
            1:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value());
            2:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value());
            3:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value()
                    );
            4:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value()
                    );
            5:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value()
                    );
            6:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value()
                    );
            7:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value()
                    );
            8:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value()
                    );
            9:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value()
                    );
            10:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value()
                    );
            11:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value()
                    );
            12:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value()
                    );
            13:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(13)).Value()
                    );
            14:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(13)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(14)).Value()
                    );
            15:
                inRecRef.Rename(RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(13)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(14)).Value(),
                    RecordRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(15)).Value()
                    );
            else
                Error(RenamePKNotSuppErr);
        end;

        if UnbindSubscription(SingleInstanceStorage) then;
        SourceRecordId := inRecRef.RecordId();
    end;
}
