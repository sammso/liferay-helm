{{/* vim: set filetype=mustache: */}}
{{/*
    liferay.osgi
*/}}
{{- define "liferay.osgi" }}
  {{- if . }}
  {{- range $fileName, $config := . }} 
  {{ "osgi-" }}{{ $fileName }}{{ ": |+" }}
    {{- range $key, $value := $config }} 
     {{ $key }}="{{ $value }}"
    {{- end }}  
  {{- end }}
  {{- end }}
{{- end }}