Any **POD** or **POD** containing Resource (**DEPLOYMENT**, **DAEMONSET** etc.) _MUST_ define:

```spec.containers[].resources.limits.cpu
spec.containers[].resources.limits.memory
spec.containers[].resources.requests.cpu
spec.containers[].resources.requests.memory