// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
codeunit 81003 "DET Data Operations"
{
    Permissions = tabledata "Vendor Ledger Entry" = RIMD, tabledata "FA Ledger Entry" = RIMD, tabledata "Job Ledger Entry" = RIMD, tabledata "Item Ledger Entry" = RIMD,
     tabledata "Res. Ledger Entry" = RIMD, tabledata "Check Ledger Entry" = RIMD, tabledata "Cust. Ledger Entry" = RIMD, tabledata "Service Ledger Entry" = RIMD,
     tabledata "Capacity Ledger Entry" = RIMD, tabledata "Employee Ledger Entry" = RIMD, tabledata "Warranty Ledger Entry" = RIMD, tabledata "Maintenance Ledger Entry" = RIMD,
     tabledata "Bank Account Ledger Entry" = RIMD, tabledata "Ins. Coverage Ledger Entry" = RIMD, tabledata "Payable Vendor Ledger Entry" = RIMD, tabledata "Phys. Inventory Ledger Entry" = RIMD,
     tabledata "Payable Employee Ledger Entry" = RIMD, tabledata "Detailed Employee Ledger Entry" = RIMD, tabledata "Detailed Cust. Ledg. Entry" = RIMD, tabledata "Detailed Vendor Ledg. Entry" = RIMD,
     tabledata "Sales Invoice Header" = RIMD, tabledata "Sales Invoice Line" = RIMD, tabledata "Sales Shipment Header" = RIMD, tabledata "Sales Shipment Line" = RIMD,
     tabledata "Sales Cr.Memo Header" = RIMD, tabledata "Sales Cr.Memo Line" = RIMD, tabledata "Purch. Cr. Memo Hdr." = RIMD, tabledata "Purch. Cr. Memo Line" = RIMD,
     tabledata "Purch. Inv. Header" = RIMD, tabledata "Purch. Inv. Line" = RIMD, tabledata "Purch. Rcpt. Header" = RIMD, tabledata "Purch. Rcpt. Line" = RIMD,
     tabledata "Purchase Header Archive" = RIMD, tabledata "Sales Line Archive" = RIMD, tabledata "Sales Header Archive" = RIMD, tabledata "Purchase Line Archive" = RIMD,
     tabledata "Sales Comment Line Archive" = RIMD, tabledata "Purch. Comment Line Archive" = RIMD, tabledata "Workflow Step Argument Archive" = RIMD, tabledata "Workflow Record Change Archive" = RIMD,
     tabledata "Workflow Step Instance Archive" = RIMD, tabledata "G/L Entry" = RIMD, tabledata "Approval Entry" = RIMD, tabledata "Warehouse Entry" = RIMD,
     tabledata "Value Entry" = RIMD, tabledata "Item Register" = RIMD, tabledata "G/L Register" = RIMD, tabledata "Vat Entry" = RIMD, tabledata "Dimension Set Entry" = RIMD,
     tabledata "Service Invoice Header" = RIMD, tabledata "Service Cr.Memo Header" = RIMD, TableData "Issued Reminder Header" = RIMD, TableData "Issued Fin. Charge Memo Header" = RIMD,
     tabledata "G/L Entry - VAT Entry Link" = RIMD, tabledata "Item Application Entry" = RIMD, tabledata "Item Application Entry History" = RIMD,
     tabledata "Return Shipment Header" = RIMD, tabledata "Return Shipment Line" = RIMD, tabledata "Return Receipt Header" = RIMD, tabledata "Return Receipt Line" = RIMD,
     tabledata "Invt. Receipt Header" = RIMD, tabledata "Invt. Receipt Line" = RIMD, tabledata "Invt. Shipment Header" = RIMD, tabledata "Invt. Shipment Line" = RIMD,
     tabledata "Pstd. Phys. Invt. Record Hdr" = RIMD, tabledata "Pstd. Phys. Invt. Record Line" = RIMD, tabledata "Pstd. Phys. Invt. Order Hdr" = RIMD, tabledata "Pstd. Phys. Invt. Order Line" = RIMD,
     tabledata "Bank Account Statement Line" = RIMD, tabledata "Change Log Entry" = RIMD, tabledata "Posted Approval Entry" = RIMD, tabledata "FA Register" = RIMD, tabledata "Post Value Entry to G/L" = RIMD,
     tabledata "Job Register" = RIMD;

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
        SingleInstanceStorage: Codeunit "DET Single Instance Storage";
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
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
