CREATE DATABASE IF NOT EXISTS ${DB};

USE ${DB};

DROP TABLE IF EXISTS AIRLINE_PERF_EXT;

-- NOTE: This version of the create seems to cause issue when submitted through JDBC with
--    applications like DBVis or Squirrel.  Beeline works fine.  A trimmed (commentless) version
--    is available through create_alt.sql
CREATE EXTERNAL TABLE AIRLINE_PERF_EXT (
    Year_                                              STRING COMMENT "Year",
    Quarter                                            STRING COMMENT "Quarter (1-4)",
    Month_                                             STRING COMMENT "Month",
    DayofMonth                                         STRING COMMENT "Day of Month",
    DayOfWeek                                          STRING COMMENT "Day of Week",
    FlightDate                                         STRING COMMENT "Flight Date (yyyymmdd)",
    Marketing_Airline_Network                          STRING COMMENT "Unique Marketing Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users, for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.",
    Operated_or_Branded_Code_Share_Partners            STRING COMMENT "Reporting Carrier Operated or Branded Code Share Partners",
    DOT_ID_Marketing_Airline                           STRING COMMENT "An identification number assigned by US DOT to identify a unique airline (carrier). A unique airline (carrier) is defined as one holding and reporting under the same DOT certificate regardless of its Code, Name, or holding company/corporation.",
    IATA_Code_Marketing_Airline                        STRING COMMENT "Code assigned by IATA and commonly used to identify a carrier. As the same code may have been assigned to different carriers over time, the code is not always unique. For analysis, use the Unique Carrier Code.",
    Flight_Number_Marketing_Airline                    STRING COMMENT "Flight Number",
    Originally_Scheduled_Code_Share_Airline            STRING COMMENT "Unique Scheduled Operating Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users,for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.",
    DOT_ID_Originally_Scheduled_Code_Share_Airline     STRING COMMENT "An identification number assigned by US DOT to identify a unique airline (carrier). A unique airline (carrier) is defined as one holding and reporting under the same DOT certificate regardless of its Code, Name, or holding company/corporation.",
    IATA_Code_Originally_Scheduled_Code_Share_Airline  STRING COMMENT "Code assigned by IATA and commonly used to identify a carrier. As the same code may have been assigned to different carriers over time, the code is not always unique. For analysis, use the Unique Carrier Code.",
    Flight_Num_Originally_Scheduled_Code_Share_Airline STRING COMMENT "Flight Number",
    Operating_Airline                                  STRING COMMENT "Unique Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users, for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.",
    DOT_ID_Operating_Airline                           STRING COMMENT "An identification number assigned by US DOT to identify a unique airline (carrier). A unique airline (carrier) is defined as one holding and reporting under the same DOT certificate regardless of its Code, Name, or holding company/corporation.",
    IATA_Code_Operating_Airline                        STRING COMMENT "Code assigned by IATA and commonly used to identify a carrier. As the same code may have been assigned to different carriers over time, the code is not always unique. For analysis, use the Unique Carrier Code.",
    Tail_Number                                        STRING COMMENT "Tail Number",
    Flight_Number_Operating_Airline                    STRING COMMENT "Flight Number",
    OriginAirportID                                    STRING COMMENT "Origin Airport, Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.",
    OriginAirportSeqID                                 STRING COMMENT "Origin Airport, Airport Sequence ID. An identification number assigned by US DOT to identify a unique airport at a given point of time. Airport attributes, such as airport name or coordinates, may change over time.",
    OriginCityMarketID                                 STRING COMMENT "Origin Airport, City Market ID. City Market ID is an identification number assigned by US DOT to identify a city market. Use this field to consolidate airports serving the same city market.",
    Origin                                             STRING COMMENT "Origin Airport",
    OriginCityName                                     STRING COMMENT "Origin Airport City Name",
    OriginState                                        STRING COMMENT "Origin Airport State Code",
    OriginStateFips                                    STRING COMMENT "Origin Airport State Fips",
    OriginStateName                                    STRING COMMENT "Origin Airport State Name",
    OriginWac                                          STRING COMMENT "Origin Airport World Area Code",
    DestAirportID                                      STRING COMMENT "Destination Airport Airport ID. An identification number assigned by US DOT to identify a unique airport. Use this field for airport analysis across a range of years because an airport can change its airport code and airport codes can be reused.",
    DestAirportSeqID                                   STRING COMMENT "Destination Airport, Airport Sequence ID. An identification number assigned by US DOT to identify a unique airport at a given point of time. Airport attributes, such as airport name or coordinates, may change over time.",
    DestCityMarketID                                   STRING COMMENT "Destination Airport, City Market ID. City Market ID is an identification number assigned by US DOT to identify a city market. Use this field to consolidate airports serving the same city market.",
    Dest                                               STRING COMMENT "Destination Airport",
    DestCityName                                       STRING COMMENT "Destination Airport, City Name",
    DestState                                          STRING COMMENT "Destination Airport, State Code",
    DestStateFips                                      STRING COMMENT "Destination Airport, State Fips",
    DestStateName                                      STRING COMMENT "Destination Airport, State Name",
    DestWac                                            STRING COMMENT "Destination Airport, World Area Code",
    CRSDepTime                                         STRING COMMENT "CRS Departure Time (local time: hhmm)",
    DepTime                                            STRING COMMENT "Actual Departure Time (local time: hhmm)",
    DepDelay                                           STRING COMMENT "Difference in minutes between scheduled and actual departure time. Early departures show negative numbers.",
    DepDelayMinutes                                    STRING COMMENT "Difference in minutes between scheduled and actual departure time. Early departures set to 0.",
    DepDel15                                           STRING COMMENT "Departure Delay Indicator, 15 Minutes or More (1=Yes)",
    DepartureDelayGroups                               STRING COMMENT "Departure Delay intervals, every (15 minutes from <-15 to >180)",
    DepTimeBlk                                         STRING COMMENT "CRS Departure Time Block, Hourly Intervals",
    TaxiOut                                            STRING COMMENT "Taxi Out Time, in Minutes",
    WheelsOff                                          STRING COMMENT "Wheels Off Time (local time: hhmm)",
    WheelsOn                                           STRING COMMENT "Wheels On Time (local time: hhmm)",
    TaxiIn                                             STRING COMMENT "Taxi In Time, in Minutes",
    CRSArrTime                                         STRING COMMENT "CRS Arrival Time (local time: hhmm)",
    ArrTime                                            STRING COMMENT "Actual Arrival Time (local time: hhmm)",
    ArrDelay                                           STRING COMMENT "Difference in minutes between scheduled and actual arrival time. Early arrivals show negative numbers.",
    ArrDelayMinutes                                    STRING COMMENT "Difference in minutes between scheduled and actual arrival time. Early arrivals set to 0.",
    ArrDel15                                           STRING COMMENT "Arrival Delay Indicator, 15 Minutes or More (1=Yes)",
    ArrivalDelayGroups                                 STRING COMMENT "Arrival Delay intervals, every (15-minutes from <-15 to >180)",
    ArrTimeBlk                                         STRING COMMENT "CRS Arrival Time Block, Hourly Intervals",
    Cancelled                                          STRING COMMENT "Cancelled Flight Indicator (1=Yes)",
    CancellationCode                                   STRING COMMENT "Specifies The Reason For Cancellation",
    Diverted                                           STRING COMMENT "Diverted Flight Indicator (1=Yes)",
    CRSElapsedTime                                     STRING COMMENT "CRS Elapsed Time of Flight, in Minutes",
    ActualElapsedTime                                  STRING COMMENT "Elapsed Time of Flight, in Minutes",
    AirTime                                            STRING COMMENT "Flight Time, in Minutes",
    Flights                                            STRING COMMENT "Number of Flights",
    Distance                                           STRING COMMENT "Distance between airports (miles)",
    DistanceGroup                                      STRING COMMENT "Distance Intervals, every 250 Miles, for Flight Segment",
    CarrierDelay                                       STRING COMMENT "Carrier Delay, in Minutes",
    WeatherDelay                                       STRING COMMENT "Weather Delay, in Minutes",
    NASDelay                                           STRING COMMENT "National Air System Delay, in Minutes",
    SecurityDelay                                      STRING COMMENT "Security Delay, in Minutes",
    LateAircraftDelay                                  STRING COMMENT "Late Aircraft Delay, in Minutes",
    FirstDepTime                                       STRING COMMENT "First Gate Departure Time at Origin Airport",
    TotalAddGTime                                      STRING COMMENT "Total Ground Time Away from Gate for Gate Return or Cancelled Flight",
    LongestAddGTime                                    STRING COMMENT "Longest Time Away from Gate for Gate Return or Cancelled Flight",
    DivAirportLandings                                 STRING COMMENT "Number of Diverted Airport Landings",
    DivReachedDest                                     STRING COMMENT "Diverted Flight Reaching Scheduled Destination Indicator (1=Yes)",
    DivActualElapsedTime                               STRING COMMENT "Elapsed Time of Diverted Flight Reaching Scheduled Destination, in Minutes. The ActualElapsedTime column remains NULL for all diverted flights.",
    DivArrDelay                                        STRING COMMENT "Difference in minutes between scheduled and actual arrival time for a diverted flight reaching scheduled destination. The ArrDelay column remains NULL for all diverted flights.",
    DivDistance                                        STRING COMMENT "Distance between scheduled destination and final diverted airport (miles). Value will be 0 for diverted flight reaching scheduled destination.",
    Div1Airport                                        STRING COMMENT "Diverted Airport Code1",
    Div1AirportID                                      STRING COMMENT "Airport ID of Diverted Airport 1. Airport ID is a Unique Key for an Airport",
    Div1AirportSeqID                                   STRING COMMENT "Airport Sequence ID of Diverted Airport 1. Unique Key for Time Specific Information for an Airport",
    Div1WheelsOn                                       STRING COMMENT "Wheels On Time (local time: hhmm) at Diverted Airport Code1",
    Div1TotalGTime                                     STRING COMMENT "Total Ground Time Away from Gate at Diverted Airport Code1",
    Div1LongestGTime                                   STRING COMMENT "Longest Ground Time Away from Gate at Diverted Airport Code1",
    Div1WheelsOff                                      STRING COMMENT "Wheels Off Time (local time: hhmm) at Diverted Airport Code1",
    Div1TailNum                                        STRING COMMENT "Aircraft Tail Number for Diverted Airport Code1",
    Div2Airport                                        STRING COMMENT "Diverted Airport Code2",
    Div2AirportID                                      STRING COMMENT "Airport ID of Diverted Airport 2. Airport ID is a Unique Key for an Airport",
    Div2AirportSeqID                                   STRING COMMENT "Airport Sequence ID of Diverted Airport 2. Unique Key for Time Specific Information for an Airport",
    Div2WheelsOn                                       STRING COMMENT "Wheels On Time (local time: hhmm) at Diverted Airport Code2",
    Div2TotalGTime                                     STRING COMMENT "Total Ground Time Away from Gate at Diverted Airport Code2",
    Div2LongestGTime                                   STRING COMMENT "Longest Ground Time Away from Gate at Diverted Airport Code2",
    Div2WheelsOff                                      STRING COMMENT "Wheels Off Time (local time: hhmm) at Diverted Airport Code2",
    Div2TailNum                                        STRING COMMENT "Aircraft Tail Number for Diverted Airport Code2",
    Div3Airport                                        STRING COMMENT "Diverted Airport Code3",
    Div3AirportID                                      STRING COMMENT "Airport ID of Diverted Airport 3. Airport ID is a Unique Key for an Airport",
    Div3AirportSeqID                                   STRING COMMENT "Airport Sequence ID of Diverted Airport 3. Unique Key for Time Specific Information for an Airport",
    Div3WheelsOn                                       STRING COMMENT "Wheels On Time (local time: hhmm) at Diverted Airport Code3",
    Div3TotalGTime                                     STRING COMMENT "Total Ground Time Away from Gate at Diverted Airport Code3",
    Div3LongestGTime                                   STRING COMMENT "Longest Ground Time Away from Gate at Diverted Airport Code3",
    Div3WheelsOff                                      STRING COMMENT "Wheels Off Time (local time: hhmm) at Diverted Airport Code3",
    Div3TailNum                                        STRING COMMENT "Aircraft Tail Number for Diverted Airport Code3",
    Div4Airport                                        STRING COMMENT "Diverted Airport Code4",
    Div4AirportID                                      STRING COMMENT "Airport ID of Diverted Airport 4. Airport ID is a Unique Key for an Airport",
    Div4AirportSeqID                                   STRING COMMENT "Airport Sequence ID of Diverted Airport 4. Unique Key for Time Specific Information for an Airport",
    Div4WheelsOn                                       STRING COMMENT "Wheels On Time (local time: hhmm) at Diverted Airport Code4",
    Div4TotalGTime                                     STRING COMMENT "Total Ground Time Away from Gate at Diverted Airport Code4",
    Div4LongestGTime                                   STRING COMMENT "Longest Ground Time Away from Gate at Diverted Airport Code4",
    Div4WheelsOff                                      STRING COMMENT "Wheels Off Time (local time: hhmm) at Diverted Airport Code4",
    Div4TailNum                                        STRING COMMENT "Aircraft Tail Number for Diverted Airport Code4",
    Div5Airport                                        STRING COMMENT "Diverted Airport Code5",
    Div5AirportID                                      STRING COMMENT "Airport ID of Diverted Airport 5. Airport ID is a Unique Key for an Airport",
    Div5AirportSeqID                                   STRING COMMENT "Airport Sequence ID of Diverted Airport 5. Unique Key for Time Specific Information for an Airport",
    Div5WheelsOn                                       STRING COMMENT "Wheels On Time (local time: hhmm) at Diverted Airport Code5",
    Div5TotalGTime                                     STRING COMMENT "Total Ground Time Away from Gate at Diverted Airport Code5",
    Div5LongestGTime                                   STRING COMMENT "Longest Ground Time Away from Gate at Diverted Airport Code5",
    Div5WheelsOff                                      STRING COMMENT "Wheels Off Time (local time: hhmm) at Diverted Airport Code5",
    Div5TailNum                                        STRING COMMENT "Aircraft Tail Number for Diverted Airport Code5",
    Duplicate                                          STRING COMMENT "Duplicate flag marked Y if the flight is swapped based on Form-3A data"
) PARTITIONED BY (year_month String)
ROW FORMAT SERDE "org.apache.hadoop.hive.serde2.OpenCSVSerde"
WITH SERDEPROPERTIES (
    "separatorChar" = ","
    )
STORED AS TEXTFILE
LOCATION "${BASEDIR}/${DB}.db/airline_perf_ext"
TBLPROPERTIES (
    "skip.header.line.count"="1"
    );