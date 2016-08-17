# Cisco Meraki CMX API demo app - as a Docker Container

The Cisco Meraki CMX API uses intelligent access points to deliver real-time location analytics data directly to customers, allowing integration with 3rd-party retail analytics applications, CRM, and custom-built applications.

#### Prerequisites
-	Cisco Meraki access point
-	Github Account

*Note: The access point will be pre-installed for the DevNet Sandbox Lab*
 
#### [Login in to Cisco Meraki Dashboard](https://account.meraki.com/login/)

You need to login to your Meraki network to retrieve and setup the CMX API interface.
As the CMX API Interface will be sending JSON as HTTP POST.

*(Note: If doing learning lab, you’ll get provided with a Meraki DevNet sandbox account)*

![](https://github.com/CiscoCloud/cisco-meraki-cmx-api-app/blob/master/images/1.png)

Navigate to the CMX API Settings
Network-wide -> Configure -> General

As we will deploy our sample application through Shipped, we still don’t know the URL before we deployed. There write down your Validator id (green box) and choose a secret (red box) that we will use. Suggestion is to use shipped as a secret for this lab

*(Enable CMX API if disabled)*
![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/2.png)

### Shipped Itegration

-[Login in to Cisco Shipped](https://ciscoshipped.io/)

We will now create our sample application to retrieve the CMX API data.
Choose ”Create New Application” and choose a name for your new application.

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/3.png)

#### Compose Your Application
As this is a sample application, Cisco has already provided sample applications.
Choose the Cisco Tab and then select Cisco Meraki CMX API
 
![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/4.png)
This sample application will now be created on your own Github account.

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/5.png)

We need to edit the service to gather data from your own Meraki Network.
Click the pen to edit the service.

![](https://github.com/vjscjp/cisco-meraki-cmx-api-app/blob/master/images/6.png)
Remember the Validator ID (redbox) and secret (green box) that you picked before in the Meraki Dashboard? It’s time to enter those values
Enter the data as the picture shows below

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/7.png)

Click ”Save”
Then click ”Save Project”

#### Building your application
Shipped is now building your application based on the sample application source code and the environment variables that you’ve entered for this application.

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/8.png)

When the build is completed it will turn green and you can now procceed to deploy this build. Click ”Deploy this Build”

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/9.png)

#### Creating a deployment environment

Click ”Create a new environment”
Choose a staging name for this build and click on ”Save”

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/10.png)

Now it’s finally time to deploy your application.
Make sure that your environment is select (blue mark next to it).
Press ”Deploy Build”.

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/11.png)

##### Deploying your application

It will take some time for container to be staged to your server.
The progress bar will show staging, running, healthy.
Note: It could take around 5min the first time

(If you got issue, contact staff to verify that your deployment target is working)

When it’s successful it will turn in to something similar to this

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/12.png)

Press the ”Run” Tab on the top to see how shipped have deployed your application.

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/13.png)

This view will give you stats (Load, Mem, Disk, Network, http latency graphs) and also the URL for accessing the application.
Press the URL on the top to access the application.

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/14.png)

The view of your application

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/15.png)

You’ll see ”Found no clients“, no worries. It’s because we have one more step in the Meraki Dashboard. Copy and paste your unique URL in the browser.
(mine is http://demo--cisco-meraki---shipped-cisco-meraki-cmx--d522b7.gce.shipped-cisco.com/)

#### Updating the Meraki CMX API Setting

Go back to the Meraki dashboard
(Network-wide -> Configure -> General)

Now enter your unique URL in the CMX by clicking ”Add a Post URL”
When you enter your URL, you need to end it with /events.
Like this http://demo--cisco-meraki---shipped-cisco-meraki-cmx--d522b7.gce.shipped-cisco.com/events

Else, Meraki CMX service won’t be able to verify your application against your validator ID that you’ve entered before.

It should look like this (but with your own parameter for validator ID, secret and URL)

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/16.png)
Don’t forget to press ”Save” in the bottom right corner.

Now press ”Validate” to see if Meraki is able to speak with your Shipped deployment.
If everything is working you’ll see this message above

”Validated http://demo--cisco-meraki---shipped-cisco-meraki-cmx--d522b7.gce.shipped-cisco.com/events”

Verify that your application is getting data from Meraki CMX.

Check your application again and you’ll see this within a couple of minutes.

![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/17.png)

If you want the raw data of your CMX post type http://uniqueURL/clients
(like this http://demo--cisco-meraki---shipped-cisco-meraki-cmx--d522b7.gce.shipped-cisco.com/clients)

No Gelocation data? Verify that your AP is placed on the map in Meraki Dashboard.
(Wireless -> Map & floor plans)
![](https://github.com/CiscoCLoud/cisco-meraki-cmx-api-app/blob/master/images/18.png)

### Summary

- You’ve now deployed an application from a source code.
-	Built it from scratch, with your own custom variables
-	Deployed it as service
-	Made Meraki CMX push data to your service
-	Displayed the data in your own service.

