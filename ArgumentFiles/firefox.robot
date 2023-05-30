--name offBeat Donut Tests on FireFox
--exclude donotrun
--exclude firefox
--exclude edge
--xunit offBeatTest-xunit.xml
--listener time_logger.py
--outputdir reports
--output offBeatTest-xml
--log offBeatTest-log
--report offBeatTest-report
--variable browser:firefox
--variable channel:None
--variable environment:user01
--loglevel TRACE
--variable headless:false
--debugfile debug_gc.log
Robot_Tests/001_Home_Page/
Robot_Tests/002_Order_Now_Tests/
Robot_Tests/1000_Close_Browser/
