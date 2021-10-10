[ALL](/pseudocode/README.md#ALL) workloads _SHOULD_ delcare an accompanying  **PodDistruptionBudget** with 
* `spec.minAvailable` set to a value less than the total number of replicas of the associated workload
* `spec.maxUnavailable` set to a value greater than 0