package kubernetes.validating.namespace

array_has_key(array, key) {
	_ = array[key]
}

required := "uid"

deny[error] {
	keys := input.request.object.metadata.labels
	not array_has_key(keys, required)
	error := sprintf("Resource must define label '%s'", [required])
}

deny[error] {
	new_namespace := input.request.object.metadata.name
	new_uid := input.request.object.metadata.labels[required]
	existing_uid := data.kubernetes.namespaces[each_namespace].metadata.labels[required]

	[new_namespace, new_uid] != [each_namespace, existing_uid]

	new_uid == existing_uid
	
	error := sprintf("Resource label `%v` with value `%v` must be cluster unique. Found conflict", [required, new_uid])
}
