// SPDX-FileCopyrightText: 2021-2025 Volodymyr Dvernytskyi
// SPDX-License-Identifier: MIT
//
// Original author — Volodymyr Dvernytskyi (Data Editor Tool)
codeunit 81010 "DET Permissions Provider"
{
    /// <summary>
    /// Central permissions provider for Data Editor Tool operations.
    /// This codeunit contains all necessary permissions for CRUD operations on various tables.
    /// All Data Editor objects should inherit from or use this codeunit to ensure consistent permissions.
    /// </summary>
    Permissions =
        tabledata "Vendor Ledger Entry" = RMID,
        tabledata "FA Ledger Entry" = RMID,
        tabledata "Job Ledger Entry" = RMID,
        tabledata "Item Ledger Entry" = RMID,
        tabledata "Res. Ledger Entry" = RMID,
        tabledata "Check Ledger Entry" = RMID,
        tabledata "Cust. Ledger Entry" = RMID,
        tabledata "Service Ledger Entry" = RMID,
        tabledata "Capacity Ledger Entry" = RMID,
        tabledata "Employee Ledger Entry" = RMID,
        tabledata "Warranty Ledger Entry" = RMID,
        tabledata "Maintenance Ledger Entry" = RMID,
        tabledata "Bank Account Ledger Entry" = RMID,
        tabledata "Ins. Coverage Ledger Entry" = RMID,
        tabledata "Payable Vendor Ledger Entry" = RMID,
        tabledata "Phys. Inventory Ledger Entry" = RMID,
        tabledata "Payable Employee Ledger Entry" = RMID,
        tabledata "Detailed Employee Ledger Entry" = RMID,
        tabledata "Detailed Cust. Ledg. Entry" = RMID,
        tabledata "Detailed Vendor Ledg. Entry" = RMID,
        tabledata "Sales Invoice Header" = RMID,
        tabledata "Sales Invoice Line" = RMID,
        tabledata "Sales Shipment Header" = RMID,
        tabledata "Sales Shipment Line" = RMID,
        tabledata "Sales Cr.Memo Header" = RMID,
        tabledata "Sales Cr.Memo Line" = RMID,
        tabledata "Purch. Cr. Memo Hdr." = RMID,
        tabledata "Purch. Cr. Memo Line" = RMID,
        tabledata "Purch. Inv. Header" = RMID,
        tabledata "Purch. Inv. Line" = RMID,
        tabledata "Purch. Rcpt. Header" = RMID,
        tabledata "Purch. Rcpt. Line" = RMID,
        tabledata "Purchase Header Archive" = RMID,
        tabledata "Sales Line Archive" = RMID,
        tabledata "Sales Header Archive" = RMID,
        tabledata "Purchase Line Archive" = RMID,
        tabledata "Sales Comment Line Archive" = RMID,
        tabledata "Purch. Comment Line Archive" = RMID,
        tabledata "Workflow Step Argument Archive" = RMID,
        tabledata "Workflow Record Change Archive" = RMID,
        tabledata "Workflow Step Instance Archive" = RMID,
        tabledata "G/L Entry" = RMID,
        tabledata "Approval Entry" = RMID,
        tabledata "Warehouse Entry" = RMID,
        tabledata "Value Entry" = RMID,
        tabledata "Item Register" = RMID,
        tabledata "G/L Register" = RIMD,
        tabledata "Vat Entry" = RMID,
        tabledata "Dimension Set Entry" = RIMD,
        tabledata "Service Invoice Header" = RMID,
        TableData "Service Cr.Memo Header" = RMID,
        TableData "Issued Reminder Header" = RMID,
        TableData "Issued Fin. Charge Memo Header" = RMID,
        tabledata "G/L Entry - VAT Entry Link" = RMID,
        tabledata "Item Application Entry" = RMID,
        tabledata "Item Application Entry History" = RMID,
        tabledata "Return Shipment Header" = RMID,
        tabledata "Return Shipment Line" = RMID,
        tabledata "Return Receipt Header" = RMID,
        tabledata "Return Receipt Line" = RMID,
        tabledata "Invt. Receipt Header" = RMID,
        tabledata "Invt. Receipt Line" = RMID,
        tabledata "Invt. Shipment Header" = RMID,
        tabledata "Invt. Shipment Line" = RMID,
        tabledata "Pstd. Phys. Invt. Record Hdr" = RMID,
        tabledata "Pstd. Phys. Invt. Record Line" = RMID,
        tabledata "Pstd. Phys. Invt. Order Hdr" = RMID,
        tabledata "Pstd. Phys. Invt. Order Line" = RMID,
        tabledata "Bank Account Statement Line" = RMID,
        tabledata "Change Log Entry" = RIMD,
        tabledata "Posted Approval Entry" = RIMD,
        tabledata "FA Register" = RIMD,
        tabledata "Post Value Entry to G/L" = RIMD,
        tabledata "Job Register" = RMID;

    /// <summary>
    /// Executes a RecordRef operation with proper permissions context.
    /// This method ensures that all CRUD operations have the necessary permissions.
    /// </summary>
    /// <param name="RecRefVar">The RecordRef to operate on</param>
    /// <param name="Operation">The operation to perform (Get, Find, Insert, Modify, Delete, etc.)</param>
    /// <param name="WithValidation">Whether to use validation during the operation</param>
    /// <returns>True if operation succeeded, false otherwise</returns>
    procedure ExecuteRecordOperation(var RecRefVar: RecordRef; Operation: Enum "DET Record Operation"; WithValidation: Boolean): Boolean
    begin
        case Operation of
            Operation::Find:
                exit(RecRefVar.Find());
            Operation::FindFirst:
                exit(RecRefVar.FindFirst());
            Operation::FindLast:
                exit(RecRefVar.FindLast());
            Operation::FindSet:
                exit(RecRefVar.FindSet());
            Operation::Next:
                exit(RecRefVar.Next() <> 0);
            Operation::Insert:
                begin
                    RecRefVar.Insert(WithValidation);
                    exit(true);
                end;
            Operation::Modify:
                begin
                    RecRefVar.Modify(WithValidation);
                    exit(true);
                end;
            Operation::Delete:
                begin
                    RecRefVar.Delete(WithValidation);
                    exit(true);
                end;
            Operation::Rename:
                exit(true); // Rename operations are handled separately with parameters
        end;
    end;

    /// <summary>
    /// Executes a FieldRef validation operation with proper permissions context.
    /// </summary>
    /// <param name="FieldRefVar">The FieldRef to validate</param>
    /// <param name="NewValue">The new value to validate</param>
    procedure ExecuteFieldValidation(var FieldRefVar: FieldRef; NewValue: Variant)
    begin
        FieldRefVar.Validate(NewValue);
    end;

    /// <summary>
    /// Executes a FieldRef value assignment with proper permissions context.
    /// </summary>
    /// <param name="FieldRefVar">The FieldRef to set value on</param>
    /// <param name="NewValue">The new value to assign</param>
    procedure ExecuteFieldAssignment(var FieldRefVar: FieldRef; NewValue: Variant)
    begin
        FieldRefVar.Value(NewValue);
    end;

    /// <summary>
    /// Executes a CalcField operation with proper permissions context.
    /// </summary>
    /// <param name="FieldRefVar">The FieldRef to calculate</param>
    procedure ExecuteCalcField(var FieldRefVar: FieldRef)
    begin
        FieldRefVar.CalcField();
    end;

    /// <summary>
    /// Provides a wrapper for RecordRef.Get operations that require permissions.
    /// </summary>
    /// <param name="RecRefVar">The RecordRef to get</param>
    /// <param name="RecordID">The RecordID to get</param>
    /// <returns>True if record was found and retrieved</returns>
    procedure SafeGet(var RecRefVar: RecordRef; RecordID: RecordId): Boolean
    begin
        exit(RecRefVar.Get(RecordID));
    end;

    /// <summary>
    /// Provides a wrapper for RecordRef operations that might trigger validation.
    /// This is particularly important for OnValidate triggers that may perform CRUD operations.
    /// </summary>
    /// <param name="RecRefVar">The RecordRef to operate on</param>
    /// <param name="FieldNo">The field number being validated</param>
    /// <param name="NewValue">The new value for the field</param>
    /// <param name="WithValidation">Whether to use validation</param>
    procedure SafeFieldUpdate(var RecRefVar: RecordRef; FieldNo: Integer; NewValue: Variant; WithValidation: Boolean)
    var
        FieldRefVar: FieldRef;
    begin
        FieldRefVar := RecRefVar.Field(FieldNo);
        if WithValidation then
            ExecuteFieldValidation(FieldRefVar, NewValue)
        else
            ExecuteFieldAssignment(FieldRefVar, NewValue);
    end;
}
