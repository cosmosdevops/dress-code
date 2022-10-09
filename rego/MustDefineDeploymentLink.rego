package kubernetes.validating.existence

array_has_key(array, key) { 
   _ = array[key]
}
required := "deployed-by-link"

deny[error] {
    keys := input.request.object.metadata.labels
    not array_has_key(keys, required)
    error := sprintf("Resource must define label '%s'", [required])
}

regex = `(?i)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b[-a-zA-Z0-9@:%_\+.~#?&//=]*`

deny[error] {
    value := input.request.object.metadata.labels[required]
    not re_match(regex, value)
    msg := sprintf("Resource label `%v` value must be a valid URL; found `%v`", [required, value])
}
