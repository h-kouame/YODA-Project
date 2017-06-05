<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(15:0)" />
        <signal name="XLXN_2(15:0)" />
        <signal name="CLK" />
        <signal name="Pmod_Data_In_1" />
        <signal name="Pmod_Data_In_2" />
        <signal name="Pmod_CS" />
        <signal name="Pmod_CLK" />
        <signal name="MOSI" />
        <signal name="SPI_CLK" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="Pmod_Data_In_1" />
        <port polarity="Input" name="Pmod_Data_In_2" />
        <port polarity="Output" name="Pmod_CS" />
        <port polarity="Output" name="Pmod_CLK" />
        <port polarity="Output" name="MOSI" />
        <port polarity="Input" name="SPI_CLK" />
        <blockdef name="SPI_Module">
            <timestamp>2016-7-17T13:8:31</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="pmodad1">
            <timestamp>2016-7-19T9:6:52</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="SPI_Module" name="XLXI_8">
            <blockpin signalname="SPI_CLK" name="clk" />
            <blockpin signalname="XLXN_1(15:0)" name="data_in_0(15:0)" />
            <blockpin signalname="XLXN_2(15:0)" name="data_in_1(15:0)" />
            <blockpin signalname="MOSI" name="mosi" />
        </block>
        <block symbolname="pmodad1" name="XLXI_9">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="Pmod_Data_In_1" name="pmod_data1" />
            <blockpin signalname="Pmod_Data_In_2" name="pmod_data2" />
            <blockpin signalname="Pmod_CS" name="pmod_cs" />
            <blockpin signalname="Pmod_CLK" name="pmod_clk" />
            <blockpin signalname="XLXN_1(15:0)" name="data_ch1(15:0)" />
            <blockpin signalname="XLXN_2(15:0)" name="data_ch2(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1(15:0)">
            <wire x2="1184" y1="1056" y2="1056" x1="736" />
        </branch>
        <branch name="XLXN_2(15:0)">
            <wire x2="1184" y1="1120" y2="1120" x1="736" />
        </branch>
        <branch name="CLK">
            <wire x2="352" y1="928" y2="928" x1="320" />
        </branch>
        <iomarker fontsize="28" x="320" y="928" name="CLK" orien="R180" />
        <branch name="Pmod_Data_In_1">
            <wire x2="352" y1="992" y2="992" x1="320" />
        </branch>
        <iomarker fontsize="28" x="320" y="992" name="Pmod_Data_In_1" orien="R180" />
        <branch name="Pmod_Data_In_2">
            <wire x2="352" y1="1056" y2="1056" x1="320" />
        </branch>
        <iomarker fontsize="28" x="320" y="1056" name="Pmod_Data_In_2" orien="R180" />
        <branch name="Pmod_CS">
            <wire x2="768" y1="928" y2="928" x1="736" />
        </branch>
        <iomarker fontsize="28" x="768" y="928" name="Pmod_CS" orien="R0" />
        <branch name="Pmod_CLK">
            <wire x2="768" y1="992" y2="992" x1="736" />
        </branch>
        <iomarker fontsize="28" x="768" y="992" name="Pmod_CLK" orien="R0" />
        <branch name="MOSI">
            <wire x2="1584" y1="992" y2="992" x1="1568" />
        </branch>
        <iomarker fontsize="28" x="1584" y="992" name="MOSI" orien="R0" />
        <instance x="1184" y="1152" name="XLXI_8" orien="R0">
        </instance>
        <branch name="SPI_CLK">
            <wire x2="1168" y1="992" y2="992" x1="1136" />
            <wire x2="1184" y1="992" y2="992" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="1136" y="992" name="SPI_CLK" orien="R180" />
        <instance x="352" y="1152" name="XLXI_9" orien="R0">
        </instance>
    </sheet>
</drawing>