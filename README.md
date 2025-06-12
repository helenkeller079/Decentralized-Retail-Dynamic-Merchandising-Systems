# Decentralized Retail Dynamic Merchandising System

A comprehensive blockchain-based system for managing retail merchandising operations through smart contracts built on the Stacks blockchain using Clarity.

## Overview

This system provides a decentralized approach to retail merchandising management, enabling transparent and automated coordination between different aspects of retail operations.

## System Components

### 1. Manager Verification Contract (`manager-verification.clar`)
- **Purpose**: Validates and manages retail merchandising managers
- **Key Features**:
    - Manager verification and authorization
    - Store assignment and tracking
    - Manager status management (active/inactive)
    - Verification date tracking

### 2. Product Placement Contract (`product-placement.clar`)
- **Purpose**: Manages optimal product placement and positioning
- **Key Features**:
    - Product placement creation and tracking
    - Zone-based organization
    - Shelf level and position management
    - Performance score tracking
    - Product relocation capabilities

### 3. Sales Analysis Contract (`sales-analysis.clar`)
- **Purpose**: Analyzes product sales performance and trends
- **Key Features**:
    - Sales transaction recording
    - Revenue and quantity tracking
    - Product performance analytics
    - Average price calculations
    - Store-specific sales data

### 4. Inventory Coordination Contract (`inventory-coordination.clar`)
- **Purpose**: Coordinates merchandising inventory levels
- **Key Features**:
    - Stock level management
    - Minimum threshold monitoring
    - Reorder request system
    - Inventory capacity tracking
    - Automated reorder alerts

### 5. Customer Behavior Contract (`customer-behavior.clar`)
- **Purpose**: Analyzes customer shopping patterns and behavior
- **Key Features**:
    - Customer interaction tracking
    - Product engagement analytics
    - Conversion rate calculations
    - Zone performance analysis
    - Shopping pattern insights

## Getting Started

### Prerequisites
- Stacks blockchain development environment
- Clarity smart contract compiler
- Node.js for running tests

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd retail-merchandising-system
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

### Testing

Run the test suite using Vitest:

\`\`\`bash
npm test
\`\`\`

Individual test files:
\`\`\`bash
npm test tests/manager-verification.test.js
npm test tests/product-placement.test.js
npm test tests/sales-analysis.test.js
npm test tests/inventory-coordination.test.js
npm test tests/customer-behavior.test.js
\`\`\`

## Contract Deployment

Deploy contracts to the Stacks blockchain:

\`\`\`bash
# Deploy manager verification contract
clarinet deploy contracts/manager-verification.clar

# Deploy product placement contract
clarinet deploy contracts/product-placement.clar

# Deploy sales analysis contract
clarinet deploy contracts/sales-analysis.clar

# Deploy inventory coordination contract
clarinet deploy contracts/inventory-coordination.clar

# Deploy customer behavior contract
clarinet deploy contracts/customer-behavior.clar
\`\`\`

## Usage Examples

### Manager Verification
\`\`\`clarity
;; Verify a new manager
(contract-call? .manager-verification verify-manager 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG "John Doe" u1)

;; Check if manager is verified
(contract-call? .manager-verification is-verified-manager 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG)
\`\`\`

### Product Placement
\`\`\`clarity
;; Create a product placement
(contract-call? .product-placement create-placement u101 "electronics" u2 u5)

;; Update performance score
(contract-call? .product-placement update-performance-score u1 u85)
\`\`\`

### Sales Recording
\`\`\`clarity
;; Record a sale
(contract-call? .sales-analysis record-sale u101 u5 u2500 u1)

;; Calculate average price
(contract-call? .sales-analysis calculate-average-price u101)
\`\`\`

### Inventory Management
\`\`\`clarity
;; Set inventory level
(contract-call? .inventory-coordination set-inventory-level u101 u100 u10 u500)

;; Update stock
(contract-call? .inventory-coordination update-stock u101 -5)
\`\`\`

### Customer Behavior Tracking
\`\`\`clarity
;; Record customer interaction
(contract-call? .customer-behavior record-interaction "customer123" u101 "view" "electronics" u30)

;; Get conversion rate
(contract-call? .customer-behavior get-conversion-rate u101)
\`\`\`

## Architecture

The system follows a modular architecture where each contract handles a specific domain:

1. **Manager Verification**: Central authority management
2. **Product Placement**: Spatial organization and optimization
3. **Sales Analysis**: Performance tracking and analytics
4. **Inventory Coordination**: Stock management and logistics
5. **Customer Behavior**: User interaction and engagement analysis

## Security Considerations

- All contracts implement proper authorization checks
- Manager verification is required for sensitive operations
- Error handling prevents invalid state transitions
- Read-only functions provide safe data access

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the repository or contact the development team.
