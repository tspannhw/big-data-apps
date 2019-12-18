SET hive.optimize.sort.dynamic.partition=true;

USE ${TARGET_DB};

INSERT OVERWRITE TABLE
    CUSTOMER
SELECT
    ID,
    FULL_NAME,
    ADDRESS,
    STATE,
    CONTACT_NUM
FROM
    ${SRC_DB}.CUSTOMER_SRC;

INSERT OVERWRITE TABLE
    VISIT PARTITION (visit_date)
SELECT
    ID,
    CUSTOMER_ID,
    VISIT_TS,
    STAY_TIME,
    CAST(VISIT_TS as DATE) as VISIT_DATE
FROM
    ${SRC_DB}.VISIT_SRC;


INSERT OVERWRITE TABLE
    PURCHASE PARTITION (PURCHASE_DATE)
SELECT
    PS.ID,
    PS.CUSTOMER_ID,
    PS.VISIT_ID,
    PS.SALES_REP,
    PS.REGISTER,
    PS.TRANSACTION_ID,
    PS.DISCOUNT,
    PS.DISCOUNT_CODE,
    PS.TOTAL_PURCHASE,
    PS.TENDER_TYPE,
    VS.VISIT_TS AS PURCHASE_TS,
    VS2.G_DATE  AS PURCHASE_DATE
FROM
    ${SRC_DB}.PURCHASE_SRC PS
        JOIN VISIT VS ON PS.VISIT_ID = VS.ID
        JOIN (SELECT DISTINCT VISIT_DATE AS G_DATE FROM VISIT) VS2
             ON VISIT_DATE = VS2.G_DATE;