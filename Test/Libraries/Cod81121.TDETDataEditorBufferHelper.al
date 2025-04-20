codeunit 81121 "TDET Data Editor Buffer Helper"
{
    procedure AssertBufferFieldValue(var DataEditorBuffer: TestPage "DET Data Editor Buffer"; FieldIndex: Integer; FieldValue: Text)
    var
        Assert: Codeunit "Library Assert";
        WrongValueErr: Label 'Expected Value is %1, Current Value is %2. FieldIndex is %3. Record Id is %4.', Comment = '%1 = FieldValue, %2 = CurrentValue, %3 = FieldIndex, %4 = RecordId';
    begin
        case FieldIndex of
            1:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 2".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 2", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            2:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 3".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 3", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            3:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 4".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 4", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            4:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 5".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 5", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            5:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 6".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 6", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            6:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 7".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 7", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            7:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 8".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 8", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            8:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 9".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 9", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            9:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 10".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 10", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            10:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 11".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 11", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            11:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 12".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 12", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            12:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 13".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 13", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            13:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 14".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 14", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            14:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 15".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 15", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            15:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 16".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 16", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            16:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 17".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 17", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            17:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 18".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 18", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            18:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 19".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 19", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            19:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 20".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 20", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            20:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 21".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 21", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            21:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 22".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 22", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            22:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 23".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 23", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            23:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 24".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 24", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            24:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 25".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 25", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            25:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 26".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 26", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            26:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 27".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 27", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            27:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 28".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 28", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            28:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 29".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 29", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            29:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 30".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 30", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            30:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 31".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 31", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            31:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 32".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 32", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            32:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 33".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 33", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            33:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 34".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 34", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            34:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 35".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 35", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            35:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 36".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 36", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            36:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 37".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 37", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            37:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 38".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 38", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            38:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 39".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 39", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            39:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 40".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 40", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            40:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 41".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 41", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            41:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 42".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 42", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            42:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 43".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 43", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            43:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 44".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 44", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            44:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 45".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 45", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            45:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 46".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 46", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            46:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 47".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 47", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            47:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 48".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 48", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            48:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 49".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 49", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            49:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 50".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 50", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            50:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 51".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 51", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            51:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 52".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 52", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            52:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 53".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 53", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            53:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 54".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 54", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            54:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 55".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 55", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            55:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 56".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 56", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            56:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 57".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 57", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            57:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 58".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 58", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            58:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 59".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 59", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            59:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 60".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 60", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            60:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 61".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 61", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            61:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 62".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 62", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            62:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 63".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 63", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            63:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 64".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 64", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            64:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 65".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 65", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            65:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 66".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 66", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            66:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 67".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 67", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            67:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 68".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 68", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            68:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 69".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 69", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            69:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 70".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 70", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            70:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 71".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 71", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            71:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 72".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 72", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            72:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 73".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 73", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            73:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 74".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 74", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            74:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 75".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 75", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            75:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 76".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 76", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            76:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 77".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 77", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            77:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 78".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 78", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            78:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 79".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 79", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            79:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 80".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 80", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            80:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 81".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 81", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            81:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 82".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 82", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            82:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 83".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 83", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            83:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 84".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 84", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            84:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 85".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 85", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            85:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 86".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 86", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            86:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 87".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 87", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            87:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 88".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 88", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            88:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 89".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 89", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            89:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 90".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 90", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            90:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 91".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 91", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            91:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 92".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 92", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            92:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 93".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 93", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            93:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 94".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 94", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            94:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 95".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 95", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            95:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 96".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 96", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            96:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 97".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 97", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            97:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 98".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 98", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            98:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 99".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 99", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            99:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 100".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 100", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            100:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 101".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 101", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            101:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 102".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 102", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            102:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 103".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 103", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            103:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 104".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 104", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            104:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 105".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 105", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            105:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 106".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 106", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            106:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 107".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 107", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            107:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 108".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 108", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            108:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 109".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 109", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            109:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 110".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 110", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            110:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 111".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 111", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            111:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 112".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 112", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            112:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 113".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 113", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            113:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 114".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 114", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            114:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 115".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 115", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            115:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 116".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 116", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            116:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 117".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 117", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            117:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 118".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 118", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            118:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 119".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 119", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            119:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 120".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 120", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            120:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 121".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 121", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            121:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 122".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 122", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            122:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 123".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 123", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            123:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 124".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 124", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            124:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 125".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 125", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            125:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 126".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 126", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            126:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 127".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 127", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            127:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 128".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 128", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            128:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 129".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 129", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            129:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 130".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 130", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            130:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 131".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 131", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            131:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 132".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 132", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            132:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 133".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 133", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            133:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 134".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 134", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            134:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 135".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 135", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            135:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 136".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 136", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            136:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 137".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 137", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            137:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 138".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 138", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            138:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 139".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 139", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            139:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 140".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 140", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            140:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 141".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 141", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            141:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 142".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 142", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            142:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 143".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 143", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            143:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 144".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 144", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            144:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 145".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 145", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            145:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 146".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 146", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            146:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 147".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 147", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            147:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 148".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 148", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            148:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 149".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 149", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            149:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 150".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 150", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            150:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 151".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 151", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            151:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 152".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 152", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            152:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 153".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 153", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            153:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 154".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 154", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            154:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 155".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 155", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            155:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 156".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 156", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            156:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 157".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 157", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            157:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 158".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 158", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            158:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 159".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 159", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            159:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 160".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 160", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            160:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 161".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 161", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            161:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 162".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 162", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            162:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 163".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 163", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            163:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 164".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 164", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            164:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 165".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 165", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            165:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 166".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 166", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            166:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 167".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 167", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            167:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 168".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 168", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            168:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 169".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 169", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            169:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 170".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 170", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            170:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 171".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 171", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            171:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 172".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 172", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            172:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 173".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 173", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            173:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 174".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 174", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            174:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 175".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 175", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            175:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 176".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 176", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            176:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 177".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 177", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            177:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 178".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 178", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            178:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 179".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 179", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            179:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 180".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 180", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            180:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 181".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 181", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            181:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 182".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 182", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            182:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 183".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 183", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            183:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 184".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 184", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            184:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 185".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 185", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            185:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 186".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 186", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            186:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 187".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 187", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            187:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 188".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 188", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            188:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 189".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 189", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            189:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 190".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 190", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            190:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 191".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 191", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            191:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 192".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 192", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            192:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 193".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 193", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            193:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 194".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 194", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            194:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 195".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 195", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            195:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 196".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 196", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            196:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 197".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 197", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            197:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 198".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 198", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            198:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 199".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 199", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            199:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 200".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 200", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            200:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 201".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 201", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            201:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 202".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 202", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            202:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 203".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 203", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            203:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 204".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 204", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            204:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 205".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 205", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            205:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 206".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 206", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            206:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 207".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 207", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            207:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 208".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 208", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            208:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 209".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 209", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            209:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 210".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 210", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            210:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 211".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 211", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            211:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 212".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 212", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            212:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 213".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 213", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            213:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 214".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 214", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            214:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 215".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 215", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            215:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 216".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 216", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            216:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 217".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 217", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            217:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 218".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 218", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            218:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 219".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 219", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            219:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 220".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 220", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            220:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 221".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 221", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            221:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 222".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 222", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            222:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 223".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 223", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            223:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 224".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 224", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            224:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 225".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 225", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            225:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 226".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 226", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            226:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 227".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 227", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            227:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 228".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 228", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            228:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 229".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 229", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            229:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 230".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 230", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            230:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 231".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 231", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            231:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 232".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 232", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            232:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 233".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 233", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            233:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 234".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 234", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            234:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 235".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 235", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            235:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 236".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 236", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            236:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 237".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 237", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            237:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 238".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 238", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            238:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 239".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 239", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            239:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 240".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 240", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            240:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 241".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 241", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            241:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 242".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 242", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            242:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 243".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 243", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            243:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 244".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 244", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            244:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 245".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 245", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            245:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 246".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 246", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            246:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 247".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 247", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            247:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 248".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 248", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            248:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 249".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 249", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            249:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 250".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 250", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            250:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 251".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 251", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            251:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 252".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 252", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            252:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 253".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 253", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            253:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 254".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 254", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            254:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 255".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 255", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            255:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 256".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 256", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            256:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 257".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 257", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            257:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 258".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 258", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            258:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 259".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 259", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            259:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 260".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 260", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            260:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 261".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 261", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            261:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 262".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 262", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            262:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 263".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 263", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            263:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 264".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 264", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            264:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 265".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 265", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            265:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 266".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 266", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            266:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 267".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 267", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            267:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 268".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 268", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            268:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 269".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 269", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            269:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 270".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 270", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            270:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 271".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 271", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            271:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 272".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 272", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            272:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 273".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 273", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            273:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 274".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 274", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            274:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 275".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 275", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            275:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 276".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 276", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            276:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 277".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 277", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            277:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 278".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 278", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            278:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 279".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 279", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            279:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 280".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 280", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            280:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 281".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 281", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            281:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 282".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 282", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            282:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 283".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 283", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            283:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 284".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 284", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            284:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 285".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 285", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            285:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 286".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 286", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            286:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 287".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 287", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            287:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 288".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 288", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            288:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 289".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 289", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            289:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 290".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 290", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            290:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 291".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 291", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            291:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 292".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 292", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            292:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 293".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 293", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            293:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 294".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 294", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            294:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 295".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 295", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            295:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 296".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 296", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            296:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 297".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 297", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            297:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 298".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 298", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            298:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 299".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 299", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            299:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 300".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 300", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
            300:
                Assert.AreEqual(FieldValue, DataEditorBuffer."Text Value 301".Value(),
                    StrSubstNo(WrongValueErr, FieldValue, DataEditorBuffer."Text Value 301", FieldIndex, DataEditorBuffer."Source Record ID".Value()));
        end;
    end;
}