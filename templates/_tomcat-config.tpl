{{/* vim: set filetype=mustache: */}}
{{/*
    liferay.tomcat.toXml
*/}}
{{- define "liferay.tomcat.toXml" }}
  tomcat-server.xml: |+
    <?xml version="1.0" encoding="UTF-8"?>
    {{- template "liferay.tomcat._toXml" . }}
{{- end }}
{{/*
    liferay.tomcat.toXml1
*/}}
{{- define "liferay.tomcat._toXml" }}
    {{- range $key, $value := . }} 
        {{- $childCount := 0 }}
        {{- if ne  (substr 0 1 $key ) "_" }}
            {{- if eq ( typeOf $value ) "map[string]interface {}"}}
    <{{ $key }}
                {{- range $attrKey, $attrValue := $value }} 
                    {{- if eq  (substr 0 1 $attrKey ) "_" }}
                        {{- " " }}{{ trimPrefix "_" $attrKey }}="{{ $attrValue }}"
                    {{- else }}
                        {{- $childCount = add1 $childCount }}
                    {{- end }}
                {{- end }}
                {{- if eq $childCount 0 -}}
                    />
                {{- else -}}
                    >
                {{- template "liferay.tomcat._toXml" $value  }}
    </{{ $key }}>
                {{- end }}    
            {{- else if eq ( typeOf $value ) "[]interface {}"}}
                {{- range $index, $indexValue := $value }}
                    {{- $map := dict $key $indexValue }}
                    {{- template "liferay.tomcat._toXml" $map }}
                {{- end }}
            {{- end -}} 
        {{- end }}
    {{- end }} 
{{- end }}
