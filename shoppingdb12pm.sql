-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2023 at 09:01 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppingdb12pm`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catid` int(20) NOT NULL,
  `cname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `cname`) VALUES
(2, 'clothes'),
(3, 'electronic'),
(1, 'grocery');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `catid` int(10) NOT NULL,
  `subcatid` int(12) NOT NULL,
  `prodid` int(12) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` float(10,2) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`catid`, `subcatid`, `prodid`, `pname`, `price`, `qty`) VALUES
(1, 1, 1, 'Tata Sampaan moong dal', 120.00, 100),
(1, 1, 2, 'rajma', 200.00, 1000),
(2, 4, 3, 'shirts', 200.00, 1000),
(2, 4, 4, 'pant', 300.00, 1000),
(1, 3, 5, 'lal mirchi', 50.00, 200);

-- --------------------------------------------------------

--
-- Table structure for table `purchasedetail`
--

CREATE TABLE `purchasedetail` (
  `srno` int(10) NOT NULL,
  `purid` int(10) NOT NULL,
  `prodid` int(10) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` float(10,2) NOT NULL,
  `qty` int(10) NOT NULL,
  `cost` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchasedetail`
--

INSERT INTO `purchasedetail` (`srno`, `purid`, `prodid`, `pname`, `price`, `qty`, `cost`) VALUES
(1, 1, 1, 'Tata Sampaan moong dal', 120.00, 1, 120.00),
(2, 1, 2, 'rajma', 200.00, 2, 400.00),
(3, 2, 1, 'Tata Sampaan moong dal', 120.00, 10, 1200.00),
(4, 2, 2, 'rajma', 200.00, 10, 2000.00),
(5, 2, 5, 'lal mirchi', 50.00, 10, 500.00),
(6, 2, 3, 'shirts', 200.00, 20, 4000.00),
(7, 3, 3, 'shirts', 200.00, 10, 2000.00),
(8, 3, 4, 'pant', 300.00, 10, 3000.00);

-- --------------------------------------------------------

--
-- Table structure for table `purchasetable`
--

CREATE TABLE `purchasetable` (
  `purid` int(12) NOT NULL,
  `supid` int(12) NOT NULL,
  `billdate` date NOT NULL,
  `totalcost` float(10,2) NOT NULL,
  `gst` float(10,2) NOT NULL,
  `totalbill` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchasetable`
--

INSERT INTO `purchasetable` (`purid`, `supid`, `billdate`, `totalcost`, `gst`, `totalbill`) VALUES
(1, 1, '2023-02-13', 520.00, 26.00, 546.00),
(2, 2, '2023-02-09', 7700.00, 385.00, 8085.00),
(3, 1, '2023-02-14', 5000.00, 250.00, 5250.00);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `catid` int(10) NOT NULL,
  `subcatid` int(10) NOT NULL,
  `sname` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`catid`, `subcatid`, `sname`) VALUES
(1, 1, 'pulses'),
(1, 2, 'flour'),
(1, 3, 'spices'),
(2, 4, 'kids clothes');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supid` int(10) NOT NULL,
  `sname` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supid`, `sname`, `phone`, `address`) VALUES
(1, 'Abc pvt ltd', '67567567', 'Model Town,Jalandhar'),
(2, 'Reliance', '546456456', 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `name` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `usertype` varchar(200) NOT NULL,
  `pic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`name`, `phone`, `gender`, `dob`, `address`, `username`, `password`, `usertype`, `pic`) VALUES
('admin', '546756756', 'female', '2023-02-11', 'delhi', 'admin', '234', 'Admin', '1676446705920aaaa.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catid`),
  ADD UNIQUE KEY `cname` (`cname`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodid`),
  ADD KEY `subcatid` (`subcatid`),
  ADD KEY `catid` (`catid`);

--
-- Indexes for table `purchasedetail`
--
ALTER TABLE `purchasedetail`
  ADD PRIMARY KEY (`srno`),
  ADD KEY `purid` (`purid`);

--
-- Indexes for table `purchasetable`
--
ALTER TABLE `purchasetable`
  ADD PRIMARY KEY (`purid`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`subcatid`),
  ADD KEY `catid` (`catid`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supid`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `purchasedetail`
--
ALTER TABLE `purchasedetail`
  MODIFY `srno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `subcatid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `const3` FOREIGN KEY (`catid`) REFERENCES `category` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `const4` FOREIGN KEY (`subcatid`) REFERENCES `subcategory` (`subcatid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchasedetail`
--
ALTER TABLE `purchasedetail`
  ADD CONSTRAINT `const1` FOREIGN KEY (`purid`) REFERENCES `purchasetable` (`purid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `const2` FOREIGN KEY (`catid`) REFERENCES `category` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
