# Security Policy

## Reporting a Vulnerability

You can as a user report a security vulnerability about the base configuration, not the forks : 

- Through GitHub security vulnerabilities report system in the "Security" tab of this project, using the "Report a vulnerability" button
- Via email to `altaks.me@gmail.com`.
- Via Discord messages to `altakxs` prefixed with "NixOS Polarflake security issue"

## Report message template : 

Please use the following security vulnerability report when creating such reports :

```md
# Security Vulnerability Report

## Title: Security Vulnerability in NixOS Polarflake Configuration

---

## 1. Vulnerability Overview

- **Date Discovered**: December 31, 2024
- **Reported By**: [Your Name or Reporter’s Username]
- **Severity**: [Critical/High/Medium/Low]
- **Affected Versions**: [List of affected versions, e.g., v1.0, v1.1]
- **Description**: Provide a concise description of the vulnerability. For example: 

    > A potential privilege escalation vulnerability exists in the NixOS Polarflake configuration due to improper user permission settings in the `configuration.nix` file. This could allow a non-privileged user to gain elevated system access.

---

## 2. Technical Details

### 2.1 Impacted Components
- **NixOS Configuration**: `configuration.nix`
- **Affected Services**: [e.g., NGINX, SSH, etc.]
- **Configuration Files**: [List specific files affected, e.g., `modules/bootloader.nix`, `modules/xdg.nix`]

### 2.2 Vulnerable Configuration
Provide an example of the vulnerable configuration, highlighting the issue.

\`\`\`nix
# Example vulnerable configuration (highlight the issue in comments)
users.users.someuser = {
  isNormalUser = true;
  extraGroups = [ "wheel" ]; # This grants sudo access, unintended for a regular user
};
\`\`\`

### 2.3 Steps to Reproduce
Provide the steps necessary to reproduce the vulnerability, for example : 

1. Clone the NixOS Polarflake repository:  
   `git clone https://github.com/Altaks/NixOS-Polarflake`
2. Apply the NixOS configuration:  
   `sudo nixos-rebuild switch`
3. Verify user permissions for `someuser`:
   - Log in as `someuser` and attempt to execute a command that requires sudo access, like `sudo ls`.

### 2.4 Root Cause
Explain the root cause of the vulnerability.

> The vulnerability arises because the `someuser` has been added to the `wheel` group, which grants `sudo` access to normal users. This was likely intended for administrative users but was mistakenly granted to a regular user.

---

## 3. Mitigation

### 3.1 Short-term Fix
Provide the immediate steps users can take to mitigate the vulnerability.

- Modify the `configuration.nix` file to remove the affected user from the `wheel` group:
\`\`\`nix
users.users.someuser = {
  isNormalUser = true;
  extraGroups = []; # Remove "wheel" group
};
\`\`\`

- Rebuild the configuration:  
  `sudo nixos-rebuild switch`

### 3.2 Long-term Fix
Provide long-term mitigation strategies or configuration improvements to prevent similar vulnerabilities.

- Review the user permissions regularly to ensure that only authorized users are granted administrative access.
- Implement automated security scans to detect changes to user groups and permissions in NixOS configurations.

### 3.3 Additional Recommendations
- **Audit other configuration files**: Ensure that no other users are improperly granted `sudo` privileges.
- **Apply security best practices** for NixOS configuration management.

### 4.3 Potential Impact
Describe the potential damage or impact if the vulnerability is exploited.

> If exploited, this vulnerability could lead to complete system compromise, allowing an attacker to execute arbitrary commands with root privileges.

---

## 6. References

- [NixOS Security Guidelines](https://nixos.org/nixos/manual/#sec-security)
- [NixOS GitHub Repository](https://github.com/Altaks/NixOS-Polarflake)
- [CVE-XXXX-XXXX (Example CVE for similar issue)](https://cve.mitre.org)

---

## 7. Acknowledgements

- **Reporter**: [Your Name]
- **Responsible Maintainers**: [List maintainers involved in the resolution]

--- 

**Note**: This template is customizable based on the nature and severity of the vulnerability, and it may include more detailed technical sections as necessary.
```
