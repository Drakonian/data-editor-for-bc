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
     tabledata "Workflow Step Instance Archive" = RMID, tabledata "G/L Entry" = RMID;

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
            }
        }
    }
    actions
    {
        area(Processing)
        {
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
            if FieldID >= 200 then
                break;
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

    local procedure InitFieldsCaptions(CaptionDictionary: Dictionary of [Integer, Text])
    var
        SingleInstanceStorage: Codeunit "DET Single Instance Storage";
    begin
        SingleInstanceStorage.SetCaptionDictionary(CaptionDictionary);
    end;

    local procedure LoadData()
    var
        TempRecRef: RecordRef;
        FieldRefVar: FieldRef;
        FieldRefVar2: FieldRef;
        Counter: Integer;
        EntryNo: Integer;
    begin
        TempRecRef.GetTable(Rec);
        if CustomTableView <> '' then
            RecRef.SetView(CustomTableView);
        if RecRef.FindSet() then
            repeat
                EntryNo += 1;
                TempRecRef.Init();
                FieldRefVar2 := TempRecRef.FieldIndex(1);
                FieldRefVar2.Value(EntryNo);
                FieldRefVar2 := TempRecRef.FieldIndex(2);
                FieldRefVar2.Value(RecRef.RecordId());

                for Counter := 1 to RecRef.FieldCount() do begin
                    FieldRefVar := RecRef.FieldIndex(Counter);
                    if FieldRefVar.Class() = FieldClass::FlowField then
                        FieldRefVar.CalcField();

                    FieldRefVar2 := TempRecRef.FieldIndex(Counter + 2);
                    FieldRefVar2.Value(FieldRefVar.Value());
                end;
                if not TempRecRef.Insert() then
                    TempRecRef.Modify();
            until RecRef.Next() = 0;

    end;

    local procedure TestFieldIsPartOfPK(var RecRef: RecordRef; var FieldRefVar: FieldRef): Boolean
    var
        FieldRefVar2: FieldRef;
        KeyRefVar: KeyRef;
        ListOfPK: List of [Integer];
        KeyCount: Integer;
    begin
        KeyRefVar := RecRef.KeyIndex(1);
        for KeyCount := 1 to KeyRefVar.FieldCount() do begin
            FieldRefVar2 := KeyRefVar.FieldIndex(KeyCount);
            ListOfPK.Add(FieldRefVar2.Number());
        end;
        //TODO: Implement Rename function with random number of PK fields
        if ListOfPK.Contains(FieldRefVar.Number()) then
            exit(true);
        //Error(RenamePKNotSuppErr);
    end;

    local procedure RenamePKField(var RecRef: RecordRef; var FieldRefVar: FieldRef; NewValueAsVariant: Variant)
    var
        SingleInstanceStorage: Codeunit "DET Single Instance Storage";
        RecRefTemp: RecordRef;
        FieldRefVar2: FieldRef;
        KeyRefVar: KeyRef;
        KeyCount: Integer;
        DictOfFieldKeyType: Dictionary of [Integer, Text];
        KeyValueIndexRelDict: Dictionary of [Integer, Text[2048]];
    begin
        KeyRefVar := RecRef.KeyIndex(1);
        for KeyCount := 1 to KeyRefVar.FieldCount() do begin
            FieldRefVar2 := KeyRefVar.FieldIndex(KeyCount);
            if FieldRefVar2.Number() <> FieldRefVar.Number() then
                if FieldRefVar2.Type() = FieldRefVar2.Type::Option then
                    KeyValueIndexRelDict.Add(KeyCount, Format(FieldRefVar2.OptionMembers().Split(',').IndexOf(FieldRefVar2.Value()) - 1))
                else
                    KeyValueIndexRelDict.Add(KeyCount, Format(FieldRefVar2.Value()))
            else
                KeyValueIndexRelDict.Add(KeyCount, Format(NewValueAsVariant));
            DictOfFieldKeyType.Add(KeyCount, Format(FieldRefVar2.Type));
        end;

        BindSubscription(SingleInstanceStorage);

        RecRefTemp := RecRef.Duplicate();
        RecRefTemp.Field(FieldRefVar.Number()).Value(NewValueAsVariant);

        case KeyValueIndexRelDict.Count() of
            1:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value());
            2:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(), RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value());
            3:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value()
                    );
            4:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value()
                    );
            5:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value()
                    );
            6:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value()
                    );
            7:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value()
                    );
            8:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value()
                    );
            9:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value()
                    );
            10:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value()
                    );
            11:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value()
                    );
            12:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value()
                    );
            13:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(13)).Value()
                    );
            14:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(13)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(14)).Value()
                    );
            15:
                RecRef.Rename(RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(1)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(2)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(3)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(4)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(5)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(6)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(7)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(8)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(9)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(10)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(11)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(12)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(13)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(14)).Value(),
                    RecRefTemp.FieldIndex(KeyValueIndexRelDict.Keys.Get(15)).Value()
                    );
            else
                Error(RenamePKNotSuppErr);
        end;

        UnbindSubscription(SingleInstanceStorage);
        Rec."Source Record ID" := RecRef.RecordId();
    end;

    local procedure GetFieldTypeFromText(FieldTypeAsTxt: Text) FieldTypeVar: FieldType
    begin
        Evaluate(FieldTypeVar, FieldTypeAsTxt);
    end;

    local procedure OnValidateField(FieldCounter: Integer; NewValue: Text[2048])
    var
        FieldRefVar: FieldRef;
        FieldInfo: Dictionary of [Integer, Text];
        OriginalFieldNo: Integer;
        NewValueAsVariant: Variant;
    begin
        if not RecRef.Get(Rec."Source Record ID") then
            exit;
        GenFieldInfoDict.Get(FieldCounter, FieldInfo);
        foreach OriginalFieldNo in FieldInfo.Keys() do
            FieldRefVar := RecRef.Field(OriginalFieldNo);

        if TestFieldIsPartOfPK(RecRef, FieldRefVar) then begin
            RenamePKField(RecRef, FieldRefVar, NewValue);
            exit;
        end;

        TextValueAsVariant(FieldRefVar.Type(), NewValue, NewValueAsVariant);
        FieldRefVar.Value(NewValueAsVariant);
        if not WithoutValidate then
            FieldRefVar.Validate();
        RecRef.Modify(not WithoutValidate);

    end;

    local procedure OnDrillDownField(FieldCounter: Integer; var NewValue: Text[2048])
    var
        FieldRec: Record Field;
        TempNameValueBuffer: Record "Name/Value Buffer" temporary;
        EditValue: page "DET Edit Value";
        NameValueLookup: Page "Name/Value Lookup";
        FieldRefVar: FieldRef;
        OptionValue: Text;
        ListOfOptions: List of [Text];
        FieldInfo: Dictionary of [Integer, Text];
        ResultVariant: Variant;
        OriginalFieldNo: Integer;
    begin
        if not RecRef.Get(Rec."Source Record ID") then
            exit;
        GenFieldInfoDict.Get(FieldCounter, FieldInfo);
        foreach OriginalFieldNo in FieldInfo.Keys() do
            FieldRefVar := RecRef.Field(OriginalFieldNo);

        if FieldRefVar.Class <> FieldClass::Normal then
            exit;

        if FieldRefVar.Type() = FieldRefVar.Type::Option then begin
            ListOfOptions := FieldRefVar.OptionMembers().Split(',');
            foreach OptionValue in ListOfOptions do
                NameValueLookup.AddItem(Format(FieldRefVar.GetEnumValueOrdinal(ListOfOptions.IndexOf(OptionValue))), CopyStr(OptionValue, 1, MaxStrLen(TempNameValueBuffer.Value)));
            NameValueLookup.Caption(FieldRefVar.Caption());
            NameValueLookup.Editable(false);
            NameValueLookup.LookupMode(true);
            if NameValueLookup.RunModal() <> Action::LookupOK then
                exit;
            NameValueLookup.GetRecord(TempNameValueBuffer);
            ResultVariant := TempNameValueBuffer.Name;
        end else begin
            FieldRec.get(RecRef.Number(), FieldRefVar.Number());
            EditValue.SetFieldInfo(FieldRec);
            EditValue.SetInitValue(NewValue);
            EditValue.Caption(FieldRefVar.Caption());
            EditValue.LookupMode(true);
            if not (EditValue.RunModal() in [Action::OK, Action::LookupOK]) then
                exit;
            EditValue.GetResult(ResultVariant);
        end;

        if TestFieldIsPartOfPK(RecRef, FieldRefVar) then begin
            if FieldRefVar.Type() = FieldRefVar.Type::Option then begin
                Evaluate(OriginalFieldNo, TempNameValueBuffer.Name);
                ResultVariant := OriginalFieldNo;
            end;
            RenamePKField(RecRef, FieldRefVar, ResultVariant);
            if FieldRefVar.Type() = FieldRefVar.Type::Option then
                NewValue := TempNameValueBuffer.Value
            else
                NewValue := format(ResultVariant);
            exit;
        end;

        FieldRefVar.Value(ResultVariant);
        if not WithoutValidate then
            FieldRefVar.Validate();
        RecRef.Modify(not WithoutValidate);

        if FieldRefVar.Type() = FieldRefVar.Type::Option then
            NewValue := TempNameValueBuffer.Value
        else
            NewValue := format(ResultVariant);
    end;

    local procedure TextValueAsVariant(FieldTypeVar: FieldType; ValueAsText: Text[2048]; var VariantVar: Variant)
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
                VariantVar := ValueAsText;
            FieldTypeVar::Integer:
                begin
                    Evaluate(IntegerValue, ValueAsText);
                    VariantVar := IntegerValue;
                end;
            FieldTypeVar::Decimal:
                begin
                    Evaluate(DecimalValue, ValueAsText);
                    VariantVar := DecimalValue;
                end;
            FieldTypeVar::Boolean:
                begin
                    Evaluate(BooleanValue, ValueAsText);
                    VariantVar := BooleanValue;
                end;
            FieldTypeVar::Date:
                begin
                    Evaluate(DateValue, ValueAsText);
                    VariantVar := DateValue;
                end;
            FieldTypeVar::DateFormula:
                begin
                    Evaluate(DateFormulaValue, ValueAsText);
                    VariantVar := DateFormulaValue;
                end;
            FieldTypeVar::DateTime:
                begin
                    Evaluate(DateTimeValue, ValueAsText);
                    VariantVar := DateTimeValue;
                end;
            FieldTypeVar::Time:
                begin
                    Evaluate(TimeValue, ValueAsText);
                    VariantVar := TimeValue;
                end;
            FieldTypeVar::Guid:
                begin
                    Evaluate(GuidValue, ValueAsText);
                    VariantVar := GuidValue;
                end;
            FieldTypeVar::BigInteger:
                begin
                    Evaluate(BigIntegerValue, ValueAsText);
                    VariantVar := BigIntegerValue;
                end;
            FieldTypeVar::Option:
                begin
                    Evaluate(IntegerValue, ValueAsText);
                    VariantVar := IntegerValue;
                end;
            else
                VariantVar := ValueAsText;
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
        RenamePKNotSuppErr: Label 'Changing the primary key for >15 values is not supported.';
        [InDataSet]
        FieldVisible1, FieldVisible2, FieldVisible3, FieldVisible4, FieldVisible5, FieldVisible6, FieldVisible7, FieldVisible8, FieldVisible9, FieldVisible10, FieldVisible11, FieldVisible12, FieldVisible13, FieldVisible14, FieldVisible15, FieldVisible16, FieldVisible17, FieldVisible18, FieldVisible19, FieldVisible20, FieldVisible21, FieldVisible22, FieldVisible23, FieldVisible24, FieldVisible25, FieldVisible26, FieldVisible27, FieldVisible28, FieldVisible29, FieldVisible30, FieldVisible31, FieldVisible32, FieldVisible33, FieldVisible34, FieldVisible35, FieldVisible36, FieldVisible37, FieldVisible38, FieldVisible39, FieldVisible40, FieldVisible41, FieldVisible42, FieldVisible43, FieldVisible44, FieldVisible45, FieldVisible46, FieldVisible47, FieldVisible48, FieldVisible49, FieldVisible50, FieldVisible51, FieldVisible52, FieldVisible53, FieldVisible54, FieldVisible55, FieldVisible56, FieldVisible57, FieldVisible58, FieldVisible59, FieldVisible60, FieldVisible61, FieldVisible62, FieldVisible63, FieldVisible64, FieldVisible65, FieldVisible66, FieldVisible67, FieldVisible68, FieldVisible69, FieldVisible70, FieldVisible71, FieldVisible72, FieldVisible73, FieldVisible74, FieldVisible75, FieldVisible76, FieldVisible77, FieldVisible78, FieldVisible79, FieldVisible80, FieldVisible81, FieldVisible82, FieldVisible83, FieldVisible84, FieldVisible85, FieldVisible86, FieldVisible87, FieldVisible88, FieldVisible89, FieldVisible90, FieldVisible91, FieldVisible92, FieldVisible93, FieldVisible94, FieldVisible95, FieldVisible96, FieldVisible97, FieldVisible98, FieldVisible99, FieldVisible100, FieldVisible101, FieldVisible102, FieldVisible103, FieldVisible104, FieldVisible105, FieldVisible106, FieldVisible107, FieldVisible108, FieldVisible109, FieldVisible110, FieldVisible111, FieldVisible112, FieldVisible113, FieldVisible114, FieldVisible115, FieldVisible116, FieldVisible117, FieldVisible118, FieldVisible119, FieldVisible120, FieldVisible121, FieldVisible122, FieldVisible123, FieldVisible124, FieldVisible125, FieldVisible126, FieldVisible127, FieldVisible128, FieldVisible129, FieldVisible130, FieldVisible131, FieldVisible132, FieldVisible133, FieldVisible134, FieldVisible135, FieldVisible136, FieldVisible137, FieldVisible138, FieldVisible139, FieldVisible140, FieldVisible141, FieldVisible142, FieldVisible143, FieldVisible144, FieldVisible145, FieldVisible146, FieldVisible147, FieldVisible148, FieldVisible149, FieldVisible150, FieldVisible151, FieldVisible152, FieldVisible153, FieldVisible154, FieldVisible155, FieldVisible156, FieldVisible157, FieldVisible158, FieldVisible159, FieldVisible160, FieldVisible161, FieldVisible162, FieldVisible163, FieldVisible164, FieldVisible165, FieldVisible166, FieldVisible167, FieldVisible168, FieldVisible169, FieldVisible170, FieldVisible171, FieldVisible172, FieldVisible173, FieldVisible174, FieldVisible175, FieldVisible176, FieldVisible177, FieldVisible178, FieldVisible179, FieldVisible180, FieldVisible181, FieldVisible182, FieldVisible183, FieldVisible184, FieldVisible185, FieldVisible186, FieldVisible187, FieldVisible188, FieldVisible189, FieldVisible190, FieldVisible191, FieldVisible192, FieldVisible193, FieldVisible194, FieldVisible195, FieldVisible196, FieldVisible197, FieldVisible198, FieldVisible199, FieldVisible200, FieldVisible201 : Boolean;
        [InDataSet]
        FieldEditable1, FieldEditable2, FieldEditable3, FieldEditable4, FieldEditable5, FieldEditable6, FieldEditable7, FieldEditable8, FieldEditable9, FieldEditable10, FieldEditable11, FieldEditable12, FieldEditable13, FieldEditable14, FieldEditable15, FieldEditable16, FieldEditable17, FieldEditable18, FieldEditable19, FieldEditable20, FieldEditable21, FieldEditable22, FieldEditable23, FieldEditable24, FieldEditable25, FieldEditable26, FieldEditable27, FieldEditable28, FieldEditable29, FieldEditable30, FieldEditable31, FieldEditable32, FieldEditable33, FieldEditable34, FieldEditable35, FieldEditable36, FieldEditable37, FieldEditable38, FieldEditable39, FieldEditable40, FieldEditable41, FieldEditable42, FieldEditable43, FieldEditable44, FieldEditable45, FieldEditable46, FieldEditable47, FieldEditable48, FieldEditable49, FieldEditable50, FieldEditable51, FieldEditable52, FieldEditable53, FieldEditable54, FieldEditable55, FieldEditable56, FieldEditable57, FieldEditable58, FieldEditable59, FieldEditable60, FieldEditable61, FieldEditable62, FieldEditable63, FieldEditable64, FieldEditable65, FieldEditable66, FieldEditable67, FieldEditable68, FieldEditable69, FieldEditable70, FieldEditable71, FieldEditable72, FieldEditable73, FieldEditable74, FieldEditable75, FieldEditable76, FieldEditable77, FieldEditable78, FieldEditable79, FieldEditable80, FieldEditable81, FieldEditable82, FieldEditable83, FieldEditable84, FieldEditable85, FieldEditable86, FieldEditable87, FieldEditable88, FieldEditable89, FieldEditable90, FieldEditable91, FieldEditable92, FieldEditable93, FieldEditable94, FieldEditable95, FieldEditable96, FieldEditable97, FieldEditable98, FieldEditable99, FieldEditable100, FieldEditable101, FieldEditable102, FieldEditable103, FieldEditable104, FieldEditable105, FieldEditable106, FieldEditable107, FieldEditable108, FieldEditable109, FieldEditable110, FieldEditable111, FieldEditable112, FieldEditable113, FieldEditable114, FieldEditable115, FieldEditable116, FieldEditable117, FieldEditable118, FieldEditable119, FieldEditable120, FieldEditable121, FieldEditable122, FieldEditable123, FieldEditable124, FieldEditable125, FieldEditable126, FieldEditable127, FieldEditable128, FieldEditable129, FieldEditable130, FieldEditable131, FieldEditable132, FieldEditable133, FieldEditable134, FieldEditable135, FieldEditable136, FieldEditable137, FieldEditable138, FieldEditable139, FieldEditable140, FieldEditable141, FieldEditable142, FieldEditable143, FieldEditable144, FieldEditable145, FieldEditable146, FieldEditable147, FieldEditable148, FieldEditable149, FieldEditable150, FieldEditable151, FieldEditable152, FieldEditable153, FieldEditable154, FieldEditable155, FieldEditable156, FieldEditable157, FieldEditable158, FieldEditable159, FieldEditable160, FieldEditable161, FieldEditable162, FieldEditable163, FieldEditable164, FieldEditable165, FieldEditable166, FieldEditable167, FieldEditable168, FieldEditable169, FieldEditable170, FieldEditable171, FieldEditable172, FieldEditable173, FieldEditable174, FieldEditable175, FieldEditable176, FieldEditable177, FieldEditable178, FieldEditable179, FieldEditable180, FieldEditable181, FieldEditable182, FieldEditable183, FieldEditable184, FieldEditable185, FieldEditable186, FieldEditable187, FieldEditable188, FieldEditable189, FieldEditable190, FieldEditable191, FieldEditable192, FieldEditable193, FieldEditable194, FieldEditable195, FieldEditable196, FieldEditable197, FieldEditable198, FieldEditable199, FieldEditable200, FieldEditable201 : boolean;
}
