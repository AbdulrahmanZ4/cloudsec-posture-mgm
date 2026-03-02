![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC)
![GCP](https://img.shields.io/badge/Cloud-GCP-blue)
![Security](https://img.shields.io/badge/Focus-Cloud%20Security-red)
# Secure GCP Multi-Tier Cloud Security Architecture

Cybersecurity posture platform deployed on Google Cloud Platform using a segmented multi-tier architecture and Infrastructure as Code.

---

## Architecture Overview

- External HTTPS Load Balancer
- Managed SSL (Self-signed for lab)
- Nginx Reverse Proxy (Hardened)
- Flask Application Layer
- Private MariaDB Tier
- VPC Segmentation
- IAP-based SSH Access
- OS Login Enforcement
- Principle of Least Privilege Networking
  
## Architecture Flow

Internet
   -->
External HTTPS Load Balancer
  -->
Nginx Reverse Proxy (web-1)
 -->
Flask Application Layer
  -->
Private MariaDB (db-1)



## Security Controls Implemented

- Enforced HTTPS (HTTP → HTTPS redirect)
- Security headers (X-Frame-Options, X-Content-Type-Options)
- SSH restricted via IAP only
- OS Login enabled at project level
- Database isolated in private subnet
- No hardcoded credentials
- Environment-based configuration
- Infrastructure managed via Terraform

---

## Threat Model & Design Rationale

This architecture was designed based on realistic cloud threat assumptions.
This design prioritizes exposure minimization and lateral movement prevention within the VPC.

### Threat Assumptions
- Public exposure of application layer
- Credential abuse or SSH brute-force attempts
- Lateral movement between tiers
- Vulnerability exploitation from exposed services
- Cloud network misconfiguration risks

### Security Design Decisions
- Public access restricted to HTTPS via Load Balancer only
- No public IP assigned to database tier
- SSH access allowed only through IAP
- OS Login enforced for centralized identity control
- Network segmentation between web and DB subnets
- Environment-based configuration (no hardcoded secrets)

### Attack Surface Reduction
- No direct SSH exposure to internet
- No database exposure to public network
- Minimal firewall rules
- TLS termination at load balancer
- Security headers enforced at reverse proxy layer

---

## Infrastructure as Code

All core infrastructure components were provisioned using Terraform:

- VPC
- Subnets
- Firewall rules
- Compute instances
- Load Balancer
- Backend services
- Network Endpoint Groups

The Terraform configuration enables reproducible infrastructure deployment and clear separation of network and compute resources.

---

## Future Enhancements

- Cloud Armor WAF integration
- Secret Manager integration
- CI/CD pipeline (Cloud Build / GitHub Actions)
- Automated security scanning
- Centralized logging & monitoring integration
