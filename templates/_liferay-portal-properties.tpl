{{/* vim: set filetype=mustache: */}}
{{/*
    liferay.portal.properties
*/}}
{{- define "liferay.portal.properties" }}
  portal-ext.properties: |+
    {{- range $key, $value := . }} 
    {{ $key }}=
      {{- if eq ( typeOf $value ) "[]interface {}" }}
        {{- $value | join ", " }}
      {{- else }}
        {{- $value }}
      {{- end }}
    {{- end }}
{{- end }}