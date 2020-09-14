{{/* vim: set filetype=mustache: */}}
{{/*
    liferay.tomcat.toXml
*/}}
{{- define "liferay.tomcat.toXml" }}
  tomcat-server.xml: |+
    <?xml version="1.0" encoding="UTF-8"?>
    {{- template "liferay.tomcat.toXml1" . }}
{{- end }}
{{/*
    liferay.tomcat.toXml1
*/}}
{{- define "liferay.tomcat.toXml1" }}
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
                {{- template "liferay.tomcat.toXml2" $value }}
    </{{ $key }}>
                {{- end }}    
            {{- else if eq ( typeOf $value ) "[]interface {}"}}
                {{- range $index, $indexValue := $value }}
                    {{- $map := dict $key $indexValue }}
                    {{- template "liferay.tomcat.toXml2" $map }}
                {{- end }}
            {{- end -}} 
        {{- end }}
    {{- end }} 
{{- end }}
{{/*
    liferay.tomcat.toXml2
*/}}
{{- define "liferay.tomcat.toXml2" }}
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
                {{- template "liferay.tomcat.toXml3" $value }}
        </{{ $key }}>
                {{- end }}    
            {{- else if eq ( typeOf $value ) "[]interface {}"}}
                {{- range $index, $indexValue := $value }}
                    {{- $map := dict $key $indexValue }}
                    {{- template "liferay.tomcat.toXml3" $map }}
                {{- end }}
            {{- end -}} 
        {{- end }}
    {{- end }}
{{- end }}
{{/*
    liferay.tomcat.toXml3
*/}}
{{- define "liferay.tomcat.toXml3" }}
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
                {{- template "liferay.tomcat.toXml4" $value }}
            </{{ $key }}>
                {{- end }}    
            {{- else if eq ( typeOf $value ) "[]interface {}"}}
                {{- range $index, $indexValue := $value }}
                    {{- $map := dict $key $indexValue }}
                    {{- template "liferay.tomcat.toXml4" $map }}
                {{- end }}
            {{- end -}} 
        {{- end }}
    {{- end }} 
{{- end }}
{{/*
    liferay.tomcat.toXml4
*/}}
{{- define "liferay.tomcat.toXml4" }}
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
                {{- template "liferay.tomcat.toXml5" $value }}
                </{{ $key }}>
                {{- end }}    
            {{- else if eq ( typeOf $value ) "[]interface {}"}}
                {{- range $index, $indexValue := $value }}
                    {{- $map := dict $key $indexValue }}
                    {{- template "liferay.tomcat.toXml5" $map }}
                {{- end }}
            {{- end -}} 
        {{- end }}
    {{- end }}  
{{- end }}
{{/*
    liferay.tomcat.toXml5
*/}}
{{- define "liferay.tomcat.toXml5" }}
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
                TOO DEEP
                    </{{ $key }}>
                {{- end }}    
            {{- else if eq ( typeOf $value ) "[]interface {}"}}
                {{- range $index, $indexValue := $value }}
                    {{- $map := dict $key $indexValue }}
                    TOO DEEP
                {{- end }}
            {{- end -}} 
        {{- end }}
    {{- end }}  
{{- end }}