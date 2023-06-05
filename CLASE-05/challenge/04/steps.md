 #### kubectl apply -f deploy.yaml
    deployment.apps/k8s-test-web-deployment configured
### kubectl get deployment
    NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
    k8s-test-web-deployment   1/1     1            1           5m25s
### kubectl get replicaset
    NAME                                 DESIRED   CURRENT   READY   AGE
    k8s-test-web-deployment-76c9b5998    0         0         0       5m29s
    k8s-test-web-deployment-84678dbc56   1         1         1       11s
    k8s-test-web-deployment-8b4dff569    0         0         0       3m9s

### kubectl get pods
    NAME                                       READY   STATUS    RESTARTS   AGE
    k8s-test-web-deployment-84678dbc56-rgsq6   1/1     Running   0          13s

### kubectl rollout history deployment/k8s-test-web-deployment
    deployment.apps/k8s-test-web-deployment 
    REVISION  CHANGE-CAUSE
    1         Primer deploy de la aplicación web - v1
    2         Actualización a la versión 2 de la aplicación web
    3         Actualización a la versión 3 de la aplicación web
    
### kubectl rollout undo deployment/k8s-test-web-deployment
    deployment.apps/k8s-test-web-deployment rolled back
 
 ### kubectl rollout history deployment/k8s-test-web-deployment
    deployment.apps/k8s-test-web-deployment 
    REVISION  CHANGE-CAUSE
    1         Primer deploy de la aplicación web - v1
    3         Actualización a la versión 3 de la aplicación web
    4         Actualización a la versión 2 de la aplicación web
    
### kubectl delete deployment k8s-test-web-deployment
    deployment.apps "k8s-test-web-deployment" deleted
    
###  kubectl get pods
    No resources found in default namespace.
