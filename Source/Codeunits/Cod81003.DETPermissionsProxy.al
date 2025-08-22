// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
codeunit 81003 "DET Permissions Proxy"
{
    Permissions = tabledata "Vendor Ledger Entry" = RMID, tabledata "FA Ledger Entry" = RMID, tabledata "Job Ledger Entry" = RMID, tabledata "Item Ledger Entry" = RMID,
     tabledata "Res. Ledger Entry" = RMID, tabledata "Check Ledger Entry" = RMID, tabledata "Cust. Ledger Entry" = RMID, tabledata "Service Ledger Entry" = RMID,
     tabledata "Capacity Ledger Entry" = RMID, tabledata "Employee Ledger Entry" = RMID, tabledata "Warranty Ledger Entry" = RMID, tabledata "Maintenance Ledger Entry" = RMID,
     tabledata "Bank Account Ledger Entry" = RMID, tabledata "Ins. Coverage Ledger Entry" = RMID, tabledata "Payable Vendor Ledger Entry" = RMID, tabledata "Phys. Inventory Ledger Entry" = RMID,
     tabledata "Payable Employee Ledger Entry" = RMID, tabledata "Detailed Employee Ledger Entry" = RMID, tabledata "Detailed Cust. Ledg. Entry" = RMID, tabledata "Detailed Vendor Ledg. Entry" = RMID,
     tabledata "Sales Invoice Header" = RMID, tabledata "Sales Invoice Line" = RMID, tabledata "Sales Shipment Header" = RMID, tabledata "Sales Shipment Line" = RMID,
     tabledata "Sales Cr.Memo Header" = RMID, tabledata "Sales Cr.Memo Line" = RMID, tabledata "Purch. Cr. Memo Hdr." = RMID, tabledata "Purch. Cr. Memo Line" = RMID,
     tabledata "Purch. Inv. Header" = RMID, tabledata "Purch. Inv. Line" = RMID, tabledata "Purch. Rcpt. Header" = RMID, tabledata "Purch. Rcpt. Line" = RMID,
     tabledata "Purchase Header Archive" = RMID, tabledata "Sales Line Archive" = RMID, tabledata "Sales Header Archive" = RMID, tabledata "Purchase Line Archive" = RMID,
     tabledata "Sales Comment Line Archive" = RMID, tabledata "Purch. Comment Line Archive" = RMID, tabledata "Workflow Step Argument Archive" = RMID, tabledata "Workflow Record Change Archive" = RMID,
     tabledata "Workflow Step Instance Archive" = RMID, tabledata "G/L Entry" = RMID, tabledata "Approval Entry" = RMID, tabledata "Warehouse Entry" = RMID,
     tabledata "Value Entry" = RMID, tabledata "Item Register" = RMID, tabledata "G/L Register" = RIMD, tabledata "Vat Entry" = RMID, tabledata "Dimension Set Entry" = RIMD,
     tabledata "Service Invoice Header" = RMID, TableData "Service Cr.Memo Header" = RMID, TableData "Issued Reminder Header" = RMID, TableData "Issued Fin. Charge Memo Header" = RMID,
     tabledata "G/L Entry - VAT Entry Link" = RMID, tabledata "Item Application Entry" = RMID, tabledata "Item Application Entry History" = RMID,
     tabledata "Return Shipment Header" = RMID, tabledata "Return Shipment Line" = RMID, tabledata "Return Receipt Header" = RMID, tabledata "Return Receipt Line" = RMID,
     tabledata "Invt. Receipt Header" = RMID, tabledata "Invt. Receipt Line" = RMID, tabledata "Invt. Shipment Header" = RMID, tabledata "Invt. Shipment Line" = RMID,
     tabledata "Pstd. Phys. Invt. Record Hdr" = RMID, tabledata "Pstd. Phys. Invt. Record Line" = RMID, tabledata "Pstd. Phys. Invt. Order Hdr" = RMID, tabledata "Pstd. Phys. Invt. Order Line" = RMID,
     tabledata "Bank Account Statement Line" = RMID, tabledata "Change Log Entry" = RIMD, tabledata "Posted Approval Entry" = RIMD, tabledata "FA Register" = RIMD, tabledata "Post Value Entry to G/L" = RIMD,
     tabledata "Job Register" = RMID;

    /// <summary>
    /// Opens a table with the specified table number.
    /// </summary>
    procedure OpenTable(var RecRef: RecordRef; TableNo: Integer)
    begin
        RecRef.Open(TableNo);
    end;

    /// <summary>
    /// Opens a table with the specified table number and read isolation.
    /// </summary>
    procedure OpenTableWithIsolation(var RecRef: RecordRef; TableNo: Integer; ReadIsolation: IsolationLevel)
    begin
        RecRef.Open(TableNo);
        RecRef.ReadIsolation := ReadIsolation;
    end;

    /// <summary>
    /// Duplicates a RecordRef.
    /// </summary>
    procedure DuplicateRecRef(var SourceRecRef: RecordRef; var TargetRecRef: RecordRef)
    begin
        TargetRecRef := SourceRecRef.Duplicate();
    end;

    /// <summary>
    /// Gets a record by RecordId.
    /// </summary>
    procedure GetRecord(var RecRef: RecordRef; RecId: RecordId): Boolean
    begin
        exit(RecRef.Get(RecId));
    end;

    /// <summary>
    /// Finds records based on the current filters.
    /// </summary>
    procedure FindRecord(var RecRef: RecordRef; Which: Text): Boolean
    begin
        exit(RecRef.Find(Which));
    end;

    /// <summary>
    /// Finds records based on the current filters (parameterless).
    /// </summary>
    procedure FindRecordNoParam(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.Find());
    end;

    /// <summary>
    /// Finds the first record.
    /// </summary>
    procedure FindFirst(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.FindFirst());
    end;

    /// <summary>
    /// Finds the last record.
    /// </summary>
    procedure FindLast(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.FindLast());
    end;

    /// <summary>
    /// Finds a set of records.
    /// </summary>
    procedure FindSet(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.FindSet());
    end;

    /// <summary>
    /// Finds a set of records with update lock.
    /// </summary>
    procedure FindSetForUpdate(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.FindSet(true));
    end;

    /// <summary>
    /// Moves to the next record.
    /// </summary>
    procedure NextRecord(var RecRef: RecordRef; Steps: Integer): Integer
    begin
        exit(RecRef.Next(Steps));
    end;

    /// <summary>
    /// Moves to the next record (single step).
    /// </summary>
    procedure NextRecordSingle(var RecRef: RecordRef): Integer
    begin
        exit(RecRef.Next());
    end;

    /// <summary>
    /// Inserts a record.
    /// </summary>
    procedure InsertRecord(var RecRef: RecordRef; RunTrigger: Boolean): Boolean
    begin
        exit(RecRef.Insert(RunTrigger));
    end;

    /// <summary>
    /// Modifies a record.
    /// </summary>
    procedure ModifyRecord(var RecRef: RecordRef; RunTrigger: Boolean): Boolean
    begin
        exit(RecRef.Modify(RunTrigger));
    end;

    /// <summary>
    /// Deletes a record.
    /// </summary>
    procedure DeleteRecord(var RecRef: RecordRef; RunTrigger: Boolean): Boolean
    begin
        exit(RecRef.Delete(RunTrigger));
    end;

    /// <summary>
    /// Deletes all records matching current filters.
    /// </summary>
    procedure DeleteAll(var RecRef: RecordRef; RunTrigger: Boolean)
    begin
        RecRef.DeleteAll(RunTrigger);
    end;

    /// <summary>
    /// Renames a primary key field (up to 15 fields).
    /// </summary>
    procedure RenameRecord(var RecRef: RecordRef; KeyValueCount: Integer;
        Value1: Variant; Value2: Variant; Value3: Variant; Value4: Variant; Value5: Variant;
        Value6: Variant; Value7: Variant; Value8: Variant; Value9: Variant; Value10: Variant;
        Value11: Variant; Value12: Variant; Value13: Variant; Value14: Variant; Value15: Variant): Boolean
    begin
        case KeyValueCount of
            1:
                exit(RecRef.Rename(Value1));
            2:
                exit(RecRef.Rename(Value1, Value2));
            3:
                exit(RecRef.Rename(Value1, Value2, Value3));
            4:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4));
            5:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5));
            6:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6));
            7:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6, Value7));
            8:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8));
            9:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9));
            10:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9, Value10));
            11:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9, Value10, Value11));
            12:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9, Value10, Value11, Value12));
            13:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9, Value10, Value11, Value12, Value13));
            14:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9, Value10, Value11, Value12, Value13, Value14));
            15:
                exit(RecRef.Rename(Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9, Value10, Value11, Value12, Value13, Value14, Value15));
            else
                Error('Renaming with %1 key fields is not supported', KeyValueCount);
        end;
    end;

    /// <summary>
    /// Validates a field value.
    /// </summary>
    procedure ValidateField(var RecRef: RecordRef; FieldNo: Integer; Value: Variant)
    var
        FieldRef: FieldRef;
    begin
        FieldRef := RecRef.Field(FieldNo);
        FieldRef.Validate(Value);
    end;

    /// <summary>
    /// Sets a field value without validation.
    /// </summary>
    procedure SetFieldValue(var RecRef: RecordRef; FieldNo: Integer; Value: Variant)
    var
        FieldRef: FieldRef;
    begin
        FieldRef := RecRef.Field(FieldNo);
        FieldRef.Value := Value;
    end;

    /// <summary>
    /// Gets a field value.
    /// </summary>
    procedure GetFieldValue(var RecRef: RecordRef; FieldNo: Integer): Variant
    var
        FieldRef: FieldRef;
    begin
        FieldRef := RecRef.Field(FieldNo);
        exit(FieldRef.Value);
    end;

    /// <summary>
    /// Calculates a flowfield or blob field.
    /// </summary>
    procedure CalcFields(var RecRef: RecordRef; FieldNo: Integer)
    var
        FieldRef: FieldRef;
    begin
        FieldRef := RecRef.Field(FieldNo);
        FieldRef.CalcField();
    end;

    /// <summary>
    /// Counts records based on current filters.
    /// </summary>
    procedure CountRecords(var RecRef: RecordRef): Integer
    begin
        exit(RecRef.Count());
    end;

    /// <summary>
    /// Checks if the record set is empty.
    /// </summary>
    procedure IsEmpty(var RecRef: RecordRef): Boolean
    begin
        exit(RecRef.IsEmpty());
    end;

    /// <summary>
    /// Initializes a new record.
    /// </summary>
    procedure InitRecord(var RecRef: RecordRef)
    begin
        RecRef.Init();
    end;

    /// <summary>
    /// Closes the RecordRef.
    /// </summary>
    procedure CloseTable(var RecRef: RecordRef)
    begin
        RecRef.Close();
    end;

    /// <summary>
    /// Sets a filter on a field.
    /// </summary>
    procedure SetFieldFilter(var RecRef: RecordRef; FieldNo: Integer; Filter: Text)
    var
        FieldRef: FieldRef;
    begin
        FieldRef := RecRef.Field(FieldNo);
        FieldRef.SetFilter(Filter);
    end;

    /// <summary>
    /// Sets a range on a field.
    /// </summary>
    procedure SetFieldRange(var RecRef: RecordRef; FieldNo: Integer; FromValue: Variant; ToValue: Variant)
    var
        FieldRef: FieldRef;
    begin
        FieldRef := RecRef.Field(FieldNo);
        FieldRef.SetRange(FromValue, ToValue);
    end;

    /// <summary>
    /// Sets a single value range on a field.
    /// </summary>
    procedure SetFieldRangeSingle(var RecRef: RecordRef; FieldNo: Integer; Value: Variant)
    var
        FieldRef: FieldRef;
    begin
        FieldRef := RecRef.Field(FieldNo);
        FieldRef.SetRange(Value);
    end;

    /// <summary>
    /// Resets all filters on the RecordRef.
    /// </summary>
    procedure ResetFilters(var RecRef: RecordRef)
    begin
        RecRef.Reset();
    end;

    /// <summary>
    /// Gets the current filters as text.
    /// </summary>
    procedure GetFilters(var RecRef: RecordRef): Text
    begin
        exit(RecRef.GetFilters());
    end;

    /// <summary>
    /// Sets the view on the RecordRef.
    /// </summary>
    procedure SetView(var RecRef: RecordRef; ViewString: Text)
    begin
        RecRef.SetView(ViewString);
    end;

    /// <summary>
    /// Gets the current view as text.
    /// </summary>
    procedure GetView(var RecRef: RecordRef; UseNames: Boolean): Text
    begin
        exit(RecRef.GetView(UseNames));
    end;

    /// <summary>
    /// Locks the table for the current RecordRef.
    /// </summary>
    procedure LockTable(var RecRef: RecordRef)
    begin
        RecRef.LockTable();
    end;

    /// <summary>
    /// Checks if a record exists with the current primary key values.
    /// </summary>
    procedure RecordExists(var RecRef: RecordRef; RecId: RecordId): Boolean
    var
        TempRecRef: RecordRef;
    begin
        TempRecRef.Open(RecRef.Number());
        exit(TempRecRef.Get(RecId));
    end;

    /// <summary>
    /// Performs field validation through proxy.
    /// </summary>
    procedure ValidateFieldRef(var FieldRef: FieldRef; Value: Variant)
    begin
        FieldRef.Validate(Value);
    end;

    /// <summary>
    /// Sets field value through proxy.
    /// </summary>
    procedure SetFieldRefValue(var FieldRef: FieldRef; Value: Variant)
    begin
        FieldRef.Value := Value;
    end;

    /// <summary>
    /// Gets field value through proxy.
    /// </summary>
    procedure GetFieldRefValue(var FieldRef: FieldRef): Variant
    begin
        exit(FieldRef.Value);
    end;

    /// <summary>
    /// Calculates a flowfield or blob field through proxy.
    /// </summary>
    procedure CalcFieldRef(var FieldRef: FieldRef)
    begin
        FieldRef.CalcField();
    end;
}
