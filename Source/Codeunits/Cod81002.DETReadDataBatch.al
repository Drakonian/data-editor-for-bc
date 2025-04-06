codeunit 81002 "DET Read Data Batch"
{
    TableNo = "DET Data Editor Buffer";

    trigger OnRun()
    var
        TempBlob: Codeunit "Temp Blob";
        DataEditorMgt: Codeunit "DET Data Editor Mgt.";
        ConfigProgressBar: Codeunit "Config. Progress Bar";
        RecRef: RecordRef;
        TempDataEditorBufferRecRef: RecordRef;
        FieldRefVar: FieldRef;
        FieldRefVar2: FieldRef;
        JObject: JsonObject;
        JToken: JsonToken;
        JObjectAsTxt: Text;
        StartIndex, EndIndex, TableNo, Counter, TotalCount, FieldNumber : integer;
        IsParallelRun: Boolean;
        FilterView: Text;
    begin
        TempBlob.FromRecord(Rec, Rec.FieldNo("Data To Process"));

        JObjectAsTxt := GetTempBlobAsTxt(TempBlob);
        JObject.ReadFrom(JObjectAsTxt);

        JObject.Get('StartIndex', JToken);
        StartIndex := JToken.AsValue().AsInteger();

        JObject.Get('EndIndex', JToken);
        EndIndex := JToken.AsValue().AsInteger();

        JObject.Get('FilterView', JToken);
        FilterView := JToken.AsValue().AsText();

        JObject.Get('TableNo', JToken);
        TableNo := JToken.AsValue().AsInteger();

        JObject.Get('FieldNumbersToRead', JToken);
        LoadFieldNoList := DataEditorMgt.ConvertListTextToListInteger(JToken.AsValue().AsText().Split(','));

        JObject.Get('IsParallelRun', JToken);
        IsParallelRun := JToken.AsValue().AsBoolean();

        RecRef.Open(TableNo);
        RecRef.SetView(FilterView);
        RecRef.ReadIsolation := RecRef.ReadIsolation::ReadCommitted;
        InitLoadFields(RecRef);

        TempDataEditorBufferRecRef.GetTable(Rec);

        TotalCount := EndIndex - StartIndex + 1;

        if GuiAllowed() then
            ConfigProgressBar.Init(TotalCount, 1, RecRef.Caption());

        if StartIndex = 1 then
            RecRef.FindSet()
        else
            RecRef.Next(StartIndex);

        repeat
            Counter := 0;
            TempDataEditorBufferRecRef.Init();
            FieldRefVar2 := TempDataEditorBufferRecRef.FieldIndex(1);
            FieldRefVar2.Value(StartIndex);
            FieldRefVar2 := TempDataEditorBufferRecRef.FieldIndex(2);
            FieldRefVar2.Value(RecRef.RecordId());

            foreach FieldNumber in LoadFieldNoList do begin
                Counter += 1;
                FieldRefVar := RecRef.Field(FieldNumber);

                //Performance bottleneck
                if FieldRefVar.Class() = FieldClass::FlowField then
                    FieldRefVar.CalcField();

                FieldRefVar2 := TempDataEditorBufferRecRef.FieldIndex(Counter + 2);
                FieldRefVar2.Value(FieldRefVar.Value());
            end;

            TempDataEditorBufferRecRef.Insert();
            StartIndex += 1;

            if GuiAllowed() then
                ConfigProgressBar.UpdateCount(StrSubstNo(ProgressStatusTxt, StartIndex, TotalCount), StartIndex - 1);
        until (RecRef.Next() = 0) or (StartIndex > EndIndex);

        if GuiAllowed() then
            ConfigProgressBar.Close();
    end;

    local procedure InitLoadFields(var inRecRef: RecordRef)
    begin
        inRecRef.SetLoadFields(TryGetFieldNo(1), TryGetFieldNo(2), TryGetFieldNo(3), TryGetFieldNo(4), TryGetFieldNo(5), TryGetFieldNo(6),
            TryGetFieldNo(7), TryGetFieldNo(8), TryGetFieldNo(9), TryGetFieldNo(10), TryGetFieldNo(11), TryGetFieldNo(12), TryGetFieldNo(13),
            TryGetFieldNo(14), TryGetFieldNo(15), TryGetFieldNo(16), TryGetFieldNo(17), TryGetFieldNo(18), TryGetFieldNo(19), TryGetFieldNo(20),
            TryGetFieldNo(21), TryGetFieldNo(22), TryGetFieldNo(23), TryGetFieldNo(24), TryGetFieldNo(25), TryGetFieldNo(26), TryGetFieldNo(27),
            TryGetFieldNo(28), TryGetFieldNo(29), TryGetFieldNo(30), TryGetFieldNo(31), TryGetFieldNo(32), TryGetFieldNo(33), TryGetFieldNo(34),
            TryGetFieldNo(35), TryGetFieldNo(36), TryGetFieldNo(37), TryGetFieldNo(38), TryGetFieldNo(39), TryGetFieldNo(40), TryGetFieldNo(41),
            TryGetFieldNo(42), TryGetFieldNo(43), TryGetFieldNo(44), TryGetFieldNo(45), TryGetFieldNo(46), TryGetFieldNo(47), TryGetFieldNo(48),
            TryGetFieldNo(49), TryGetFieldNo(50), TryGetFieldNo(51), TryGetFieldNo(52), TryGetFieldNo(53), TryGetFieldNo(54), TryGetFieldNo(55),
            TryGetFieldNo(56), TryGetFieldNo(57), TryGetFieldNo(58), TryGetFieldNo(59), TryGetFieldNo(60), TryGetFieldNo(61), TryGetFieldNo(62),
            TryGetFieldNo(63), TryGetFieldNo(64), TryGetFieldNo(65), TryGetFieldNo(66), TryGetFieldNo(67), TryGetFieldNo(68), TryGetFieldNo(69),
            TryGetFieldNo(70), TryGetFieldNo(71), TryGetFieldNo(72), TryGetFieldNo(73), TryGetFieldNo(74), TryGetFieldNo(75), TryGetFieldNo(76),
            TryGetFieldNo(77), TryGetFieldNo(78), TryGetFieldNo(79), TryGetFieldNo(80), TryGetFieldNo(81), TryGetFieldNo(82), TryGetFieldNo(83),
            TryGetFieldNo(84), TryGetFieldNo(85), TryGetFieldNo(86), TryGetFieldNo(87), TryGetFieldNo(88), TryGetFieldNo(89), TryGetFieldNo(90),
            TryGetFieldNo(91), TryGetFieldNo(92), TryGetFieldNo(93), TryGetFieldNo(94), TryGetFieldNo(95), TryGetFieldNo(96), TryGetFieldNo(97),
            TryGetFieldNo(98), TryGetFieldNo(99), TryGetFieldNo(100), TryGetFieldNo(101), TryGetFieldNo(102), TryGetFieldNo(103), TryGetFieldNo(104),
            TryGetFieldNo(105), TryGetFieldNo(106), TryGetFieldNo(107), TryGetFieldNo(108), TryGetFieldNo(109), TryGetFieldNo(110), TryGetFieldNo(111),
            TryGetFieldNo(112), TryGetFieldNo(113), TryGetFieldNo(114), TryGetFieldNo(115), TryGetFieldNo(116), TryGetFieldNo(117), TryGetFieldNo(118),
            TryGetFieldNo(119), TryGetFieldNo(120), TryGetFieldNo(121), TryGetFieldNo(122), TryGetFieldNo(123), TryGetFieldNo(124), TryGetFieldNo(125),
            TryGetFieldNo(126), TryGetFieldNo(127), TryGetFieldNo(128), TryGetFieldNo(129), TryGetFieldNo(130), TryGetFieldNo(131), TryGetFieldNo(132),
            TryGetFieldNo(133), TryGetFieldNo(134), TryGetFieldNo(135), TryGetFieldNo(136), TryGetFieldNo(137), TryGetFieldNo(138), TryGetFieldNo(139),
            TryGetFieldNo(140), TryGetFieldNo(141), TryGetFieldNo(142), TryGetFieldNo(143), TryGetFieldNo(144), TryGetFieldNo(145), TryGetFieldNo(146),
            TryGetFieldNo(147), TryGetFieldNo(148), TryGetFieldNo(149), TryGetFieldNo(150), TryGetFieldNo(151), TryGetFieldNo(152), TryGetFieldNo(153),
            TryGetFieldNo(154), TryGetFieldNo(155), TryGetFieldNo(156), TryGetFieldNo(157), TryGetFieldNo(158), TryGetFieldNo(159), TryGetFieldNo(160),
            TryGetFieldNo(161), TryGetFieldNo(162), TryGetFieldNo(163), TryGetFieldNo(164), TryGetFieldNo(165), TryGetFieldNo(166), TryGetFieldNo(167),
            TryGetFieldNo(168), TryGetFieldNo(169), TryGetFieldNo(170), TryGetFieldNo(171), TryGetFieldNo(172), TryGetFieldNo(173), TryGetFieldNo(174),
            TryGetFieldNo(175), TryGetFieldNo(176), TryGetFieldNo(177), TryGetFieldNo(178), TryGetFieldNo(179), TryGetFieldNo(180), TryGetFieldNo(181),
            TryGetFieldNo(182), TryGetFieldNo(183), TryGetFieldNo(184), TryGetFieldNo(185), TryGetFieldNo(186), TryGetFieldNo(187), TryGetFieldNo(188),
            TryGetFieldNo(189), TryGetFieldNo(190), TryGetFieldNo(191), TryGetFieldNo(192), TryGetFieldNo(193), TryGetFieldNo(194), TryGetFieldNo(195),
            TryGetFieldNo(196), TryGetFieldNo(197), TryGetFieldNo(198), TryGetFieldNo(199), TryGetFieldNo(200), TryGetFieldNo(201), TryGetFieldNo(202),
            TryGetFieldNo(203), TryGetFieldNo(204), TryGetFieldNo(205), TryGetFieldNo(206), TryGetFieldNo(207), TryGetFieldNo(208), TryGetFieldNo(209),
            TryGetFieldNo(210), TryGetFieldNo(211), TryGetFieldNo(212), TryGetFieldNo(213), TryGetFieldNo(214), TryGetFieldNo(215), TryGetFieldNo(216),
            TryGetFieldNo(217), TryGetFieldNo(218), TryGetFieldNo(219), TryGetFieldNo(220), TryGetFieldNo(221), TryGetFieldNo(222), TryGetFieldNo(223),
            TryGetFieldNo(224), TryGetFieldNo(225), TryGetFieldNo(226), TryGetFieldNo(227), TryGetFieldNo(228), TryGetFieldNo(229), TryGetFieldNo(230),
            TryGetFieldNo(231), TryGetFieldNo(232), TryGetFieldNo(233), TryGetFieldNo(234), TryGetFieldNo(235), TryGetFieldNo(236), TryGetFieldNo(237),
            TryGetFieldNo(238), TryGetFieldNo(239), TryGetFieldNo(240), TryGetFieldNo(241), TryGetFieldNo(242), TryGetFieldNo(243), TryGetFieldNo(244),
            TryGetFieldNo(245), TryGetFieldNo(246), TryGetFieldNo(247), TryGetFieldNo(248), TryGetFieldNo(249), TryGetFieldNo(250), TryGetFieldNo(251),
            TryGetFieldNo(252), TryGetFieldNo(253), TryGetFieldNo(254), TryGetFieldNo(255), TryGetFieldNo(256), TryGetFieldNo(257), TryGetFieldNo(258),
            TryGetFieldNo(259), TryGetFieldNo(260), TryGetFieldNo(261), TryGetFieldNo(262), TryGetFieldNo(263), TryGetFieldNo(264), TryGetFieldNo(265),
            TryGetFieldNo(266), TryGetFieldNo(267), TryGetFieldNo(268), TryGetFieldNo(269), TryGetFieldNo(270), TryGetFieldNo(271), TryGetFieldNo(272),
            TryGetFieldNo(273), TryGetFieldNo(274), TryGetFieldNo(275), TryGetFieldNo(276), TryGetFieldNo(277), TryGetFieldNo(278), TryGetFieldNo(279),
            TryGetFieldNo(280), TryGetFieldNo(281), TryGetFieldNo(282), TryGetFieldNo(283), TryGetFieldNo(284), TryGetFieldNo(285), TryGetFieldNo(286),
            TryGetFieldNo(287), TryGetFieldNo(288), TryGetFieldNo(289), TryGetFieldNo(290), TryGetFieldNo(291), TryGetFieldNo(292), TryGetFieldNo(293),
            TryGetFieldNo(294), TryGetFieldNo(295), TryGetFieldNo(296), TryGetFieldNo(297), TryGetFieldNo(298), TryGetFieldNo(299), TryGetFieldNo(300),
            TryGetFieldNo(301), TryGetFieldNo(302), TryGetFieldNo(303), TryGetFieldNo(304), TryGetFieldNo(305), TryGetFieldNo(306), TryGetFieldNo(307),
            TryGetFieldNo(308), TryGetFieldNo(309), TryGetFieldNo(310), TryGetFieldNo(311), TryGetFieldNo(312), TryGetFieldNo(313), TryGetFieldNo(314),
            TryGetFieldNo(315), TryGetFieldNo(316), TryGetFieldNo(317), TryGetFieldNo(318), TryGetFieldNo(319), TryGetFieldNo(320), TryGetFieldNo(321),
            TryGetFieldNo(322), TryGetFieldNo(323), TryGetFieldNo(324), TryGetFieldNo(325), TryGetFieldNo(326), TryGetFieldNo(327), TryGetFieldNo(328),
            TryGetFieldNo(329), TryGetFieldNo(330), TryGetFieldNo(331), TryGetFieldNo(332), TryGetFieldNo(333), TryGetFieldNo(334), TryGetFieldNo(335),
            TryGetFieldNo(336), TryGetFieldNo(337), TryGetFieldNo(338), TryGetFieldNo(339), TryGetFieldNo(340), TryGetFieldNo(341), TryGetFieldNo(342),
            TryGetFieldNo(343), TryGetFieldNo(344), TryGetFieldNo(345), TryGetFieldNo(346), TryGetFieldNo(347), TryGetFieldNo(348), TryGetFieldNo(349),
            TryGetFieldNo(350), TryGetFieldNo(351), TryGetFieldNo(352), TryGetFieldNo(353), TryGetFieldNo(354), TryGetFieldNo(355), TryGetFieldNo(356),
            TryGetFieldNo(357), TryGetFieldNo(358), TryGetFieldNo(359), TryGetFieldNo(360), TryGetFieldNo(361), TryGetFieldNo(362), TryGetFieldNo(363),
            TryGetFieldNo(364), TryGetFieldNo(365), TryGetFieldNo(366), TryGetFieldNo(367), TryGetFieldNo(368), TryGetFieldNo(369), TryGetFieldNo(370),
            TryGetFieldNo(371), TryGetFieldNo(372), TryGetFieldNo(373), TryGetFieldNo(374), TryGetFieldNo(375), TryGetFieldNo(376), TryGetFieldNo(377),
            TryGetFieldNo(378), TryGetFieldNo(379), TryGetFieldNo(380), TryGetFieldNo(381), TryGetFieldNo(382), TryGetFieldNo(383), TryGetFieldNo(384),
            TryGetFieldNo(385), TryGetFieldNo(386), TryGetFieldNo(387), TryGetFieldNo(388), TryGetFieldNo(389), TryGetFieldNo(390), TryGetFieldNo(391),
            TryGetFieldNo(392), TryGetFieldNo(393), TryGetFieldNo(394), TryGetFieldNo(395), TryGetFieldNo(396), TryGetFieldNo(397), TryGetFieldNo(398),
            TryGetFieldNo(399), TryGetFieldNo(400));
    end;

    local procedure TryGetFieldNo(Index: Integer): Integer
    begin
        if LoadFieldNoList.Count() < Index then
            exit(0);
        exit(LoadFieldNoList.Get(Index));
    end;

    procedure GetTempBlobAsTxt(var TempBlob: Codeunit "Temp Blob") Response: Text
    var
        ValueInStream: InStream;
        BufferTxt: Text;
    begin
        TempBlob.CreateInStream(ValueInStream, TextEncoding::UTF8);
        while not ValueInStream.EOS() do begin
            ValueInStream.Read(BufferTxt);
            Response += BufferTxt;
        end;
    end;

    var
        LoadFieldNoList: List of [Integer];
        ProgressStatusTxt: Label 'Processing %1 records out of %2', Comment = '%1 = table name; %2 = number of processed records (integer); %3 = total number records (integer).';
}