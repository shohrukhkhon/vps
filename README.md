# Virtual Machine by Github Action

<details>
    <summary>Ubuntu (SSH Version)</summary>
<br>

1. Click **Run Workflox**
2. Copy ssh with url
3. Open Terminal, and type command provided by github actions boxes.
type **yes** from the connect, and then type your ssh password by secrets of USER_PASSWORD u have set.

4. Type **sudo -i** for root permission and type your password.
5. Enjoy having your FREE GNU/Linux SSH VPS and type any command you want.(but only 6 hours)
</details>

<details>
    <summary>Ubuntu (Desktop Remote Version)</summary>
<br>

- Desktop Screenshot
- GNU/Linux Chrome
- Install any apps you want :)
</details>

## Machine Specification:
- 2-core vCPU
- 7 GB RAM
- 14 GB SSD Disk **(Excluded System used)**
## Setting up:
1. Fork this project
2. Go to your peoject page, click `Settings` and go to `Secrets`, and then click `New Secret` to add these secrets below:

Secrets Name | Uses | Notes
----- | ----- | -----
`NGROK_AUTH_TOKEN` | For **ngrok** tunnel uses | Go to website, and copy the API key from https://dashboard.ngrok.com/auth/your-authtoken
`VNC_PASSWORD` | For the login password of VNC remote authentication | Type any password you want
`USERNAME` | For GNU/Linux system username | Type any name you want
`USER_PASSWORD` | For GNU/Linux shell and root password | Type any password you want
`MACHINE_NAME` | For GNU/Linux System Computer name | Type any name you want

<summary>GNU/Linux</summary>
<br>

1. First, start the actions of GNU/Linux System.
2. Second, Copy the link from the console
3. Go to Terminal or else ssh client and enter command provided. Enter your ssh password then.
4. ENJOY!

## Updating Codes
<details>
    <summary>Click Here to Expand</summary>
<br>

1. First, click **compare**.
2. Second, follow instruction below and press crate pull request.
3. Third, type anything on the title amd create a pull request.
4. Fourth, click merge pull request under the page you have redirected to.

</details>

## Limits:
1. You can run each virtual machine only run up for **6** hours for execution time. If Virtual Machine reaches this limit, it will be terminated and clear everything.
2. Not suggested for you saving some of important and sensitive files to each machine, be risked that all files will be deleted and cannot be undo.
3. Since we are using **ngrok**, you can only run one of those **three** system by one due to ngrok free plan limits, you cannot access both system at the same time unless you purchased **ngrok** pro or business plan.
4. Not suggested to login any account from any website (just like **Google or Microsoft**), since **VNC
