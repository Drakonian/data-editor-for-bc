# Table Data Editor Application for Business Central
You probably remember the glory days when we had direct access to data in Navision tables. But with the move to Cloud Business Central, we lost that ability. It's probably much safer and more correct, but what if we need to fix some data problem and we know what we're doing? We can write a routine that fixes that problem. But I suggest a better option, this Data Editor extension that allows you to change and delete information from any table in Business Central

https://vld-nav.com/table-data-editor-for-bc-2-0


![Data Editor](https://static.tildacdn.com/tild3565-3631-4636-b463-303765396635/OpenTable.gif)

---

# Tips
- For the extension to work properly you must make sure that your BC user is using the **DET Data Editor Tool** or **SUPER** permission set.
- For OnPrem you must have a license for objects with id 81000+

# How to Install a Per Tenant Extension (.app file) in Business Central

This guide provides step-by-step instructions for installing a Per Tenant Extension (PTE) `.app` file in Microsoft Dynamics 365 Business Central via the Extension Management page.

## Prerequisites

- **Permissions**: Ensure you have the permissions to manage extensions in Business Central.
- **.app File**: Have the `.app` file you wish to install ready.

## Installation Steps

### 1. Access the Extension Management Page

- Go to **Extension Management** from the Search.

### 2. Upload the Extension

- Click **Upload Extension** on the Extension Management page.
- Press **Select .app file DrillDown**, navigate to your `.app` file, select it, and click **Open**.
  
### 3. Install the Extension

- Click **Deploy**
- Accept any terms and conditions, if prompted.
- Confirm the installation by clicking **Yes**.

### 4. Verify Installation

- The installation process may take a few minutes. You can monitor the progress on the Extension Management page, where the status will change to **Installed** once completed.

## Troubleshooting

- **Installation Errors**: Refer to the error message details and consult the extension's documentation or support resources.
- **Permissions Issues**: Confirm you have the necessary permissions to install extensions. Contact your system administrator if you're unsure.


---
