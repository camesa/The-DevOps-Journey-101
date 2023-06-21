4\. Obtén información detallada del Pod creado.

     $ kubectl describe pod c05-1
    Name:             c05-1
    Namespace:        default
    Priority:         0
    Service Account:  default
    Node:             docker-desktop/192.168.65.4
    Start Time:       Sat, 03 Jun 2023 10:45:10 -0300
    Labels:           app=test-web
    Annotations:      <none>
    Status:           Running
    IP:               10.1.0.6
    IPs:
      IP:  10.1.0.6
    Containers:
      c05-1-test-web:
        Container ID:   docker://3456150fed24e086189de8360aa07b869b41c2eb0b747693975e406c915d6d09
        Image:          roxsross12/k8s_test_web:latest
        Image ID:       docker-pullable://roxsross12/k8s_test_web@sha256:7bca3aceeecd5724dc6fa643622145df8ffd3a2d4663ba42e1013dfa56f19a99
        Port:           80/TCP
        Host Port:      0/TCP
        State:          Running
          Started:      Sat, 03 Jun 2023 10:45:15 -0300
        Ready:          True
        Restart Count:  0
        Environment:    <none>
        Mounts:
          /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-msdrh (ro)
    Conditions:
      Type              Status
      Initialized       True 
      Ready             True 
      ContainersReady   True 
      PodScheduled      True 
    Volumes:
      kube-api-access-msdrh:
        Type:                    Projected (a volume that contains injected data from multiple sources)
        TokenExpirationSeconds:  3607
        ConfigMapName:           kube-root-ca.crt
        ConfigMapOptional:       <nil>
        DownwardAPI:             true
    QoS Class:                   BestEffort
    Node-Selectors:              <none>
    Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
    Events:
      Type    Reason     Age   From               Message
      ----    ------     ----  ----               -------
      Normal  Scheduled  41s   default-scheduler  Successfully assigned default/c05-1 to docker-desktop
      Normal  Pulling    41s   kubelet            Pulling image "roxsross12/k8s_test_web:latest"
      Normal  Pulled     36s   kubelet            Successfully pulled image "roxsross12/k8s_test_web:latest" in 5.02252296s (5.022526627s including 
waiting)
      Normal  Created    36s   kubelet            Created container c05-1-test-web
      Normal  Started    36s   kubelet            Started container c05-1-test-web

