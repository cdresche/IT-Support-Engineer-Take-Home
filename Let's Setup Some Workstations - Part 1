# Monday Morning Onboarding Processes

## Windows Workstation Onboarding Process

### Pre-Monday Automated Workflow
A New Hire Request in Service Ticketing System triggers an automated workflow:

1. Create the user's Microsoft Entra ID (Azure AD) account  
2. Assign Microsoft 365, Slack, Bitwarden, and VPN licenses  
3. Add them to the correct Entra ID groups for role and office location  
4. Enable Multi-Factor Authentication (MFA)  
5. Service Ticketing System generates an IT ticket with onboarding checklist details  
6. An IT Support Engineer is assigned the IT ticket to build the Desktop

### Monday Morning IT Support Tasks

1. Pull an Intune pre-enrolled, BitLocker enabled Windows 11 Desktop from inventory  
2. Assign Desktop to the IT Ticket  
3. Just-In-Time admin access via Microsoft Privileged Identity Management is granted to the IT Support Engineer to log into the Desktop and verify that:  
   * The drive is fully encrypted  
   * All security policies and software deployments are successful  
   * Device connects to the network (DHCP or DHCP with reservation) and   
   * VPN was auto-configured and tested  
   * Any non-standard software is installed  
   * Ensure Windows Defender is active, firewall rules are enforced  
   * Label Desktop  
4. Assign the Desktop to the new user in the service ticket
5. Mark the ticket as "Desktop Ready" or similar
6. Restricts access to the Desktop until the new user logs in with Entra ID

### New User Setup Process

1. Identity of the new user is verified using the company approved verification process  
2. Logging in using the user's Microsoft Entra ID credentials and the temporary password  
   * Entered by an IT Support Engineer or given to the new user via a company approved method  
   * Remote new user could be via Bitwarden Send or over the phone after identity verification  
3. New user sets their new password  
4. Employee installs Microsoft Authenticator for use with MFA  
5. They scan the QR code for MFA enrollment  
6. Logging into Bitwarden via SSO (Entra ID)  
7. Outlook auto-configures using the user's Microsoft 365 email account  
8. Outlook Calendar syncs automatically with Microsoft 365  
9. The new user can immediately send emails & access their calendar  
10. Teams sync with the user's calendar  
11. Printers and network drives are mapped via Intune and Group Policy

### Setup Verification and Completion
IT Support updates ticket with any important information and then marks ticket as complete, which triggers a "Welcome Email" that could include:   
* Login process details (no account information) & IT helpdesk links  
* Security best practices & password management guide  
* VPN access instructions & company policy documents

## Ubuntu Linux Workstation Onboarding Process

### Pre-Monday Automated Workflow

1. Create the developer's Microsoft Entra ID (Azure AD) account  
2. Assign Microsoft 365, GitLab, Slack, Bitwarden, and VPN licenses  
3. Add them to the correct developer groups & repositories  
4. Enable Multi-Factor Authentication (MFA)  
5. Service Ticketing System generates an IT ticket with onboarding checklist details  
6. An IT Support Engineer is assigned the IT ticket to build the Desktop

### Monday Morning Image Deployment

#### Image Security Features
* Full Disk Encryption (LUKS) - ensures data is unreadable if the device is lost  
* Firewall (UFW) Preconfigured - Only allows SSH (port 22) and VPN traffic  
* Entra ID Integration (SSSD & Kerberos) - Centralized authentication with MFA  
* SSH Hardening – Root login disabled, forces key-based authentication  
* Ansible Control Node public key for initial configuration  
* Automatic Security Updates Enabled – Live kernel patching is enabled  
* Pre-Configured Audit Logging – Tracks authentication attempts for compliance

#### Deployment Steps
1. Pull an available, pre-approved Ubuntu Desktop from inventory  
2. Assign Desktop to the IT Ticket  
3. Boot the device via PXE network boot or Clonezilla USB  
4. Deploy the pre-configured Ubuntu developer image  
5. Reboot and verify that the base image was applied properly

### Domain Integration

1. IT Support Engineer logs in using a temporary local admin account (it-setup)  
2. Connect the desktop to the network (wired or Wi-Fi)  
3. Join the Desktop to the domain  
4. Verify domain authentication  
5. Delete the temporary local IT admin account, it-setup

### Ansible Configuration

1. IT runs Ansible from the centralized Ansible Control Node  
2. Detects Entra ID role and installs necessary tools:  
   * Developers: VS Code, Git, Docker, Node.js, Python, OpenJDK  
   * CI/CD Tools: Jenkins, Terraform, Ansible  
   * Productivity - MS 365 Web Access (Outlook, Team, OneDrive, SharePoint), Slack  
   * Virtualization: KVM/QEMU, VMware, VirtualBox  
   * Password Management - Bitwarden (SSO with Entra ID)  
   * Network settings (DHCP or DHCP reservation)  
   * Configures VPN (WireGuard/OpenVPN)  
   * Maps network printers & drive mounts dynamically based on Entra ID group  
   * Hardens system security policies (firewall, AppArmor, logging, intrusion detection)

### Build Verification

1. Ensure security policies & configurations are applied  
2. Confirm firewall enforcement  
3. Network connectivity  
4. Verify logging authentication attempts  
5. Confirm security updates are enabled  
6. Assign the machine to the new user in the IT Asset Management System  
7. Mark the service ticket as "Desktop Ready"

### First User Login

1. Logging in using the user's Microsoft Entra ID credentials and the temporary password  
   1. Entered by an IT Support Engineer or given to the new user via a company approved method  
   2. Remote new user could be via Bitwarden Send or over the phone after identity verification  
2. New user sets their new password  
3. Employee installs Microsoft Authenticator  
4. They scan the QR code for MFA enrollment  
5. MFA is enforced before allowing access  
6. User logs into Bitwarden (SSO with Entra ID)  
7. User home directory is automatically created upon first login  
8. User open https://outlook.office.com for email & calendar access

### Completion
IT Support updates ticket with any important information and then marks ticket as complete, which triggers a "Welcome Email" that could include:   
* Entra ID authentication guide for Linux login  
* VPN access instructions & IT helpdesk links  
* SSH key management guide & security reminders  
* CI/CD pipeline documentation & access credentials
