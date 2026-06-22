# SmartAssist 360

## Overview

SmartAssist 360 is an AI-powered Customer Support and SLA Management Platform built on Salesforce.

The application helps support teams manage customer cases, track SLA compliance, generate AI-based resolution recommendations, and provide customers with a self-service Experience Cloud portal.

---

## Features

### Case Management
- Create and manage support cases
- Priority-based support workflows
- Escalation management

### SLA Tracking
- Monitor response and resolution commitments
- Track SLA violations
- Support performance reporting

### AI Resolution Engine
- REST API integration
- AI-generated troubleshooting recommendations
- Resolution logging

### Experience Cloud Portal
- Customer self-service portal
- Case visibility
- Product access
- Feedback management

### Product Management
- Product catalog
- Product version tracking
- Support team assignment

### Customer Feedback
- Customer satisfaction tracking
- Service improvement insights

---

## Technology Stack

- Salesforce Service Cloud
- Apex
- Lightning Web Components (LWC)
- Experience Cloud
- REST API Integration
- SOQL
- Validation Rules
- Permission Sets
- Record Types

---

## Custom Objects

### Product__c
Stores product information.

### Customer_Feedback__c
Stores customer feedback records.

### SLA_Tracking__c
Tracks SLA commitments and violations.

### AI_Resolution_Log__c
Stores AI-generated resolution recommendations.

---

## Automation

### Apex Trigger Framework

Case Trigger Handler

Functions:
- Escalation handling
- Resolution tracking
- SLA calculations

### AI Resolution Service

Functions:
- External API callout
- AI recommendation generation
- Resolution logging

---

## Experience Cloud

Customer Portal Features:

- Home Dashboard
- Cases
- Products
- Feedback
- SLA Tracking
- AI Resolutions

---

## Test Coverage

| Class | Coverage |
|---------|---------|
| CaseTriggerHandler | 100% |
| AIResolutionService | 92% |

---

## Future Enhancements

- Agentforce Integration
- Einstein AI Recommendations
- Omni-Channel Routing
- Knowledge Management
- Real-Time Dashboards

---
## Screenshots

### Experience Cloud Portal

![Portal](screenshots/portal-home.png)

### Cases

![Cases](screenshots/cases.png)

### AI Resolution Engine

![AI Resolution](screenshots/ai-resolution.png)

## Project Architecture

Experience Cloud Portal
        ↓
      Cases
        ↓
 Apex Trigger Framework
        ↓
    SLA Tracking
        ↓
 AI Resolution Service
        ↓
 External REST API
        ↓
 AI Resolution Logs

## Author
Shyamjith K
Salesforce Developer Project
