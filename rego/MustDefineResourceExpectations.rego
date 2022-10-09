package kubernetes.validating.workloadresource

array_has_key(array, key) {
	_ = array[key]
}


deny[error] {
	not is_workload_resource
    error := sprintf("Resource label `%v` value must be a valid URL; found `%v`", ["ok", "k"])
}

is_workload_resource {
	input.request.kind.kind == "Deployment"
}

is_workload_resource {
	input.request.kind.kind == "StatefulSet"
}

is_workload_resource {
	input.request.kind.kind == "ReplicaSet"
}

is_workload_resource {
	input.request.kind.kind == "DaemonSet"
}
