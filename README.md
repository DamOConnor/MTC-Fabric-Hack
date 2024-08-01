# MTC Fabric Hack 

<img src="images/Fabric_256.svg" alt="Fabric Image" style="margin: 10px;" width="100" align="right"/>

![level](https://img.shields.io/badge/Microsoft%20Fabric-introductory-green)

This repo is to support the MTC Fabric Hack on Monday 29th August 2024 to Wednesday 31st August 2024 and contains a number of labs to help users get familiar with Microsoft Fabric and in particular Data Engineering.

Each lab will consist of a set of clear instructions to complete and a recap.

## Agenda

- Intros
 - Slides and demos
 - Introduction to Fabric
 - hands-on demos
- Goals
 - Data Engineering
 - Capture important questions as we go
 - What do you want to get out of the hack?
- How the day will flow
  - Hack and discussions
  - Instructor will demo each lab
  - Attendees will work through each lab
    - if you finish a lab, help your colleagues get to the same place
    - some later labs will depend on earlier work being completed
- Who's in the room?
  - Instructors, proctors, attendees
  - go round each attendee and ask what they want to get out of the day(s)

## Decisions
- work through labs using browser?
OR
- install VSCode and work from there

## Datasets
- [tpc-h](datasets/tpch.md)
- [NHS Open Data](datasets/nhsopen.md)
- [NYC Taxi](datasets/nyctaxi.md)


## Labs



### Setup
- [Lab 1.0: Connect to the Azure Portal](labs/lab1/lab1_0.md)
- [Lab 1.1: Connect to the Fabric Portal](labs/lab1/lab1_1.md)
- [Lab 1.2: View the trial Fabric Capacity](labs/lab1/lab1_2.md)
- [Lab 1.3: View your lab workspace](labs/lab1/lab1_3.md)
- [Lab 1.4: View the shared workspace](labs/lab1/lab1_4.md)
- [Lab 1.5: Create a Lakehouse](labs/lab1/lab1_5.md)
- [Lab 1.6: Create a shortcut](labs/lab1/lab1_6.md)

### Acquire
- [Lab 2.0: Import NHS Open data to a Lakehouse](labs/lab2/lab2_0.md)
- [Lab 2.1: Import tpc-h data to a Lakehouse](lab2_0.md)
- Lab 2.2: Import NHS Open data to a to a Data Warehouse
- Lab 2.3: Import tpc-h data to a Data Warehouse
- Lab 2.x: Connect to the Lakehouse from SQL Server Management Studio (SSMS)
- Lab 2.x: Connect to the Lakehouse from Azure Data Studio (ADS)
- Lab 2.99: Samples


### Enhance
- Lab 3.0: Explore data with Data Wrangler in Microsoft Fabric
- ~~Lab 3.2: Explore data with Copilot in Microsoft Fabric~~
  - Copilot is not available on Fabric trials
- Lab 3.x: Notebook Parameters
- Lab 3.x: Sentiment analysis
- Lab 3.99: Samples

### Match
- [Lab 4.0: Install Splink in Microsoft Fabric](labs/lab4/lab4_0.md)

### Surface
- Lab 5.0: Install the Fabric Capacity Metrics App
- Lab 5.1: AI Skill demo (msit only)


### Clone this repo
```bash
git clone https://github.com/DamOConnor/MTC-Fabric-Hack
```