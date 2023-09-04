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

![image](https://github.com/devclosre/task2/assets/143948725/40cf3ed5-54a1-45ac-b49c-e61ed9237b2d)



Now we have Node Group, which is considered as Data plane and we have control over it. Actual workloads run on these machines.

![image](https://github.com/devclosre/task2/assets/143948725/d1995745-8ab9-4540-9c02-ed2cb297125b)

We have two machines in the our Node group

Node1:


![image](https://github.com/devclosre/task2/assets/143948725/48509ba3-9fca-4f40-bed5-3db32489bc59)

Node2:


![image](https://github.com/devclosre/task2/assets/143948725/2d78c295-5b9e-40b1-8663-2c0e9c8278a6)



Once the cluster gets created login to Bastion, we have already installed AWS CLI and kubectl using script. 

Now we need to fetch the kubeconfig file using the below command:

# aws eks update-kubeconfig --name EKS-DEMO --region ap-southeast-4


![image](https://github.com/devclosre/task2/assets/143948725/d3f745ce-b08a-4110-a788-4f10c7bc3fb5)

Now the kubeconfig file is downloaded using which we can access the API server.

kubeconfig file has all the details of the cluster, certificates and secret token to authenticate to cluster.

Using kubectl we can deploy our application on to the k8s cluster.

We have two deployment files, one for nginx deployment and one for nginx service.

The files are as follows:


![image](https://github.com/devclosre/task2/assets/143948725/a6ee88d3-1e60-4b8d-b576-3012857a001a)


![image](https://github.com/devclosre/task2/assets/143948725/df7881e1-78f0-450b-a446-ed77993cca6a)

Once we apply these files, Nginx deployment with 2 replicas and Nginx service of type Load Balancer gets created.


![image](https://github.com/devclosre/task2/assets/143948725/9a885f9d-c032-4e9a-94f8-9bf7c6ac8bc4)


We can access our Nginx pod using the dns name of the Load Balancer.


![image](https://github.com/devclosre/task2/assets/143948725/fb0a6fd1-ec52-4fd9-89a4-eee37a4fb3cb)






















