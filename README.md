# Terraform AWS Infrastructure Deployment

## Prerequisites

Before starting, ensure the following tools and configurations are available:

- AWS Account
- Terraform (latest version)
- Git
- AWS CLI

### Configure AWS Credentials

1. Log in to your AWS account.
2. Create an Access Key and Secret Access Key for your IAM user.
3. Configure AWS CLI on your local system:

```bash
aws configure
```

4. Provide the following details when prompted:

```text
AWS Access Key ID: <your-access-key>
AWS Secret Access Key: <your-secret-key>
Default region name: <your-region>
Default output format: json
```

## Deployment Steps

### 1. Clone the Repository

```bash
git clone <repository-url>
```

### 2. Navigate to the Project Directory

```bash
cd <project-directory>
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Format Terraform Files

```bash
terraform fmt
```

### 5. Validate the Configuration

```bash
terraform validate
```

### 6. Review the Execution Plan

```bash
terraform plan
```

### 7. Deploy the Infrastructure

```bash
terraform apply
```

Type `yes` when prompted to confirm the deployment.

## Success

Once the deployment completes successfully, your infrastructure will be provisioned and ready to use.

🚀 **All set!**
