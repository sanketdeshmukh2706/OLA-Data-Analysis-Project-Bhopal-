# 🚖 OLA Data Analysis Project (Bhopal)

## 📌 Project Overview

This project focuses on analyzing OLA ride booking data for **Bhopal city** to extract meaningful insights and improve business decision-making.

It is an end-to-end Data Analyst project covering:

* Data Generation
* Data Cleaning (Excel)
* Data Analysis (SQL)
* Data Visualization (Power BI)

---

## 🛠️ Tools & Technologies Used

* Microsoft Excel (Data Cleaning & Preparation)
* SQL (Data Analysis)
* Power BI (Dashboard Creation & Visualization)

---

## 📂 Dataset Information

The dataset contains **1 lakh+ rows** of ride booking data for one month.

### 📊 Key Columns:

* Date
* Time
* Booking ID
* Booking Status
* Customer ID
* Vehicle Type
* Pickup Location
* Drop Location
* Avg VTAT
* Avg CTAT
* Cancelled Rides by Customer
* Reason for cancelling by Customer
* Cancelled Rides by Driver
* Incomplete Rides
* Incomplete Rides Reason
* Booking Value
* Ride Distance
* Driver Ratings
* Customer Rating
* Payment Method

---

## 🔄 Project Workflow

### 1️⃣ Data Generation & Collection

* Created a large dataset with realistic ride booking scenarios
* Ensured proper distribution of:

  * Successful bookings (~62%)
  * Customer cancellations (<7%)
  * Driver cancellations (<18%)

---

### 2️⃣ Data Cleaning (Excel)

* Removed duplicates
* Handled missing values
* Standardized column names
* Ensured correct data types

---

### 3️⃣ Data Analysis (SQL)

Used SQL to analyze ride data and extract insights related to bookings, cancellations, and revenue.

#### 🔧 Database Setup

```sql
CREATE DATABASE Ola;
USE Ola;
```

#### 🔍 Key SQL Queries

**1. Retrieve all successful bookings**

```sql
CREATE VIEW Successful_Bookings AS
SELECT * 
FROM bookings
WHERE `Booking Status` = 'Successful';
```

**2. Average ride distance for each vehicle type**

```sql
CREATE VIEW AVG_distance_for_each_vehicle AS
SELECT `Vehicle Type`, AVG(`Ride Distance`) AS avg_distance
FROM bookings
GROUP BY `Vehicle Type`;
```

**3. Total cancelled rides by customers**

```sql
CREATE VIEW Cancelled_ride_by_customers AS
SELECT SUM(`Cancelled Rides by Customer`) AS total_cancelled_rides
FROM bookings;
```

**4. Top 5 customers by number of rides**

```sql
CREATE VIEW top_5_customers AS
SELECT `Customer ID`, COUNT(`Booking ID`) AS total_rides
FROM bookings
GROUP BY `Customer ID`
ORDER BY total_rides DESC
LIMIT 5;
```

**5. Driver cancellations (personal & car issues)**

```sql
CREATE VIEW cancelled_by_drivers_due_personal_and_car_related_issues AS
SELECT COUNT(*) AS total_cancelled
FROM bookings
WHERE `Cancelled Rides by Driver` = 'Personal & Car related issues';
```

**6. Max & Min driver ratings (Prime Sedan)**

```sql
CREATE VIEW max_and_min_rating_for_prime_sedan AS
SELECT 
    MAX(`Driver Ratings`) AS max_rating,
    MIN(`Driver Ratings`) AS min_rating
FROM bookings
WHERE `Vehicle Type` = 'Prime Sedan'
AND `Driver Ratings` != 'NA';
```

**7. Rides with UPI payment**

```sql
CREATE VIEW payment_by_upi AS
SELECT * 
FROM bookings
WHERE `Payment Method` = 'UPI';
```

**8. Average customer rating per vehicle type**

```sql
CREATE VIEW avg_rating_per_vehicle_type AS
SELECT `Vehicle Type`, AVG(`Customer Rating`) AS avg_rating
FROM bookings
GROUP BY `Vehicle Type`;
```

**9. Total booking value of successful rides**

```sql
CREATE VIEW total_ride_complete_successfully AS
SELECT SUM(`Booking Value`) AS total_booking_value
FROM bookings
WHERE `Booking Status` = 'Successful';
```

**10. Incomplete rides with reason**

```sql
CREATE VIEW all_incomplete_rides_with_reason AS
SELECT `Booking ID`, `Incomplete Rides Reason`
FROM bookings
WHERE `Incomplete Rides` = 'Yes'
AND `Incomplete Rides Reason` != 'NA';
```

---

### 4️⃣ Data Visualization (Power BI)

Created an interactive dashboard including:

* Ride Volume Over Time
* Booking Status Breakdown
* Revenue Analysis
* Cancellation Reasons
* Customer & Driver Ratings

---

## 🎥 Live Dashboard Demo

🔗 https://drive.google.com/file/d/1ba-fGMtNW7yk50gyFmZE7MDDP_jpxomE/view?usp=drivesdk

👉 This video demonstrates the working Power BI dashboard including filters, KPIs, and insights.

---

## 📊 Key Insights

* Most rides are successfully completed (~62%)
* Peak demand observed on weekends
* Driver cancellations are higher than customer cancellations
* Revenue is higher during weekends
* Ratings help identify service quality

---

## 🎯 Conclusion

This project helps in understanding customer behavior, improving ride success rate, reducing cancellations, and making better business decisions using data.

---

