package kubernetes.validating.ingress

deny[error] {

	input.request.kind.kind == "Ingress"	

	input_namespace = input.request.object.metadata.namespace
	input_name = input.request.object.metadata.name
	
	new_host := input.request.object.spec.rules[each_rule].host
	old_host := data.kubernetes.ingresses[each_namespace][each_name].spec.rules[each_rule].host

	[input_namespace, input_name] != [each_namespace, each_name]

	new_host == old_host

	error := sprintf("Ingress host '%s' conflicts with existing ingress in %s/%s", [new_host, each_namespace, each_name])
}


