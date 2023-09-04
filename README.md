# Task2: Create an EKS cluster using Terraform and deploy an Nginx application on the K8s cluster and access it via the Internet
We are using AWS as our cloud provider for this taks.
Manifest files used to achieve this task:
![image](https://github.com/devclosre/task-two/assets/143948725/ed480600-f0e6-489c-aa62-b439794c8abd)


Once we do a terraform apply on these files, an EKS cluster, a Node group with 2 instance and a Bastion host gets created.

Lets look at the EKS cluster and Node group:

EKS is a Managed service by AWS and we do not have any control over this component, AWS has compelete control over it.

We have to create a Master Role and Node group Role and attach some policies for each role.

Policies assigned to Master Role:

AmazonEKSClusterPolicy

AmazonEKSServicePolicy

AmazonEKSVPCResourceController

Policies assigned to Node Role:

AmazonEKSWorkerNodePolicy

AmazonEKS_CNI_Policy

AmazonSSMManagedInstanceCore

AmazonEC2ContainerRegistryReadOnly

s3

EKS cluster is dependent on the Master Role with above mentioned polices and Node group is dependent on the Worker Node Role with above mentioned policies attached.

We can see the EKS cluster name is EKS-DEMO and status is Active.

![image](https://github.com/devclosre/task-two/assets/143948725/627a8334-2090-4535-b33f-360e5889f21e)


Now we have Node Group, which is considered as Data plane and we have control over it. Actual workloads run on these machines.

![image](https://github.com/devclosre/task-two/assets/143948725/5c3ec56d-fd96-42eb-90ba-7a1fa10c8bf4)


We have two machines in the our Node group

Node1:

![image](https://github.com/devclosre/task-two/assets/143948725/19f1b23d-8d2a-4d78-afbd-7dd613e040ea)


Node2:

![image](https://github.com/devclosre/task-two/assets/143948725/db2c6344-d6ca-48a6-9322-e76b0184b0c5)



Once the cluster gets created login to Bastion, we have already installed AWS CLI and kubectl using script. 

![image](https://github.com/devclosre/task-two/assets/143948725/2be92f6d-0fc6-466c-a572-b38853003d3c)


Now we need to fetch the kubeconfig file using the below command:

# aws eks update-kubeconfig --name EKS-DEMO --region ap-southeast-4


![image](https://github.com/devclosre/task-two/assets/143948725/a82cdab6-7553-4285-88d7-9df737c72f66)


Now the kubeconfig file is downloaded using which we can access the API server.

kubeconfig file has all the details of the cluster, certificates and secret token to authenticate to cluster.

Using kubectl we can deploy our application on to the k8s cluster.

We have two deployment files, one for nginx deployment and one for nginx service.

The files are as follows:


![image](https://github.com/devclosre/task-two/assets/143948725/008d3142-1c39-4995-977e-d648466765ac)


![image](https://github.com/devclosre/task-two/assets/143948725/b9c73fbf-ec74-42c7-8192-484f64360bc7)



Once we apply these files, Nginx deployment with 2 replicas and Nginx service of type Load Balancer gets created.


![image](https://github.com/devclosre/task-two/assets/143948725/35a7ae54-c9a8-4f55-ae36-0f4e672d68bb)

![image](https://github.com/devclosre/task-two/assets/143948725/948503bd-0505-4208-8f53-37f7e85896f9)


We can access our Nginx pod using the dns name of the Load Balancer.


![image](https://github.com/devclosre/task-two/assets/143948725/c092d819-f4ea-4d6c-a13b-c3f834c374c0)






















