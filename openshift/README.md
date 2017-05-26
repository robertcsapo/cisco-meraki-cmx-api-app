# Cisco Meraki CMX API demo app - as a Service

The Cisco Meraki CMX API uses intelligent access points to deliver real-time location analytics data directly to customers, allowing integration with 3rd-party retail analytics applications, CRM, and custom-built applications.

#### Prerequisites
-	Cisco Meraki access point
-	Github Account
- RedHat OpenShift account (free)

#### [Login in to Cisco Meraki Dashboard](https://account.meraki.com/login/)

You need to login to your Meraki network to retrieve and setup the CMX API interface.
As the CMX API Interface will be sending JSON as HTTP POST.

*(Note: If doing learning lab, you’ll get provided with a Meraki DevNet sandbox account)*

![](https://github.com/robertcsapo/cisco-meraki-cmx-api-app/blob/openshift/openshift/images/1.png)

Navigate to the CMX API Settings
Network-wide -> Configure -> General

As we will deploy our sample application through OpenShift, we still don’t know the URL before we deployed. Therefor write down your Validator id (green box) and choose a secret (red box) that we will use. Suggestion is to use **openshift** as a secret for this lab

*(Enable **Scanning API** if disabled)*

### OpenShift Integration

-[Login in to RedHat OpenShift](https://manage.openshift.com/)

We will now create our sample application to retrieve the CMX API data.  
Choose ”New Project” and choose a name for your new project.
(image)
![](https://github.com/robertcsapo/cisco-meraki-cmx-api-app/blob/openshift/openshift/images/2.png)

#### Compose Your Application
As this sample application is built on Ruby.
Choose "Ruby" under Languages.

Pick the latest (2.3) release of Ruby
(image)
![](https://github.com/robertcsapo/cisco-meraki-cmx-api-app/blob/openshift/openshift/images/3.png)

You will need to choose a name for you application (under your project).  
Then add git repository url (https://github.com/robertcsapo/cisco-meraki-cmx-api-app)  
Choose Branch **openshift** (click _advanced options_)
(image)
![](https://github.com/robertcsapo/cisco-meraki-cmx-api-app/blob/openshift/openshift/images/4.png)

We need to edit the service to gather data from your own Meraki Network.
Click on "advanced options" to edit the service.

Security  
- [x] Secure route  

Build Configuration  
- [x] Environment Variables (Build and Runtime)  
- * CMX_SECRET => **openshift**  
- * CMX_VALIDATOR => **c3ffa19963ffc5d5a9e61fb0994b680ea426b9cc**
(image)
![](https://github.com/robertcsapo/cisco-meraki-cmx-api-app/blob/openshift/openshift/images/5.png)

Finish by pressing "Create".  
Press "Go to overview" to see your project.  
Now your application will be created for your project in OpenShift.  
(This could take some time)

When it's done, you should be able to navigate to your CMX Application. URL will be posted on Overview (top right corner).
(image)
![](https://github.com/robertcsapo/cisco-meraki-cmx-api-app/blob/openshift/openshift/images/6.png)

You’ll see ”Found no clients“ on your CMX App, no worries. It’s because we have one more step in the Meraki Dashboard. Copy and paste your unique URL in the browser.

#### Updating the Meraki CMX API Setting

Go back to the Meraki dashboard
(Network-wide -> Configure -> General)

Now enter your unique URL in the CMX by clicking ”Add a Post URL”
When you enter your URL, you need to end it with /events.  
Like this one  https://cmx-app-cisco-meraki-cmx.1d35.starter-us-east-1.openshiftapps.com/events

Else, Meraki CMX service won’t be able to verify your application against your validator ID that you’ve entered before.

It should look like this (but with your own parameter for validator ID, secret and URL)
(image)
![](https://github.com/robertcsapo/cisco-meraki-cmx-api-app/blob/openshift/openshift/images/7.png)

Don’t forget to press ”Save” in the bottom right corner.

Now press ”Validate” to see if Meraki is able to speak with your OpenShift deployment.
If everything is working you’ll see this message above

”Validated https://cmx-app-cisco-meraki-cmx.1d35.starter-us-east-1.openshiftapps.com/events”

Verify that your application is getting data from Meraki CMX.

Check your application again and you’ll see data within a couple of minutes.

If you want the raw data of your CMX post type http://uniqueURL/clients
(like this https://cmx-app-cisco-meraki-cmx.1d35.starter-us-east-1.openshiftapps.com/clients)

No Gelocation data? Verify that your AP is placed on the map in Meraki Dashboard.
(Wireless -> Map & floor plans)

### Summary

- You’ve now deployed an application from a source code.
-	Built it from scratch, with your own custom variables
-	Deployed it as service
-	Made Meraki CMX push data to your service
-	Displayed the data in your own service.
