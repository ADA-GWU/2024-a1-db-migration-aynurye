# DB Migration 

<i>Aynur Yeganzada</i>

### Blue - Green Deployment Strategy: 

<b>What is the problem?</b>
<ul>
Maintenance usually occurs at night when there are fewer users. Developers need to be present during updates in case something goes wrong.  Agile development requires frequent updates to receive customer feedback. Outages can cause customer dissatisfaction and affect developers. Blue green deployment involves running two instances of an application simultaneously.  One instance is live, while the other is idle. Updates are made to the idle instance, and users are gradually moved to it once it's ready. This method reduces downtime and allows for smoother updates.
</ul>
<br>


<b>What is the strategy logic?</b>
<ul>
Blue-green deployment is a DevOps technique that allows developers to deploy updates to applications or services without causing downtime or affecting user experience. The process involves having two identical environments, one running the current version of the application (blue) and the other running the new version (green). The new version is deployed and tested in the green environment before gradually moving users from the blue environment to the green one. If any issues arise, users can easily be moved back to the blue environment. This approach reduces the risk of downtime and allows for faster and more frequent updates, enabling teams to respond to customer feedback and make improvements more quickly.
</ul>


<br>
<b>Overview of the steps:</b>
<ul>
<li>Setup Environments:
<ul><li>Establish two complete and independent environments, often referred to as "blue" and "green." These environments should include servers, databases, and any other necessary infrastructure components. Ensure both environments are capable of running the application independently.</li></ul>
<li>Pre-deployment Checks:</li>
<ul><li>Before deploying any changes, conduct pre-deployment checks to ensure that both the "blue" and "green" environments are in a healthy state. This includes validating configurations, connectivity, and overall system readiness.</li></ul>
<li>Deploy to Inactive Environment:</li>
<ul><li>Deploy the new version or changes to the inactive environment (e.g., deploy to "green" if "blue" is currently in production). Use automated deployment tools to ensure consistency and reduce the chance of errors.</li></ul>
<li>Testing:</li>
<ul><li>Perform comprehensive testing on the inactive environment to verify the functionality, performance, and stability of the new version. This includes unit tests, integration tests, and any other relevant testing procedures.</li></ul>
<li>Validation:</li>
<ul><li>Conduct user acceptance testing (UAT) and involve stakeholders to validate that the new version meets business requirements. Address any issues or concerns raised during this validation phase.</li></ul>
<li>Switch Traffic:</li>
<ul><li>Gradually redirect incoming production traffic from the active environment (e.g., "blue") to the inactive environment (e.g., "green"). This can be accomplished through load balancer configurations or DNS updates.</li></ul>
<li>Monitoring and Validation</li>
<ul><li>Monitor the performance of the newly switched environment and validate that it's handling the production load effectively. Ensure that there are no unexpected issues, and if any arise, be prepared to quickly switch back to the original environment.</li></ul>
<li>Rollback Plan:</li>
<ul><li>Have a well-defined rollback plan in place. If issues are detected post-deployment, be ready to revert the traffic back to the original environment swiftly. This plan should be thoroughly tested to ensure its effectiveness.</li></ul>
<li>Post-deployment Monitoring:</li>
<ul><li>Continue monitoring the system after the traffic switch to identify any post-deployment issues or anomalies. This ongoing monitoring helps to catch and address issues promptly.</li></ul>
<li>Complete Deployment:</li>
<ul><li>Once the new version is validated and the monitoring period confirms stability, consider the deployment complete. Update documentation and inform relevant teams about the successful deployment.</li></ul>
</ul>

<br>

**Note**: Remove any temporary resources or configurations introduced during the deployment process. Ensure that both environments are left in a clean and consistent state.

## Running the program:

**To do So**: we need to just have <i>PostgreSQL</i> installed.

<ol><li>Go to the directory my project is located</li>
<li>If you don't have the tables created before, run the script for automatic creation: </li>

<i>For Mac Users:</i>
```bash
  psql -d your_database_name -U your_username -f path/to/create_table.sql
```

<i>For Win Users:</i>
```bash
  psql -d your_database_name -U your_username -f path\to\create_table.sql
```
**Note** that if the tables ealready created, then the script will just insert the values to the tables. 

The tables will be displayed in the terminal

### STUDENTS Table

| **ST_ID** | ST_NAME | ST_LAST     |
|-----------|---------|-------------|
| **1**     | Konul   | Gurbanova   |
| 2         | Shahnur | Isgandarli  |
| **3**     | Natavan | Mammadova   |


### INTERESTS Table

| **STUDENT_ID** | INTEREST    |
|----------------|-------------|
| 1              | Tennis      |
| 1              | Literature  |
| 2              | Math        |
| 2              | Tennis      |
| 3              | Math        |
| 3              | Music       |
| 2              | Football    |
| 1              | Chemistry   |
| 3              | Chess       |

<li><b>Migration</b> step involves calling for another script</li>

<i>For Mac Users:</i>
```bash
  psql -d your_database_name -U your_username -f path/to/migration.sql
```

<i>For Win Users:</i>
```bash
  psql -d your_database_name -U your_username -f path\to\migration.sql
```

The tables will be displayed in the terminal

### STUDENTS Table

| **STUDENT_ID** | ST_NAME |     ST_LAST     |
|----------------|---------|-----------------|
| **1**          | Konul   | Gurbanova       |
| 2              | Shahnur | Isgandarli      |
| **3**          | Natavan | Mammadova       |


### INTERESTS Table

| **STUDENT_ID** | INTERESTS                             |
|----------------|---------------------------------------|
| **1**          | "Tennis", "Literature", "Chemistry"   |
| **2**          | "Math", "Tennis", "Football"          |
| **3**          | "Math", "Music", "Chess"              |

<li><b>Rollback</b> step involves calling for another script</li>

<i>For Mac Users:</i>
```bash
  psql -d your_database_name -U your_username -f path/to/rollback.sql
```

<i>For Win Users:</i>
```bash
  psql -d your_database_name -U your_username -f path\to\rollback.sql
```
</ol>

<h3>References:</h3>
<li><a href="https://docs.aws.amazon.com/whitepapers/latest/overview-deployment-options/bluegreen-deployments.html" target=_blank>AWS Docs</a></li>
<li><a href="https://docs.cloudfoundry.org/devguide/deploy-apps/blue-green.html" target=_blank>Cloud Foundry</a></li>

















