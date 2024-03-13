page 81000 "DET Data Editor Buffer"
{

    Caption = 'Data Editor Buffer';
    PageType = List;
    SourceTable = "DET Data Editor Buffer";
    UsageCategory = None;
    SourceTableTemporary = true;
    InsertAllowed = false;
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
     TableData "Service Invoice Header" = RMID, TableData "Service Cr.Memo Header" = RMID, TableData "Issued Reminder Header" = RMID, TableData "Issued Fin. Charge Memo Header" = RMID;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Text Value 2"; Rec."Text Value 2")
                {
                    ToolTip = 'Specifies the value of the Value 2 field';
                    ApplicationArea = All;
                    Visible = FieldVisible1;
                    Editable = FieldEditable1;
                    trigger OnValidate()
                    begin
                        OnValidateField(1, Rec."Text Value 2");

                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(1, Rec."Text Value 2");

                    end;
                }

                field("Text Value 3"; Rec."Text Value 3")
                {
                    ToolTip = 'Specifies the value of the Value 3 field';
                    ApplicationArea = All;
                    Visible = FieldVisible2;
                    Editable = FieldEditable2;
                    trigger OnValidate()
                    begin
                        OnValidateField(2, Rec."Text Value 3");

                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(2, Rec."Text Value 3");

                    end;
                }
                field("Text Value 4"; Rec."Text Value 4")
                {
                    ToolTip = 'Specifies the value of the Value 4 field';
                    ApplicationArea = All;
                    Visible = FieldVisible3;
                    Editable = FieldEditable3;
                    trigger OnValidate()
                    begin
                        OnValidateField(3, Rec."Text Value 4");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(3, Rec."Text Value 4");
                    end;
                }
                field("Text Value 5"; Rec."Text Value 5")
                {
                    ToolTip = 'Specifies the value of the Value 5 field';
                    ApplicationArea = All;
                    Visible = FieldVisible4;
                    Editable = FieldEditable4;
                    trigger OnValidate()
                    begin
                        OnValidateField(4, Rec."Text Value 5");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(4, Rec."Text Value 5");
                    end;
                }
                field("Text Value 6"; Rec."Text Value 6")
                {
                    ToolTip = 'Specifies the value of the Value 6 field';
                    ApplicationArea = All;
                    Visible = FieldVisible5;
                    Editable = FieldEditable5;
                    trigger OnValidate()
                    begin
                        OnValidateField(5, Rec."Text Value 6");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(5, Rec."Text Value 6");
                    end;
                }
                field("Text Value 7"; Rec."Text Value 7")
                {
                    ToolTip = 'Specifies the value of the Value 7 field';
                    ApplicationArea = All;
                    Visible = FieldVisible6;
                    Editable = FieldEditable6;
                    trigger OnValidate()
                    begin
                        OnValidateField(6, Rec."Text Value 7");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(6, Rec."Text Value 7");
                    end;
                }
                field("Text Value 8"; Rec."Text Value 8")
                {
                    ToolTip = 'Specifies the value of the Value 8 field';
                    ApplicationArea = All;
                    Visible = FieldVisible7;
                    Editable = FieldEditable7;
                    trigger OnValidate()
                    begin
                        OnValidateField(7, Rec."Text Value 8");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(7, Rec."Text Value 8");
                    end;
                }
                field("Text Value 9"; Rec."Text Value 9")
                {
                    ToolTip = 'Specifies the value of the Value 9 field';
                    ApplicationArea = All;
                    Visible = FieldVisible8;
                    Editable = FieldEditable8;
                    trigger OnValidate()
                    begin
                        OnValidateField(8, Rec."Text Value 9");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(8, Rec."Text Value 9");
                    end;
                }
                field("Text Value 10"; Rec."Text Value 10")
                {
                    ToolTip = 'Specifies the value of the Value 10 field';
                    ApplicationArea = All;
                    Visible = FieldVisible9;
                    Editable = FieldEditable9;
                    trigger OnValidate()
                    begin
                        OnValidateField(9, Rec."Text Value 10");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(9, Rec."Text Value 10");
                    end;
                }
                field("Text Value 11"; Rec."Text Value 11")
                {
                    ToolTip = 'Specifies the value of the Value 11 field';
                    ApplicationArea = All;
                    Visible = FieldVisible10;
                    Editable = FieldEditable10;
                    trigger OnValidate()
                    begin
                        OnValidateField(10, Rec."Text Value 11");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(10, Rec."Text Value 11");
                    end;
                }
                field("Text Value 12"; Rec."Text Value 12")
                {
                    ToolTip = 'Specifies the value of the Value 12 field';
                    ApplicationArea = All;
                    Visible = FieldVisible11;
                    Editable = FieldEditable11;
                    trigger OnValidate()
                    begin
                        OnValidateField(11, Rec."Text Value 12");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(11, Rec."Text Value 12");
                    end;
                }
                field("Text Value 13"; Rec."Text Value 13")
                {
                    ToolTip = 'Specifies the value of the Value 13 field';
                    ApplicationArea = All;
                    Visible = FieldVisible12;
                    Editable = FieldEditable12;
                    trigger OnValidate()
                    begin
                        OnValidateField(12, Rec."Text Value 13");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(12, Rec."Text Value 13");
                    end;
                }
                field("Text Value 14"; Rec."Text Value 14")
                {
                    ToolTip = 'Specifies the value of the Value 14 field';
                    ApplicationArea = All;
                    Visible = FieldVisible13;
                    Editable = FieldEditable13;
                    trigger OnValidate()
                    begin
                        OnValidateField(13, Rec."Text Value 14");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(13, Rec."Text Value 14");
                    end;
                }
                field("Text Value 15"; Rec."Text Value 15")
                {
                    ToolTip = 'Specifies the value of the Value 15 field';
                    ApplicationArea = All;
                    Visible = FieldVisible14;
                    Editable = FieldEditable14;
                    trigger OnValidate()
                    begin
                        OnValidateField(14, Rec."Text Value 15");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(14, Rec."Text Value 15");
                    end;
                }
                field("Text Value 16"; Rec."Text Value 16")
                {
                    ToolTip = 'Specifies the value of the Value 16 field';
                    ApplicationArea = All;
                    Visible = FieldVisible15;
                    Editable = FieldEditable15;
                    trigger OnValidate()
                    begin
                        OnValidateField(15, Rec."Text Value 16");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(15, Rec."Text Value 16");
                    end;
                }
                field("Text Value 17"; Rec."Text Value 17")
                {
                    ToolTip = 'Specifies the value of the Value 17 field';
                    ApplicationArea = All;
                    Visible = FieldVisible16;
                    Editable = FieldEditable16;
                    trigger OnValidate()
                    begin
                        OnValidateField(16, Rec."Text Value 17");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(16, Rec."Text Value 17");
                    end;
                }
                field("Text Value 18"; Rec."Text Value 18")
                {
                    ToolTip = 'Specifies the value of the Value 18 field';
                    ApplicationArea = All;
                    Visible = FieldVisible17;
                    Editable = FieldEditable17;
                    trigger OnValidate()
                    begin
                        OnValidateField(17, Rec."Text Value 18");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(17, Rec."Text Value 18");
                    end;
                }
                field("Text Value 19"; Rec."Text Value 19")
                {
                    ToolTip = 'Specifies the value of the Value 19 field';
                    ApplicationArea = All;
                    Visible = FieldVisible18;
                    Editable = FieldEditable18;
                    trigger OnValidate()
                    begin
                        OnValidateField(18, Rec."Text Value 19");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(18, Rec."Text Value 19");
                    end;
                }
                field("Text Value 20"; Rec."Text Value 20")
                {
                    ToolTip = 'Specifies the value of the Value 20 field';
                    ApplicationArea = All;
                    Visible = FieldVisible19;
                    Editable = FieldEditable19;
                    trigger OnValidate()
                    begin
                        OnValidateField(19, Rec."Text Value 20");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(19, Rec."Text Value 20");
                    end;
                }
                field("Text Value 21"; Rec."Text Value 21")
                {
                    ToolTip = 'Specifies the value of the Value 21 field';
                    ApplicationArea = All;
                    Visible = FieldVisible20;
                    Editable = FieldEditable20;
                    trigger OnValidate()
                    begin
                        OnValidateField(20, Rec."Text Value 21");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(20, Rec."Text Value 21");
                    end;
                }
                field("Text Value 22"; Rec."Text Value 22")
                {
                    ToolTip = 'Specifies the value of the Value 22 field';
                    ApplicationArea = All;
                    Visible = FieldVisible21;
                    Editable = FieldEditable21;
                    trigger OnValidate()
                    begin
                        OnValidateField(21, Rec."Text Value 22");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(21, Rec."Text Value 22");
                    end;
                }
                field("Text Value 23"; Rec."Text Value 23")
                {
                    ToolTip = 'Specifies the value of the Value 23 field';
                    ApplicationArea = All;
                    Visible = FieldVisible22;
                    Editable = FieldEditable22;
                    trigger OnValidate()
                    begin
                        OnValidateField(22, Rec."Text Value 23");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(22, Rec."Text Value 23");
                    end;
                }
                field("Text Value 24"; Rec."Text Value 24")
                {
                    ToolTip = 'Specifies the value of the Value 24 field';
                    ApplicationArea = All;
                    Visible = FieldVisible23;
                    Editable = FieldEditable23;
                    trigger OnValidate()
                    begin
                        OnValidateField(23, Rec."Text Value 24");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(23, Rec."Text Value 24");
                    end;
                }
                field("Text Value 25"; Rec."Text Value 25")
                {
                    ToolTip = 'Specifies the value of the Value 25 field';
                    ApplicationArea = All;
                    Visible = FieldVisible24;
                    Editable = FieldEditable24;
                    trigger OnValidate()
                    begin
                        OnValidateField(24, Rec."Text Value 25");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(24, Rec."Text Value 25");
                    end;
                }
                field("Text Value 26"; Rec."Text Value 26")
                {
                    ToolTip = 'Specifies the value of the Value 26 field';
                    ApplicationArea = All;
                    Visible = FieldVisible25;
                    Editable = FieldEditable25;
                    trigger OnValidate()
                    begin
                        OnValidateField(25, Rec."Text Value 26");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(25, Rec."Text Value 26");
                    end;
                }
                field("Text Value 27"; Rec."Text Value 27")
                {
                    ToolTip = 'Specifies the value of the Value 27 field';
                    ApplicationArea = All;
                    Visible = FieldVisible26;
                    Editable = FieldEditable26;
                    trigger OnValidate()
                    begin
                        OnValidateField(26, Rec."Text Value 27");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(26, Rec."Text Value 27");
                    end;
                }
                field("Text Value 28"; Rec."Text Value 28")
                {
                    ToolTip = 'Specifies the value of the Value 28 field';
                    ApplicationArea = All;
                    Visible = FieldVisible27;
                    Editable = FieldEditable27;
                    trigger OnValidate()
                    begin
                        OnValidateField(27, Rec."Text Value 28");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(27, Rec."Text Value 28");
                    end;
                }
                field("Text Value 29"; Rec."Text Value 29")
                {
                    ToolTip = 'Specifies the value of the Value 29 field';
                    ApplicationArea = All;
                    Visible = FieldVisible28;
                    Editable = FieldEditable28;
                    trigger OnValidate()
                    begin
                        OnValidateField(28, Rec."Text Value 29");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(28, Rec."Text Value 29");
                    end;
                }
                field("Text Value 30"; Rec."Text Value 30")
                {
                    ToolTip = 'Specifies the value of the Value 30 field';
                    ApplicationArea = All;
                    Visible = FieldVisible29;
                    Editable = FieldEditable29;
                    trigger OnValidate()
                    begin
                        OnValidateField(29, Rec."Text Value 30");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(29, Rec."Text Value 30");
                    end;
                }
                field("Text Value 31"; Rec."Text Value 31")
                {
                    ToolTip = 'Specifies the value of the Value 31 field';
                    ApplicationArea = All;
                    Visible = FieldVisible30;
                    Editable = FieldEditable30;
                    trigger OnValidate()
                    begin
                        OnValidateField(30, Rec."Text Value 31");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(30, Rec."Text Value 31");
                    end;
                }
                field("Text Value 32"; Rec."Text Value 32")
                {
                    ToolTip = 'Specifies the value of the Value 32 field';
                    ApplicationArea = All;
                    Visible = FieldVisible31;
                    Editable = FieldEditable31;
                    trigger OnValidate()
                    begin
                        OnValidateField(31, Rec."Text Value 32");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(31, Rec."Text Value 32");
                    end;
                }
                field("Text Value 33"; Rec."Text Value 33")
                {
                    ToolTip = 'Specifies the value of the Value 33 field';
                    ApplicationArea = All;
                    Visible = FieldVisible32;
                    Editable = FieldEditable32;
                    trigger OnValidate()
                    begin
                        OnValidateField(32, Rec."Text Value 33");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(32, Rec."Text Value 33");
                    end;
                }
                field("Text Value 34"; Rec."Text Value 34")
                {
                    ToolTip = 'Specifies the value of the Value 34 field';
                    ApplicationArea = All;
                    Visible = FieldVisible33;
                    Editable = FieldEditable33;
                    trigger OnValidate()
                    begin
                        OnValidateField(33, Rec."Text Value 34");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(33, Rec."Text Value 34");
                    end;
                }
                field("Text Value 35"; Rec."Text Value 35")
                {
                    ToolTip = 'Specifies the value of the Value 35 field';
                    ApplicationArea = All;
                    Visible = FieldVisible34;
                    Editable = FieldEditable34;
                    trigger OnValidate()
                    begin
                        OnValidateField(34, Rec."Text Value 35");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(34, Rec."Text Value 35");
                    end;
                }
                field("Text Value 36"; Rec."Text Value 36")
                {
                    ToolTip = 'Specifies the value of the Value 36 field';
                    ApplicationArea = All;
                    Visible = FieldVisible35;
                    Editable = FieldEditable35;
                    trigger OnValidate()
                    begin
                        OnValidateField(35, Rec."Text Value 36");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(35, Rec."Text Value 36");
                    end;
                }
                field("Text Value 37"; Rec."Text Value 37")
                {
                    ToolTip = 'Specifies the value of the Value 37 field';
                    ApplicationArea = All;
                    Visible = FieldVisible36;
                    Editable = FieldEditable36;
                    trigger OnValidate()
                    begin
                        OnValidateField(36, Rec."Text Value 37");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(36, Rec."Text Value 37");
                    end;
                }
                field("Text Value 38"; Rec."Text Value 38")
                {
                    ToolTip = 'Specifies the value of the Value 38 field';
                    ApplicationArea = All;
                    Visible = FieldVisible37;
                    Editable = FieldEditable37;
                    trigger OnValidate()
                    begin
                        OnValidateField(37, Rec."Text Value 38");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(37, Rec."Text Value 38");
                    end;
                }
                field("Text Value 39"; Rec."Text Value 39")
                {
                    ToolTip = 'Specifies the value of the Value 39 field';
                    ApplicationArea = All;
                    Visible = FieldVisible38;
                    Editable = FieldEditable38;
                    trigger OnValidate()
                    begin
                        OnValidateField(38, Rec."Text Value 39");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(38, Rec."Text Value 39");
                    end;
                }
                field("Text Value 40"; Rec."Text Value 40")
                {
                    ToolTip = 'Specifies the value of the Value 40 field';
                    ApplicationArea = All;
                    Visible = FieldVisible39;
                    Editable = FieldEditable39;
                    trigger OnValidate()
                    begin
                        OnValidateField(39, Rec."Text Value 40");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(39, Rec."Text Value 40");
                    end;
                }
                field("Text Value 41"; Rec."Text Value 41")
                {
                    ToolTip = 'Specifies the value of the Value 41 field';
                    ApplicationArea = All;
                    Visible = FieldVisible40;
                    Editable = FieldEditable40;
                    trigger OnValidate()
                    begin
                        OnValidateField(40, Rec."Text Value 41");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(40, Rec."Text Value 41");
                    end;
                }
                field("Text Value 42"; Rec."Text Value 42")
                {
                    ToolTip = 'Specifies the value of the Value 42 field';
                    ApplicationArea = All;
                    Visible = FieldVisible41;
                    Editable = FieldEditable41;
                    trigger OnValidate()
                    begin
                        OnValidateField(41, Rec."Text Value 42");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(41, Rec."Text Value 42");
                    end;
                }
                field("Text Value 43"; Rec."Text Value 43")
                {
                    ToolTip = 'Specifies the value of the Value 43 field';
                    ApplicationArea = All;
                    Visible = FieldVisible42;
                    Editable = FieldEditable42;
                    trigger OnValidate()
                    begin
                        OnValidateField(42, Rec."Text Value 43");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(42, Rec."Text Value 43");
                    end;
                }
                field("Text Value 44"; Rec."Text Value 44")
                {
                    ToolTip = 'Specifies the value of the Value 44 field';
                    ApplicationArea = All;
                    Visible = FieldVisible43;
                    Editable = FieldEditable43;
                    trigger OnValidate()
                    begin
                        OnValidateField(43, Rec."Text Value 44");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(43, Rec."Text Value 44");
                    end;
                }
                field("Text Value 45"; Rec."Text Value 45")
                {
                    ToolTip = 'Specifies the value of the Value 45 field';
                    ApplicationArea = All;
                    Visible = FieldVisible44;
                    Editable = FieldEditable44;
                    trigger OnValidate()
                    begin
                        OnValidateField(44, Rec."Text Value 45");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(44, Rec."Text Value 45");
                    end;
                }
                field("Text Value 46"; Rec."Text Value 46")
                {
                    ToolTip = 'Specifies the value of the Value 46 field';
                    ApplicationArea = All;
                    Visible = FieldVisible45;
                    Editable = FieldEditable45;
                    trigger OnValidate()
                    begin
                        OnValidateField(45, Rec."Text Value 46");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(45, Rec."Text Value 46");
                    end;
                }
                field("Text Value 47"; Rec."Text Value 47")
                {
                    ToolTip = 'Specifies the value of the Value 47 field';
                    ApplicationArea = All;
                    Visible = FieldVisible46;
                    Editable = FieldEditable46;
                    trigger OnValidate()
                    begin
                        OnValidateField(46, Rec."Text Value 47");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(46, Rec."Text Value 47");
                    end;
                }
                field("Text Value 48"; Rec."Text Value 48")
                {
                    ToolTip = 'Specifies the value of the Value 48 field';
                    ApplicationArea = All;
                    Visible = FieldVisible47;
                    Editable = FieldEditable47;
                    trigger OnValidate()
                    begin
                        OnValidateField(47, Rec."Text Value 48");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(47, Rec."Text Value 48");
                    end;
                }
                field("Text Value 49"; Rec."Text Value 49")
                {
                    ToolTip = 'Specifies the value of the Value 49 field';
                    ApplicationArea = All;
                    Visible = FieldVisible48;
                    Editable = FieldEditable48;
                    trigger OnValidate()
                    begin
                        OnValidateField(48, Rec."Text Value 49");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(48, Rec."Text Value 49");
                    end;
                }
                field("Text Value 50"; Rec."Text Value 50")
                {
                    ToolTip = 'Specifies the value of the Value 50 field';
                    ApplicationArea = All;
                    Visible = FieldVisible49;
                    Editable = FieldEditable49;
                    trigger OnValidate()
                    begin
                        OnValidateField(49, Rec."Text Value 50");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(49, Rec."Text Value 50");
                    end;
                }
                field("Text Value 51"; Rec."Text Value 51")
                {
                    ToolTip = 'Specifies the value of the Value 51 field';
                    ApplicationArea = All;
                    Visible = FieldVisible50;
                    Editable = FieldEditable50;
                    trigger OnValidate()
                    begin
                        OnValidateField(50, Rec."Text Value 51");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(50, Rec."Text Value 51");
                    end;
                }
                field("Text Value 52"; Rec."Text Value 52")
                {
                    ToolTip = 'Specifies the value of the Value 52 field';
                    ApplicationArea = All;
                    Visible = FieldVisible51;
                    Editable = FieldEditable51;
                    trigger OnValidate()
                    begin
                        OnValidateField(51, Rec."Text Value 52");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(51, Rec."Text Value 52");
                    end;
                }
                field("Text Value 53"; Rec."Text Value 53")
                {
                    ToolTip = 'Specifies the value of the Value 53 field';
                    ApplicationArea = All;
                    Visible = FieldVisible52;
                    Editable = FieldEditable52;
                    trigger OnValidate()
                    begin
                        OnValidateField(52, Rec."Text Value 53");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(52, Rec."Text Value 53");
                    end;
                }
                field("Text Value 54"; Rec."Text Value 54")
                {
                    ToolTip = 'Specifies the value of the Value 54 field';
                    ApplicationArea = All;
                    Visible = FieldVisible53;
                    Editable = FieldEditable53;
                    trigger OnValidate()
                    begin
                        OnValidateField(53, Rec."Text Value 54");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(53, Rec."Text Value 54");
                    end;
                }
                field("Text Value 55"; Rec."Text Value 55")
                {
                    ToolTip = 'Specifies the value of the Value 55 field';
                    ApplicationArea = All;
                    Visible = FieldVisible54;
                    Editable = FieldEditable54;
                    trigger OnValidate()
                    begin
                        OnValidateField(54, Rec."Text Value 55");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(54, Rec."Text Value 55");
                    end;
                }
                field("Text Value 56"; Rec."Text Value 56")
                {
                    ToolTip = 'Specifies the value of the Value 56 field';
                    ApplicationArea = All;
                    Visible = FieldVisible55;
                    Editable = FieldEditable55;
                    trigger OnValidate()
                    begin
                        OnValidateField(55, Rec."Text Value 56");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(55, Rec."Text Value 56");
                    end;
                }
                field("Text Value 57"; Rec."Text Value 57")
                {
                    ToolTip = 'Specifies the value of the Value 57 field';
                    ApplicationArea = All;
                    Visible = FieldVisible56;
                    Editable = FieldEditable56;
                    trigger OnValidate()
                    begin
                        OnValidateField(56, Rec."Text Value 57");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(56, Rec."Text Value 57");
                    end;
                }
                field("Text Value 58"; Rec."Text Value 58")
                {
                    ToolTip = 'Specifies the value of the Value 58 field';
                    ApplicationArea = All;
                    Visible = FieldVisible57;
                    Editable = FieldEditable57;
                    trigger OnValidate()
                    begin
                        OnValidateField(57, Rec."Text Value 58");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(57, Rec."Text Value 58");
                    end;
                }
                field("Text Value 59"; Rec."Text Value 59")
                {
                    ToolTip = 'Specifies the value of the Value 59 field';
                    ApplicationArea = All;
                    Visible = FieldVisible58;
                    Editable = FieldEditable58;
                    trigger OnValidate()
                    begin
                        OnValidateField(58, Rec."Text Value 59");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(58, Rec."Text Value 59");
                    end;
                }
                field("Text Value 60"; Rec."Text Value 60")
                {
                    ToolTip = 'Specifies the value of the Value 60 field';
                    ApplicationArea = All;
                    Visible = FieldVisible59;
                    Editable = FieldEditable59;
                    trigger OnValidate()
                    begin
                        OnValidateField(59, Rec."Text Value 60");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(59, Rec."Text Value 60");
                    end;
                }
                field("Text Value 61"; Rec."Text Value 61")
                {
                    ToolTip = 'Specifies the value of the Value 61 field';
                    ApplicationArea = All;
                    Visible = FieldVisible60;
                    Editable = FieldEditable60;
                    trigger OnValidate()
                    begin
                        OnValidateField(60, Rec."Text Value 61");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(60, Rec."Text Value 61");
                    end;
                }
                field("Text Value 62"; Rec."Text Value 62")
                {
                    ToolTip = 'Specifies the value of the Value 62 field';
                    ApplicationArea = All;
                    Visible = FieldVisible61;
                    Editable = FieldEditable61;
                    trigger OnValidate()
                    begin
                        OnValidateField(61, Rec."Text Value 62");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(61, Rec."Text Value 62");
                    end;
                }
                field("Text Value 63"; Rec."Text Value 63")
                {
                    ToolTip = 'Specifies the value of the Value 63 field';
                    ApplicationArea = All;
                    Visible = FieldVisible62;
                    Editable = FieldEditable62;
                    trigger OnValidate()
                    begin
                        OnValidateField(62, Rec."Text Value 63");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(62, Rec."Text Value 63");
                    end;
                }
                field("Text Value 64"; Rec."Text Value 64")
                {
                    ToolTip = 'Specifies the value of the Value 64 field';
                    ApplicationArea = All;
                    Visible = FieldVisible63;
                    Editable = FieldEditable63;
                    trigger OnValidate()
                    begin
                        OnValidateField(63, Rec."Text Value 64");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(63, Rec."Text Value 64");
                    end;
                }
                field("Text Value 65"; Rec."Text Value 65")
                {
                    ToolTip = 'Specifies the value of the Value 65 field';
                    ApplicationArea = All;
                    Visible = FieldVisible64;
                    Editable = FieldEditable64;
                    trigger OnValidate()
                    begin
                        OnValidateField(64, Rec."Text Value 65");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(64, Rec."Text Value 65");
                    end;
                }
                field("Text Value 66"; Rec."Text Value 66")
                {
                    ToolTip = 'Specifies the value of the Value 66 field';
                    ApplicationArea = All;
                    Visible = FieldVisible65;
                    Editable = FieldEditable65;
                    trigger OnValidate()
                    begin
                        OnValidateField(65, Rec."Text Value 66");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(65, Rec."Text Value 66");
                    end;
                }
                field("Text Value 67"; Rec."Text Value 67")
                {
                    ToolTip = 'Specifies the value of the Value 67 field';
                    ApplicationArea = All;
                    Visible = FieldVisible66;
                    Editable = FieldEditable66;
                    trigger OnValidate()
                    begin
                        OnValidateField(66, Rec."Text Value 67");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(66, Rec."Text Value 67");
                    end;
                }
                field("Text Value 68"; Rec."Text Value 68")
                {
                    ToolTip = 'Specifies the value of the Value 68 field';
                    ApplicationArea = All;
                    Visible = FieldVisible67;
                    Editable = FieldEditable67;
                    trigger OnValidate()
                    begin
                        OnValidateField(67, Rec."Text Value 68");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(67, Rec."Text Value 68");
                    end;
                }
                field("Text Value 69"; Rec."Text Value 69")
                {
                    ToolTip = 'Specifies the value of the Value 69 field';
                    ApplicationArea = All;
                    Visible = FieldVisible68;
                    Editable = FieldEditable68;
                    trigger OnValidate()
                    begin
                        OnValidateField(68, Rec."Text Value 69");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(68, Rec."Text Value 69");
                    end;
                }
                field("Text Value 70"; Rec."Text Value 70")
                {
                    ToolTip = 'Specifies the value of the Value 70 field';
                    ApplicationArea = All;
                    Visible = FieldVisible69;
                    Editable = FieldEditable69;
                    trigger OnValidate()
                    begin
                        OnValidateField(69, Rec."Text Value 70");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(69, Rec."Text Value 70");
                    end;
                }
                field("Text Value 71"; Rec."Text Value 71")
                {
                    ToolTip = 'Specifies the value of the Value 71 field';
                    ApplicationArea = All;
                    Visible = FieldVisible70;
                    Editable = FieldEditable70;
                    trigger OnValidate()
                    begin
                        OnValidateField(70, Rec."Text Value 71");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(70, Rec."Text Value 71");
                    end;
                }
                field("Text Value 72"; Rec."Text Value 72")
                {
                    ToolTip = 'Specifies the value of the Value 72 field';
                    ApplicationArea = All;
                    Visible = FieldVisible71;
                    Editable = FieldEditable71;
                    trigger OnValidate()
                    begin
                        OnValidateField(71, Rec."Text Value 72");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(71, Rec."Text Value 72");
                    end;
                }
                field("Text Value 73"; Rec."Text Value 73")
                {
                    ToolTip = 'Specifies the value of the Value 73 field';
                    ApplicationArea = All;
                    Visible = FieldVisible72;
                    Editable = FieldEditable72;
                    trigger OnValidate()
                    begin
                        OnValidateField(72, Rec."Text Value 73");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(72, Rec."Text Value 73");
                    end;
                }
                field("Text Value 74"; Rec."Text Value 74")
                {
                    ToolTip = 'Specifies the value of the Value 74 field';
                    ApplicationArea = All;
                    Visible = FieldVisible73;
                    Editable = FieldEditable73;
                    trigger OnValidate()
                    begin
                        OnValidateField(73, Rec."Text Value 74");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(73, Rec."Text Value 74");
                    end;
                }
                field("Text Value 75"; Rec."Text Value 75")
                {
                    ToolTip = 'Specifies the value of the Value 75 field';
                    ApplicationArea = All;
                    Visible = FieldVisible74;
                    Editable = FieldEditable74;
                    trigger OnValidate()
                    begin
                        OnValidateField(74, Rec."Text Value 75");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(74, Rec."Text Value 75");
                    end;
                }
                field("Text Value 76"; Rec."Text Value 76")
                {
                    ToolTip = 'Specifies the value of the Value 76 field';
                    ApplicationArea = All;
                    Visible = FieldVisible75;
                    Editable = FieldEditable75;
                    trigger OnValidate()
                    begin
                        OnValidateField(75, Rec."Text Value 76");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(75, Rec."Text Value 76");
                    end;
                }
                field("Text Value 77"; Rec."Text Value 77")
                {
                    ToolTip = 'Specifies the value of the Value 77 field';
                    ApplicationArea = All;
                    Visible = FieldVisible76;
                    Editable = FieldEditable76;
                    trigger OnValidate()
                    begin
                        OnValidateField(76, Rec."Text Value 77");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(76, Rec."Text Value 77");
                    end;
                }
                field("Text Value 78"; Rec."Text Value 78")
                {
                    ToolTip = 'Specifies the value of the Value 78 field';
                    ApplicationArea = All;
                    Visible = FieldVisible77;
                    Editable = FieldEditable77;
                    trigger OnValidate()
                    begin
                        OnValidateField(77, Rec."Text Value 78");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(77, Rec."Text Value 78");
                    end;
                }
                field("Text Value 79"; Rec."Text Value 79")
                {
                    ToolTip = 'Specifies the value of the Value 79 field';
                    ApplicationArea = All;
                    Visible = FieldVisible78;
                    Editable = FieldEditable78;
                    trigger OnValidate()
                    begin
                        OnValidateField(78, Rec."Text Value 79");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(78, Rec."Text Value 79");
                    end;
                }
                field("Text Value 80"; Rec."Text Value 80")
                {
                    ToolTip = 'Specifies the value of the Value 80 field';
                    ApplicationArea = All;
                    Visible = FieldVisible79;
                    Editable = FieldEditable79;
                    trigger OnValidate()
                    begin
                        OnValidateField(79, Rec."Text Value 80");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(79, Rec."Text Value 80");
                    end;
                }
                field("Text Value 81"; Rec."Text Value 81")
                {
                    ToolTip = 'Specifies the value of the Value 81 field';
                    ApplicationArea = All;
                    Visible = FieldVisible80;
                    Editable = FieldEditable80;
                    trigger OnValidate()
                    begin
                        OnValidateField(80, Rec."Text Value 81");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(80, Rec."Text Value 81");
                    end;
                }
                field("Text Value 82"; Rec."Text Value 82")
                {
                    ToolTip = 'Specifies the value of the Value 82 field';
                    ApplicationArea = All;
                    Visible = FieldVisible81;
                    Editable = FieldEditable81;
                    trigger OnValidate()
                    begin
                        OnValidateField(81, Rec."Text Value 82");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(81, Rec."Text Value 82");
                    end;
                }
                field("Text Value 83"; Rec."Text Value 83")
                {
                    ToolTip = 'Specifies the value of the Value 83 field';
                    ApplicationArea = All;
                    Visible = FieldVisible82;
                    Editable = FieldEditable82;
                    trigger OnValidate()
                    begin
                        OnValidateField(82, Rec."Text Value 83");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(82, Rec."Text Value 83");
                    end;
                }
                field("Text Value 84"; Rec."Text Value 84")
                {
                    ToolTip = 'Specifies the value of the Value 84 field';
                    ApplicationArea = All;
                    Visible = FieldVisible83;
                    Editable = FieldEditable83;
                    trigger OnValidate()
                    begin
                        OnValidateField(83, Rec."Text Value 84");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(83, Rec."Text Value 84");
                    end;
                }
                field("Text Value 85"; Rec."Text Value 85")
                {
                    ToolTip = 'Specifies the value of the Value 85 field';
                    ApplicationArea = All;
                    Visible = FieldVisible84;
                    Editable = FieldEditable84;
                    trigger OnValidate()
                    begin
                        OnValidateField(84, Rec."Text Value 85");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(84, Rec."Text Value 85");
                    end;
                }
                field("Text Value 86"; Rec."Text Value 86")
                {
                    ToolTip = 'Specifies the value of the Value 86 field';
                    ApplicationArea = All;
                    Visible = FieldVisible85;
                    Editable = FieldEditable85;
                    trigger OnValidate()
                    begin
                        OnValidateField(85, Rec."Text Value 86");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(85, Rec."Text Value 86");
                    end;
                }
                field("Text Value 87"; Rec."Text Value 87")
                {
                    ToolTip = 'Specifies the value of the Value 87 field';
                    ApplicationArea = All;
                    Visible = FieldVisible86;
                    Editable = FieldEditable86;
                    trigger OnValidate()
                    begin
                        OnValidateField(86, Rec."Text Value 87");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(86, Rec."Text Value 87");
                    end;
                }
                field("Text Value 88"; Rec."Text Value 88")
                {
                    ToolTip = 'Specifies the value of the Value 88 field';
                    ApplicationArea = All;
                    Visible = FieldVisible87;
                    Editable = FieldEditable87;
                    trigger OnValidate()
                    begin
                        OnValidateField(87, Rec."Text Value 88");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(87, Rec."Text Value 88");
                    end;
                }
                field("Text Value 89"; Rec."Text Value 89")
                {
                    ToolTip = 'Specifies the value of the Value 89 field';
                    ApplicationArea = All;
                    Visible = FieldVisible88;
                    Editable = FieldEditable88;
                    trigger OnValidate()
                    begin
                        OnValidateField(88, Rec."Text Value 89");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(88, Rec."Text Value 89");
                    end;
                }
                field("Text Value 90"; Rec."Text Value 90")
                {
                    ToolTip = 'Specifies the value of the Value 90 field';
                    ApplicationArea = All;
                    Visible = FieldVisible89;
                    Editable = FieldEditable89;
                    trigger OnValidate()
                    begin
                        OnValidateField(89, Rec."Text Value 90");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(89, Rec."Text Value 90");
                    end;
                }
                field("Text Value 91"; Rec."Text Value 91")
                {
                    ToolTip = 'Specifies the value of the Value 91 field';
                    ApplicationArea = All;
                    Visible = FieldVisible90;
                    Editable = FieldEditable90;
                    trigger OnValidate()
                    begin
                        OnValidateField(90, Rec."Text Value 91");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(90, Rec."Text Value 91");
                    end;
                }
                field("Text Value 92"; Rec."Text Value 92")
                {
                    ToolTip = 'Specifies the value of the Value 92 field';
                    ApplicationArea = All;
                    Visible = FieldVisible91;
                    Editable = FieldEditable91;
                    trigger OnValidate()
                    begin
                        OnValidateField(91, Rec."Text Value 92");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(91, Rec."Text Value 92");
                    end;
                }
                field("Text Value 93"; Rec."Text Value 93")
                {
                    ToolTip = 'Specifies the value of the Value 93 field';
                    ApplicationArea = All;
                    Visible = FieldVisible92;
                    Editable = FieldEditable92;
                    trigger OnValidate()
                    begin
                        OnValidateField(92, Rec."Text Value 93");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(92, Rec."Text Value 93");
                    end;
                }
                field("Text Value 94"; Rec."Text Value 94")
                {
                    ToolTip = 'Specifies the value of the Value 94 field';
                    ApplicationArea = All;
                    Visible = FieldVisible93;
                    Editable = FieldEditable93;
                    trigger OnValidate()
                    begin
                        OnValidateField(93, Rec."Text Value 94");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(93, Rec."Text Value 94");
                    end;
                }
                field("Text Value 95"; Rec."Text Value 95")
                {
                    ToolTip = 'Specifies the value of the Value 95 field';
                    ApplicationArea = All;
                    Visible = FieldVisible94;
                    Editable = FieldEditable94;
                    trigger OnValidate()
                    begin
                        OnValidateField(94, Rec."Text Value 95");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(94, Rec."Text Value 95");
                    end;
                }
                field("Text Value 96"; Rec."Text Value 96")
                {
                    ToolTip = 'Specifies the value of the Value 96 field';
                    ApplicationArea = All;
                    Visible = FieldVisible95;
                    Editable = FieldEditable95;
                    trigger OnValidate()
                    begin
                        OnValidateField(95, Rec."Text Value 96");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(95, Rec."Text Value 96");
                    end;
                }
                field("Text Value 97"; Rec."Text Value 97")
                {
                    ToolTip = 'Specifies the value of the Value 97 field';
                    ApplicationArea = All;
                    Visible = FieldVisible96;
                    Editable = FieldEditable96;
                    trigger OnValidate()
                    begin
                        OnValidateField(96, Rec."Text Value 97");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(96, Rec."Text Value 97");
                    end;
                }
                field("Text Value 98"; Rec."Text Value 98")
                {
                    ToolTip = 'Specifies the value of the Value 98 field';
                    ApplicationArea = All;
                    Visible = FieldVisible97;
                    Editable = FieldEditable97;
                    trigger OnValidate()
                    begin
                        OnValidateField(97, Rec."Text Value 98");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(97, Rec."Text Value 98");
                    end;
                }
                field("Text Value 99"; Rec."Text Value 99")
                {
                    ToolTip = 'Specifies the value of the Value 99 field';
                    ApplicationArea = All;
                    Visible = FieldVisible98;
                    Editable = FieldEditable98;
                    trigger OnValidate()
                    begin
                        OnValidateField(98, Rec."Text Value 99");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(98, Rec."Text Value 99");
                    end;
                }
                field("Text Value 100"; Rec."Text Value 100")
                {
                    ToolTip = 'Specifies the value of the Value 100 field';
                    ApplicationArea = All;
                    Visible = FieldVisible99;
                    Editable = FieldEditable99;
                    trigger OnValidate()
                    begin
                        OnValidateField(99, Rec."Text Value 100");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(99, Rec."Text Value 100");
                    end;
                }
                field("Text Value 101"; Rec."Text Value 101")
                {
                    ToolTip = 'Specifies the value of the Value 101 field';
                    ApplicationArea = All;
                    Visible = FieldVisible100;
                    Editable = FieldEditable100;
                    trigger OnValidate()
                    begin
                        OnValidateField(100, Rec."Text Value 101");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(100, Rec."Text Value 101");
                    end;
                }
                field("Text Value 102"; Rec."Text Value 102")
                {
                    ToolTip = 'Specifies the value of the Value 102 field';
                    ApplicationArea = All;
                    Visible = FieldVisible101;
                    Editable = FieldEditable101;
                    trigger OnValidate()
                    begin
                        OnValidateField(101, Rec."Text Value 102");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(101, Rec."Text Value 102");
                    end;
                }
                field("Text Value 103"; Rec."Text Value 103")
                {
                    ToolTip = 'Specifies the value of the Value 103 field';
                    ApplicationArea = All;
                    Visible = FieldVisible102;
                    Editable = FieldEditable102;
                    trigger OnValidate()
                    begin
                        OnValidateField(102, Rec."Text Value 103");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(102, Rec."Text Value 103");
                    end;
                }
                field("Text Value 104"; Rec."Text Value 104")
                {
                    ToolTip = 'Specifies the value of the Value 104 field';
                    ApplicationArea = All;
                    Visible = FieldVisible103;
                    Editable = FieldEditable103;
                    trigger OnValidate()
                    begin
                        OnValidateField(103, Rec."Text Value 104");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(103, Rec."Text Value 104");
                    end;
                }
                field("Text Value 105"; Rec."Text Value 105")
                {
                    ToolTip = 'Specifies the value of the Value 105 field';
                    ApplicationArea = All;
                    Visible = FieldVisible104;
                    Editable = FieldEditable104;
                    trigger OnValidate()
                    begin
                        OnValidateField(104, Rec."Text Value 105");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(104, Rec."Text Value 105");
                    end;
                }
                field("Text Value 106"; Rec."Text Value 106")
                {
                    ToolTip = 'Specifies the value of the Value 106 field';
                    ApplicationArea = All;
                    Visible = FieldVisible105;
                    Editable = FieldEditable105;
                    trigger OnValidate()
                    begin
                        OnValidateField(105, Rec."Text Value 106");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(105, Rec."Text Value 106");
                    end;
                }
                field("Text Value 107"; Rec."Text Value 107")
                {
                    ToolTip = 'Specifies the value of the Value 107 field';
                    ApplicationArea = All;
                    Visible = FieldVisible106;
                    Editable = FieldEditable106;
                    trigger OnValidate()
                    begin
                        OnValidateField(106, Rec."Text Value 107");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(106, Rec."Text Value 107");
                    end;
                }
                field("Text Value 108"; Rec."Text Value 108")
                {
                    ToolTip = 'Specifies the value of the Value 108 field';
                    ApplicationArea = All;
                    Visible = FieldVisible107;
                    Editable = FieldEditable107;
                    trigger OnValidate()
                    begin
                        OnValidateField(107, Rec."Text Value 108");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(107, Rec."Text Value 108");
                    end;
                }
                field("Text Value 109"; Rec."Text Value 109")
                {
                    ToolTip = 'Specifies the value of the Value 109 field';
                    ApplicationArea = All;
                    Visible = FieldVisible108;
                    Editable = FieldEditable108;
                    trigger OnValidate()
                    begin
                        OnValidateField(108, Rec."Text Value 109");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(108, Rec."Text Value 109");
                    end;
                }
                field("Text Value 110"; Rec."Text Value 110")
                {
                    ToolTip = 'Specifies the value of the Value 110 field';
                    ApplicationArea = All;
                    Visible = FieldVisible109;
                    Editable = FieldEditable109;
                    trigger OnValidate()
                    begin
                        OnValidateField(109, Rec."Text Value 110");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(109, Rec."Text Value 110");
                    end;
                }
                field("Text Value 111"; Rec."Text Value 111")
                {
                    ToolTip = 'Specifies the value of the Value 111 field';
                    ApplicationArea = All;
                    Visible = FieldVisible110;
                    Editable = FieldEditable110;
                    trigger OnValidate()
                    begin
                        OnValidateField(110, Rec."Text Value 111");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(110, Rec."Text Value 111");
                    end;
                }
                field("Text Value 112"; Rec."Text Value 112")
                {
                    ToolTip = 'Specifies the value of the Value 112 field';
                    ApplicationArea = All;
                    Visible = FieldVisible111;
                    Editable = FieldEditable111;
                    trigger OnValidate()
                    begin
                        OnValidateField(111, Rec."Text Value 112");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(111, Rec."Text Value 112");
                    end;
                }
                field("Text Value 113"; Rec."Text Value 113")
                {
                    ToolTip = 'Specifies the value of the Value 113 field';
                    ApplicationArea = All;
                    Visible = FieldVisible112;
                    Editable = FieldEditable112;
                    trigger OnValidate()
                    begin
                        OnValidateField(112, Rec."Text Value 113");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(112, Rec."Text Value 113");
                    end;
                }
                field("Text Value 114"; Rec."Text Value 114")
                {
                    ToolTip = 'Specifies the value of the Value 114 field';
                    ApplicationArea = All;
                    Visible = FieldVisible113;
                    Editable = FieldEditable113;
                    trigger OnValidate()
                    begin
                        OnValidateField(113, Rec."Text Value 114");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(113, Rec."Text Value 114");
                    end;
                }
                field("Text Value 115"; Rec."Text Value 115")
                {
                    ToolTip = 'Specifies the value of the Value 115 field';
                    ApplicationArea = All;
                    Visible = FieldVisible114;
                    Editable = FieldEditable114;
                    trigger OnValidate()
                    begin
                        OnValidateField(114, Rec."Text Value 115");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(114, Rec."Text Value 115");
                    end;
                }
                field("Text Value 116"; Rec."Text Value 116")
                {
                    ToolTip = 'Specifies the value of the Value 116 field';
                    ApplicationArea = All;
                    Visible = FieldVisible115;
                    Editable = FieldEditable115;
                    trigger OnValidate()
                    begin
                        OnValidateField(115, Rec."Text Value 116");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(115, Rec."Text Value 116");
                    end;
                }
                field("Text Value 117"; Rec."Text Value 117")
                {
                    ToolTip = 'Specifies the value of the Value 117 field';
                    ApplicationArea = All;
                    Visible = FieldVisible116;
                    Editable = FieldEditable116;
                    trigger OnValidate()
                    begin
                        OnValidateField(116, Rec."Text Value 117");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(116, Rec."Text Value 117");
                    end;
                }
                field("Text Value 118"; Rec."Text Value 118")
                {
                    ToolTip = 'Specifies the value of the Value 118 field';
                    ApplicationArea = All;
                    Visible = FieldVisible117;
                    Editable = FieldEditable117;
                    trigger OnValidate()
                    begin
                        OnValidateField(117, Rec."Text Value 118");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(117, Rec."Text Value 118");
                    end;
                }
                field("Text Value 119"; Rec."Text Value 119")
                {
                    ToolTip = 'Specifies the value of the Value 119 field';
                    ApplicationArea = All;
                    Visible = FieldVisible118;
                    Editable = FieldEditable118;
                    trigger OnValidate()
                    begin
                        OnValidateField(118, Rec."Text Value 119");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(118, Rec."Text Value 119");
                    end;
                }
                field("Text Value 120"; Rec."Text Value 120")
                {
                    ToolTip = 'Specifies the value of the Value 120 field';
                    ApplicationArea = All;
                    Visible = FieldVisible119;
                    Editable = FieldEditable119;
                    trigger OnValidate()
                    begin
                        OnValidateField(119, Rec."Text Value 120");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(119, Rec."Text Value 120");
                    end;
                }
                field("Text Value 121"; Rec."Text Value 121")
                {
                    ToolTip = 'Specifies the value of the Value 121 field';
                    ApplicationArea = All;
                    Visible = FieldVisible120;
                    Editable = FieldEditable120;
                    trigger OnValidate()
                    begin
                        OnValidateField(120, Rec."Text Value 121");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(120, Rec."Text Value 121");
                    end;
                }
                field("Text Value 122"; Rec."Text Value 122")
                {
                    ToolTip = 'Specifies the value of the Value 122 field';
                    ApplicationArea = All;
                    Visible = FieldVisible121;
                    Editable = FieldEditable121;
                    trigger OnValidate()
                    begin
                        OnValidateField(121, Rec."Text Value 122");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(121, Rec."Text Value 122");
                    end;
                }
                field("Text Value 123"; Rec."Text Value 123")
                {
                    ToolTip = 'Specifies the value of the Value 123 field';
                    ApplicationArea = All;
                    Visible = FieldVisible122;
                    Editable = FieldEditable122;
                    trigger OnValidate()
                    begin
                        OnValidateField(122, Rec."Text Value 123");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(122, Rec."Text Value 123");
                    end;
                }
                field("Text Value 124"; Rec."Text Value 124")
                {
                    ToolTip = 'Specifies the value of the Value 124 field';
                    ApplicationArea = All;
                    Visible = FieldVisible123;
                    Editable = FieldEditable123;
                    trigger OnValidate()
                    begin
                        OnValidateField(123, Rec."Text Value 124");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(123, Rec."Text Value 124");
                    end;
                }
                field("Text Value 125"; Rec."Text Value 125")
                {
                    ToolTip = 'Specifies the value of the Value 125 field';
                    ApplicationArea = All;
                    Visible = FieldVisible124;
                    Editable = FieldEditable124;
                    trigger OnValidate()
                    begin
                        OnValidateField(124, Rec."Text Value 125");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(124, Rec."Text Value 125");
                    end;
                }
                field("Text Value 126"; Rec."Text Value 126")
                {
                    ToolTip = 'Specifies the value of the Value 126 field';
                    ApplicationArea = All;
                    Visible = FieldVisible125;
                    Editable = FieldEditable125;
                    trigger OnValidate()
                    begin
                        OnValidateField(125, Rec."Text Value 126");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(125, Rec."Text Value 126");
                    end;
                }
                field("Text Value 127"; Rec."Text Value 127")
                {
                    ToolTip = 'Specifies the value of the Value 127 field';
                    ApplicationArea = All;
                    Visible = FieldVisible126;
                    Editable = FieldEditable126;
                    trigger OnValidate()
                    begin
                        OnValidateField(126, Rec."Text Value 127");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(126, Rec."Text Value 127");
                    end;
                }
                field("Text Value 128"; Rec."Text Value 128")
                {
                    ToolTip = 'Specifies the value of the Value 128 field';
                    ApplicationArea = All;
                    Visible = FieldVisible127;
                    Editable = FieldEditable127;
                    trigger OnValidate()
                    begin
                        OnValidateField(127, Rec."Text Value 128");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(127, Rec."Text Value 128");
                    end;
                }
                field("Text Value 129"; Rec."Text Value 129")
                {
                    ToolTip = 'Specifies the value of the Value 129 field';
                    ApplicationArea = All;
                    Visible = FieldVisible128;
                    Editable = FieldEditable128;
                    trigger OnValidate()
                    begin
                        OnValidateField(128, Rec."Text Value 129");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(128, Rec."Text Value 129");
                    end;
                }
                field("Text Value 130"; Rec."Text Value 130")
                {
                    ToolTip = 'Specifies the value of the Value 130 field';
                    ApplicationArea = All;
                    Visible = FieldVisible129;
                    Editable = FieldEditable129;
                    trigger OnValidate()
                    begin
                        OnValidateField(129, Rec."Text Value 130");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(129, Rec."Text Value 130");
                    end;
                }
                field("Text Value 131"; Rec."Text Value 131")
                {
                    ToolTip = 'Specifies the value of the Value 131 field';
                    ApplicationArea = All;
                    Visible = FieldVisible130;
                    Editable = FieldEditable130;
                    trigger OnValidate()
                    begin
                        OnValidateField(130, Rec."Text Value 131");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(130, Rec."Text Value 131");
                    end;
                }
                field("Text Value 132"; Rec."Text Value 132")
                {
                    ToolTip = 'Specifies the value of the Value 132 field';
                    ApplicationArea = All;
                    Visible = FieldVisible131;
                    Editable = FieldEditable131;
                    trigger OnValidate()
                    begin
                        OnValidateField(131, Rec."Text Value 132");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(131, Rec."Text Value 132");
                    end;
                }
                field("Text Value 133"; Rec."Text Value 133")
                {
                    ToolTip = 'Specifies the value of the Value 133 field';
                    ApplicationArea = All;
                    Visible = FieldVisible132;
                    Editable = FieldEditable132;
                    trigger OnValidate()
                    begin
                        OnValidateField(132, Rec."Text Value 133");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(132, Rec."Text Value 133");
                    end;
                }
                field("Text Value 134"; Rec."Text Value 134")
                {
                    ToolTip = 'Specifies the value of the Value 134 field';
                    ApplicationArea = All;
                    Visible = FieldVisible133;
                    Editable = FieldEditable133;
                    trigger OnValidate()
                    begin
                        OnValidateField(133, Rec."Text Value 134");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(133, Rec."Text Value 134");
                    end;
                }
                field("Text Value 135"; Rec."Text Value 135")
                {
                    ToolTip = 'Specifies the value of the Value 135 field';
                    ApplicationArea = All;
                    Visible = FieldVisible134;
                    Editable = FieldEditable134;
                    trigger OnValidate()
                    begin
                        OnValidateField(134, Rec."Text Value 135");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(134, Rec."Text Value 135");
                    end;
                }
                field("Text Value 136"; Rec."Text Value 136")
                {
                    ToolTip = 'Specifies the value of the Value 136 field';
                    ApplicationArea = All;
                    Visible = FieldVisible135;
                    Editable = FieldEditable135;
                    trigger OnValidate()
                    begin
                        OnValidateField(135, Rec."Text Value 136");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(135, Rec."Text Value 136");
                    end;
                }
                field("Text Value 137"; Rec."Text Value 137")
                {
                    ToolTip = 'Specifies the value of the Value 137 field';
                    ApplicationArea = All;
                    Visible = FieldVisible136;
                    Editable = FieldEditable136;
                    trigger OnValidate()
                    begin
                        OnValidateField(136, Rec."Text Value 137");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(136, Rec."Text Value 137");
                    end;
                }
                field("Text Value 138"; Rec."Text Value 138")
                {
                    ToolTip = 'Specifies the value of the Value 138 field';
                    ApplicationArea = All;
                    Visible = FieldVisible137;
                    Editable = FieldEditable137;
                    trigger OnValidate()
                    begin
                        OnValidateField(137, Rec."Text Value 138");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(137, Rec."Text Value 138");
                    end;
                }
                field("Text Value 139"; Rec."Text Value 139")
                {
                    ToolTip = 'Specifies the value of the Value 139 field';
                    ApplicationArea = All;
                    Visible = FieldVisible138;
                    Editable = FieldEditable138;
                    trigger OnValidate()
                    begin
                        OnValidateField(138, Rec."Text Value 139");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(138, Rec."Text Value 139");
                    end;
                }
                field("Text Value 140"; Rec."Text Value 140")
                {
                    ToolTip = 'Specifies the value of the Value 140 field';
                    ApplicationArea = All;
                    Visible = FieldVisible139;
                    Editable = FieldEditable139;
                    trigger OnValidate()
                    begin
                        OnValidateField(139, Rec."Text Value 140");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(139, Rec."Text Value 140");
                    end;
                }
                field("Text Value 141"; Rec."Text Value 141")
                {
                    ToolTip = 'Specifies the value of the Value 141 field';
                    ApplicationArea = All;
                    Visible = FieldVisible140;
                    Editable = FieldEditable140;
                    trigger OnValidate()
                    begin
                        OnValidateField(140, Rec."Text Value 141");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(140, Rec."Text Value 141");
                    end;
                }
                field("Text Value 142"; Rec."Text Value 142")
                {
                    ToolTip = 'Specifies the value of the Value 142 field';
                    ApplicationArea = All;
                    Visible = FieldVisible141;
                    Editable = FieldEditable141;
                    trigger OnValidate()
                    begin
                        OnValidateField(141, Rec."Text Value 142");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(141, Rec."Text Value 142");
                    end;
                }
                field("Text Value 143"; Rec."Text Value 143")
                {
                    ToolTip = 'Specifies the value of the Value 143 field';
                    ApplicationArea = All;
                    Visible = FieldVisible142;
                    Editable = FieldEditable142;
                    trigger OnValidate()
                    begin
                        OnValidateField(142, Rec."Text Value 143");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(142, Rec."Text Value 143");
                    end;
                }
                field("Text Value 144"; Rec."Text Value 144")
                {
                    ToolTip = 'Specifies the value of the Value 144 field';
                    ApplicationArea = All;
                    Visible = FieldVisible143;
                    Editable = FieldEditable143;
                    trigger OnValidate()
                    begin
                        OnValidateField(143, Rec."Text Value 144");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(143, Rec."Text Value 144");
                    end;
                }
                field("Text Value 145"; Rec."Text Value 145")
                {
                    ToolTip = 'Specifies the value of the Value 145 field';
                    ApplicationArea = All;
                    Visible = FieldVisible144;
                    Editable = FieldEditable144;
                    trigger OnValidate()
                    begin
                        OnValidateField(144, Rec."Text Value 145");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(144, Rec."Text Value 145");
                    end;
                }
                field("Text Value 146"; Rec."Text Value 146")
                {
                    ToolTip = 'Specifies the value of the Value 146 field';
                    ApplicationArea = All;
                    Visible = FieldVisible145;
                    Editable = FieldEditable145;
                    trigger OnValidate()
                    begin
                        OnValidateField(145, Rec."Text Value 146");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(145, Rec."Text Value 146");
                    end;
                }
                field("Text Value 147"; Rec."Text Value 147")
                {
                    ToolTip = 'Specifies the value of the Value 147 field';
                    ApplicationArea = All;
                    Visible = FieldVisible146;
                    Editable = FieldEditable146;
                    trigger OnValidate()
                    begin
                        OnValidateField(146, Rec."Text Value 147");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(146, Rec."Text Value 147");
                    end;
                }
                field("Text Value 148"; Rec."Text Value 148")
                {
                    ToolTip = 'Specifies the value of the Value 148 field';
                    ApplicationArea = All;
                    Visible = FieldVisible147;
                    Editable = FieldEditable147;
                    trigger OnValidate()
                    begin
                        OnValidateField(147, Rec."Text Value 148");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(147, Rec."Text Value 148");
                    end;
                }
                field("Text Value 149"; Rec."Text Value 149")
                {
                    ToolTip = 'Specifies the value of the Value 149 field';
                    ApplicationArea = All;
                    Visible = FieldVisible148;
                    Editable = FieldEditable148;
                    trigger OnValidate()
                    begin
                        OnValidateField(148, Rec."Text Value 149");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(148, Rec."Text Value 149");
                    end;
                }
                field("Text Value 150"; Rec."Text Value 150")
                {
                    ToolTip = 'Specifies the value of the Value 150 field';
                    ApplicationArea = All;
                    Visible = FieldVisible149;
                    Editable = FieldEditable149;
                    trigger OnValidate()
                    begin
                        OnValidateField(149, Rec."Text Value 150");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(149, Rec."Text Value 150");
                    end;
                }
                field("Text Value 151"; Rec."Text Value 151")
                {
                    ToolTip = 'Specifies the value of the Value 151 field';
                    ApplicationArea = All;
                    Visible = FieldVisible150;
                    Editable = FieldEditable150;
                    trigger OnValidate()
                    begin
                        OnValidateField(150, Rec."Text Value 151");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(150, Rec."Text Value 151");
                    end;
                }
                field("Text Value 152"; Rec."Text Value 152")
                {
                    ToolTip = 'Specifies the value of the Value 152 field';
                    ApplicationArea = All;
                    Visible = FieldVisible151;
                    Editable = FieldEditable151;
                    trigger OnValidate()
                    begin
                        OnValidateField(151, Rec."Text Value 152");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(151, Rec."Text Value 152");
                    end;
                }
                field("Text Value 153"; Rec."Text Value 153")
                {
                    ToolTip = 'Specifies the value of the Value 153 field';
                    ApplicationArea = All;
                    Visible = FieldVisible152;
                    Editable = FieldEditable152;
                    trigger OnValidate()
                    begin
                        OnValidateField(152, Rec."Text Value 153");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(152, Rec."Text Value 153");
                    end;
                }
                field("Text Value 154"; Rec."Text Value 154")
                {
                    ToolTip = 'Specifies the value of the Value 154 field';
                    ApplicationArea = All;
                    Visible = FieldVisible153;
                    Editable = FieldEditable153;
                    trigger OnValidate()
                    begin
                        OnValidateField(153, Rec."Text Value 154");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(153, Rec."Text Value 154");
                    end;
                }
                field("Text Value 155"; Rec."Text Value 155")
                {
                    ToolTip = 'Specifies the value of the Value 155 field';
                    ApplicationArea = All;
                    Visible = FieldVisible154;
                    Editable = FieldEditable154;
                    trigger OnValidate()
                    begin
                        OnValidateField(154, Rec."Text Value 155");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(154, Rec."Text Value 155");
                    end;
                }
                field("Text Value 156"; Rec."Text Value 156")
                {
                    ToolTip = 'Specifies the value of the Value 156 field';
                    ApplicationArea = All;
                    Visible = FieldVisible155;
                    Editable = FieldEditable155;
                    trigger OnValidate()
                    begin
                        OnValidateField(155, Rec."Text Value 156");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(155, Rec."Text Value 156");
                    end;
                }
                field("Text Value 157"; Rec."Text Value 157")
                {
                    ToolTip = 'Specifies the value of the Value 157 field';
                    ApplicationArea = All;
                    Visible = FieldVisible156;
                    Editable = FieldEditable156;
                    trigger OnValidate()
                    begin
                        OnValidateField(156, Rec."Text Value 157");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(156, Rec."Text Value 157");
                    end;
                }
                field("Text Value 158"; Rec."Text Value 158")
                {
                    ToolTip = 'Specifies the value of the Value 158 field';
                    ApplicationArea = All;
                    Visible = FieldVisible157;
                    Editable = FieldEditable157;
                    trigger OnValidate()
                    begin
                        OnValidateField(157, Rec."Text Value 158");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(157, Rec."Text Value 158");
                    end;
                }
                field("Text Value 159"; Rec."Text Value 159")
                {
                    ToolTip = 'Specifies the value of the Value 159 field';
                    ApplicationArea = All;
                    Visible = FieldVisible158;
                    Editable = FieldEditable158;
                    trigger OnValidate()
                    begin
                        OnValidateField(158, Rec."Text Value 159");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(158, Rec."Text Value 159");
                    end;
                }
                field("Text Value 160"; Rec."Text Value 160")
                {
                    ToolTip = 'Specifies the value of the Value 160 field';
                    ApplicationArea = All;
                    Visible = FieldVisible159;
                    Editable = FieldEditable159;
                    trigger OnValidate()
                    begin
                        OnValidateField(159, Rec."Text Value 160");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(159, Rec."Text Value 160");
                    end;
                }
                field("Text Value 161"; Rec."Text Value 161")
                {
                    ToolTip = 'Specifies the value of the Value 161 field';
                    ApplicationArea = All;
                    Visible = FieldVisible160;
                    Editable = FieldEditable160;
                    trigger OnValidate()
                    begin
                        OnValidateField(160, Rec."Text Value 161");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(160, Rec."Text Value 161");
                    end;
                }
                field("Text Value 162"; Rec."Text Value 162")
                {
                    ToolTip = 'Specifies the value of the Value 162 field';
                    ApplicationArea = All;
                    Visible = FieldVisible161;
                    Editable = FieldEditable161;
                    trigger OnValidate()
                    begin
                        OnValidateField(161, Rec."Text Value 162");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(161, Rec."Text Value 162");
                    end;
                }
                field("Text Value 163"; Rec."Text Value 163")
                {
                    ToolTip = 'Specifies the value of the Value 163 field';
                    ApplicationArea = All;
                    Visible = FieldVisible162;
                    Editable = FieldEditable162;
                    trigger OnValidate()
                    begin
                        OnValidateField(162, Rec."Text Value 163");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(162, Rec."Text Value 163");
                    end;
                }
                field("Text Value 164"; Rec."Text Value 164")
                {
                    ToolTip = 'Specifies the value of the Value 164 field';
                    ApplicationArea = All;
                    Visible = FieldVisible163;
                    Editable = FieldEditable163;
                    trigger OnValidate()
                    begin
                        OnValidateField(163, Rec."Text Value 164");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(163, Rec."Text Value 164");
                    end;
                }
                field("Text Value 165"; Rec."Text Value 165")
                {
                    ToolTip = 'Specifies the value of the Value 165 field';
                    ApplicationArea = All;
                    Visible = FieldVisible164;
                    Editable = FieldEditable164;
                    trigger OnValidate()
                    begin
                        OnValidateField(164, Rec."Text Value 165");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(164, Rec."Text Value 165");
                    end;
                }
                field("Text Value 166"; Rec."Text Value 166")
                {
                    ToolTip = 'Specifies the value of the Value 166 field';
                    ApplicationArea = All;
                    Visible = FieldVisible165;
                    Editable = FieldEditable165;
                    trigger OnValidate()
                    begin
                        OnValidateField(165, Rec."Text Value 166");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(165, Rec."Text Value 166");
                    end;
                }
                field("Text Value 167"; Rec."Text Value 167")
                {
                    ToolTip = 'Specifies the value of the Value 167 field';
                    ApplicationArea = All;
                    Visible = FieldVisible166;
                    Editable = FieldEditable166;
                    trigger OnValidate()
                    begin
                        OnValidateField(166, Rec."Text Value 167");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(166, Rec."Text Value 167");
                    end;
                }
                field("Text Value 168"; Rec."Text Value 168")
                {
                    ToolTip = 'Specifies the value of the Value 168 field';
                    ApplicationArea = All;
                    Visible = FieldVisible167;
                    Editable = FieldEditable167;
                    trigger OnValidate()
                    begin
                        OnValidateField(167, Rec."Text Value 168");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(167, Rec."Text Value 168");
                    end;
                }
                field("Text Value 169"; Rec."Text Value 169")
                {
                    ToolTip = 'Specifies the value of the Value 169 field';
                    ApplicationArea = All;
                    Visible = FieldVisible168;
                    Editable = FieldEditable168;
                    trigger OnValidate()
                    begin
                        OnValidateField(168, Rec."Text Value 169");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(168, Rec."Text Value 169");
                    end;
                }
                field("Text Value 170"; Rec."Text Value 170")
                {
                    ToolTip = 'Specifies the value of the Value 170 field';
                    ApplicationArea = All;
                    Visible = FieldVisible169;
                    Editable = FieldEditable169;
                    trigger OnValidate()
                    begin
                        OnValidateField(169, Rec."Text Value 170");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(169, Rec."Text Value 170");
                    end;
                }
                field("Text Value 171"; Rec."Text Value 171")
                {
                    ToolTip = 'Specifies the value of the Value 171 field';
                    ApplicationArea = All;
                    Visible = FieldVisible170;
                    Editable = FieldEditable170;
                    trigger OnValidate()
                    begin
                        OnValidateField(170, Rec."Text Value 171");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(170, Rec."Text Value 171");
                    end;
                }
                field("Text Value 172"; Rec."Text Value 172")
                {
                    ToolTip = 'Specifies the value of the Value 172 field';
                    ApplicationArea = All;
                    Visible = FieldVisible171;
                    Editable = FieldEditable171;
                    trigger OnValidate()
                    begin
                        OnValidateField(171, Rec."Text Value 172");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(171, Rec."Text Value 172");
                    end;
                }
                field("Text Value 173"; Rec."Text Value 173")
                {
                    ToolTip = 'Specifies the value of the Value 173 field';
                    ApplicationArea = All;
                    Visible = FieldVisible172;
                    Editable = FieldEditable172;
                    trigger OnValidate()
                    begin
                        OnValidateField(172, Rec."Text Value 173");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(172, Rec."Text Value 173");
                    end;
                }
                field("Text Value 174"; Rec."Text Value 174")
                {
                    ToolTip = 'Specifies the value of the Value 174 field';
                    ApplicationArea = All;
                    Visible = FieldVisible173;
                    Editable = FieldEditable173;
                    trigger OnValidate()
                    begin
                        OnValidateField(173, Rec."Text Value 174");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(173, Rec."Text Value 174");
                    end;
                }
                field("Text Value 175"; Rec."Text Value 175")
                {
                    ToolTip = 'Specifies the value of the Value 175 field';
                    ApplicationArea = All;
                    Visible = FieldVisible174;
                    Editable = FieldEditable174;
                    trigger OnValidate()
                    begin
                        OnValidateField(174, Rec."Text Value 175");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(174, Rec."Text Value 175");
                    end;
                }
                field("Text Value 176"; Rec."Text Value 176")
                {
                    ToolTip = 'Specifies the value of the Value 176 field';
                    ApplicationArea = All;
                    Visible = FieldVisible175;
                    Editable = FieldEditable175;
                    trigger OnValidate()
                    begin
                        OnValidateField(175, Rec."Text Value 176");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(175, Rec."Text Value 176");
                    end;
                }
                field("Text Value 177"; Rec."Text Value 177")
                {
                    ToolTip = 'Specifies the value of the Value 177 field';
                    ApplicationArea = All;
                    Visible = FieldVisible176;
                    Editable = FieldEditable176;
                    trigger OnValidate()
                    begin
                        OnValidateField(176, Rec."Text Value 177");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(176, Rec."Text Value 177");
                    end;
                }
                field("Text Value 178"; Rec."Text Value 178")
                {
                    ToolTip = 'Specifies the value of the Value 178 field';
                    ApplicationArea = All;
                    Visible = FieldVisible177;
                    Editable = FieldEditable177;
                    trigger OnValidate()
                    begin
                        OnValidateField(177, Rec."Text Value 178");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(177, Rec."Text Value 178");
                    end;
                }
                field("Text Value 179"; Rec."Text Value 179")
                {
                    ToolTip = 'Specifies the value of the Value 179 field';
                    ApplicationArea = All;
                    Visible = FieldVisible178;
                    Editable = FieldEditable178;
                    trigger OnValidate()
                    begin
                        OnValidateField(178, Rec."Text Value 179");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(178, Rec."Text Value 179");
                    end;
                }
                field("Text Value 180"; Rec."Text Value 180")
                {
                    ToolTip = 'Specifies the value of the Value 180 field';
                    ApplicationArea = All;
                    Visible = FieldVisible179;
                    Editable = FieldEditable179;
                    trigger OnValidate()
                    begin
                        OnValidateField(179, Rec."Text Value 180");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(179, Rec."Text Value 180");
                    end;
                }
                field("Text Value 181"; Rec."Text Value 181")
                {
                    ToolTip = 'Specifies the value of the Value 181 field';
                    ApplicationArea = All;
                    Visible = FieldVisible180;
                    Editable = FieldEditable180;
                    trigger OnValidate()
                    begin
                        OnValidateField(180, Rec."Text Value 181");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(180, Rec."Text Value 181");
                    end;
                }
                field("Text Value 182"; Rec."Text Value 182")
                {
                    ToolTip = 'Specifies the value of the Value 182 field';
                    ApplicationArea = All;
                    Visible = FieldVisible181;
                    Editable = FieldEditable181;
                    trigger OnValidate()
                    begin
                        OnValidateField(181, Rec."Text Value 182");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(181, Rec."Text Value 182");
                    end;
                }
                field("Text Value 183"; Rec."Text Value 183")
                {
                    ToolTip = 'Specifies the value of the Value 183 field';
                    ApplicationArea = All;
                    Visible = FieldVisible182;
                    Editable = FieldEditable182;
                    trigger OnValidate()
                    begin
                        OnValidateField(182, Rec."Text Value 183");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(182, Rec."Text Value 183");
                    end;
                }
                field("Text Value 184"; Rec."Text Value 184")
                {
                    ToolTip = 'Specifies the value of the Value 184 field';
                    ApplicationArea = All;
                    Visible = FieldVisible183;
                    Editable = FieldEditable183;
                    trigger OnValidate()
                    begin
                        OnValidateField(183, Rec."Text Value 184");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(183, Rec."Text Value 184");
                    end;
                }
                field("Text Value 185"; Rec."Text Value 185")
                {
                    ToolTip = 'Specifies the value of the Value 185 field';
                    ApplicationArea = All;
                    Visible = FieldVisible184;
                    Editable = FieldEditable184;
                    trigger OnValidate()
                    begin
                        OnValidateField(184, Rec."Text Value 185");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(184, Rec."Text Value 185");
                    end;
                }
                field("Text Value 186"; Rec."Text Value 186")
                {
                    ToolTip = 'Specifies the value of the Value 186 field';
                    ApplicationArea = All;
                    Visible = FieldVisible185;
                    Editable = FieldEditable185;
                    trigger OnValidate()
                    begin
                        OnValidateField(185, Rec."Text Value 186");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(185, Rec."Text Value 186");
                    end;
                }
                field("Text Value 187"; Rec."Text Value 187")
                {
                    ToolTip = 'Specifies the value of the Value 187 field';
                    ApplicationArea = All;
                    Visible = FieldVisible186;
                    Editable = FieldEditable186;
                    trigger OnValidate()
                    begin
                        OnValidateField(186, Rec."Text Value 187");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(186, Rec."Text Value 187");
                    end;
                }
                field("Text Value 188"; Rec."Text Value 188")
                {
                    ToolTip = 'Specifies the value of the Value 188 field';
                    ApplicationArea = All;
                    Visible = FieldVisible187;
                    Editable = FieldEditable187;
                    trigger OnValidate()
                    begin
                        OnValidateField(187, Rec."Text Value 188");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(187, Rec."Text Value 188");
                    end;
                }
                field("Text Value 189"; Rec."Text Value 189")
                {
                    ToolTip = 'Specifies the value of the Value 189 field';
                    ApplicationArea = All;
                    Visible = FieldVisible188;
                    Editable = FieldEditable188;
                    trigger OnValidate()
                    begin
                        OnValidateField(188, Rec."Text Value 189");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(188, Rec."Text Value 189");
                    end;
                }
                field("Text Value 190"; Rec."Text Value 190")
                {
                    ToolTip = 'Specifies the value of the Value 190 field';
                    ApplicationArea = All;
                    Visible = FieldVisible189;
                    Editable = FieldEditable189;
                    trigger OnValidate()
                    begin
                        OnValidateField(189, Rec."Text Value 190");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(189, Rec."Text Value 190");
                    end;
                }
                field("Text Value 191"; Rec."Text Value 191")
                {
                    ToolTip = 'Specifies the value of the Value 191 field';
                    ApplicationArea = All;
                    Visible = FieldVisible190;
                    Editable = FieldEditable190;
                    trigger OnValidate()
                    begin
                        OnValidateField(190, Rec."Text Value 191");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(190, Rec."Text Value 191");
                    end;
                }
                field("Text Value 192"; Rec."Text Value 192")
                {
                    ToolTip = 'Specifies the value of the Value 192 field';
                    ApplicationArea = All;
                    Visible = FieldVisible191;
                    Editable = FieldEditable191;
                    trigger OnValidate()
                    begin
                        OnValidateField(191, Rec."Text Value 192");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(191, Rec."Text Value 192");
                    end;
                }
                field("Text Value 193"; Rec."Text Value 193")
                {
                    ToolTip = 'Specifies the value of the Value 193 field';
                    ApplicationArea = All;
                    Visible = FieldVisible192;
                    Editable = FieldEditable192;
                    trigger OnValidate()
                    begin
                        OnValidateField(192, Rec."Text Value 193");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(192, Rec."Text Value 193");
                    end;
                }
                field("Text Value 194"; Rec."Text Value 194")
                {
                    ToolTip = 'Specifies the value of the Value 194 field';
                    ApplicationArea = All;
                    Visible = FieldVisible193;
                    Editable = FieldEditable193;
                    trigger OnValidate()
                    begin
                        OnValidateField(193, Rec."Text Value 194");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(193, Rec."Text Value 194");
                    end;
                }
                field("Text Value 195"; Rec."Text Value 195")
                {
                    ToolTip = 'Specifies the value of the Value 195 field';
                    ApplicationArea = All;
                    Visible = FieldVisible194;
                    Editable = FieldEditable194;
                    trigger OnValidate()
                    begin
                        OnValidateField(194, Rec."Text Value 195");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(194, Rec."Text Value 195");
                    end;
                }
                field("Text Value 196"; Rec."Text Value 196")
                {
                    ToolTip = 'Specifies the value of the Value 196 field';
                    ApplicationArea = All;
                    Visible = FieldVisible195;
                    Editable = FieldEditable195;
                    trigger OnValidate()
                    begin
                        OnValidateField(195, Rec."Text Value 196");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(195, Rec."Text Value 196");
                    end;
                }
                field("Text Value 197"; Rec."Text Value 197")
                {
                    ToolTip = 'Specifies the value of the Value 197 field';
                    ApplicationArea = All;
                    Visible = FieldVisible196;
                    Editable = FieldEditable196;
                    trigger OnValidate()
                    begin
                        OnValidateField(196, Rec."Text Value 197");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(196, Rec."Text Value 197");
                    end;
                }
                field("Text Value 198"; Rec."Text Value 198")
                {
                    ToolTip = 'Specifies the value of the Value 198 field';
                    ApplicationArea = All;
                    Visible = FieldVisible197;
                    Editable = FieldEditable197;
                    trigger OnValidate()
                    begin
                        OnValidateField(197, Rec."Text Value 198");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(197, Rec."Text Value 198");
                    end;
                }
                field("Text Value 199"; Rec."Text Value 199")
                {
                    ToolTip = 'Specifies the value of the Value 199 field';
                    ApplicationArea = All;
                    Visible = FieldVisible198;
                    Editable = FieldEditable198;
                    trigger OnValidate()
                    begin
                        OnValidateField(198, Rec."Text Value 199");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(198, Rec."Text Value 199");
                    end;
                }
                field("Text Value 200"; Rec."Text Value 200")
                {
                    ToolTip = 'Specifies the value of the Value 200 field';
                    ApplicationArea = All;
                    Visible = FieldVisible199;
                    Editable = FieldEditable199;
                    trigger OnValidate()
                    begin
                        OnValidateField(199, Rec."Text Value 200");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(199, Rec."Text Value 200");
                    end;
                }
                field("Text Value 201"; Rec."Text Value 201")
                {
                    ToolTip = 'Specifies the value of the Value 201 field';
                    ApplicationArea = All;
                    Visible = FieldVisible200;
                    Editable = FieldEditable200;
                    trigger OnValidate()
                    begin
                        OnValidateField(200, Rec."Text Value 201");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(200, Rec."Text Value 201");
                    end;
                }
                field("Text Value 202"; Rec."Text Value 202")
                {
                    ToolTip = 'Specifies the value of the Value 202 field';
                    ApplicationArea = All;
                    Visible = FieldVisible201;
                    Editable = FieldEditable201;
                    trigger OnValidate()
                    begin
                        OnValidateField(201, Rec."Text Value 202");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(201, Rec."Text Value 202");
                    end;
                }
                field("Text Value 203"; Rec."Text Value 203")
                {
                    ToolTip = 'Specifies the value of the Value 203 field';
                    ApplicationArea = All;
                    Visible = FieldVisible202;
                    Editable = FieldEditable202;
                    trigger OnValidate()
                    begin
                        OnValidateField(202, Rec."Text Value 203");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(202, Rec."Text Value 203");
                    end;
                }
                field("Text Value 204"; Rec."Text Value 204")
                {
                    ToolTip = 'Specifies the value of the Value 204 field';
                    ApplicationArea = All;
                    Visible = FieldVisible203;
                    Editable = FieldEditable203;
                    trigger OnValidate()
                    begin
                        OnValidateField(203, Rec."Text Value 204");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(203, Rec."Text Value 204");
                    end;
                }
                field("Text Value 205"; Rec."Text Value 205")
                {
                    ToolTip = 'Specifies the value of the Value 205 field';
                    ApplicationArea = All;
                    Visible = FieldVisible204;
                    Editable = FieldEditable204;
                    trigger OnValidate()
                    begin
                        OnValidateField(204, Rec."Text Value 205");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(204, Rec."Text Value 205");
                    end;
                }
                field("Text Value 206"; Rec."Text Value 206")
                {
                    ToolTip = 'Specifies the value of the Value 206 field';
                    ApplicationArea = All;
                    Visible = FieldVisible205;
                    Editable = FieldEditable205;
                    trigger OnValidate()
                    begin
                        OnValidateField(205, Rec."Text Value 206");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(205, Rec."Text Value 206");
                    end;
                }
                field("Text Value 207"; Rec."Text Value 207")
                {
                    ToolTip = 'Specifies the value of the Value 207 field';
                    ApplicationArea = All;
                    Visible = FieldVisible206;
                    Editable = FieldEditable206;
                    trigger OnValidate()
                    begin
                        OnValidateField(206, Rec."Text Value 207");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(206, Rec."Text Value 207");
                    end;
                }
                field("Text Value 208"; Rec."Text Value 208")
                {
                    ToolTip = 'Specifies the value of the Value 208 field';
                    ApplicationArea = All;
                    Visible = FieldVisible207;
                    Editable = FieldEditable207;
                    trigger OnValidate()
                    begin
                        OnValidateField(207, Rec."Text Value 208");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(207, Rec."Text Value 208");
                    end;
                }
                field("Text Value 209"; Rec."Text Value 209")
                {
                    ToolTip = 'Specifies the value of the Value 209 field';
                    ApplicationArea = All;
                    Visible = FieldVisible208;
                    Editable = FieldEditable208;
                    trigger OnValidate()
                    begin
                        OnValidateField(208, Rec."Text Value 209");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(208, Rec."Text Value 209");
                    end;
                }
                field("Text Value 210"; Rec."Text Value 210")
                {
                    ToolTip = 'Specifies the value of the Value 210 field';
                    ApplicationArea = All;
                    Visible = FieldVisible209;
                    Editable = FieldEditable209;
                    trigger OnValidate()
                    begin
                        OnValidateField(209, Rec."Text Value 210");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(209, Rec."Text Value 210");
                    end;
                }
                field("Text Value 211"; Rec."Text Value 211")
                {
                    ToolTip = 'Specifies the value of the Value 211 field';
                    ApplicationArea = All;
                    Visible = FieldVisible210;
                    Editable = FieldEditable210;
                    trigger OnValidate()
                    begin
                        OnValidateField(210, Rec."Text Value 211");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(210, Rec."Text Value 211");
                    end;
                }
                field("Text Value 212"; Rec."Text Value 212")
                {
                    ToolTip = 'Specifies the value of the Value 212 field';
                    ApplicationArea = All;
                    Visible = FieldVisible211;
                    Editable = FieldEditable211;
                    trigger OnValidate()
                    begin
                        OnValidateField(211, Rec."Text Value 212");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(211, Rec."Text Value 212");
                    end;
                }
                field("Text Value 213"; Rec."Text Value 213")
                {
                    ToolTip = 'Specifies the value of the Value 213 field';
                    ApplicationArea = All;
                    Visible = FieldVisible212;
                    Editable = FieldEditable212;
                    trigger OnValidate()
                    begin
                        OnValidateField(212, Rec."Text Value 213");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(212, Rec."Text Value 213");
                    end;
                }
                field("Text Value 214"; Rec."Text Value 214")
                {
                    ToolTip = 'Specifies the value of the Value 214 field';
                    ApplicationArea = All;
                    Visible = FieldVisible213;
                    Editable = FieldEditable213;
                    trigger OnValidate()
                    begin
                        OnValidateField(213, Rec."Text Value 214");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(213, Rec."Text Value 214");
                    end;
                }
                field("Text Value 215"; Rec."Text Value 215")
                {
                    ToolTip = 'Specifies the value of the Value 215 field';
                    ApplicationArea = All;
                    Visible = FieldVisible214;
                    Editable = FieldEditable214;
                    trigger OnValidate()
                    begin
                        OnValidateField(214, Rec."Text Value 215");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(214, Rec."Text Value 215");
                    end;
                }
                field("Text Value 216"; Rec."Text Value 216")
                {
                    ToolTip = 'Specifies the value of the Value 216 field';
                    ApplicationArea = All;
                    Visible = FieldVisible215;
                    Editable = FieldEditable215;
                    trigger OnValidate()
                    begin
                        OnValidateField(215, Rec."Text Value 216");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(215, Rec."Text Value 216");
                    end;
                }
                field("Text Value 217"; Rec."Text Value 217")
                {
                    ToolTip = 'Specifies the value of the Value 217 field';
                    ApplicationArea = All;
                    Visible = FieldVisible216;
                    Editable = FieldEditable216;
                    trigger OnValidate()
                    begin
                        OnValidateField(216, Rec."Text Value 217");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(216, Rec."Text Value 217");
                    end;
                }
                field("Text Value 218"; Rec."Text Value 218")
                {
                    ToolTip = 'Specifies the value of the Value 218 field';
                    ApplicationArea = All;
                    Visible = FieldVisible217;
                    Editable = FieldEditable217;
                    trigger OnValidate()
                    begin
                        OnValidateField(217, Rec."Text Value 218");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(217, Rec."Text Value 218");
                    end;
                }
                field("Text Value 219"; Rec."Text Value 219")
                {
                    ToolTip = 'Specifies the value of the Value 219 field';
                    ApplicationArea = All;
                    Visible = FieldVisible218;
                    Editable = FieldEditable218;
                    trigger OnValidate()
                    begin
                        OnValidateField(218, Rec."Text Value 219");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(218, Rec."Text Value 219");
                    end;
                }
                field("Text Value 220"; Rec."Text Value 220")
                {
                    ToolTip = 'Specifies the value of the Value 220 field';
                    ApplicationArea = All;
                    Visible = FieldVisible219;
                    Editable = FieldEditable219;
                    trigger OnValidate()
                    begin
                        OnValidateField(219, Rec."Text Value 220");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(219, Rec."Text Value 220");
                    end;
                }
                field("Text Value 221"; Rec."Text Value 221")
                {
                    ToolTip = 'Specifies the value of the Value 221 field';
                    ApplicationArea = All;
                    Visible = FieldVisible220;
                    Editable = FieldEditable220;
                    trigger OnValidate()
                    begin
                        OnValidateField(220, Rec."Text Value 221");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(220, Rec."Text Value 221");
                    end;
                }
                field("Text Value 222"; Rec."Text Value 222")
                {
                    ToolTip = 'Specifies the value of the Value 222 field';
                    ApplicationArea = All;
                    Visible = FieldVisible221;
                    Editable = FieldEditable221;
                    trigger OnValidate()
                    begin
                        OnValidateField(221, Rec."Text Value 222");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(221, Rec."Text Value 222");
                    end;
                }
                field("Text Value 223"; Rec."Text Value 223")
                {
                    ToolTip = 'Specifies the value of the Value 223 field';
                    ApplicationArea = All;
                    Visible = FieldVisible222;
                    Editable = FieldEditable222;
                    trigger OnValidate()
                    begin
                        OnValidateField(222, Rec."Text Value 223");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(222, Rec."Text Value 223");
                    end;
                }
                field("Text Value 224"; Rec."Text Value 224")
                {
                    ToolTip = 'Specifies the value of the Value 224 field';
                    ApplicationArea = All;
                    Visible = FieldVisible223;
                    Editable = FieldEditable223;
                    trigger OnValidate()
                    begin
                        OnValidateField(223, Rec."Text Value 224");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(223, Rec."Text Value 224");
                    end;
                }
                field("Text Value 225"; Rec."Text Value 225")
                {
                    ToolTip = 'Specifies the value of the Value 225 field';
                    ApplicationArea = All;
                    Visible = FieldVisible224;
                    Editable = FieldEditable224;
                    trigger OnValidate()
                    begin
                        OnValidateField(224, Rec."Text Value 225");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(224, Rec."Text Value 225");
                    end;
                }
                field("Text Value 226"; Rec."Text Value 226")
                {
                    ToolTip = 'Specifies the value of the Value 226 field';
                    ApplicationArea = All;
                    Visible = FieldVisible225;
                    Editable = FieldEditable225;
                    trigger OnValidate()
                    begin
                        OnValidateField(225, Rec."Text Value 226");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(225, Rec."Text Value 226");
                    end;
                }
                field("Text Value 227"; Rec."Text Value 227")
                {
                    ToolTip = 'Specifies the value of the Value 227 field';
                    ApplicationArea = All;
                    Visible = FieldVisible226;
                    Editable = FieldEditable226;
                    trigger OnValidate()
                    begin
                        OnValidateField(226, Rec."Text Value 227");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(226, Rec."Text Value 227");
                    end;
                }
                field("Text Value 228"; Rec."Text Value 228")
                {
                    ToolTip = 'Specifies the value of the Value 228 field';
                    ApplicationArea = All;
                    Visible = FieldVisible227;
                    Editable = FieldEditable227;
                    trigger OnValidate()
                    begin
                        OnValidateField(227, Rec."Text Value 228");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(227, Rec."Text Value 228");
                    end;
                }
                field("Text Value 229"; Rec."Text Value 229")
                {
                    ToolTip = 'Specifies the value of the Value 229 field';
                    ApplicationArea = All;
                    Visible = FieldVisible228;
                    Editable = FieldEditable228;
                    trigger OnValidate()
                    begin
                        OnValidateField(228, Rec."Text Value 229");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(228, Rec."Text Value 229");
                    end;
                }
                field("Text Value 230"; Rec."Text Value 230")
                {
                    ToolTip = 'Specifies the value of the Value 230 field';
                    ApplicationArea = All;
                    Visible = FieldVisible229;
                    Editable = FieldEditable229;
                    trigger OnValidate()
                    begin
                        OnValidateField(229, Rec."Text Value 230");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(229, Rec."Text Value 230");
                    end;
                }
                field("Text Value 231"; Rec."Text Value 231")
                {
                    ToolTip = 'Specifies the value of the Value 231 field';
                    ApplicationArea = All;
                    Visible = FieldVisible230;
                    Editable = FieldEditable230;
                    trigger OnValidate()
                    begin
                        OnValidateField(230, Rec."Text Value 231");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(230, Rec."Text Value 231");
                    end;
                }
                field("Text Value 232"; Rec."Text Value 232")
                {
                    ToolTip = 'Specifies the value of the Value 232 field';
                    ApplicationArea = All;
                    Visible = FieldVisible231;
                    Editable = FieldEditable231;
                    trigger OnValidate()
                    begin
                        OnValidateField(231, Rec."Text Value 232");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(231, Rec."Text Value 232");
                    end;
                }
                field("Text Value 233"; Rec."Text Value 233")
                {
                    ToolTip = 'Specifies the value of the Value 233 field';
                    ApplicationArea = All;
                    Visible = FieldVisible232;
                    Editable = FieldEditable232;
                    trigger OnValidate()
                    begin
                        OnValidateField(232, Rec."Text Value 233");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(232, Rec."Text Value 233");
                    end;
                }
                field("Text Value 234"; Rec."Text Value 234")
                {
                    ToolTip = 'Specifies the value of the Value 234 field';
                    ApplicationArea = All;
                    Visible = FieldVisible233;
                    Editable = FieldEditable233;
                    trigger OnValidate()
                    begin
                        OnValidateField(233, Rec."Text Value 234");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(233, Rec."Text Value 234");
                    end;
                }
                field("Text Value 235"; Rec."Text Value 235")
                {
                    ToolTip = 'Specifies the value of the Value 235 field';
                    ApplicationArea = All;
                    Visible = FieldVisible234;
                    Editable = FieldEditable234;
                    trigger OnValidate()
                    begin
                        OnValidateField(234, Rec."Text Value 235");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(234, Rec."Text Value 235");
                    end;
                }
                field("Text Value 236"; Rec."Text Value 236")
                {
                    ToolTip = 'Specifies the value of the Value 236 field';
                    ApplicationArea = All;
                    Visible = FieldVisible235;
                    Editable = FieldEditable235;
                    trigger OnValidate()
                    begin
                        OnValidateField(235, Rec."Text Value 236");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(235, Rec."Text Value 236");
                    end;
                }
                field("Text Value 237"; Rec."Text Value 237")
                {
                    ToolTip = 'Specifies the value of the Value 237 field';
                    ApplicationArea = All;
                    Visible = FieldVisible236;
                    Editable = FieldEditable236;
                    trigger OnValidate()
                    begin
                        OnValidateField(236, Rec."Text Value 237");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(236, Rec."Text Value 237");
                    end;
                }
                field("Text Value 238"; Rec."Text Value 238")
                {
                    ToolTip = 'Specifies the value of the Value 238 field';
                    ApplicationArea = All;
                    Visible = FieldVisible237;
                    Editable = FieldEditable237;
                    trigger OnValidate()
                    begin
                        OnValidateField(237, Rec."Text Value 238");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(237, Rec."Text Value 238");
                    end;
                }
                field("Text Value 239"; Rec."Text Value 239")
                {
                    ToolTip = 'Specifies the value of the Value 239 field';
                    ApplicationArea = All;
                    Visible = FieldVisible238;
                    Editable = FieldEditable238;
                    trigger OnValidate()
                    begin
                        OnValidateField(238, Rec."Text Value 239");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(238, Rec."Text Value 239");
                    end;
                }
                field("Text Value 240"; Rec."Text Value 240")
                {
                    ToolTip = 'Specifies the value of the Value 240 field';
                    ApplicationArea = All;
                    Visible = FieldVisible239;
                    Editable = FieldEditable239;
                    trigger OnValidate()
                    begin
                        OnValidateField(239, Rec."Text Value 240");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(239, Rec."Text Value 240");
                    end;
                }
                field("Text Value 241"; Rec."Text Value 241")
                {
                    ToolTip = 'Specifies the value of the Value 241 field';
                    ApplicationArea = All;
                    Visible = FieldVisible240;
                    Editable = FieldEditable240;
                    trigger OnValidate()
                    begin
                        OnValidateField(240, Rec."Text Value 241");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(240, Rec."Text Value 241");
                    end;
                }
                field("Text Value 242"; Rec."Text Value 242")
                {
                    ToolTip = 'Specifies the value of the Value 242 field';
                    ApplicationArea = All;
                    Visible = FieldVisible241;
                    Editable = FieldEditable241;
                    trigger OnValidate()
                    begin
                        OnValidateField(241, Rec."Text Value 242");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(241, Rec."Text Value 242");
                    end;
                }
                field("Text Value 243"; Rec."Text Value 243")
                {
                    ToolTip = 'Specifies the value of the Value 243 field';
                    ApplicationArea = All;
                    Visible = FieldVisible242;
                    Editable = FieldEditable242;
                    trigger OnValidate()
                    begin
                        OnValidateField(242, Rec."Text Value 243");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(242, Rec."Text Value 243");
                    end;
                }
                field("Text Value 244"; Rec."Text Value 244")
                {
                    ToolTip = 'Specifies the value of the Value 244 field';
                    ApplicationArea = All;
                    Visible = FieldVisible243;
                    Editable = FieldEditable243;
                    trigger OnValidate()
                    begin
                        OnValidateField(243, Rec."Text Value 244");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(243, Rec."Text Value 244");
                    end;
                }
                field("Text Value 245"; Rec."Text Value 245")
                {
                    ToolTip = 'Specifies the value of the Value 245 field';
                    ApplicationArea = All;
                    Visible = FieldVisible244;
                    Editable = FieldEditable244;
                    trigger OnValidate()
                    begin
                        OnValidateField(244, Rec."Text Value 245");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(244, Rec."Text Value 245");
                    end;
                }
                field("Text Value 246"; Rec."Text Value 246")
                {
                    ToolTip = 'Specifies the value of the Value 246 field';
                    ApplicationArea = All;
                    Visible = FieldVisible245;
                    Editable = FieldEditable245;
                    trigger OnValidate()
                    begin
                        OnValidateField(245, Rec."Text Value 246");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(245, Rec."Text Value 246");
                    end;
                }
                field("Text Value 247"; Rec."Text Value 247")
                {
                    ToolTip = 'Specifies the value of the Value 247 field';
                    ApplicationArea = All;
                    Visible = FieldVisible246;
                    Editable = FieldEditable246;
                    trigger OnValidate()
                    begin
                        OnValidateField(246, Rec."Text Value 247");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(246, Rec."Text Value 247");
                    end;
                }
                field("Text Value 248"; Rec."Text Value 248")
                {
                    ToolTip = 'Specifies the value of the Value 248 field';
                    ApplicationArea = All;
                    Visible = FieldVisible247;
                    Editable = FieldEditable247;
                    trigger OnValidate()
                    begin
                        OnValidateField(247, Rec."Text Value 248");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(247, Rec."Text Value 248");
                    end;
                }
                field("Text Value 249"; Rec."Text Value 249")
                {
                    ToolTip = 'Specifies the value of the Value 249 field';
                    ApplicationArea = All;
                    Visible = FieldVisible248;
                    Editable = FieldEditable248;
                    trigger OnValidate()
                    begin
                        OnValidateField(248, Rec."Text Value 249");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(248, Rec."Text Value 249");
                    end;
                }
                field("Text Value 250"; Rec."Text Value 250")
                {
                    ToolTip = 'Specifies the value of the Value 250 field';
                    ApplicationArea = All;
                    Visible = FieldVisible249;
                    Editable = FieldEditable249;
                    trigger OnValidate()
                    begin
                        OnValidateField(249, Rec."Text Value 250");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(249, Rec."Text Value 250");
                    end;
                }
                field("Text Value 251"; Rec."Text Value 251")
                {
                    ToolTip = 'Specifies the value of the Value 251 field';
                    ApplicationArea = All;
                    Visible = FieldVisible250;
                    Editable = FieldEditable250;
                    trigger OnValidate()
                    begin
                        OnValidateField(250, Rec."Text Value 251");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(250, Rec."Text Value 251");
                    end;
                }
                field("Text Value 252"; Rec."Text Value 252")
                {
                    ToolTip = 'Specifies the value of the Value 252 field';
                    ApplicationArea = All;
                    Visible = FieldVisible251;
                    Editable = FieldEditable251;
                    trigger OnValidate()
                    begin
                        OnValidateField(251, Rec."Text Value 252");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(251, Rec."Text Value 252");
                    end;
                }
                field("Text Value 253"; Rec."Text Value 253")
                {
                    ToolTip = 'Specifies the value of the Value 253 field';
                    ApplicationArea = All;
                    Visible = FieldVisible252;
                    Editable = FieldEditable252;
                    trigger OnValidate()
                    begin
                        OnValidateField(252, Rec."Text Value 253");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(252, Rec."Text Value 253");
                    end;
                }
                field("Text Value 254"; Rec."Text Value 254")
                {
                    ToolTip = 'Specifies the value of the Value 254 field';
                    ApplicationArea = All;
                    Visible = FieldVisible253;
                    Editable = FieldEditable253;
                    trigger OnValidate()
                    begin
                        OnValidateField(253, Rec."Text Value 254");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(253, Rec."Text Value 254");
                    end;
                }
                field("Text Value 255"; Rec."Text Value 255")
                {
                    ToolTip = 'Specifies the value of the Value 255 field';
                    ApplicationArea = All;
                    Visible = FieldVisible254;
                    Editable = FieldEditable254;
                    trigger OnValidate()
                    begin
                        OnValidateField(254, Rec."Text Value 255");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(254, Rec."Text Value 255");
                    end;
                }
                field("Text Value 256"; Rec."Text Value 256")
                {
                    ToolTip = 'Specifies the value of the Value 256 field';
                    ApplicationArea = All;
                    Visible = FieldVisible255;
                    Editable = FieldEditable255;
                    trigger OnValidate()
                    begin
                        OnValidateField(255, Rec."Text Value 256");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(255, Rec."Text Value 256");
                    end;
                }
                field("Text Value 257"; Rec."Text Value 257")
                {
                    ToolTip = 'Specifies the value of the Value 257 field';
                    ApplicationArea = All;
                    Visible = FieldVisible256;
                    Editable = FieldEditable256;
                    trigger OnValidate()
                    begin
                        OnValidateField(256, Rec."Text Value 257");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(256, Rec."Text Value 257");
                    end;
                }
                field("Text Value 258"; Rec."Text Value 258")
                {
                    ToolTip = 'Specifies the value of the Value 258 field';
                    ApplicationArea = All;
                    Visible = FieldVisible257;
                    Editable = FieldEditable257;
                    trigger OnValidate()
                    begin
                        OnValidateField(257, Rec."Text Value 258");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(257, Rec."Text Value 258");
                    end;
                }
                field("Text Value 259"; Rec."Text Value 259")
                {
                    ToolTip = 'Specifies the value of the Value 259 field';
                    ApplicationArea = All;
                    Visible = FieldVisible258;
                    Editable = FieldEditable258;
                    trigger OnValidate()
                    begin
                        OnValidateField(258, Rec."Text Value 259");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(258, Rec."Text Value 259");
                    end;
                }
                field("Text Value 260"; Rec."Text Value 260")
                {
                    ToolTip = 'Specifies the value of the Value 260 field';
                    ApplicationArea = All;
                    Visible = FieldVisible259;
                    Editable = FieldEditable259;
                    trigger OnValidate()
                    begin
                        OnValidateField(259, Rec."Text Value 260");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(259, Rec."Text Value 260");
                    end;
                }
                field("Text Value 261"; Rec."Text Value 261")
                {
                    ToolTip = 'Specifies the value of the Value 261 field';
                    ApplicationArea = All;
                    Visible = FieldVisible260;
                    Editable = FieldEditable260;
                    trigger OnValidate()
                    begin
                        OnValidateField(260, Rec."Text Value 261");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(260, Rec."Text Value 261");
                    end;
                }
                field("Text Value 262"; Rec."Text Value 262")
                {
                    ToolTip = 'Specifies the value of the Value 262 field';
                    ApplicationArea = All;
                    Visible = FieldVisible261;
                    Editable = FieldEditable261;
                    trigger OnValidate()
                    begin
                        OnValidateField(261, Rec."Text Value 262");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(261, Rec."Text Value 262");
                    end;
                }
                field("Text Value 263"; Rec."Text Value 263")
                {
                    ToolTip = 'Specifies the value of the Value 263 field';
                    ApplicationArea = All;
                    Visible = FieldVisible262;
                    Editable = FieldEditable262;
                    trigger OnValidate()
                    begin
                        OnValidateField(262, Rec."Text Value 263");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(262, Rec."Text Value 263");
                    end;
                }
                field("Text Value 264"; Rec."Text Value 264")
                {
                    ToolTip = 'Specifies the value of the Value 264 field';
                    ApplicationArea = All;
                    Visible = FieldVisible263;
                    Editable = FieldEditable263;
                    trigger OnValidate()
                    begin
                        OnValidateField(263, Rec."Text Value 264");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(263, Rec."Text Value 264");
                    end;
                }
                field("Text Value 265"; Rec."Text Value 265")
                {
                    ToolTip = 'Specifies the value of the Value 265 field';
                    ApplicationArea = All;
                    Visible = FieldVisible264;
                    Editable = FieldEditable264;
                    trigger OnValidate()
                    begin
                        OnValidateField(264, Rec."Text Value 265");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(264, Rec."Text Value 265");
                    end;
                }
                field("Text Value 266"; Rec."Text Value 266")
                {
                    ToolTip = 'Specifies the value of the Value 266 field';
                    ApplicationArea = All;
                    Visible = FieldVisible265;
                    Editable = FieldEditable265;
                    trigger OnValidate()
                    begin
                        OnValidateField(265, Rec."Text Value 266");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(265, Rec."Text Value 266");
                    end;
                }
                field("Text Value 267"; Rec."Text Value 267")
                {
                    ToolTip = 'Specifies the value of the Value 267 field';
                    ApplicationArea = All;
                    Visible = FieldVisible266;
                    Editable = FieldEditable266;
                    trigger OnValidate()
                    begin
                        OnValidateField(266, Rec."Text Value 267");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(266, Rec."Text Value 267");
                    end;
                }
                field("Text Value 268"; Rec."Text Value 268")
                {
                    ToolTip = 'Specifies the value of the Value 268 field';
                    ApplicationArea = All;
                    Visible = FieldVisible267;
                    Editable = FieldEditable267;
                    trigger OnValidate()
                    begin
                        OnValidateField(267, Rec."Text Value 268");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(267, Rec."Text Value 268");
                    end;
                }
                field("Text Value 269"; Rec."Text Value 269")
                {
                    ToolTip = 'Specifies the value of the Value 269 field';
                    ApplicationArea = All;
                    Visible = FieldVisible268;
                    Editable = FieldEditable268;
                    trigger OnValidate()
                    begin
                        OnValidateField(268, Rec."Text Value 269");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(268, Rec."Text Value 269");
                    end;
                }
                field("Text Value 270"; Rec."Text Value 270")
                {
                    ToolTip = 'Specifies the value of the Value 270 field';
                    ApplicationArea = All;
                    Visible = FieldVisible269;
                    Editable = FieldEditable269;
                    trigger OnValidate()
                    begin
                        OnValidateField(269, Rec."Text Value 270");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(269, Rec."Text Value 270");
                    end;
                }
                field("Text Value 271"; Rec."Text Value 271")
                {
                    ToolTip = 'Specifies the value of the Value 271 field';
                    ApplicationArea = All;
                    Visible = FieldVisible270;
                    Editable = FieldEditable270;
                    trigger OnValidate()
                    begin
                        OnValidateField(270, Rec."Text Value 271");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(270, Rec."Text Value 271");
                    end;
                }
                field("Text Value 272"; Rec."Text Value 272")
                {
                    ToolTip = 'Specifies the value of the Value 272 field';
                    ApplicationArea = All;
                    Visible = FieldVisible271;
                    Editable = FieldEditable271;
                    trigger OnValidate()
                    begin
                        OnValidateField(271, Rec."Text Value 272");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(271, Rec."Text Value 272");
                    end;
                }
                field("Text Value 273"; Rec."Text Value 273")
                {
                    ToolTip = 'Specifies the value of the Value 273 field';
                    ApplicationArea = All;
                    Visible = FieldVisible272;
                    Editable = FieldEditable272;
                    trigger OnValidate()
                    begin
                        OnValidateField(272, Rec."Text Value 273");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(272, Rec."Text Value 273");
                    end;
                }
                field("Text Value 274"; Rec."Text Value 274")
                {
                    ToolTip = 'Specifies the value of the Value 274 field';
                    ApplicationArea = All;
                    Visible = FieldVisible273;
                    Editable = FieldEditable273;
                    trigger OnValidate()
                    begin
                        OnValidateField(273, Rec."Text Value 274");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(273, Rec."Text Value 274");
                    end;
                }
                field("Text Value 275"; Rec."Text Value 275")
                {
                    ToolTip = 'Specifies the value of the Value 275 field';
                    ApplicationArea = All;
                    Visible = FieldVisible274;
                    Editable = FieldEditable274;
                    trigger OnValidate()
                    begin
                        OnValidateField(274, Rec."Text Value 275");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(274, Rec."Text Value 275");
                    end;
                }
                field("Text Value 276"; Rec."Text Value 276")
                {
                    ToolTip = 'Specifies the value of the Value 276 field';
                    ApplicationArea = All;
                    Visible = FieldVisible275;
                    Editable = FieldEditable275;
                    trigger OnValidate()
                    begin
                        OnValidateField(275, Rec."Text Value 276");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(275, Rec."Text Value 276");
                    end;
                }
                field("Text Value 277"; Rec."Text Value 277")
                {
                    ToolTip = 'Specifies the value of the Value 277 field';
                    ApplicationArea = All;
                    Visible = FieldVisible276;
                    Editable = FieldEditable276;
                    trigger OnValidate()
                    begin
                        OnValidateField(276, Rec."Text Value 277");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(276, Rec."Text Value 277");
                    end;
                }
                field("Text Value 278"; Rec."Text Value 278")
                {
                    ToolTip = 'Specifies the value of the Value 278 field';
                    ApplicationArea = All;
                    Visible = FieldVisible277;
                    Editable = FieldEditable277;
                    trigger OnValidate()
                    begin
                        OnValidateField(277, Rec."Text Value 278");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(277, Rec."Text Value 278");
                    end;
                }
                field("Text Value 279"; Rec."Text Value 279")
                {
                    ToolTip = 'Specifies the value of the Value 279 field';
                    ApplicationArea = All;
                    Visible = FieldVisible278;
                    Editable = FieldEditable278;
                    trigger OnValidate()
                    begin
                        OnValidateField(278, Rec."Text Value 279");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(278, Rec."Text Value 279");
                    end;
                }
                field("Text Value 280"; Rec."Text Value 280")
                {
                    ToolTip = 'Specifies the value of the Value 280 field';
                    ApplicationArea = All;
                    Visible = FieldVisible279;
                    Editable = FieldEditable279;
                    trigger OnValidate()
                    begin
                        OnValidateField(279, Rec."Text Value 280");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(279, Rec."Text Value 280");
                    end;
                }
                field("Text Value 281"; Rec."Text Value 281")
                {
                    ToolTip = 'Specifies the value of the Value 281 field';
                    ApplicationArea = All;
                    Visible = FieldVisible280;
                    Editable = FieldEditable280;
                    trigger OnValidate()
                    begin
                        OnValidateField(280, Rec."Text Value 281");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(280, Rec."Text Value 281");
                    end;
                }
                field("Text Value 282"; Rec."Text Value 282")
                {
                    ToolTip = 'Specifies the value of the Value 282 field';
                    ApplicationArea = All;
                    Visible = FieldVisible281;
                    Editable = FieldEditable281;
                    trigger OnValidate()
                    begin
                        OnValidateField(281, Rec."Text Value 282");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(281, Rec."Text Value 282");
                    end;
                }
                field("Text Value 283"; Rec."Text Value 283")
                {
                    ToolTip = 'Specifies the value of the Value 283 field';
                    ApplicationArea = All;
                    Visible = FieldVisible282;
                    Editable = FieldEditable282;
                    trigger OnValidate()
                    begin
                        OnValidateField(282, Rec."Text Value 283");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(282, Rec."Text Value 283");
                    end;
                }
                field("Text Value 284"; Rec."Text Value 284")
                {
                    ToolTip = 'Specifies the value of the Value 284 field';
                    ApplicationArea = All;
                    Visible = FieldVisible283;
                    Editable = FieldEditable283;
                    trigger OnValidate()
                    begin
                        OnValidateField(283, Rec."Text Value 284");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(283, Rec."Text Value 284");
                    end;
                }
                field("Text Value 285"; Rec."Text Value 285")
                {
                    ToolTip = 'Specifies the value of the Value 285 field';
                    ApplicationArea = All;
                    Visible = FieldVisible284;
                    Editable = FieldEditable284;
                    trigger OnValidate()
                    begin
                        OnValidateField(284, Rec."Text Value 285");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(284, Rec."Text Value 285");
                    end;
                }
                field("Text Value 286"; Rec."Text Value 286")
                {
                    ToolTip = 'Specifies the value of the Value 286 field';
                    ApplicationArea = All;
                    Visible = FieldVisible285;
                    Editable = FieldEditable285;
                    trigger OnValidate()
                    begin
                        OnValidateField(285, Rec."Text Value 286");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(285, Rec."Text Value 286");
                    end;
                }
                field("Text Value 287"; Rec."Text Value 287")
                {
                    ToolTip = 'Specifies the value of the Value 287 field';
                    ApplicationArea = All;
                    Visible = FieldVisible286;
                    Editable = FieldEditable286;
                    trigger OnValidate()
                    begin
                        OnValidateField(286, Rec."Text Value 287");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(286, Rec."Text Value 287");
                    end;
                }
                field("Text Value 288"; Rec."Text Value 288")
                {
                    ToolTip = 'Specifies the value of the Value 288 field';
                    ApplicationArea = All;
                    Visible = FieldVisible287;
                    Editable = FieldEditable287;
                    trigger OnValidate()
                    begin
                        OnValidateField(287, Rec."Text Value 288");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(287, Rec."Text Value 288");
                    end;
                }
                field("Text Value 289"; Rec."Text Value 289")
                {
                    ToolTip = 'Specifies the value of the Value 289 field';
                    ApplicationArea = All;
                    Visible = FieldVisible288;
                    Editable = FieldEditable288;
                    trigger OnValidate()
                    begin
                        OnValidateField(288, Rec."Text Value 289");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(288, Rec."Text Value 289");
                    end;
                }
                field("Text Value 290"; Rec."Text Value 290")
                {
                    ToolTip = 'Specifies the value of the Value 290 field';
                    ApplicationArea = All;
                    Visible = FieldVisible289;
                    Editable = FieldEditable289;
                    trigger OnValidate()
                    begin
                        OnValidateField(289, Rec."Text Value 290");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(289, Rec."Text Value 290");
                    end;
                }
                field("Text Value 291"; Rec."Text Value 291")
                {
                    ToolTip = 'Specifies the value of the Value 291 field';
                    ApplicationArea = All;
                    Visible = FieldVisible290;
                    Editable = FieldEditable290;
                    trigger OnValidate()
                    begin
                        OnValidateField(290, Rec."Text Value 291");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(290, Rec."Text Value 291");
                    end;
                }
                field("Text Value 292"; Rec."Text Value 292")
                {
                    ToolTip = 'Specifies the value of the Value 292 field';
                    ApplicationArea = All;
                    Visible = FieldVisible291;
                    Editable = FieldEditable291;
                    trigger OnValidate()
                    begin
                        OnValidateField(291, Rec."Text Value 292");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(291, Rec."Text Value 292");
                    end;
                }
                field("Text Value 293"; Rec."Text Value 293")
                {
                    ToolTip = 'Specifies the value of the Value 293 field';
                    ApplicationArea = All;
                    Visible = FieldVisible292;
                    Editable = FieldEditable292;
                    trigger OnValidate()
                    begin
                        OnValidateField(292, Rec."Text Value 293");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(292, Rec."Text Value 293");
                    end;
                }
                field("Text Value 294"; Rec."Text Value 294")
                {
                    ToolTip = 'Specifies the value of the Value 294 field';
                    ApplicationArea = All;
                    Visible = FieldVisible293;
                    Editable = FieldEditable293;
                    trigger OnValidate()
                    begin
                        OnValidateField(293, Rec."Text Value 294");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(293, Rec."Text Value 294");
                    end;
                }
                field("Text Value 295"; Rec."Text Value 295")
                {
                    ToolTip = 'Specifies the value of the Value 295 field';
                    ApplicationArea = All;
                    Visible = FieldVisible294;
                    Editable = FieldEditable294;
                    trigger OnValidate()
                    begin
                        OnValidateField(294, Rec."Text Value 295");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(294, Rec."Text Value 295");
                    end;
                }
                field("Text Value 296"; Rec."Text Value 296")
                {
                    ToolTip = 'Specifies the value of the Value 296 field';
                    ApplicationArea = All;
                    Visible = FieldVisible295;
                    Editable = FieldEditable295;
                    trigger OnValidate()
                    begin
                        OnValidateField(295, Rec."Text Value 296");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(295, Rec."Text Value 296");
                    end;
                }
                field("Text Value 297"; Rec."Text Value 297")
                {
                    ToolTip = 'Specifies the value of the Value 297 field';
                    ApplicationArea = All;
                    Visible = FieldVisible296;
                    Editable = FieldEditable296;
                    trigger OnValidate()
                    begin
                        OnValidateField(296, Rec."Text Value 297");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(296, Rec."Text Value 297");
                    end;
                }
                field("Text Value 298"; Rec."Text Value 298")
                {
                    ToolTip = 'Specifies the value of the Value 298 field';
                    ApplicationArea = All;
                    Visible = FieldVisible297;
                    Editable = FieldEditable297;
                    trigger OnValidate()
                    begin
                        OnValidateField(297, Rec."Text Value 298");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(297, Rec."Text Value 298");
                    end;
                }
                field("Text Value 299"; Rec."Text Value 299")
                {
                    ToolTip = 'Specifies the value of the Value 299 field';
                    ApplicationArea = All;
                    Visible = FieldVisible298;
                    Editable = FieldEditable298;
                    trigger OnValidate()
                    begin
                        OnValidateField(298, Rec."Text Value 299");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(298, Rec."Text Value 299");
                    end;
                }
                field("Text Value 300"; Rec."Text Value 300")
                {
                    ToolTip = 'Specifies the value of the Value 300 field';
                    ApplicationArea = All;
                    Visible = FieldVisible299;
                    Editable = FieldEditable299;
                    trigger OnValidate()
                    begin
                        OnValidateField(299, Rec."Text Value 300");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(299, Rec."Text Value 300");
                    end;
                }
                field("Text Value 301"; Rec."Text Value 301")
                {
                    ToolTip = 'Specifies the value of the Value 301 field';
                    ApplicationArea = All;
                    Visible = FieldVisible300;
                    Editable = FieldEditable300;
                    trigger OnValidate()
                    begin
                        OnValidateField(300, Rec."Text Value 301");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(300, Rec."Text Value 301");
                    end;
                }
                field("Text Value 302"; Rec."Text Value 302")
                {
                    ToolTip = 'Specifies the value of the Value 302 field';
                    ApplicationArea = All;
                    Visible = FieldVisible301;
                    Editable = FieldEditable301;
                    trigger OnValidate()
                    begin
                        OnValidateField(301, Rec."Text Value 302");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(301, Rec."Text Value 302");
                    end;
                }
                field("Text Value 303"; Rec."Text Value 303")
                {
                    ToolTip = 'Specifies the value of the Value 303 field';
                    ApplicationArea = All;
                    Visible = FieldVisible302;
                    Editable = FieldEditable302;
                    trigger OnValidate()
                    begin
                        OnValidateField(302, Rec."Text Value 303");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(302, Rec."Text Value 303");
                    end;
                }
                field("Text Value 304"; Rec."Text Value 304")
                {
                    ToolTip = 'Specifies the value of the Value 304 field';
                    ApplicationArea = All;
                    Visible = FieldVisible303;
                    Editable = FieldEditable303;
                    trigger OnValidate()
                    begin
                        OnValidateField(303, Rec."Text Value 304");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(303, Rec."Text Value 304");
                    end;
                }
                field("Text Value 305"; Rec."Text Value 305")
                {
                    ToolTip = 'Specifies the value of the Value 305 field';
                    ApplicationArea = All;
                    Visible = FieldVisible304;
                    Editable = FieldEditable304;
                    trigger OnValidate()
                    begin
                        OnValidateField(304, Rec."Text Value 305");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(304, Rec."Text Value 305");
                    end;
                }
                field("Text Value 306"; Rec."Text Value 306")
                {
                    ToolTip = 'Specifies the value of the Value 306 field';
                    ApplicationArea = All;
                    Visible = FieldVisible305;
                    Editable = FieldEditable305;
                    trigger OnValidate()
                    begin
                        OnValidateField(305, Rec."Text Value 306");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(305, Rec."Text Value 306");
                    end;
                }
                field("Text Value 307"; Rec."Text Value 307")
                {
                    ToolTip = 'Specifies the value of the Value 307 field';
                    ApplicationArea = All;
                    Visible = FieldVisible306;
                    Editable = FieldEditable306;
                    trigger OnValidate()
                    begin
                        OnValidateField(306, Rec."Text Value 307");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(306, Rec."Text Value 307");
                    end;
                }
                field("Text Value 308"; Rec."Text Value 308")
                {
                    ToolTip = 'Specifies the value of the Value 308 field';
                    ApplicationArea = All;
                    Visible = FieldVisible307;
                    Editable = FieldEditable307;
                    trigger OnValidate()
                    begin
                        OnValidateField(307, Rec."Text Value 308");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(307, Rec."Text Value 308");
                    end;
                }
                field("Text Value 309"; Rec."Text Value 309")
                {
                    ToolTip = 'Specifies the value of the Value 309 field';
                    ApplicationArea = All;
                    Visible = FieldVisible308;
                    Editable = FieldEditable308;
                    trigger OnValidate()
                    begin
                        OnValidateField(308, Rec."Text Value 309");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(308, Rec."Text Value 309");
                    end;
                }
                field("Text Value 310"; Rec."Text Value 310")
                {
                    ToolTip = 'Specifies the value of the Value 310 field';
                    ApplicationArea = All;
                    Visible = FieldVisible309;
                    Editable = FieldEditable309;
                    trigger OnValidate()
                    begin
                        OnValidateField(309, Rec."Text Value 310");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(309, Rec."Text Value 310");
                    end;
                }
                field("Text Value 311"; Rec."Text Value 311")
                {
                    ToolTip = 'Specifies the value of the Value 311 field';
                    ApplicationArea = All;
                    Visible = FieldVisible310;
                    Editable = FieldEditable310;
                    trigger OnValidate()
                    begin
                        OnValidateField(310, Rec."Text Value 311");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(310, Rec."Text Value 311");
                    end;
                }
                field("Text Value 312"; Rec."Text Value 312")
                {
                    ToolTip = 'Specifies the value of the Value 312 field';
                    ApplicationArea = All;
                    Visible = FieldVisible311;
                    Editable = FieldEditable311;
                    trigger OnValidate()
                    begin
                        OnValidateField(311, Rec."Text Value 312");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(311, Rec."Text Value 312");
                    end;
                }
                field("Text Value 313"; Rec."Text Value 313")
                {
                    ToolTip = 'Specifies the value of the Value 313 field';
                    ApplicationArea = All;
                    Visible = FieldVisible312;
                    Editable = FieldEditable312;
                    trigger OnValidate()
                    begin
                        OnValidateField(312, Rec."Text Value 313");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(312, Rec."Text Value 313");
                    end;
                }
                field("Text Value 314"; Rec."Text Value 314")
                {
                    ToolTip = 'Specifies the value of the Value 314 field';
                    ApplicationArea = All;
                    Visible = FieldVisible313;
                    Editable = FieldEditable313;
                    trigger OnValidate()
                    begin
                        OnValidateField(313, Rec."Text Value 314");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(313, Rec."Text Value 314");
                    end;
                }
                field("Text Value 315"; Rec."Text Value 315")
                {
                    ToolTip = 'Specifies the value of the Value 315 field';
                    ApplicationArea = All;
                    Visible = FieldVisible314;
                    Editable = FieldEditable314;
                    trigger OnValidate()
                    begin
                        OnValidateField(314, Rec."Text Value 315");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(314, Rec."Text Value 315");
                    end;
                }
                field("Text Value 316"; Rec."Text Value 316")
                {
                    ToolTip = 'Specifies the value of the Value 316 field';
                    ApplicationArea = All;
                    Visible = FieldVisible315;
                    Editable = FieldEditable315;
                    trigger OnValidate()
                    begin
                        OnValidateField(315, Rec."Text Value 316");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(315, Rec."Text Value 316");
                    end;
                }
                field("Text Value 317"; Rec."Text Value 317")
                {
                    ToolTip = 'Specifies the value of the Value 317 field';
                    ApplicationArea = All;
                    Visible = FieldVisible316;
                    Editable = FieldEditable316;
                    trigger OnValidate()
                    begin
                        OnValidateField(316, Rec."Text Value 317");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(316, Rec."Text Value 317");
                    end;
                }
                field("Text Value 318"; Rec."Text Value 318")
                {
                    ToolTip = 'Specifies the value of the Value 318 field';
                    ApplicationArea = All;
                    Visible = FieldVisible317;
                    Editable = FieldEditable317;
                    trigger OnValidate()
                    begin
                        OnValidateField(317, Rec."Text Value 318");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(317, Rec."Text Value 318");
                    end;
                }
                field("Text Value 319"; Rec."Text Value 319")
                {
                    ToolTip = 'Specifies the value of the Value 319 field';
                    ApplicationArea = All;
                    Visible = FieldVisible318;
                    Editable = FieldEditable318;
                    trigger OnValidate()
                    begin
                        OnValidateField(318, Rec."Text Value 319");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(318, Rec."Text Value 319");
                    end;
                }
                field("Text Value 320"; Rec."Text Value 320")
                {
                    ToolTip = 'Specifies the value of the Value 320 field';
                    ApplicationArea = All;
                    Visible = FieldVisible319;
                    Editable = FieldEditable319;
                    trigger OnValidate()
                    begin
                        OnValidateField(319, Rec."Text Value 320");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(319, Rec."Text Value 320");
                    end;
                }
                field("Text Value 321"; Rec."Text Value 321")
                {
                    ToolTip = 'Specifies the value of the Value 321 field';
                    ApplicationArea = All;
                    Visible = FieldVisible320;
                    Editable = FieldEditable320;
                    trigger OnValidate()
                    begin
                        OnValidateField(320, Rec."Text Value 321");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(320, Rec."Text Value 321");
                    end;
                }
                field("Text Value 322"; Rec."Text Value 322")
                {
                    ToolTip = 'Specifies the value of the Value 322 field';
                    ApplicationArea = All;
                    Visible = FieldVisible321;
                    Editable = FieldEditable321;
                    trigger OnValidate()
                    begin
                        OnValidateField(321, Rec."Text Value 322");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(321, Rec."Text Value 322");
                    end;
                }
                field("Text Value 323"; Rec."Text Value 323")
                {
                    ToolTip = 'Specifies the value of the Value 323 field';
                    ApplicationArea = All;
                    Visible = FieldVisible322;
                    Editable = FieldEditable322;
                    trigger OnValidate()
                    begin
                        OnValidateField(322, Rec."Text Value 323");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(322, Rec."Text Value 323");
                    end;
                }
                field("Text Value 324"; Rec."Text Value 324")
                {
                    ToolTip = 'Specifies the value of the Value 324 field';
                    ApplicationArea = All;
                    Visible = FieldVisible323;
                    Editable = FieldEditable323;
                    trigger OnValidate()
                    begin
                        OnValidateField(323, Rec."Text Value 324");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(323, Rec."Text Value 324");
                    end;
                }
                field("Text Value 325"; Rec."Text Value 325")
                {
                    ToolTip = 'Specifies the value of the Value 325 field';
                    ApplicationArea = All;
                    Visible = FieldVisible324;
                    Editable = FieldEditable324;
                    trigger OnValidate()
                    begin
                        OnValidateField(324, Rec."Text Value 325");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(324, Rec."Text Value 325");
                    end;
                }
                field("Text Value 326"; Rec."Text Value 326")
                {
                    ToolTip = 'Specifies the value of the Value 326 field';
                    ApplicationArea = All;
                    Visible = FieldVisible325;
                    Editable = FieldEditable325;
                    trigger OnValidate()
                    begin
                        OnValidateField(325, Rec."Text Value 326");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(325, Rec."Text Value 326");
                    end;
                }
                field("Text Value 327"; Rec."Text Value 327")
                {
                    ToolTip = 'Specifies the value of the Value 327 field';
                    ApplicationArea = All;
                    Visible = FieldVisible326;
                    Editable = FieldEditable326;
                    trigger OnValidate()
                    begin
                        OnValidateField(326, Rec."Text Value 327");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(326, Rec."Text Value 327");
                    end;
                }
                field("Text Value 328"; Rec."Text Value 328")
                {
                    ToolTip = 'Specifies the value of the Value 328 field';
                    ApplicationArea = All;
                    Visible = FieldVisible327;
                    Editable = FieldEditable327;
                    trigger OnValidate()
                    begin
                        OnValidateField(327, Rec."Text Value 328");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(327, Rec."Text Value 328");
                    end;
                }
                field("Text Value 329"; Rec."Text Value 329")
                {
                    ToolTip = 'Specifies the value of the Value 329 field';
                    ApplicationArea = All;
                    Visible = FieldVisible328;
                    Editable = FieldEditable328;
                    trigger OnValidate()
                    begin
                        OnValidateField(328, Rec."Text Value 329");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(328, Rec."Text Value 329");
                    end;
                }
                field("Text Value 330"; Rec."Text Value 330")
                {
                    ToolTip = 'Specifies the value of the Value 330 field';
                    ApplicationArea = All;
                    Visible = FieldVisible329;
                    Editable = FieldEditable329;
                    trigger OnValidate()
                    begin
                        OnValidateField(329, Rec."Text Value 330");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(329, Rec."Text Value 330");
                    end;
                }
                field("Text Value 331"; Rec."Text Value 331")
                {
                    ToolTip = 'Specifies the value of the Value 331 field';
                    ApplicationArea = All;
                    Visible = FieldVisible330;
                    Editable = FieldEditable330;
                    trigger OnValidate()
                    begin
                        OnValidateField(330, Rec."Text Value 331");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(330, Rec."Text Value 331");
                    end;
                }
                field("Text Value 332"; Rec."Text Value 332")
                {
                    ToolTip = 'Specifies the value of the Value 332 field';
                    ApplicationArea = All;
                    Visible = FieldVisible331;
                    Editable = FieldEditable331;
                    trigger OnValidate()
                    begin
                        OnValidateField(331, Rec."Text Value 332");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(331, Rec."Text Value 332");
                    end;
                }
                field("Text Value 333"; Rec."Text Value 333")
                {
                    ToolTip = 'Specifies the value of the Value 333 field';
                    ApplicationArea = All;
                    Visible = FieldVisible332;
                    Editable = FieldEditable332;
                    trigger OnValidate()
                    begin
                        OnValidateField(332, Rec."Text Value 333");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(332, Rec."Text Value 333");
                    end;
                }
                field("Text Value 334"; Rec."Text Value 334")
                {
                    ToolTip = 'Specifies the value of the Value 334 field';
                    ApplicationArea = All;
                    Visible = FieldVisible333;
                    Editable = FieldEditable333;
                    trigger OnValidate()
                    begin
                        OnValidateField(333, Rec."Text Value 334");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(333, Rec."Text Value 334");
                    end;
                }
                field("Text Value 335"; Rec."Text Value 335")
                {
                    ToolTip = 'Specifies the value of the Value 335 field';
                    ApplicationArea = All;
                    Visible = FieldVisible334;
                    Editable = FieldEditable334;
                    trigger OnValidate()
                    begin
                        OnValidateField(334, Rec."Text Value 335");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(334, Rec."Text Value 335");
                    end;
                }
                field("Text Value 336"; Rec."Text Value 336")
                {
                    ToolTip = 'Specifies the value of the Value 336 field';
                    ApplicationArea = All;
                    Visible = FieldVisible335;
                    Editable = FieldEditable335;
                    trigger OnValidate()
                    begin
                        OnValidateField(335, Rec."Text Value 336");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(335, Rec."Text Value 336");
                    end;
                }
                field("Text Value 337"; Rec."Text Value 337")
                {
                    ToolTip = 'Specifies the value of the Value 337 field';
                    ApplicationArea = All;
                    Visible = FieldVisible336;
                    Editable = FieldEditable336;
                    trigger OnValidate()
                    begin
                        OnValidateField(336, Rec."Text Value 337");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(336, Rec."Text Value 337");
                    end;
                }
                field("Text Value 338"; Rec."Text Value 338")
                {
                    ToolTip = 'Specifies the value of the Value 338 field';
                    ApplicationArea = All;
                    Visible = FieldVisible337;
                    Editable = FieldEditable337;
                    trigger OnValidate()
                    begin
                        OnValidateField(337, Rec."Text Value 338");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(337, Rec."Text Value 338");
                    end;
                }
                field("Text Value 339"; Rec."Text Value 339")
                {
                    ToolTip = 'Specifies the value of the Value 339 field';
                    ApplicationArea = All;
                    Visible = FieldVisible338;
                    Editable = FieldEditable338;
                    trigger OnValidate()
                    begin
                        OnValidateField(338, Rec."Text Value 339");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(338, Rec."Text Value 339");
                    end;
                }
                field("Text Value 340"; Rec."Text Value 340")
                {
                    ToolTip = 'Specifies the value of the Value 340 field';
                    ApplicationArea = All;
                    Visible = FieldVisible339;
                    Editable = FieldEditable339;
                    trigger OnValidate()
                    begin
                        OnValidateField(339, Rec."Text Value 340");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(339, Rec."Text Value 340");
                    end;
                }
                field("Text Value 341"; Rec."Text Value 341")
                {
                    ToolTip = 'Specifies the value of the Value 341 field';
                    ApplicationArea = All;
                    Visible = FieldVisible340;
                    Editable = FieldEditable340;
                    trigger OnValidate()
                    begin
                        OnValidateField(340, Rec."Text Value 341");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(340, Rec."Text Value 341");
                    end;
                }
                field("Text Value 342"; Rec."Text Value 342")
                {
                    ToolTip = 'Specifies the value of the Value 342 field';
                    ApplicationArea = All;
                    Visible = FieldVisible341;
                    Editable = FieldEditable341;
                    trigger OnValidate()
                    begin
                        OnValidateField(341, Rec."Text Value 342");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(341, Rec."Text Value 342");
                    end;
                }
                field("Text Value 343"; Rec."Text Value 343")
                {
                    ToolTip = 'Specifies the value of the Value 343 field';
                    ApplicationArea = All;
                    Visible = FieldVisible342;
                    Editable = FieldEditable342;
                    trigger OnValidate()
                    begin
                        OnValidateField(342, Rec."Text Value 343");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(342, Rec."Text Value 343");
                    end;
                }
                field("Text Value 344"; Rec."Text Value 344")
                {
                    ToolTip = 'Specifies the value of the Value 344 field';
                    ApplicationArea = All;
                    Visible = FieldVisible343;
                    Editable = FieldEditable343;
                    trigger OnValidate()
                    begin
                        OnValidateField(343, Rec."Text Value 344");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(343, Rec."Text Value 344");
                    end;
                }
                field("Text Value 345"; Rec."Text Value 345")
                {
                    ToolTip = 'Specifies the value of the Value 345 field';
                    ApplicationArea = All;
                    Visible = FieldVisible344;
                    Editable = FieldEditable344;
                    trigger OnValidate()
                    begin
                        OnValidateField(344, Rec."Text Value 345");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(344, Rec."Text Value 345");
                    end;
                }
                field("Text Value 346"; Rec."Text Value 346")
                {
                    ToolTip = 'Specifies the value of the Value 346 field';
                    ApplicationArea = All;
                    Visible = FieldVisible345;
                    Editable = FieldEditable345;
                    trigger OnValidate()
                    begin
                        OnValidateField(345, Rec."Text Value 346");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(345, Rec."Text Value 346");
                    end;
                }
                field("Text Value 347"; Rec."Text Value 347")
                {
                    ToolTip = 'Specifies the value of the Value 347 field';
                    ApplicationArea = All;
                    Visible = FieldVisible346;
                    Editable = FieldEditable346;
                    trigger OnValidate()
                    begin
                        OnValidateField(346, Rec."Text Value 347");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(346, Rec."Text Value 347");
                    end;
                }
                field("Text Value 348"; Rec."Text Value 348")
                {
                    ToolTip = 'Specifies the value of the Value 348 field';
                    ApplicationArea = All;
                    Visible = FieldVisible347;
                    Editable = FieldEditable347;
                    trigger OnValidate()
                    begin
                        OnValidateField(347, Rec."Text Value 348");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(347, Rec."Text Value 348");
                    end;
                }
                field("Text Value 349"; Rec."Text Value 349")
                {
                    ToolTip = 'Specifies the value of the Value 349 field';
                    ApplicationArea = All;
                    Visible = FieldVisible348;
                    Editable = FieldEditable348;
                    trigger OnValidate()
                    begin
                        OnValidateField(348, Rec."Text Value 349");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(348, Rec."Text Value 349");
                    end;
                }
                field("Text Value 350"; Rec."Text Value 350")
                {
                    ToolTip = 'Specifies the value of the Value 350 field';
                    ApplicationArea = All;
                    Visible = FieldVisible349;
                    Editable = FieldEditable349;
                    trigger OnValidate()
                    begin
                        OnValidateField(349, Rec."Text Value 350");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(349, Rec."Text Value 350");
                    end;
                }
                field("Text Value 351"; Rec."Text Value 351")
                {
                    ToolTip = 'Specifies the value of the Value 351 field';
                    ApplicationArea = All;
                    Visible = FieldVisible350;
                    Editable = FieldEditable350;
                    trigger OnValidate()
                    begin
                        OnValidateField(350, Rec."Text Value 351");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(350, Rec."Text Value 351");
                    end;
                }
                field("Text Value 352"; Rec."Text Value 352")
                {
                    ToolTip = 'Specifies the value of the Value 352 field';
                    ApplicationArea = All;
                    Visible = FieldVisible351;
                    Editable = FieldEditable351;
                    trigger OnValidate()
                    begin
                        OnValidateField(351, Rec."Text Value 352");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(351, Rec."Text Value 352");
                    end;
                }
                field("Text Value 353"; Rec."Text Value 353")
                {
                    ToolTip = 'Specifies the value of the Value 353 field';
                    ApplicationArea = All;
                    Visible = FieldVisible352;
                    Editable = FieldEditable352;
                    trigger OnValidate()
                    begin
                        OnValidateField(352, Rec."Text Value 353");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(352, Rec."Text Value 353");
                    end;
                }
                field("Text Value 354"; Rec."Text Value 354")
                {
                    ToolTip = 'Specifies the value of the Value 354 field';
                    ApplicationArea = All;
                    Visible = FieldVisible353;
                    Editable = FieldEditable353;
                    trigger OnValidate()
                    begin
                        OnValidateField(353, Rec."Text Value 354");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(353, Rec."Text Value 354");
                    end;
                }
                field("Text Value 355"; Rec."Text Value 355")
                {
                    ToolTip = 'Specifies the value of the Value 355 field';
                    ApplicationArea = All;
                    Visible = FieldVisible354;
                    Editable = FieldEditable354;
                    trigger OnValidate()
                    begin
                        OnValidateField(354, Rec."Text Value 355");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(354, Rec."Text Value 355");
                    end;
                }
                field("Text Value 356"; Rec."Text Value 356")
                {
                    ToolTip = 'Specifies the value of the Value 356 field';
                    ApplicationArea = All;
                    Visible = FieldVisible355;
                    Editable = FieldEditable355;
                    trigger OnValidate()
                    begin
                        OnValidateField(355, Rec."Text Value 356");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(355, Rec."Text Value 356");
                    end;
                }
                field("Text Value 357"; Rec."Text Value 357")
                {
                    ToolTip = 'Specifies the value of the Value 357 field';
                    ApplicationArea = All;
                    Visible = FieldVisible356;
                    Editable = FieldEditable356;
                    trigger OnValidate()
                    begin
                        OnValidateField(356, Rec."Text Value 357");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(356, Rec."Text Value 357");
                    end;
                }
                field("Text Value 358"; Rec."Text Value 358")
                {
                    ToolTip = 'Specifies the value of the Value 358 field';
                    ApplicationArea = All;
                    Visible = FieldVisible357;
                    Editable = FieldEditable357;
                    trigger OnValidate()
                    begin
                        OnValidateField(357, Rec."Text Value 358");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(357, Rec."Text Value 358");
                    end;
                }
                field("Text Value 359"; Rec."Text Value 359")
                {
                    ToolTip = 'Specifies the value of the Value 359 field';
                    ApplicationArea = All;
                    Visible = FieldVisible358;
                    Editable = FieldEditable358;
                    trigger OnValidate()
                    begin
                        OnValidateField(358, Rec."Text Value 359");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(358, Rec."Text Value 359");
                    end;
                }
                field("Text Value 360"; Rec."Text Value 360")
                {
                    ToolTip = 'Specifies the value of the Value 360 field';
                    ApplicationArea = All;
                    Visible = FieldVisible359;
                    Editable = FieldEditable359;
                    trigger OnValidate()
                    begin
                        OnValidateField(359, Rec."Text Value 360");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(359, Rec."Text Value 360");
                    end;
                }
                field("Text Value 361"; Rec."Text Value 361")
                {
                    ToolTip = 'Specifies the value of the Value 361 field';
                    ApplicationArea = All;
                    Visible = FieldVisible360;
                    Editable = FieldEditable360;
                    trigger OnValidate()
                    begin
                        OnValidateField(360, Rec."Text Value 361");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(360, Rec."Text Value 361");
                    end;
                }
                field("Text Value 362"; Rec."Text Value 362")
                {
                    ToolTip = 'Specifies the value of the Value 362 field';
                    ApplicationArea = All;
                    Visible = FieldVisible361;
                    Editable = FieldEditable361;
                    trigger OnValidate()
                    begin
                        OnValidateField(361, Rec."Text Value 362");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(361, Rec."Text Value 362");
                    end;
                }
                field("Text Value 363"; Rec."Text Value 363")
                {
                    ToolTip = 'Specifies the value of the Value 363 field';
                    ApplicationArea = All;
                    Visible = FieldVisible362;
                    Editable = FieldEditable362;
                    trigger OnValidate()
                    begin
                        OnValidateField(362, Rec."Text Value 363");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(362, Rec."Text Value 363");
                    end;
                }
                field("Text Value 364"; Rec."Text Value 364")
                {
                    ToolTip = 'Specifies the value of the Value 364 field';
                    ApplicationArea = All;
                    Visible = FieldVisible363;
                    Editable = FieldEditable363;
                    trigger OnValidate()
                    begin
                        OnValidateField(363, Rec."Text Value 364");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(363, Rec."Text Value 364");
                    end;
                }
                field("Text Value 365"; Rec."Text Value 365")
                {
                    ToolTip = 'Specifies the value of the Value 365 field';
                    ApplicationArea = All;
                    Visible = FieldVisible364;
                    Editable = FieldEditable364;
                    trigger OnValidate()
                    begin
                        OnValidateField(364, Rec."Text Value 365");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(364, Rec."Text Value 365");
                    end;
                }
                field("Text Value 366"; Rec."Text Value 366")
                {
                    ToolTip = 'Specifies the value of the Value 366 field';
                    ApplicationArea = All;
                    Visible = FieldVisible365;
                    Editable = FieldEditable365;
                    trigger OnValidate()
                    begin
                        OnValidateField(365, Rec."Text Value 366");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(365, Rec."Text Value 366");
                    end;
                }
                field("Text Value 367"; Rec."Text Value 367")
                {
                    ToolTip = 'Specifies the value of the Value 367 field';
                    ApplicationArea = All;
                    Visible = FieldVisible366;
                    Editable = FieldEditable366;
                    trigger OnValidate()
                    begin
                        OnValidateField(366, Rec."Text Value 367");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(366, Rec."Text Value 367");
                    end;
                }
                field("Text Value 368"; Rec."Text Value 368")
                {
                    ToolTip = 'Specifies the value of the Value 368 field';
                    ApplicationArea = All;
                    Visible = FieldVisible367;
                    Editable = FieldEditable367;
                    trigger OnValidate()
                    begin
                        OnValidateField(367, Rec."Text Value 368");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(367, Rec."Text Value 368");
                    end;
                }
                field("Text Value 369"; Rec."Text Value 369")
                {
                    ToolTip = 'Specifies the value of the Value 369 field';
                    ApplicationArea = All;
                    Visible = FieldVisible368;
                    Editable = FieldEditable368;
                    trigger OnValidate()
                    begin
                        OnValidateField(368, Rec."Text Value 369");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(368, Rec."Text Value 369");
                    end;
                }
                field("Text Value 370"; Rec."Text Value 370")
                {
                    ToolTip = 'Specifies the value of the Value 370 field';
                    ApplicationArea = All;
                    Visible = FieldVisible369;
                    Editable = FieldEditable369;
                    trigger OnValidate()
                    begin
                        OnValidateField(369, Rec."Text Value 370");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(369, Rec."Text Value 370");
                    end;
                }
                field("Text Value 371"; Rec."Text Value 371")
                {
                    ToolTip = 'Specifies the value of the Value 371 field';
                    ApplicationArea = All;
                    Visible = FieldVisible370;
                    Editable = FieldEditable370;
                    trigger OnValidate()
                    begin
                        OnValidateField(370, Rec."Text Value 371");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(370, Rec."Text Value 371");
                    end;
                }
                field("Text Value 372"; Rec."Text Value 372")
                {
                    ToolTip = 'Specifies the value of the Value 372 field';
                    ApplicationArea = All;
                    Visible = FieldVisible371;
                    Editable = FieldEditable371;
                    trigger OnValidate()
                    begin
                        OnValidateField(371, Rec."Text Value 372");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(371, Rec."Text Value 372");
                    end;
                }
                field("Text Value 373"; Rec."Text Value 373")
                {
                    ToolTip = 'Specifies the value of the Value 373 field';
                    ApplicationArea = All;
                    Visible = FieldVisible372;
                    Editable = FieldEditable372;
                    trigger OnValidate()
                    begin
                        OnValidateField(372, Rec."Text Value 373");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(372, Rec."Text Value 373");
                    end;
                }
                field("Text Value 374"; Rec."Text Value 374")
                {
                    ToolTip = 'Specifies the value of the Value 374 field';
                    ApplicationArea = All;
                    Visible = FieldVisible373;
                    Editable = FieldEditable373;
                    trigger OnValidate()
                    begin
                        OnValidateField(373, Rec."Text Value 374");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(373, Rec."Text Value 374");
                    end;
                }
                field("Text Value 375"; Rec."Text Value 375")
                {
                    ToolTip = 'Specifies the value of the Value 375 field';
                    ApplicationArea = All;
                    Visible = FieldVisible374;
                    Editable = FieldEditable374;
                    trigger OnValidate()
                    begin
                        OnValidateField(374, Rec."Text Value 375");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(374, Rec."Text Value 375");
                    end;
                }
                field("Text Value 376"; Rec."Text Value 376")
                {
                    ToolTip = 'Specifies the value of the Value 376 field';
                    ApplicationArea = All;
                    Visible = FieldVisible375;
                    Editable = FieldEditable375;
                    trigger OnValidate()
                    begin
                        OnValidateField(375, Rec."Text Value 376");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(375, Rec."Text Value 376");
                    end;
                }
                field("Text Value 377"; Rec."Text Value 377")
                {
                    ToolTip = 'Specifies the value of the Value 377 field';
                    ApplicationArea = All;
                    Visible = FieldVisible376;
                    Editable = FieldEditable376;
                    trigger OnValidate()
                    begin
                        OnValidateField(376, Rec."Text Value 377");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(376, Rec."Text Value 377");
                    end;
                }
                field("Text Value 378"; Rec."Text Value 378")
                {
                    ToolTip = 'Specifies the value of the Value 378 field';
                    ApplicationArea = All;
                    Visible = FieldVisible377;
                    Editable = FieldEditable377;
                    trigger OnValidate()
                    begin
                        OnValidateField(377, Rec."Text Value 378");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(377, Rec."Text Value 378");
                    end;
                }
                field("Text Value 379"; Rec."Text Value 379")
                {
                    ToolTip = 'Specifies the value of the Value 379 field';
                    ApplicationArea = All;
                    Visible = FieldVisible378;
                    Editable = FieldEditable378;
                    trigger OnValidate()
                    begin
                        OnValidateField(378, Rec."Text Value 379");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(378, Rec."Text Value 379");
                    end;
                }
                field("Text Value 380"; Rec."Text Value 380")
                {
                    ToolTip = 'Specifies the value of the Value 380 field';
                    ApplicationArea = All;
                    Visible = FieldVisible379;
                    Editable = FieldEditable379;
                    trigger OnValidate()
                    begin
                        OnValidateField(379, Rec."Text Value 380");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(379, Rec."Text Value 380");
                    end;
                }
                field("Text Value 381"; Rec."Text Value 381")
                {
                    ToolTip = 'Specifies the value of the Value 381 field';
                    ApplicationArea = All;
                    Visible = FieldVisible380;
                    Editable = FieldEditable380;
                    trigger OnValidate()
                    begin
                        OnValidateField(380, Rec."Text Value 381");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(380, Rec."Text Value 381");
                    end;
                }
                field("Text Value 382"; Rec."Text Value 382")
                {
                    ToolTip = 'Specifies the value of the Value 382 field';
                    ApplicationArea = All;
                    Visible = FieldVisible381;
                    Editable = FieldEditable381;
                    trigger OnValidate()
                    begin
                        OnValidateField(381, Rec."Text Value 382");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(381, Rec."Text Value 382");
                    end;
                }
                field("Text Value 383"; Rec."Text Value 383")
                {
                    ToolTip = 'Specifies the value of the Value 383 field';
                    ApplicationArea = All;
                    Visible = FieldVisible382;
                    Editable = FieldEditable382;
                    trigger OnValidate()
                    begin
                        OnValidateField(382, Rec."Text Value 383");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(382, Rec."Text Value 383");
                    end;
                }
                field("Text Value 384"; Rec."Text Value 384")
                {
                    ToolTip = 'Specifies the value of the Value 384 field';
                    ApplicationArea = All;
                    Visible = FieldVisible383;
                    Editable = FieldEditable383;
                    trigger OnValidate()
                    begin
                        OnValidateField(383, Rec."Text Value 384");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(383, Rec."Text Value 384");
                    end;
                }
                field("Text Value 385"; Rec."Text Value 385")
                {
                    ToolTip = 'Specifies the value of the Value 385 field';
                    ApplicationArea = All;
                    Visible = FieldVisible384;
                    Editable = FieldEditable384;
                    trigger OnValidate()
                    begin
                        OnValidateField(384, Rec."Text Value 385");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(384, Rec."Text Value 385");
                    end;
                }
                field("Text Value 386"; Rec."Text Value 386")
                {
                    ToolTip = 'Specifies the value of the Value 386 field';
                    ApplicationArea = All;
                    Visible = FieldVisible385;
                    Editable = FieldEditable385;
                    trigger OnValidate()
                    begin
                        OnValidateField(385, Rec."Text Value 386");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(385, Rec."Text Value 386");
                    end;
                }
                field("Text Value 387"; Rec."Text Value 387")
                {
                    ToolTip = 'Specifies the value of the Value 387 field';
                    ApplicationArea = All;
                    Visible = FieldVisible386;
                    Editable = FieldEditable386;
                    trigger OnValidate()
                    begin
                        OnValidateField(386, Rec."Text Value 387");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(386, Rec."Text Value 387");
                    end;
                }
                field("Text Value 388"; Rec."Text Value 388")
                {
                    ToolTip = 'Specifies the value of the Value 388 field';
                    ApplicationArea = All;
                    Visible = FieldVisible387;
                    Editable = FieldEditable387;
                    trigger OnValidate()
                    begin
                        OnValidateField(387, Rec."Text Value 388");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(387, Rec."Text Value 388");
                    end;
                }
                field("Text Value 389"; Rec."Text Value 389")
                {
                    ToolTip = 'Specifies the value of the Value 389 field';
                    ApplicationArea = All;
                    Visible = FieldVisible388;
                    Editable = FieldEditable388;
                    trigger OnValidate()
                    begin
                        OnValidateField(388, Rec."Text Value 389");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(388, Rec."Text Value 389");
                    end;
                }
                field("Text Value 390"; Rec."Text Value 390")
                {
                    ToolTip = 'Specifies the value of the Value 390 field';
                    ApplicationArea = All;
                    Visible = FieldVisible389;
                    Editable = FieldEditable389;
                    trigger OnValidate()
                    begin
                        OnValidateField(389, Rec."Text Value 390");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(389, Rec."Text Value 390");
                    end;
                }
                field("Text Value 391"; Rec."Text Value 391")
                {
                    ToolTip = 'Specifies the value of the Value 391 field';
                    ApplicationArea = All;
                    Visible = FieldVisible390;
                    Editable = FieldEditable390;
                    trigger OnValidate()
                    begin
                        OnValidateField(390, Rec."Text Value 391");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(390, Rec."Text Value 391");
                    end;
                }
                field("Text Value 392"; Rec."Text Value 392")
                {
                    ToolTip = 'Specifies the value of the Value 392 field';
                    ApplicationArea = All;
                    Visible = FieldVisible391;
                    Editable = FieldEditable391;
                    trigger OnValidate()
                    begin
                        OnValidateField(391, Rec."Text Value 392");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(391, Rec."Text Value 392");
                    end;
                }
                field("Text Value 393"; Rec."Text Value 393")
                {
                    ToolTip = 'Specifies the value of the Value 393 field';
                    ApplicationArea = All;
                    Visible = FieldVisible392;
                    Editable = FieldEditable392;
                    trigger OnValidate()
                    begin
                        OnValidateField(392, Rec."Text Value 393");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(392, Rec."Text Value 393");
                    end;
                }
                field("Text Value 394"; Rec."Text Value 394")
                {
                    ToolTip = 'Specifies the value of the Value 394 field';
                    ApplicationArea = All;
                    Visible = FieldVisible393;
                    Editable = FieldEditable393;
                    trigger OnValidate()
                    begin
                        OnValidateField(393, Rec."Text Value 394");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(393, Rec."Text Value 394");
                    end;
                }
                field("Text Value 395"; Rec."Text Value 395")
                {
                    ToolTip = 'Specifies the value of the Value 395 field';
                    ApplicationArea = All;
                    Visible = FieldVisible394;
                    Editable = FieldEditable394;
                    trigger OnValidate()
                    begin
                        OnValidateField(394, Rec."Text Value 395");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(394, Rec."Text Value 395");
                    end;
                }
                field("Text Value 396"; Rec."Text Value 396")
                {
                    ToolTip = 'Specifies the value of the Value 396 field';
                    ApplicationArea = All;
                    Visible = FieldVisible395;
                    Editable = FieldEditable395;
                    trigger OnValidate()
                    begin
                        OnValidateField(395, Rec."Text Value 396");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(395, Rec."Text Value 396");
                    end;
                }
                field("Text Value 397"; Rec."Text Value 397")
                {
                    ToolTip = 'Specifies the value of the Value 397 field';
                    ApplicationArea = All;
                    Visible = FieldVisible396;
                    Editable = FieldEditable396;
                    trigger OnValidate()
                    begin
                        OnValidateField(396, Rec."Text Value 397");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(396, Rec."Text Value 397");
                    end;
                }
                field("Text Value 398"; Rec."Text Value 398")
                {
                    ToolTip = 'Specifies the value of the Value 398 field';
                    ApplicationArea = All;
                    Visible = FieldVisible397;
                    Editable = FieldEditable397;
                    trigger OnValidate()
                    begin
                        OnValidateField(397, Rec."Text Value 398");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(397, Rec."Text Value 398");
                    end;
                }
                field("Text Value 399"; Rec."Text Value 399")
                {
                    ToolTip = 'Specifies the value of the Value 399 field';
                    ApplicationArea = All;
                    Visible = FieldVisible398;
                    Editable = FieldEditable398;
                    trigger OnValidate()
                    begin
                        OnValidateField(398, Rec."Text Value 399");
                    end;

                    trigger OnDrillDown()
                    begin
                        OnDrillDownField(398, Rec."Text Value 399");
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(InsertNew)
            {
                ApplicationArea = All;
                Image = Add;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Insert new record';
                ToolTip = 'Insert new record';
                trigger OnAction()
                begin
                    InsertNewRecord();
                end;
            }
            action("DET Delete Selected")
            {
                ApplicationArea = All;
                Image = Delete;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Delete Selected';
                ToolTip = 'Delete Selected';
                trigger OnAction()
                var
                    DataEditorBuffer: Record "DET Data Editor Buffer";
                begin
                    DataEditorBuffer.CopyFilters(Rec);
                    CurrPage.SetSelectionFilter(Rec);
                    if Rec.FindSet() then
                        repeat
                            DeleteSourceRecord(Rec."Source Record ID");
                            Rec.Delete();
                        until Rec.Next() = 0;
                    Rec.Reset();
                    Rec.CopyFilters(DataEditorBuffer);
                end;
            }
            action("DET Update Column")
            {
                ApplicationArea = All;
                Image = Column;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Update Column';
                ToolTip = 'Update Column';
                trigger OnAction()
                begin
                    UpdateColumn();
                end;
            }
            action("DET Copy Column To Column")
            {
                ApplicationArea = All;
                Image = Column;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Copy Column To Column';
                ToolTip = 'Copy Column To Column';
                trigger OnAction()
                begin
                    CopyColumnToColumn();
                end;
            }
            action("DET Sort")
            {
                ApplicationArea = All;
                Image = SortAscending;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Sort';
                ToolTip = 'Sort';
                trigger OnAction()
                begin
                    SetCustomSort();
                end;
            }
            action("DET Find & Replace")
            {
                ApplicationArea = All;
                Image = Find;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Find & Replace';
                ToolTip = 'Find & Replace';
                trigger OnAction()
                begin
                    FindAndReplace();
                end;
            }
            action(Refresh)
            {
                ApplicationArea = All;
                Image = Refresh;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Refresh';
                ToolTip = 'Refresh this page with current filters';

                trigger OnAction()
                begin
                    LoadData();
                end;
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        DeleteSourceRecord(Rec."Source Record ID");
    end;

    local procedure FindAndReplace()
    var
        FindAndReplacePage: Page "DET Find and Replace";
    begin
        FindAndReplacePage.SetRecordInfo(RecRef.Number(), RecRef.Name(), WithoutValidate, RecRef.GetView());
        FindAndReplacePage.RunModal();
        LoadData();
    end;

    local procedure UpdateColumn()
    var
        TempDETField: Record "DET Field" temporary;
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
        SelectFields: Page "DET Select Fields";
        RecRefDuplicate: RecordRef;
        NewFieldRef: FieldRef;
        FieldRefVar: FieldRef;
    begin
        if RecRef.Number() = 0 then
            exit;
        SelectFields.SetOneFieldMode(true);
        SelectFields.SetFilterOnlyNormalFields(true);
        SelectFields.SetShowOnlyFilteredFields(true);
        SelectFields.LoadFields(RecRef.Number(), FieldFilter);
        SelectFields.LookupMode(true);
        SelectFields.Editable(true);
        if SelectFields.RunModal() <> Action::LookupOK then
            exit;
        SelectFields.GetRecord(TempDETField);
        RecRefDuplicate := RecRef.Duplicate();
        NewFieldRef := RecRefDuplicate.Field(TempDETField."Field Id");
        if not DataEditorMgt.GetNewColumnValue(RecRef, NewFieldRef, Rec."Source Record ID", TempNameValueBuffer) then
            exit;
        if not Confirm(ColumnUpdateConfirmLbl, false, TempDETField.Name, Rec.Count(), RecRef.Name()) then
            exit;
        if Rec.FindSet() then
            repeat
                RecRef.Get(Rec."Source Record ID");
                FieldRefVar := RecRef.Field(TempDETField."Field Id");
                FieldRefVar.Value(NewFieldRef.Value());
                if not WithoutValidate then
                    FieldRefVar.Validate();
                RecRef.Modify(not WithoutValidate);
            until Rec.Next() = 0;
        LoadData();
    end;

    local procedure CopyColumnToColumn()
    var
        TempDETField: Record "DET Field" temporary;
        SelectFields: Page "DET Select Fields";
        RecRefDuplicate: RecordRef;
        CopyFromFieldRef: FieldRef;
        CopyToFieldRef: FieldRef;
        CopyToFieldNo, CopyFromFieldNo : Integer;
    begin
        if RecRef.Number() = 0 then
            exit;
        SelectFields.Caption('Copy From Column');
        SelectFields.SetOneFieldMode(true);
        SelectFields.SetFilterOnlyNormalFields(true);
        SelectFields.SetShowOnlyFilteredFields(true);
        SelectFields.LoadFields(RecRef.Number(), FieldFilter);
        SelectFields.LookupMode(true);
        SelectFields.Editable(true);
        if SelectFields.RunModal() <> Action::LookupOK then
            exit;
        SelectFields.GetRecord(TempDETField);
        RecRefDuplicate := RecRef.Duplicate();
        CopyFromFieldRef := RecRefDuplicate.Field(TempDETField."Field Id");

        Clear(TempDETField);
        Clear(SelectFields);
        SelectFields.Caption('Copy To Column');
        SelectFields.SetOneFieldMode(true);
        SelectFields.SetFilterOnlyNormalFields(true);
        SelectFields.SetShowOnlyFilteredFields(true);
        SelectFields.LoadFields(RecRef.Number(), FieldFilter);
        SelectFields.LookupMode(true);
        SelectFields.Editable(true);
        if SelectFields.RunModal() <> Action::LookupOK then
            exit;
        SelectFields.GetRecord(TempDETField);
        RecRefDuplicate := RecRef.Duplicate();
        CopyToFieldRef := RecRefDuplicate.Field(TempDETField."Field Id");

        if not Confirm(ColumnCopyToConfirmLbl, false, CopyFromFieldRef.Caption(), CopyToFieldRef.Caption(), Rec.Count(), RecRef.Name()) then
            exit;

        CopyFromFieldNo := CopyFromFieldRef.Number();
        CopyToFieldNo := CopyToFieldRef.Number();

        if Rec.FindSet() then
            repeat
                RecRef.Get(Rec."Source Record ID");
                CopyFromFieldRef := RecRef.Field(CopyFromFieldNo);
                CopyToFieldRef := RecRef.Field(CopyToFieldNo);
                CopyToFieldRef.Value(CopyFromFieldRef.Value());
                if not WithoutValidate then
                    CopyToFieldRef.Validate();
                RecRef.Modify(not WithoutValidate);
            until Rec.Next() = 0;
        LoadData();
    end;

    local procedure SetCustomSort()
    var
        KeyRec: Record "Key";
        PageKey: Page "DET Key";
    begin
        KeyRec.SetRange(Enabled, true);
        KeyRec.SetRange(TableNo, RecRef.Number());
        PageKey.SetTableView(KeyRec);
        PageKey.LookupMode(true);
        if not (PageKey.RunModal() in [Action::LookupOK, Action::OK]) then
            exit;
        PageKey.GetRecord(KeyRec);
        RecRef.CurrentKeyIndex(KeyRec."No.");
        CustomTableView := RecRef.GetView();
        LoadData();
    end;

    local procedure InsertNewRecord()
    var
        InsertNewRecordPage: Page "DET Insert New Record";
        NewRecordId: RecordId;
    begin
        InsertNewRecordPage.SetInitData(RecRef.Number(), WithoutValidate);
        if not (InsertNewRecordPage.RunModal() in [Action::LookupOK, Action::OK]) then
            exit;
        NewRecordId := InsertNewRecordPage.GetResultRecordID();
        LoadData();
        Rec.SetRange("Source Record ID", NewRecordId);
        Rec.FindFirst();
        Rec.SetPosition(Rec.GetPosition());
        Rec.SetRange("Source Record ID");
        Message(RecordIsInsertedLbl, NewRecordId);
    end;

    local procedure DeleteSourceRecord(SourceRecordID: RecordId)
    var
        SourceRecRef: RecordRef;
    begin
        if SourceRecRef.Get(SourceRecordID) then
            SourceRecRef.Delete(not WithoutValidate);
    end;

    procedure LoadRecords(TableNo: Integer; inCustomTableView: Text; inFieldFilter: Text; inWithoutValidate: Boolean; inExcludeFlowFields: Boolean)
    begin
        WithoutValidate := inWithoutValidate;
        ExcludeFlowFields := inExcludeFlowFields;
        CustomTableView := inCustomTableView;
        FieldFilter := inFieldFilter;
        OpenRecord(TableNo);
        InitVisibility();
        InitEditable();
        LoadData();
    end;

    local procedure OpenRecord(TableNo: Integer)
    var
        FieldRec: Record Field;
        FieldRefVar: FieldRef;
        SkipField: Boolean;
        Counter: Integer;
        FieldID: Integer;
        FieldInfoDictionaty: Dictionary of [Integer, Text];
        StartBufferFieldNo: Integer;
    begin
        RecRef.Open(TableNo);
        CurrPage.Caption(RecRef.Caption());
        StartBufferFieldNo := Rec.FieldNo("Text Value 2");
        FieldRec.FilterGroup(10);
        FieldRec.SetFilter("No.", FieldFilter);
        FieldRec.FilterGroup(0);
        for FieldID := 1 to RecRef.FieldCount() do begin
            FieldRefVar := RecRef.FieldIndex(FieldID);
            FieldRec.SetRange("No.", FieldRefVar.Number());
            SkipField := (FieldRefVar.Class() = FieldClass::FlowFilter) or
                    ((FieldRefVar.Class() = FieldClass::FlowField) and ExcludeFlowFields) or
                    (FieldRec.IsEmpty);
            if not SkipField then begin
                Counter += 1;
                FieldInfoDictionaty.Add(FieldRefVar.Number(), Format(FieldRefVar.Type()));
                GenFieldInfoDict.Add(Counter, FieldInfoDictionaty);
                CaptionDictionary.Add(StartBufferFieldNo, FieldRefVar.Caption());
                StartBufferFieldNo += 1;
                Clear(FieldInfoDictionaty);
            end;
        end;
        InitFieldsCaptions(CaptionDictionary);
    end;

    local procedure InitFieldsCaptions(inCaptionDictionary: Dictionary of [Integer, Text])
    var
        SingleInstanceStorage: Codeunit "DET Single Instance Storage";
    begin
        SingleInstanceStorage.SetCaptionDictionary(inCaptionDictionary);
    end;

    local procedure LoadData()
    var
        TempRecRef: RecordRef;
        FieldRefVar: FieldRef;
        FieldRefVar2: FieldRef;
        FieldInfoDictionaty: Dictionary of [Integer, Text];
        Counter: Integer;
        FieldNumber: Integer;
        FieldCount: Integer;
        EntryNo: Integer;
    begin
        TempRecRef.GetTable(Rec);
        if CustomTableView <> '' then
            RecRef.SetView(CustomTableView);
        if RecRef.FindSet() then
            repeat
                FieldCount := 0;
                Counter := 0;
                EntryNo += 1;
                TempRecRef.Init();
                FieldRefVar2 := TempRecRef.FieldIndex(1);
                FieldRefVar2.Value(EntryNo);
                FieldRefVar2 := TempRecRef.FieldIndex(2);
                FieldRefVar2.Value(RecRef.RecordId());

                for FieldCount := 1 to GenFieldInfoDict.Count() do begin
                    FieldInfoDictionaty := GenFieldInfoDict.Get(FieldCount);
                    foreach FieldNumber in FieldInfoDictionaty.Keys() do begin
                        Counter += 1;
                        FieldRefVar := RecRef.Field(FieldNumber);
                        if FieldRefVar.Class() = FieldClass::FlowField then
                            FieldRefVar.CalcField();

                        FieldRefVar2 := TempRecRef.FieldIndex(Counter + 2);
                        FieldRefVar2.Value(FieldRefVar.Value());
                    end;
                end;

                if not TempRecRef.Insert() then
                    TempRecRef.Modify();
            until RecRef.Next() = 0;

    end;

    local procedure OnValidateField(FieldCounter: Integer; NewValue: Text[2048])
    var
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
        FieldRefVar: FieldRef;
        FieldInfo: Dictionary of [Integer, Text];
        OriginalFieldNo: Integer;
    begin
        if not RecRef.Get(Rec."Source Record ID") then
            exit;
        GenFieldInfoDict.Get(FieldCounter, FieldInfo);
        foreach OriginalFieldNo in FieldInfo.Keys() do
            FieldRefVar := RecRef.Field(OriginalFieldNo);

        if DataEditorMgt.IsFieldIsPartOfPK(RecRef, FieldRefVar) then begin
            DataEditorMgt.RenamePKField(RecRef, FieldRefVar, Rec."Source Record ID", NewValue);
            exit;
        end;

        FieldRefVar.Value(TextValueAsVariant(FieldRefVar.Type(), NewValue));
        if not WithoutValidate then
            FieldRefVar.Validate();
        RecRef.Modify(not WithoutValidate);

    end;

    local procedure OnDrillDownField(FieldCounter: Integer; var NewValue: Text[2048])
    var
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
        FieldRefVar: FieldRef;
        FieldInfo: Dictionary of [Integer, Text];
        OriginalFieldNo: Integer;
    begin
        if not RecRef.Get(Rec."Source Record ID") then
            exit;
        GenFieldInfoDict.Get(FieldCounter, FieldInfo);
        OriginalFieldNo := FieldInfo.Keys.Get(FieldInfo.Count());
        FieldRefVar := RecRef.Field(OriginalFieldNo);

        if not DataEditorMgt.GetNewColumnValue(RecRef, FieldRefVar, Rec."Source Record ID", TempNameValueBuffer) then
            exit;

        if not WithoutValidate then
            FieldRefVar.Validate();
        RecRef.Modify(not WithoutValidate);

        if FieldRefVar.Type() = FieldRefVar.Type::Option then
            NewValue := TempNameValueBuffer.Value
        else
            NewValue := format(FieldRefVar.Value());
    end;

    procedure TextValueAsVariant(FieldTypeVar: FieldType; ValueAsText: Text[2048]): Variant
    var
        DateFormulaValue: DateFormula;
        IntegerValue: Integer;
        DecimalValue: Decimal;
        BooleanValue: Boolean;
        DateValue: Date;
        DateTimeValue: DateTime;
        TimeValue: Time;
        GuidValue: Guid;
        BigIntegerValue: BigInteger;
    begin
        case FieldTypeVar of
            FieldTypeVar::Code, FieldTypeVar::Text:
                exit(ValueAsText);
            FieldTypeVar::Integer:
                begin
                    Evaluate(IntegerValue, ValueAsText);
                    exit(IntegerValue);
                end;
            FieldTypeVar::Decimal:
                begin
                    Evaluate(DecimalValue, ValueAsText);
                    exit(DecimalValue);
                end;
            FieldTypeVar::Boolean:
                begin
                    Evaluate(BooleanValue, ValueAsText);
                    exit(BooleanValue);
                end;
            FieldTypeVar::Date:
                begin
                    Evaluate(DateValue, ValueAsText);
                    exit(DateValue);
                end;
            FieldTypeVar::DateFormula:
                begin
                    Evaluate(DateFormulaValue, ValueAsText);
                    exit(DateFormulaValue);
                end;
            FieldTypeVar::DateTime:
                begin
                    Evaluate(DateTimeValue, ValueAsText);
                    exit(DateTimeValue);
                end;
            FieldTypeVar::Time:
                begin
                    Evaluate(TimeValue, ValueAsText);
                    exit(TimeValue);
                end;
            FieldTypeVar::Guid:
                begin
                    Evaluate(GuidValue, ValueAsText);
                    exit(GuidValue);
                end;
            FieldTypeVar::BigInteger:
                begin
                    Evaluate(BigIntegerValue, ValueAsText);
                    exit(BigIntegerValue);
                end;
            FieldTypeVar::Option:
                begin
                    Evaluate(IntegerValue, ValueAsText);
                    exit(IntegerValue);
                end;
            else
                exit(ValueAsText);
        end;
    end;

    local procedure InitVisibility()
    begin
        FieldVisible1 := GenFieldInfoDict.ContainsKey(1);
        FieldVisible2 := GenFieldInfoDict.ContainsKey(2);
        FieldVisible3 := GenFieldInfoDict.ContainsKey(3);
        FieldVisible4 := GenFieldInfoDict.ContainsKey(4);
        FieldVisible5 := GenFieldInfoDict.ContainsKey(5);
        FieldVisible6 := GenFieldInfoDict.ContainsKey(6);
        FieldVisible7 := GenFieldInfoDict.ContainsKey(7);
        FieldVisible8 := GenFieldInfoDict.ContainsKey(8);
        FieldVisible9 := GenFieldInfoDict.ContainsKey(9);
        FieldVisible10 := GenFieldInfoDict.ContainsKey(10);
        FieldVisible11 := GenFieldInfoDict.ContainsKey(11);
        FieldVisible12 := GenFieldInfoDict.ContainsKey(12);
        FieldVisible13 := GenFieldInfoDict.ContainsKey(13);
        FieldVisible14 := GenFieldInfoDict.ContainsKey(14);
        FieldVisible15 := GenFieldInfoDict.ContainsKey(15);
        FieldVisible16 := GenFieldInfoDict.ContainsKey(16);
        FieldVisible17 := GenFieldInfoDict.ContainsKey(17);
        FieldVisible18 := GenFieldInfoDict.ContainsKey(18);
        FieldVisible19 := GenFieldInfoDict.ContainsKey(19);
        FieldVisible20 := GenFieldInfoDict.ContainsKey(20);
        FieldVisible21 := GenFieldInfoDict.ContainsKey(21);
        FieldVisible22 := GenFieldInfoDict.ContainsKey(22);
        FieldVisible23 := GenFieldInfoDict.ContainsKey(23);
        FieldVisible24 := GenFieldInfoDict.ContainsKey(24);
        FieldVisible25 := GenFieldInfoDict.ContainsKey(25);
        FieldVisible26 := GenFieldInfoDict.ContainsKey(26);
        FieldVisible27 := GenFieldInfoDict.ContainsKey(27);
        FieldVisible28 := GenFieldInfoDict.ContainsKey(28);
        FieldVisible29 := GenFieldInfoDict.ContainsKey(29);
        FieldVisible30 := GenFieldInfoDict.ContainsKey(30);
        FieldVisible31 := GenFieldInfoDict.ContainsKey(31);
        FieldVisible32 := GenFieldInfoDict.ContainsKey(32);
        FieldVisible33 := GenFieldInfoDict.ContainsKey(33);
        FieldVisible34 := GenFieldInfoDict.ContainsKey(34);
        FieldVisible35 := GenFieldInfoDict.ContainsKey(35);
        FieldVisible36 := GenFieldInfoDict.ContainsKey(36);
        FieldVisible37 := GenFieldInfoDict.ContainsKey(37);
        FieldVisible38 := GenFieldInfoDict.ContainsKey(38);
        FieldVisible39 := GenFieldInfoDict.ContainsKey(39);
        FieldVisible40 := GenFieldInfoDict.ContainsKey(40);
        FieldVisible41 := GenFieldInfoDict.ContainsKey(41);
        FieldVisible42 := GenFieldInfoDict.ContainsKey(42);
        FieldVisible43 := GenFieldInfoDict.ContainsKey(43);
        FieldVisible44 := GenFieldInfoDict.ContainsKey(44);
        FieldVisible45 := GenFieldInfoDict.ContainsKey(45);
        FieldVisible46 := GenFieldInfoDict.ContainsKey(46);
        FieldVisible47 := GenFieldInfoDict.ContainsKey(47);
        FieldVisible48 := GenFieldInfoDict.ContainsKey(48);
        FieldVisible49 := GenFieldInfoDict.ContainsKey(49);
        FieldVisible50 := GenFieldInfoDict.ContainsKey(50);
        FieldVisible51 := GenFieldInfoDict.ContainsKey(51);
        FieldVisible52 := GenFieldInfoDict.ContainsKey(52);
        FieldVisible53 := GenFieldInfoDict.ContainsKey(53);
        FieldVisible54 := GenFieldInfoDict.ContainsKey(54);
        FieldVisible55 := GenFieldInfoDict.ContainsKey(55);
        FieldVisible56 := GenFieldInfoDict.ContainsKey(56);
        FieldVisible57 := GenFieldInfoDict.ContainsKey(57);
        FieldVisible58 := GenFieldInfoDict.ContainsKey(58);
        FieldVisible59 := GenFieldInfoDict.ContainsKey(59);
        FieldVisible60 := GenFieldInfoDict.ContainsKey(60);
        FieldVisible61 := GenFieldInfoDict.ContainsKey(61);
        FieldVisible62 := GenFieldInfoDict.ContainsKey(62);
        FieldVisible63 := GenFieldInfoDict.ContainsKey(63);
        FieldVisible64 := GenFieldInfoDict.ContainsKey(64);
        FieldVisible65 := GenFieldInfoDict.ContainsKey(65);
        FieldVisible66 := GenFieldInfoDict.ContainsKey(66);
        FieldVisible67 := GenFieldInfoDict.ContainsKey(67);
        FieldVisible68 := GenFieldInfoDict.ContainsKey(68);
        FieldVisible69 := GenFieldInfoDict.ContainsKey(69);
        FieldVisible70 := GenFieldInfoDict.ContainsKey(70);
        FieldVisible71 := GenFieldInfoDict.ContainsKey(71);
        FieldVisible72 := GenFieldInfoDict.ContainsKey(72);
        FieldVisible73 := GenFieldInfoDict.ContainsKey(73);
        FieldVisible74 := GenFieldInfoDict.ContainsKey(74);
        FieldVisible75 := GenFieldInfoDict.ContainsKey(75);
        FieldVisible76 := GenFieldInfoDict.ContainsKey(76);
        FieldVisible77 := GenFieldInfoDict.ContainsKey(77);
        FieldVisible78 := GenFieldInfoDict.ContainsKey(78);
        FieldVisible79 := GenFieldInfoDict.ContainsKey(79);
        FieldVisible80 := GenFieldInfoDict.ContainsKey(80);
        FieldVisible81 := GenFieldInfoDict.ContainsKey(81);
        FieldVisible82 := GenFieldInfoDict.ContainsKey(82);
        FieldVisible83 := GenFieldInfoDict.ContainsKey(83);
        FieldVisible84 := GenFieldInfoDict.ContainsKey(84);
        FieldVisible85 := GenFieldInfoDict.ContainsKey(85);
        FieldVisible86 := GenFieldInfoDict.ContainsKey(86);
        FieldVisible87 := GenFieldInfoDict.ContainsKey(87);
        FieldVisible88 := GenFieldInfoDict.ContainsKey(88);
        FieldVisible89 := GenFieldInfoDict.ContainsKey(89);
        FieldVisible90 := GenFieldInfoDict.ContainsKey(90);
        FieldVisible91 := GenFieldInfoDict.ContainsKey(91);
        FieldVisible92 := GenFieldInfoDict.ContainsKey(92);
        FieldVisible93 := GenFieldInfoDict.ContainsKey(93);
        FieldVisible94 := GenFieldInfoDict.ContainsKey(94);
        FieldVisible95 := GenFieldInfoDict.ContainsKey(95);
        FieldVisible96 := GenFieldInfoDict.ContainsKey(96);
        FieldVisible97 := GenFieldInfoDict.ContainsKey(97);
        FieldVisible98 := GenFieldInfoDict.ContainsKey(98);
        FieldVisible99 := GenFieldInfoDict.ContainsKey(99);
        FieldVisible100 := GenFieldInfoDict.ContainsKey(100);
        FieldVisible101 := GenFieldInfoDict.ContainsKey(101);
        FieldVisible102 := GenFieldInfoDict.ContainsKey(102);
        FieldVisible103 := GenFieldInfoDict.ContainsKey(103);
        FieldVisible104 := GenFieldInfoDict.ContainsKey(104);
        FieldVisible105 := GenFieldInfoDict.ContainsKey(105);
        FieldVisible106 := GenFieldInfoDict.ContainsKey(106);
        FieldVisible107 := GenFieldInfoDict.ContainsKey(107);
        FieldVisible108 := GenFieldInfoDict.ContainsKey(108);
        FieldVisible109 := GenFieldInfoDict.ContainsKey(109);
        FieldVisible110 := GenFieldInfoDict.ContainsKey(110);
        FieldVisible111 := GenFieldInfoDict.ContainsKey(111);
        FieldVisible112 := GenFieldInfoDict.ContainsKey(112);
        FieldVisible113 := GenFieldInfoDict.ContainsKey(113);
        FieldVisible114 := GenFieldInfoDict.ContainsKey(114);
        FieldVisible115 := GenFieldInfoDict.ContainsKey(115);
        FieldVisible116 := GenFieldInfoDict.ContainsKey(116);
        FieldVisible117 := GenFieldInfoDict.ContainsKey(117);
        FieldVisible118 := GenFieldInfoDict.ContainsKey(118);
        FieldVisible119 := GenFieldInfoDict.ContainsKey(119);
        FieldVisible120 := GenFieldInfoDict.ContainsKey(120);
        FieldVisible121 := GenFieldInfoDict.ContainsKey(121);
        FieldVisible122 := GenFieldInfoDict.ContainsKey(122);
        FieldVisible123 := GenFieldInfoDict.ContainsKey(123);
        FieldVisible124 := GenFieldInfoDict.ContainsKey(124);
        FieldVisible125 := GenFieldInfoDict.ContainsKey(125);
        FieldVisible126 := GenFieldInfoDict.ContainsKey(126);
        FieldVisible127 := GenFieldInfoDict.ContainsKey(127);
        FieldVisible128 := GenFieldInfoDict.ContainsKey(128);
        FieldVisible129 := GenFieldInfoDict.ContainsKey(129);
        FieldVisible130 := GenFieldInfoDict.ContainsKey(130);
        FieldVisible131 := GenFieldInfoDict.ContainsKey(131);
        FieldVisible132 := GenFieldInfoDict.ContainsKey(132);
        FieldVisible133 := GenFieldInfoDict.ContainsKey(133);
        FieldVisible134 := GenFieldInfoDict.ContainsKey(134);
        FieldVisible135 := GenFieldInfoDict.ContainsKey(135);
        FieldVisible136 := GenFieldInfoDict.ContainsKey(136);
        FieldVisible137 := GenFieldInfoDict.ContainsKey(137);
        FieldVisible138 := GenFieldInfoDict.ContainsKey(138);
        FieldVisible139 := GenFieldInfoDict.ContainsKey(139);
        FieldVisible140 := GenFieldInfoDict.ContainsKey(140);
        FieldVisible141 := GenFieldInfoDict.ContainsKey(141);
        FieldVisible142 := GenFieldInfoDict.ContainsKey(142);
        FieldVisible143 := GenFieldInfoDict.ContainsKey(143);
        FieldVisible144 := GenFieldInfoDict.ContainsKey(144);
        FieldVisible145 := GenFieldInfoDict.ContainsKey(145);
        FieldVisible146 := GenFieldInfoDict.ContainsKey(146);
        FieldVisible147 := GenFieldInfoDict.ContainsKey(147);
        FieldVisible148 := GenFieldInfoDict.ContainsKey(148);
        FieldVisible149 := GenFieldInfoDict.ContainsKey(149);
        FieldVisible150 := GenFieldInfoDict.ContainsKey(150);
        FieldVisible151 := GenFieldInfoDict.ContainsKey(151);
        FieldVisible152 := GenFieldInfoDict.ContainsKey(152);
        FieldVisible153 := GenFieldInfoDict.ContainsKey(153);
        FieldVisible154 := GenFieldInfoDict.ContainsKey(154);
        FieldVisible155 := GenFieldInfoDict.ContainsKey(155);
        FieldVisible156 := GenFieldInfoDict.ContainsKey(156);
        FieldVisible157 := GenFieldInfoDict.ContainsKey(157);
        FieldVisible158 := GenFieldInfoDict.ContainsKey(158);
        FieldVisible159 := GenFieldInfoDict.ContainsKey(159);
        FieldVisible160 := GenFieldInfoDict.ContainsKey(160);
        FieldVisible161 := GenFieldInfoDict.ContainsKey(161);
        FieldVisible162 := GenFieldInfoDict.ContainsKey(162);
        FieldVisible163 := GenFieldInfoDict.ContainsKey(163);
        FieldVisible164 := GenFieldInfoDict.ContainsKey(164);
        FieldVisible165 := GenFieldInfoDict.ContainsKey(165);
        FieldVisible166 := GenFieldInfoDict.ContainsKey(166);
        FieldVisible167 := GenFieldInfoDict.ContainsKey(167);
        FieldVisible168 := GenFieldInfoDict.ContainsKey(168);
        FieldVisible169 := GenFieldInfoDict.ContainsKey(169);
        FieldVisible170 := GenFieldInfoDict.ContainsKey(170);
        FieldVisible171 := GenFieldInfoDict.ContainsKey(171);
        FieldVisible172 := GenFieldInfoDict.ContainsKey(172);
        FieldVisible173 := GenFieldInfoDict.ContainsKey(173);
        FieldVisible174 := GenFieldInfoDict.ContainsKey(174);
        FieldVisible175 := GenFieldInfoDict.ContainsKey(175);
        FieldVisible176 := GenFieldInfoDict.ContainsKey(176);
        FieldVisible177 := GenFieldInfoDict.ContainsKey(177);
        FieldVisible178 := GenFieldInfoDict.ContainsKey(178);
        FieldVisible179 := GenFieldInfoDict.ContainsKey(179);
        FieldVisible180 := GenFieldInfoDict.ContainsKey(180);
        FieldVisible181 := GenFieldInfoDict.ContainsKey(181);
        FieldVisible182 := GenFieldInfoDict.ContainsKey(182);
        FieldVisible183 := GenFieldInfoDict.ContainsKey(183);
        FieldVisible184 := GenFieldInfoDict.ContainsKey(184);
        FieldVisible185 := GenFieldInfoDict.ContainsKey(185);
        FieldVisible186 := GenFieldInfoDict.ContainsKey(186);
        FieldVisible187 := GenFieldInfoDict.ContainsKey(187);
        FieldVisible188 := GenFieldInfoDict.ContainsKey(188);
        FieldVisible189 := GenFieldInfoDict.ContainsKey(189);
        FieldVisible190 := GenFieldInfoDict.ContainsKey(190);
        FieldVisible191 := GenFieldInfoDict.ContainsKey(191);
        FieldVisible192 := GenFieldInfoDict.ContainsKey(192);
        FieldVisible193 := GenFieldInfoDict.ContainsKey(193);
        FieldVisible194 := GenFieldInfoDict.ContainsKey(194);
        FieldVisible195 := GenFieldInfoDict.ContainsKey(195);
        FieldVisible196 := GenFieldInfoDict.ContainsKey(196);
        FieldVisible197 := GenFieldInfoDict.ContainsKey(197);
        FieldVisible198 := GenFieldInfoDict.ContainsKey(198);
        FieldVisible199 := GenFieldInfoDict.ContainsKey(199);
        FieldVisible200 := GenFieldInfoDict.ContainsKey(200);
        FieldVisible201 := GenFieldInfoDict.ContainsKey(201);
        FieldVisible202 := GenFieldInfoDict.ContainsKey(202);
        FieldVisible203 := GenFieldInfoDict.ContainsKey(203);
        FieldVisible204 := GenFieldInfoDict.ContainsKey(204);
        FieldVisible205 := GenFieldInfoDict.ContainsKey(205);
        FieldVisible206 := GenFieldInfoDict.ContainsKey(206);
        FieldVisible207 := GenFieldInfoDict.ContainsKey(207);
        FieldVisible208 := GenFieldInfoDict.ContainsKey(208);
        FieldVisible209 := GenFieldInfoDict.ContainsKey(209);
        FieldVisible210 := GenFieldInfoDict.ContainsKey(210);
        FieldVisible211 := GenFieldInfoDict.ContainsKey(211);
        FieldVisible212 := GenFieldInfoDict.ContainsKey(212);
        FieldVisible213 := GenFieldInfoDict.ContainsKey(213);
        FieldVisible214 := GenFieldInfoDict.ContainsKey(214);
        FieldVisible215 := GenFieldInfoDict.ContainsKey(215);
        FieldVisible216 := GenFieldInfoDict.ContainsKey(216);
        FieldVisible217 := GenFieldInfoDict.ContainsKey(217);
        FieldVisible218 := GenFieldInfoDict.ContainsKey(218);
        FieldVisible219 := GenFieldInfoDict.ContainsKey(219);
        FieldVisible220 := GenFieldInfoDict.ContainsKey(220);
        FieldVisible221 := GenFieldInfoDict.ContainsKey(221);
        FieldVisible222 := GenFieldInfoDict.ContainsKey(222);
        FieldVisible223 := GenFieldInfoDict.ContainsKey(223);
        FieldVisible224 := GenFieldInfoDict.ContainsKey(224);
        FieldVisible225 := GenFieldInfoDict.ContainsKey(225);
        FieldVisible226 := GenFieldInfoDict.ContainsKey(226);
        FieldVisible227 := GenFieldInfoDict.ContainsKey(227);
        FieldVisible228 := GenFieldInfoDict.ContainsKey(228);
        FieldVisible229 := GenFieldInfoDict.ContainsKey(229);
        FieldVisible230 := GenFieldInfoDict.ContainsKey(230);
        FieldVisible231 := GenFieldInfoDict.ContainsKey(231);
        FieldVisible232 := GenFieldInfoDict.ContainsKey(232);
        FieldVisible233 := GenFieldInfoDict.ContainsKey(233);
        FieldVisible234 := GenFieldInfoDict.ContainsKey(234);
        FieldVisible235 := GenFieldInfoDict.ContainsKey(235);
        FieldVisible236 := GenFieldInfoDict.ContainsKey(236);
        FieldVisible237 := GenFieldInfoDict.ContainsKey(237);
        FieldVisible238 := GenFieldInfoDict.ContainsKey(238);
        FieldVisible239 := GenFieldInfoDict.ContainsKey(239);
        FieldVisible240 := GenFieldInfoDict.ContainsKey(240);
        FieldVisible241 := GenFieldInfoDict.ContainsKey(241);
        FieldVisible242 := GenFieldInfoDict.ContainsKey(242);
        FieldVisible243 := GenFieldInfoDict.ContainsKey(243);
        FieldVisible244 := GenFieldInfoDict.ContainsKey(244);
        FieldVisible245 := GenFieldInfoDict.ContainsKey(245);
        FieldVisible246 := GenFieldInfoDict.ContainsKey(246);
        FieldVisible247 := GenFieldInfoDict.ContainsKey(247);
        FieldVisible248 := GenFieldInfoDict.ContainsKey(248);
        FieldVisible249 := GenFieldInfoDict.ContainsKey(249);
        FieldVisible250 := GenFieldInfoDict.ContainsKey(250);
        FieldVisible251 := GenFieldInfoDict.ContainsKey(251);
        FieldVisible252 := GenFieldInfoDict.ContainsKey(252);
        FieldVisible253 := GenFieldInfoDict.ContainsKey(253);
        FieldVisible254 := GenFieldInfoDict.ContainsKey(254);
        FieldVisible255 := GenFieldInfoDict.ContainsKey(255);
        FieldVisible256 := GenFieldInfoDict.ContainsKey(256);
        FieldVisible257 := GenFieldInfoDict.ContainsKey(257);
        FieldVisible258 := GenFieldInfoDict.ContainsKey(258);
        FieldVisible259 := GenFieldInfoDict.ContainsKey(259);
        FieldVisible260 := GenFieldInfoDict.ContainsKey(260);
        FieldVisible261 := GenFieldInfoDict.ContainsKey(261);
        FieldVisible262 := GenFieldInfoDict.ContainsKey(262);
        FieldVisible263 := GenFieldInfoDict.ContainsKey(263);
        FieldVisible264 := GenFieldInfoDict.ContainsKey(264);
        FieldVisible265 := GenFieldInfoDict.ContainsKey(265);
        FieldVisible266 := GenFieldInfoDict.ContainsKey(266);
        FieldVisible267 := GenFieldInfoDict.ContainsKey(267);
        FieldVisible268 := GenFieldInfoDict.ContainsKey(268);
        FieldVisible269 := GenFieldInfoDict.ContainsKey(269);
        FieldVisible270 := GenFieldInfoDict.ContainsKey(270);
        FieldVisible271 := GenFieldInfoDict.ContainsKey(271);
        FieldVisible272 := GenFieldInfoDict.ContainsKey(272);
        FieldVisible273 := GenFieldInfoDict.ContainsKey(273);
        FieldVisible274 := GenFieldInfoDict.ContainsKey(274);
        FieldVisible275 := GenFieldInfoDict.ContainsKey(275);
        FieldVisible276 := GenFieldInfoDict.ContainsKey(276);
        FieldVisible277 := GenFieldInfoDict.ContainsKey(277);
        FieldVisible278 := GenFieldInfoDict.ContainsKey(278);
        FieldVisible279 := GenFieldInfoDict.ContainsKey(279);
        FieldVisible280 := GenFieldInfoDict.ContainsKey(280);
        FieldVisible281 := GenFieldInfoDict.ContainsKey(281);
        FieldVisible282 := GenFieldInfoDict.ContainsKey(282);
        FieldVisible283 := GenFieldInfoDict.ContainsKey(283);
        FieldVisible284 := GenFieldInfoDict.ContainsKey(284);
        FieldVisible285 := GenFieldInfoDict.ContainsKey(285);
        FieldVisible286 := GenFieldInfoDict.ContainsKey(286);
        FieldVisible287 := GenFieldInfoDict.ContainsKey(287);
        FieldVisible288 := GenFieldInfoDict.ContainsKey(288);
        FieldVisible289 := GenFieldInfoDict.ContainsKey(289);
        FieldVisible290 := GenFieldInfoDict.ContainsKey(290);
        FieldVisible291 := GenFieldInfoDict.ContainsKey(291);
        FieldVisible292 := GenFieldInfoDict.ContainsKey(292);
        FieldVisible293 := GenFieldInfoDict.ContainsKey(293);
        FieldVisible294 := GenFieldInfoDict.ContainsKey(294);
        FieldVisible295 := GenFieldInfoDict.ContainsKey(295);
        FieldVisible296 := GenFieldInfoDict.ContainsKey(296);
        FieldVisible297 := GenFieldInfoDict.ContainsKey(297);
        FieldVisible298 := GenFieldInfoDict.ContainsKey(298);
        FieldVisible299 := GenFieldInfoDict.ContainsKey(299);
        FieldVisible300 := GenFieldInfoDict.ContainsKey(300);
        FieldVisible301 := GenFieldInfoDict.ContainsKey(301);
        FieldVisible302 := GenFieldInfoDict.ContainsKey(302);
        FieldVisible303 := GenFieldInfoDict.ContainsKey(303);
        FieldVisible304 := GenFieldInfoDict.ContainsKey(304);
        FieldVisible305 := GenFieldInfoDict.ContainsKey(305);
        FieldVisible306 := GenFieldInfoDict.ContainsKey(306);
        FieldVisible307 := GenFieldInfoDict.ContainsKey(307);
        FieldVisible308 := GenFieldInfoDict.ContainsKey(308);
        FieldVisible309 := GenFieldInfoDict.ContainsKey(309);
        FieldVisible310 := GenFieldInfoDict.ContainsKey(310);
        FieldVisible311 := GenFieldInfoDict.ContainsKey(311);
        FieldVisible312 := GenFieldInfoDict.ContainsKey(312);
        FieldVisible313 := GenFieldInfoDict.ContainsKey(313);
        FieldVisible314 := GenFieldInfoDict.ContainsKey(314);
        FieldVisible315 := GenFieldInfoDict.ContainsKey(315);
        FieldVisible316 := GenFieldInfoDict.ContainsKey(316);
        FieldVisible317 := GenFieldInfoDict.ContainsKey(317);
        FieldVisible318 := GenFieldInfoDict.ContainsKey(318);
        FieldVisible319 := GenFieldInfoDict.ContainsKey(319);
        FieldVisible320 := GenFieldInfoDict.ContainsKey(320);
        FieldVisible321 := GenFieldInfoDict.ContainsKey(321);
        FieldVisible322 := GenFieldInfoDict.ContainsKey(322);
        FieldVisible323 := GenFieldInfoDict.ContainsKey(323);
        FieldVisible324 := GenFieldInfoDict.ContainsKey(324);
        FieldVisible325 := GenFieldInfoDict.ContainsKey(325);
        FieldVisible326 := GenFieldInfoDict.ContainsKey(326);
        FieldVisible327 := GenFieldInfoDict.ContainsKey(327);
        FieldVisible328 := GenFieldInfoDict.ContainsKey(328);
        FieldVisible329 := GenFieldInfoDict.ContainsKey(329);
        FieldVisible330 := GenFieldInfoDict.ContainsKey(330);
        FieldVisible331 := GenFieldInfoDict.ContainsKey(331);
        FieldVisible332 := GenFieldInfoDict.ContainsKey(332);
        FieldVisible333 := GenFieldInfoDict.ContainsKey(333);
        FieldVisible334 := GenFieldInfoDict.ContainsKey(334);
        FieldVisible335 := GenFieldInfoDict.ContainsKey(335);
        FieldVisible336 := GenFieldInfoDict.ContainsKey(336);
        FieldVisible337 := GenFieldInfoDict.ContainsKey(337);
        FieldVisible338 := GenFieldInfoDict.ContainsKey(338);
        FieldVisible339 := GenFieldInfoDict.ContainsKey(339);
        FieldVisible340 := GenFieldInfoDict.ContainsKey(340);
        FieldVisible341 := GenFieldInfoDict.ContainsKey(341);
        FieldVisible342 := GenFieldInfoDict.ContainsKey(342);
        FieldVisible343 := GenFieldInfoDict.ContainsKey(343);
        FieldVisible344 := GenFieldInfoDict.ContainsKey(344);
        FieldVisible345 := GenFieldInfoDict.ContainsKey(345);
        FieldVisible346 := GenFieldInfoDict.ContainsKey(346);
        FieldVisible347 := GenFieldInfoDict.ContainsKey(347);
        FieldVisible348 := GenFieldInfoDict.ContainsKey(348);
        FieldVisible349 := GenFieldInfoDict.ContainsKey(349);
        FieldVisible350 := GenFieldInfoDict.ContainsKey(350);
        FieldVisible351 := GenFieldInfoDict.ContainsKey(351);
        FieldVisible352 := GenFieldInfoDict.ContainsKey(352);
        FieldVisible353 := GenFieldInfoDict.ContainsKey(353);
        FieldVisible354 := GenFieldInfoDict.ContainsKey(354);
        FieldVisible355 := GenFieldInfoDict.ContainsKey(355);
        FieldVisible356 := GenFieldInfoDict.ContainsKey(356);
        FieldVisible357 := GenFieldInfoDict.ContainsKey(357);
        FieldVisible358 := GenFieldInfoDict.ContainsKey(358);
        FieldVisible359 := GenFieldInfoDict.ContainsKey(359);
        FieldVisible360 := GenFieldInfoDict.ContainsKey(360);
        FieldVisible361 := GenFieldInfoDict.ContainsKey(361);
        FieldVisible362 := GenFieldInfoDict.ContainsKey(362);
        FieldVisible363 := GenFieldInfoDict.ContainsKey(363);
        FieldVisible364 := GenFieldInfoDict.ContainsKey(364);
        FieldVisible365 := GenFieldInfoDict.ContainsKey(365);
        FieldVisible366 := GenFieldInfoDict.ContainsKey(366);
        FieldVisible367 := GenFieldInfoDict.ContainsKey(367);
        FieldVisible368 := GenFieldInfoDict.ContainsKey(368);
        FieldVisible369 := GenFieldInfoDict.ContainsKey(369);
        FieldVisible370 := GenFieldInfoDict.ContainsKey(370);
        FieldVisible371 := GenFieldInfoDict.ContainsKey(371);
        FieldVisible372 := GenFieldInfoDict.ContainsKey(372);
        FieldVisible373 := GenFieldInfoDict.ContainsKey(373);
        FieldVisible374 := GenFieldInfoDict.ContainsKey(374);
        FieldVisible375 := GenFieldInfoDict.ContainsKey(375);
        FieldVisible376 := GenFieldInfoDict.ContainsKey(376);
        FieldVisible377 := GenFieldInfoDict.ContainsKey(377);
        FieldVisible378 := GenFieldInfoDict.ContainsKey(378);
        FieldVisible379 := GenFieldInfoDict.ContainsKey(379);
        FieldVisible380 := GenFieldInfoDict.ContainsKey(380);
        FieldVisible381 := GenFieldInfoDict.ContainsKey(381);
        FieldVisible382 := GenFieldInfoDict.ContainsKey(382);
        FieldVisible383 := GenFieldInfoDict.ContainsKey(383);
        FieldVisible384 := GenFieldInfoDict.ContainsKey(384);
        FieldVisible385 := GenFieldInfoDict.ContainsKey(385);
        FieldVisible386 := GenFieldInfoDict.ContainsKey(386);
        FieldVisible387 := GenFieldInfoDict.ContainsKey(387);
        FieldVisible388 := GenFieldInfoDict.ContainsKey(388);
        FieldVisible389 := GenFieldInfoDict.ContainsKey(389);
        FieldVisible390 := GenFieldInfoDict.ContainsKey(390);
        FieldVisible391 := GenFieldInfoDict.ContainsKey(391);
        FieldVisible392 := GenFieldInfoDict.ContainsKey(392);
        FieldVisible393 := GenFieldInfoDict.ContainsKey(393);
        FieldVisible394 := GenFieldInfoDict.ContainsKey(394);
        FieldVisible395 := GenFieldInfoDict.ContainsKey(395);
        FieldVisible396 := GenFieldInfoDict.ContainsKey(396);
        FieldVisible397 := GenFieldInfoDict.ContainsKey(397);
        FieldVisible398 := GenFieldInfoDict.ContainsKey(398);
        FieldVisible399 := GenFieldInfoDict.ContainsKey(399);
        FieldVisible400 := GenFieldInfoDict.ContainsKey(400);

    end;

    local procedure InitEditable()
    begin
        FieldEditable1 := GetEditable(1);
        FieldEditable2 := GetEditable(2);
        FieldEditable3 := GetEditable(3);
        FieldEditable4 := GetEditable(4);
        FieldEditable5 := GetEditable(5);
        FieldEditable6 := GetEditable(6);
        FieldEditable7 := GetEditable(7);
        FieldEditable8 := GetEditable(8);
        FieldEditable9 := GetEditable(9);
        FieldEditable10 := GetEditable(10);
        FieldEditable11 := GetEditable(11);
        FieldEditable12 := GetEditable(12);
        FieldEditable13 := GetEditable(13);
        FieldEditable14 := GetEditable(14);
        FieldEditable15 := GetEditable(15);
        FieldEditable16 := GetEditable(16);
        FieldEditable17 := GetEditable(17);
        FieldEditable18 := GetEditable(18);
        FieldEditable19 := GetEditable(19);
        FieldEditable20 := GetEditable(20);
        FieldEditable21 := GetEditable(21);
        FieldEditable22 := GetEditable(22);
        FieldEditable23 := GetEditable(23);
        FieldEditable24 := GetEditable(24);
        FieldEditable25 := GetEditable(25);
        FieldEditable26 := GetEditable(26);
        FieldEditable27 := GetEditable(27);
        FieldEditable28 := GetEditable(28);
        FieldEditable29 := GetEditable(29);
        FieldEditable30 := GetEditable(30);
        FieldEditable31 := GetEditable(31);
        FieldEditable32 := GetEditable(32);
        FieldEditable33 := GetEditable(33);
        FieldEditable34 := GetEditable(34);
        FieldEditable35 := GetEditable(35);
        FieldEditable36 := GetEditable(36);
        FieldEditable37 := GetEditable(37);
        FieldEditable38 := GetEditable(38);
        FieldEditable39 := GetEditable(39);
        FieldEditable40 := GetEditable(40);
        FieldEditable41 := GetEditable(41);
        FieldEditable42 := GetEditable(42);
        FieldEditable43 := GetEditable(43);
        FieldEditable44 := GetEditable(44);
        FieldEditable45 := GetEditable(45);
        FieldEditable46 := GetEditable(46);
        FieldEditable47 := GetEditable(47);
        FieldEditable48 := GetEditable(48);
        FieldEditable49 := GetEditable(49);
        FieldEditable50 := GetEditable(50);
        FieldEditable51 := GetEditable(51);
        FieldEditable52 := GetEditable(52);
        FieldEditable53 := GetEditable(53);
        FieldEditable54 := GetEditable(54);
        FieldEditable55 := GetEditable(55);
        FieldEditable56 := GetEditable(56);
        FieldEditable57 := GetEditable(57);
        FieldEditable58 := GetEditable(58);
        FieldEditable59 := GetEditable(59);
        FieldEditable60 := GetEditable(60);
        FieldEditable61 := GetEditable(61);
        FieldEditable62 := GetEditable(62);
        FieldEditable63 := GetEditable(63);
        FieldEditable64 := GetEditable(64);
        FieldEditable65 := GetEditable(65);
        FieldEditable66 := GetEditable(66);
        FieldEditable67 := GetEditable(67);
        FieldEditable68 := GetEditable(68);
        FieldEditable69 := GetEditable(69);
        FieldEditable70 := GetEditable(70);
        FieldEditable71 := GetEditable(71);
        FieldEditable72 := GetEditable(72);
        FieldEditable73 := GetEditable(73);
        FieldEditable74 := GetEditable(74);
        FieldEditable75 := GetEditable(75);
        FieldEditable76 := GetEditable(76);
        FieldEditable77 := GetEditable(77);
        FieldEditable78 := GetEditable(78);
        FieldEditable79 := GetEditable(79);
        FieldEditable80 := GetEditable(80);
        FieldEditable81 := GetEditable(81);
        FieldEditable82 := GetEditable(82);
        FieldEditable83 := GetEditable(83);
        FieldEditable84 := GetEditable(84);
        FieldEditable85 := GetEditable(85);
        FieldEditable86 := GetEditable(86);
        FieldEditable87 := GetEditable(87);
        FieldEditable88 := GetEditable(88);
        FieldEditable89 := GetEditable(89);
        FieldEditable90 := GetEditable(90);
        FieldEditable91 := GetEditable(91);
        FieldEditable92 := GetEditable(92);
        FieldEditable93 := GetEditable(93);
        FieldEditable94 := GetEditable(94);
        FieldEditable95 := GetEditable(95);
        FieldEditable96 := GetEditable(96);
        FieldEditable97 := GetEditable(97);
        FieldEditable98 := GetEditable(98);
        FieldEditable99 := GetEditable(99);
        FieldEditable100 := GetEditable(100);
        FieldEditable101 := GetEditable(101);
        FieldEditable102 := GetEditable(102);
        FieldEditable103 := GetEditable(103);
        FieldEditable104 := GetEditable(104);
        FieldEditable105 := GetEditable(105);
        FieldEditable106 := GetEditable(106);
        FieldEditable107 := GetEditable(107);
        FieldEditable108 := GetEditable(108);
        FieldEditable109 := GetEditable(109);
        FieldEditable110 := GetEditable(110);
        FieldEditable111 := GetEditable(111);
        FieldEditable112 := GetEditable(112);
        FieldEditable113 := GetEditable(113);
        FieldEditable114 := GetEditable(114);
        FieldEditable115 := GetEditable(115);
        FieldEditable116 := GetEditable(116);
        FieldEditable117 := GetEditable(117);
        FieldEditable118 := GetEditable(118);
        FieldEditable119 := GetEditable(119);
        FieldEditable120 := GetEditable(120);
        FieldEditable121 := GetEditable(121);
        FieldEditable122 := GetEditable(122);
        FieldEditable123 := GetEditable(123);
        FieldEditable124 := GetEditable(124);
        FieldEditable125 := GetEditable(125);
        FieldEditable126 := GetEditable(126);
        FieldEditable127 := GetEditable(127);
        FieldEditable128 := GetEditable(128);
        FieldEditable129 := GetEditable(129);
        FieldEditable130 := GetEditable(130);
        FieldEditable131 := GetEditable(131);
        FieldEditable132 := GetEditable(132);
        FieldEditable133 := GetEditable(133);
        FieldEditable134 := GetEditable(134);
        FieldEditable135 := GetEditable(135);
        FieldEditable136 := GetEditable(136);
        FieldEditable137 := GetEditable(137);
        FieldEditable138 := GetEditable(138);
        FieldEditable139 := GetEditable(139);
        FieldEditable140 := GetEditable(140);
        FieldEditable141 := GetEditable(141);
        FieldEditable142 := GetEditable(142);
        FieldEditable143 := GetEditable(143);
        FieldEditable144 := GetEditable(144);
        FieldEditable145 := GetEditable(145);
        FieldEditable146 := GetEditable(146);
        FieldEditable147 := GetEditable(147);
        FieldEditable148 := GetEditable(148);
        FieldEditable149 := GetEditable(149);
        FieldEditable150 := GetEditable(150);
        FieldEditable151 := GetEditable(151);
        FieldEditable152 := GetEditable(152);
        FieldEditable153 := GetEditable(153);
        FieldEditable154 := GetEditable(154);
        FieldEditable155 := GetEditable(155);
        FieldEditable156 := GetEditable(156);
        FieldEditable157 := GetEditable(157);
        FieldEditable158 := GetEditable(158);
        FieldEditable159 := GetEditable(159);
        FieldEditable160 := GetEditable(160);
        FieldEditable161 := GetEditable(161);
        FieldEditable162 := GetEditable(162);
        FieldEditable163 := GetEditable(163);
        FieldEditable164 := GetEditable(164);
        FieldEditable165 := GetEditable(165);
        FieldEditable166 := GetEditable(166);
        FieldEditable167 := GetEditable(167);
        FieldEditable168 := GetEditable(168);
        FieldEditable169 := GetEditable(169);
        FieldEditable170 := GetEditable(170);
        FieldEditable171 := GetEditable(171);
        FieldEditable172 := GetEditable(172);
        FieldEditable173 := GetEditable(173);
        FieldEditable174 := GetEditable(174);
        FieldEditable175 := GetEditable(175);
        FieldEditable176 := GetEditable(176);
        FieldEditable177 := GetEditable(177);
        FieldEditable178 := GetEditable(178);
        FieldEditable179 := GetEditable(179);
        FieldEditable180 := GetEditable(180);
        FieldEditable181 := GetEditable(181);
        FieldEditable182 := GetEditable(182);
        FieldEditable183 := GetEditable(183);
        FieldEditable184 := GetEditable(184);
        FieldEditable185 := GetEditable(185);
        FieldEditable186 := GetEditable(186);
        FieldEditable187 := GetEditable(187);
        FieldEditable188 := GetEditable(188);
        FieldEditable189 := GetEditable(189);
        FieldEditable190 := GetEditable(190);
        FieldEditable191 := GetEditable(191);
        FieldEditable192 := GetEditable(192);
        FieldEditable193 := GetEditable(193);
        FieldEditable194 := GetEditable(194);
        FieldEditable195 := GetEditable(195);
        FieldEditable196 := GetEditable(196);
        FieldEditable197 := GetEditable(197);
        FieldEditable198 := GetEditable(198);
        FieldEditable199 := GetEditable(199);
        FieldEditable200 := GetEditable(200);
        FieldEditable201 := GetEditable(201);
        FieldEditable202 := GetEditable(202);
        FieldEditable203 := GetEditable(203);
        FieldEditable204 := GetEditable(204);
        FieldEditable205 := GetEditable(205);
        FieldEditable206 := GetEditable(206);
        FieldEditable207 := GetEditable(207);
        FieldEditable208 := GetEditable(208);
        FieldEditable209 := GetEditable(209);
        FieldEditable210 := GetEditable(210);
        FieldEditable211 := GetEditable(211);
        FieldEditable212 := GetEditable(212);
        FieldEditable213 := GetEditable(213);
        FieldEditable214 := GetEditable(214);
        FieldEditable215 := GetEditable(215);
        FieldEditable216 := GetEditable(216);
        FieldEditable217 := GetEditable(217);
        FieldEditable218 := GetEditable(218);
        FieldEditable219 := GetEditable(219);
        FieldEditable220 := GetEditable(220);
        FieldEditable221 := GetEditable(221);
        FieldEditable222 := GetEditable(222);
        FieldEditable223 := GetEditable(223);
        FieldEditable224 := GetEditable(224);
        FieldEditable225 := GetEditable(225);
        FieldEditable226 := GetEditable(226);
        FieldEditable227 := GetEditable(227);
        FieldEditable228 := GetEditable(228);
        FieldEditable229 := GetEditable(229);
        FieldEditable230 := GetEditable(230);
        FieldEditable231 := GetEditable(231);
        FieldEditable232 := GetEditable(232);
        FieldEditable233 := GetEditable(233);
        FieldEditable234 := GetEditable(234);
        FieldEditable235 := GetEditable(235);
        FieldEditable236 := GetEditable(236);
        FieldEditable237 := GetEditable(237);
        FieldEditable238 := GetEditable(238);
        FieldEditable239 := GetEditable(239);
        FieldEditable240 := GetEditable(240);
        FieldEditable241 := GetEditable(241);
        FieldEditable242 := GetEditable(242);
        FieldEditable243 := GetEditable(243);
        FieldEditable244 := GetEditable(244);
        FieldEditable245 := GetEditable(245);
        FieldEditable246 := GetEditable(246);
        FieldEditable247 := GetEditable(247);
        FieldEditable248 := GetEditable(248);
        FieldEditable249 := GetEditable(249);
        FieldEditable250 := GetEditable(250);
        FieldEditable251 := GetEditable(251);
        FieldEditable252 := GetEditable(252);
        FieldEditable253 := GetEditable(253);
        FieldEditable254 := GetEditable(254);
        FieldEditable255 := GetEditable(255);
        FieldEditable256 := GetEditable(256);
        FieldEditable257 := GetEditable(257);
        FieldEditable258 := GetEditable(258);
        FieldEditable259 := GetEditable(259);
        FieldEditable260 := GetEditable(260);
        FieldEditable261 := GetEditable(261);
        FieldEditable262 := GetEditable(262);
        FieldEditable263 := GetEditable(263);
        FieldEditable264 := GetEditable(264);
        FieldEditable265 := GetEditable(265);
        FieldEditable266 := GetEditable(266);
        FieldEditable267 := GetEditable(267);
        FieldEditable268 := GetEditable(268);
        FieldEditable269 := GetEditable(269);
        FieldEditable270 := GetEditable(270);
        FieldEditable271 := GetEditable(271);
        FieldEditable272 := GetEditable(272);
        FieldEditable273 := GetEditable(273);
        FieldEditable274 := GetEditable(274);
        FieldEditable275 := GetEditable(275);
        FieldEditable276 := GetEditable(276);
        FieldEditable277 := GetEditable(277);
        FieldEditable278 := GetEditable(278);
        FieldEditable279 := GetEditable(279);
        FieldEditable280 := GetEditable(280);
        FieldEditable281 := GetEditable(281);
        FieldEditable282 := GetEditable(282);
        FieldEditable283 := GetEditable(283);
        FieldEditable284 := GetEditable(284);
        FieldEditable285 := GetEditable(285);
        FieldEditable286 := GetEditable(286);
        FieldEditable287 := GetEditable(287);
        FieldEditable288 := GetEditable(288);
        FieldEditable289 := GetEditable(289);
        FieldEditable290 := GetEditable(290);
        FieldEditable291 := GetEditable(291);
        FieldEditable292 := GetEditable(292);
        FieldEditable293 := GetEditable(293);
        FieldEditable294 := GetEditable(294);
        FieldEditable295 := GetEditable(295);
        FieldEditable296 := GetEditable(296);
        FieldEditable297 := GetEditable(297);
        FieldEditable298 := GetEditable(298);
        FieldEditable299 := GetEditable(299);
        FieldEditable300 := GetEditable(300);
        FieldEditable301 := GetEditable(301);
        FieldEditable302 := GetEditable(302);
        FieldEditable303 := GetEditable(303);
        FieldEditable304 := GetEditable(304);
        FieldEditable305 := GetEditable(305);
        FieldEditable306 := GetEditable(306);
        FieldEditable307 := GetEditable(307);
        FieldEditable308 := GetEditable(308);
        FieldEditable309 := GetEditable(309);
        FieldEditable310 := GetEditable(310);
        FieldEditable311 := GetEditable(311);
        FieldEditable312 := GetEditable(312);
        FieldEditable313 := GetEditable(313);
        FieldEditable314 := GetEditable(314);
        FieldEditable315 := GetEditable(315);
        FieldEditable316 := GetEditable(316);
        FieldEditable317 := GetEditable(317);
        FieldEditable318 := GetEditable(318);
        FieldEditable319 := GetEditable(319);
        FieldEditable320 := GetEditable(320);
        FieldEditable321 := GetEditable(321);
        FieldEditable322 := GetEditable(322);
        FieldEditable323 := GetEditable(323);
        FieldEditable324 := GetEditable(324);
        FieldEditable325 := GetEditable(325);
        FieldEditable326 := GetEditable(326);
        FieldEditable327 := GetEditable(327);
        FieldEditable328 := GetEditable(328);
        FieldEditable329 := GetEditable(329);
        FieldEditable330 := GetEditable(330);
        FieldEditable331 := GetEditable(331);
        FieldEditable332 := GetEditable(332);
        FieldEditable333 := GetEditable(333);
        FieldEditable334 := GetEditable(334);
        FieldEditable335 := GetEditable(335);
        FieldEditable336 := GetEditable(336);
        FieldEditable337 := GetEditable(337);
        FieldEditable338 := GetEditable(338);
        FieldEditable339 := GetEditable(339);
        FieldEditable340 := GetEditable(340);
        FieldEditable341 := GetEditable(341);
        FieldEditable342 := GetEditable(342);
        FieldEditable343 := GetEditable(343);
        FieldEditable344 := GetEditable(344);
        FieldEditable345 := GetEditable(345);
        FieldEditable346 := GetEditable(346);
        FieldEditable347 := GetEditable(347);
        FieldEditable348 := GetEditable(348);
        FieldEditable349 := GetEditable(349);
        FieldEditable350 := GetEditable(350);
        FieldEditable351 := GetEditable(351);
        FieldEditable352 := GetEditable(352);
        FieldEditable353 := GetEditable(353);
        FieldEditable354 := GetEditable(354);
        FieldEditable355 := GetEditable(355);
        FieldEditable356 := GetEditable(356);
        FieldEditable357 := GetEditable(357);
        FieldEditable358 := GetEditable(358);
        FieldEditable359 := GetEditable(359);
        FieldEditable360 := GetEditable(360);
        FieldEditable361 := GetEditable(361);
        FieldEditable362 := GetEditable(362);
        FieldEditable363 := GetEditable(363);
        FieldEditable364 := GetEditable(364);
        FieldEditable365 := GetEditable(365);
        FieldEditable366 := GetEditable(366);
        FieldEditable367 := GetEditable(367);
        FieldEditable368 := GetEditable(368);
        FieldEditable369 := GetEditable(369);
        FieldEditable370 := GetEditable(370);
        FieldEditable371 := GetEditable(371);
        FieldEditable372 := GetEditable(372);
        FieldEditable373 := GetEditable(373);
        FieldEditable374 := GetEditable(374);
        FieldEditable375 := GetEditable(375);
        FieldEditable376 := GetEditable(376);
        FieldEditable377 := GetEditable(377);
        FieldEditable378 := GetEditable(378);
        FieldEditable379 := GetEditable(379);
        FieldEditable380 := GetEditable(380);
        FieldEditable381 := GetEditable(381);
        FieldEditable382 := GetEditable(382);
        FieldEditable383 := GetEditable(383);
        FieldEditable384 := GetEditable(384);
        FieldEditable385 := GetEditable(385);
        FieldEditable386 := GetEditable(386);
        FieldEditable387 := GetEditable(387);
        FieldEditable388 := GetEditable(388);
        FieldEditable389 := GetEditable(389);
        FieldEditable390 := GetEditable(390);
        FieldEditable391 := GetEditable(391);
        FieldEditable392 := GetEditable(392);
        FieldEditable393 := GetEditable(393);
        FieldEditable394 := GetEditable(394);
        FieldEditable395 := GetEditable(395);
        FieldEditable396 := GetEditable(396);
        FieldEditable397 := GetEditable(397);
        FieldEditable398 := GetEditable(398);
        FieldEditable399 := GetEditable(399);
        FieldEditable400 := GetEditable(400);

    end;

    local procedure GetEditable(FieldCounter: Integer): Boolean
    var
        FieldInfo: Dictionary of [Integer, Text];
        FieldTypeAsText: Text;
    begin
        if FieldCounter > GenFieldInfoDict.Count() then
            exit(false);
        GenFieldInfoDict.Get(FieldCounter, FieldInfo);
        foreach FieldTypeAsText in FieldInfo.Values() do
            exit(FieldTypeAsText in [Format(FieldType::Text), Format(FieldType::Code),
                Format(FieldType::Integer),
                Format(FieldType::Decimal),
                Format(FieldType::Boolean),
                Format(FieldType::Date),
                Format(FieldType::DateFormula),
                Format(FieldType::DateTime),
                Format(FieldType::Time),
                Format(FieldType::Guid),
                Format(FieldType::BigInteger)]);
    end;

    var
        RecRef: RecordRef;
        WithoutValidate: Boolean;
        ExcludeFlowFields: Boolean;
        CustomTableView: text;
        FieldFilter: text;
        GenFieldInfoDict: Dictionary of [Integer, Dictionary of [Integer, Text]];
        CaptionDictionary: Dictionary of [Integer, Text];
        RecordIsInsertedLbl: Label 'Record %1 is inserted.', Comment = '%1 = RecordId of new record.';
        ColumnUpdateConfirmLbl: Label 'Are you sure you want to update the %1 for %2 %3 entries?', Comment = '%1 = Field Caption., %2 = Record Count, %3 = Record name';
        ColumnCopyToConfirmLbl: Label 'Are you sure you want to copy column %1 to column %2 for %3 %4 entries?', Comment = '%1 = Field Caption Copy From, %2 = Field Caption Copy To, %3 = Record Count, %4 = Record Name';
        FieldVisible1, FieldVisible2, FieldVisible3, FieldVisible4, FieldVisible5, FieldVisible6, FieldVisible7, FieldVisible8, FieldVisible9, FieldVisible10, FieldVisible11, FieldVisible12, FieldVisible13, FieldVisible14, FieldVisible15, FieldVisible16, FieldVisible17, FieldVisible18, FieldVisible19, FieldVisible20, FieldVisible21, FieldVisible22, FieldVisible23, FieldVisible24, FieldVisible25, FieldVisible26, FieldVisible27, FieldVisible28, FieldVisible29, FieldVisible30, FieldVisible31, FieldVisible32, FieldVisible33, FieldVisible34, FieldVisible35, FieldVisible36, FieldVisible37, FieldVisible38, FieldVisible39, FieldVisible40, FieldVisible41, FieldVisible42, FieldVisible43, FieldVisible44, FieldVisible45, FieldVisible46, FieldVisible47, FieldVisible48, FieldVisible49, FieldVisible50, FieldVisible51, FieldVisible52, FieldVisible53, FieldVisible54, FieldVisible55, FieldVisible56, FieldVisible57, FieldVisible58, FieldVisible59, FieldVisible60, FieldVisible61, FieldVisible62, FieldVisible63, FieldVisible64, FieldVisible65, FieldVisible66, FieldVisible67, FieldVisible68, FieldVisible69, FieldVisible70, FieldVisible71, FieldVisible72, FieldVisible73, FieldVisible74, FieldVisible75, FieldVisible76, FieldVisible77, FieldVisible78, FieldVisible79, FieldVisible80, FieldVisible81, FieldVisible82, FieldVisible83, FieldVisible84, FieldVisible85, FieldVisible86, FieldVisible87, FieldVisible88, FieldVisible89, FieldVisible90, FieldVisible91, FieldVisible92, FieldVisible93, FieldVisible94, FieldVisible95, FieldVisible96, FieldVisible97, FieldVisible98, FieldVisible99, FieldVisible100, FieldVisible101, FieldVisible102, FieldVisible103, FieldVisible104, FieldVisible105, FieldVisible106, FieldVisible107, FieldVisible108, FieldVisible109, FieldVisible110, FieldVisible111, FieldVisible112, FieldVisible113, FieldVisible114, FieldVisible115, FieldVisible116, FieldVisible117, FieldVisible118, FieldVisible119, FieldVisible120, FieldVisible121, FieldVisible122, FieldVisible123, FieldVisible124, FieldVisible125, FieldVisible126, FieldVisible127, FieldVisible128, FieldVisible129, FieldVisible130, FieldVisible131, FieldVisible132, FieldVisible133, FieldVisible134, FieldVisible135, FieldVisible136, FieldVisible137, FieldVisible138, FieldVisible139, FieldVisible140, FieldVisible141, FieldVisible142, FieldVisible143, FieldVisible144, FieldVisible145, FieldVisible146, FieldVisible147, FieldVisible148, FieldVisible149, FieldVisible150, FieldVisible151, FieldVisible152, FieldVisible153, FieldVisible154, FieldVisible155, FieldVisible156, FieldVisible157, FieldVisible158, FieldVisible159, FieldVisible160, FieldVisible161, FieldVisible162, FieldVisible163, FieldVisible164, FieldVisible165, FieldVisible166, FieldVisible167, FieldVisible168, FieldVisible169, FieldVisible170, FieldVisible171, FieldVisible172, FieldVisible173, FieldVisible174, FieldVisible175, FieldVisible176, FieldVisible177, FieldVisible178, FieldVisible179, FieldVisible180, FieldVisible181, FieldVisible182, FieldVisible183, FieldVisible184, FieldVisible185, FieldVisible186, FieldVisible187, FieldVisible188, FieldVisible189, FieldVisible190, FieldVisible191, FieldVisible192, FieldVisible193, FieldVisible194, FieldVisible195, FieldVisible196, FieldVisible197, FieldVisible198, FieldVisible199, FieldVisible200, FieldVisible201, FieldVisible202, FieldVisible203, FieldVisible204, FieldVisible205, FieldVisible206, FieldVisible207, FieldVisible208, FieldVisible209, FieldVisible210, FieldVisible211, FieldVisible212, FieldVisible213, FieldVisible214, FieldVisible215, FieldVisible216, FieldVisible217, FieldVisible218, FieldVisible219, FieldVisible220, FieldVisible221, FieldVisible222, FieldVisible223, FieldVisible224, FieldVisible225, FieldVisible226, FieldVisible227, FieldVisible228, FieldVisible229, FieldVisible230, FieldVisible231, FieldVisible232, FieldVisible233, FieldVisible234, FieldVisible235, FieldVisible236, FieldVisible237, FieldVisible238, FieldVisible239, FieldVisible240, FieldVisible241, FieldVisible242, FieldVisible243, FieldVisible244, FieldVisible245, FieldVisible246, FieldVisible247, FieldVisible248, FieldVisible249, FieldVisible250, FieldVisible251, FieldVisible252, FieldVisible253, FieldVisible254, FieldVisible255, FieldVisible256, FieldVisible257, FieldVisible258, FieldVisible259, FieldVisible260, FieldVisible261, FieldVisible262, FieldVisible263, FieldVisible264, FieldVisible265, FieldVisible266, FieldVisible267, FieldVisible268, FieldVisible269, FieldVisible270, FieldVisible271, FieldVisible272, FieldVisible273, FieldVisible274, FieldVisible275, FieldVisible276, FieldVisible277, FieldVisible278, FieldVisible279, FieldVisible280, FieldVisible281, FieldVisible282, FieldVisible283, FieldVisible284, FieldVisible285, FieldVisible286, FieldVisible287, FieldVisible288, FieldVisible289, FieldVisible290, FieldVisible291, FieldVisible292, FieldVisible293, FieldVisible294, FieldVisible295, FieldVisible296, FieldVisible297, FieldVisible298, FieldVisible299, FieldVisible300, FieldVisible301, FieldVisible302, FieldVisible303, FieldVisible304, FieldVisible305, FieldVisible306, FieldVisible307, FieldVisible308, FieldVisible309, FieldVisible310, FieldVisible311, FieldVisible312, FieldVisible313, FieldVisible314, FieldVisible315, FieldVisible316, FieldVisible317, FieldVisible318, FieldVisible319, FieldVisible320, FieldVisible321, FieldVisible322, FieldVisible323, FieldVisible324, FieldVisible325, FieldVisible326, FieldVisible327, FieldVisible328, FieldVisible329, FieldVisible330, FieldVisible331, FieldVisible332, FieldVisible333, FieldVisible334, FieldVisible335, FieldVisible336, FieldVisible337, FieldVisible338, FieldVisible339, FieldVisible340, FieldVisible341, FieldVisible342, FieldVisible343, FieldVisible344, FieldVisible345, FieldVisible346, FieldVisible347, FieldVisible348, FieldVisible349, FieldVisible350, FieldVisible351, FieldVisible352, FieldVisible353, FieldVisible354, FieldVisible355, FieldVisible356, FieldVisible357, FieldVisible358, FieldVisible359, FieldVisible360, FieldVisible361, FieldVisible362, FieldVisible363, FieldVisible364, FieldVisible365, FieldVisible366, FieldVisible367, FieldVisible368, FieldVisible369, FieldVisible370, FieldVisible371, FieldVisible372, FieldVisible373, FieldVisible374, FieldVisible375, FieldVisible376, FieldVisible377, FieldVisible378, FieldVisible379, FieldVisible380, FieldVisible381, FieldVisible382, FieldVisible383, FieldVisible384, FieldVisible385, FieldVisible386, FieldVisible387, FieldVisible388, FieldVisible389, FieldVisible390, FieldVisible391, FieldVisible392, FieldVisible393, FieldVisible394, FieldVisible395, FieldVisible396, FieldVisible397, FieldVisible398, FieldVisible399, FieldVisible400 : Boolean;
        FieldEditable1, FieldEditable2, FieldEditable3, FieldEditable4, FieldEditable5, FieldEditable6, FieldEditable7, FieldEditable8, FieldEditable9, FieldEditable10, FieldEditable11, FieldEditable12, FieldEditable13, FieldEditable14, FieldEditable15, FieldEditable16, FieldEditable17, FieldEditable18, FieldEditable19, FieldEditable20, FieldEditable21, FieldEditable22, FieldEditable23, FieldEditable24, FieldEditable25, FieldEditable26, FieldEditable27, FieldEditable28, FieldEditable29, FieldEditable30, FieldEditable31, FieldEditable32, FieldEditable33, FieldEditable34, FieldEditable35, FieldEditable36, FieldEditable37, FieldEditable38, FieldEditable39, FieldEditable40, FieldEditable41, FieldEditable42, FieldEditable43, FieldEditable44, FieldEditable45, FieldEditable46, FieldEditable47, FieldEditable48, FieldEditable49, FieldEditable50, FieldEditable51, FieldEditable52, FieldEditable53, FieldEditable54, FieldEditable55, FieldEditable56, FieldEditable57, FieldEditable58, FieldEditable59, FieldEditable60, FieldEditable61, FieldEditable62, FieldEditable63, FieldEditable64, FieldEditable65, FieldEditable66, FieldEditable67, FieldEditable68, FieldEditable69, FieldEditable70, FieldEditable71, FieldEditable72, FieldEditable73, FieldEditable74, FieldEditable75, FieldEditable76, FieldEditable77, FieldEditable78, FieldEditable79, FieldEditable80, FieldEditable81, FieldEditable82, FieldEditable83, FieldEditable84, FieldEditable85, FieldEditable86, FieldEditable87, FieldEditable88, FieldEditable89, FieldEditable90, FieldEditable91, FieldEditable92, FieldEditable93, FieldEditable94, FieldEditable95, FieldEditable96, FieldEditable97, FieldEditable98, FieldEditable99, FieldEditable100, FieldEditable101, FieldEditable102, FieldEditable103, FieldEditable104, FieldEditable105, FieldEditable106, FieldEditable107, FieldEditable108, FieldEditable109, FieldEditable110, FieldEditable111, FieldEditable112, FieldEditable113, FieldEditable114, FieldEditable115, FieldEditable116, FieldEditable117, FieldEditable118, FieldEditable119, FieldEditable120, FieldEditable121, FieldEditable122, FieldEditable123, FieldEditable124, FieldEditable125, FieldEditable126, FieldEditable127, FieldEditable128, FieldEditable129, FieldEditable130, FieldEditable131, FieldEditable132, FieldEditable133, FieldEditable134, FieldEditable135, FieldEditable136, FieldEditable137, FieldEditable138, FieldEditable139, FieldEditable140, FieldEditable141, FieldEditable142, FieldEditable143, FieldEditable144, FieldEditable145, FieldEditable146, FieldEditable147, FieldEditable148, FieldEditable149, FieldEditable150, FieldEditable151, FieldEditable152, FieldEditable153, FieldEditable154, FieldEditable155, FieldEditable156, FieldEditable157, FieldEditable158, FieldEditable159, FieldEditable160, FieldEditable161, FieldEditable162, FieldEditable163, FieldEditable164, FieldEditable165, FieldEditable166, FieldEditable167, FieldEditable168, FieldEditable169, FieldEditable170, FieldEditable171, FieldEditable172, FieldEditable173, FieldEditable174, FieldEditable175, FieldEditable176, FieldEditable177, FieldEditable178, FieldEditable179, FieldEditable180, FieldEditable181, FieldEditable182, FieldEditable183, FieldEditable184, FieldEditable185, FieldEditable186, FieldEditable187, FieldEditable188, FieldEditable189, FieldEditable190, FieldEditable191, FieldEditable192, FieldEditable193, FieldEditable194, FieldEditable195, FieldEditable196, FieldEditable197, FieldEditable198, FieldEditable199, FieldEditable200, FieldEditable201, FieldEditable202, FieldEditable203, FieldEditable204, FieldEditable205, FieldEditable206, FieldEditable207, FieldEditable208, FieldEditable209, FieldEditable210, FieldEditable211, FieldEditable212, FieldEditable213, FieldEditable214, FieldEditable215, FieldEditable216, FieldEditable217, FieldEditable218, FieldEditable219, FieldEditable220, FieldEditable221, FieldEditable222, FieldEditable223, FieldEditable224, FieldEditable225, FieldEditable226, FieldEditable227, FieldEditable228, FieldEditable229, FieldEditable230, FieldEditable231, FieldEditable232, FieldEditable233, FieldEditable234, FieldEditable235, FieldEditable236, FieldEditable237, FieldEditable238, FieldEditable239, FieldEditable240, FieldEditable241, FieldEditable242, FieldEditable243, FieldEditable244, FieldEditable245, FieldEditable246, FieldEditable247, FieldEditable248, FieldEditable249, FieldEditable250, FieldEditable251, FieldEditable252, FieldEditable253, FieldEditable254, FieldEditable255, FieldEditable256, FieldEditable257, FieldEditable258, FieldEditable259, FieldEditable260, FieldEditable261, FieldEditable262, FieldEditable263, FieldEditable264, FieldEditable265, FieldEditable266, FieldEditable267, FieldEditable268, FieldEditable269, FieldEditable270, FieldEditable271, FieldEditable272, FieldEditable273, FieldEditable274, FieldEditable275, FieldEditable276, FieldEditable277, FieldEditable278, FieldEditable279, FieldEditable280, FieldEditable281, FieldEditable282, FieldEditable283, FieldEditable284, FieldEditable285, FieldEditable286, FieldEditable287, FieldEditable288, FieldEditable289, FieldEditable290, FieldEditable291, FieldEditable292, FieldEditable293, FieldEditable294, FieldEditable295, FieldEditable296, FieldEditable297, FieldEditable298, FieldEditable299, FieldEditable300, FieldEditable301, FieldEditable302, FieldEditable303, FieldEditable304, FieldEditable305, FieldEditable306, FieldEditable307, FieldEditable308, FieldEditable309, FieldEditable310, FieldEditable311, FieldEditable312, FieldEditable313, FieldEditable314, FieldEditable315, FieldEditable316, FieldEditable317, FieldEditable318, FieldEditable319, FieldEditable320, FieldEditable321, FieldEditable322, FieldEditable323, FieldEditable324, FieldEditable325, FieldEditable326, FieldEditable327, FieldEditable328, FieldEditable329, FieldEditable330, FieldEditable331, FieldEditable332, FieldEditable333, FieldEditable334, FieldEditable335, FieldEditable336, FieldEditable337, FieldEditable338, FieldEditable339, FieldEditable340, FieldEditable341, FieldEditable342, FieldEditable343, FieldEditable344, FieldEditable345, FieldEditable346, FieldEditable347, FieldEditable348, FieldEditable349, FieldEditable350, FieldEditable351, FieldEditable352, FieldEditable353, FieldEditable354, FieldEditable355, FieldEditable356, FieldEditable357, FieldEditable358, FieldEditable359, FieldEditable360, FieldEditable361, FieldEditable362, FieldEditable363, FieldEditable364, FieldEditable365, FieldEditable366, FieldEditable367, FieldEditable368, FieldEditable369, FieldEditable370, FieldEditable371, FieldEditable372, FieldEditable373, FieldEditable374, FieldEditable375, FieldEditable376, FieldEditable377, FieldEditable378, FieldEditable379, FieldEditable380, FieldEditable381, FieldEditable382, FieldEditable383, FieldEditable384, FieldEditable385, FieldEditable386, FieldEditable387, FieldEditable388, FieldEditable389, FieldEditable390, FieldEditable391, FieldEditable392, FieldEditable393, FieldEditable394, FieldEditable395, FieldEditable396, FieldEditable397, FieldEditable398, FieldEditable399, FieldEditable400 : boolean;
}
