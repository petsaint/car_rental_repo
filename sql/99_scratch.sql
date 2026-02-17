SELECT branchID, branch_name, branch_phone FROM BRANCH;
SELECT * FROM VEHICLE_TYPE;
SELECT * FROM VEHICLE_MODEL_YEAR;
SELECT * FROM CUSTOMER;
SELECT * FROM STAFF;
SELECT * FROM VEHICLE;
SELECT * FROM VEHICLE_MAKE;
SELECT * FROM VEHICLE_MODEL;

SELECT agreementID, customer_fname, customer_lname, vehicleID,
scheduledPickup, scheduledReturn, pickupBranchID, returnBranchID,
pickupTime, returnTime, estimated_cost, actual_cost, agreement_status
FROM AGREEMENT
JOIN CUSTOMER ON AGREEMENT.customerID = CUSTOMER.customerID;
