package labels

import future.keywords.in

required_labels := {"1"}
required_pattern := `^[a-z]*$`

array_has_key(array, key) = value { 
   value = array[key]
}


# Return violation if required label does not exist
violation[{"msg":msg}] {
	some label in required_labels
    not input.request.object.metadata.labels[label]
    msg := sprintf("missing required label '%v'", [label])
}

# Return violaiton if required label does not match required pattern
violation[{"msg": msg}] {
    value := array_has_key(input.request.object.metadata.labels, required_labels)
    not regex.match(required_pattern, value)
    msg := sprintf("label '%v' does not match required pattern", [value])
}