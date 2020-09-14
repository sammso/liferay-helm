{{/* vim: set filetype=mustache: */}}
{{/*
    liferay.config
*/}}
{{- define "liferay.config" }}
data:
  {{- template "liferay.tomcat.toXml" .tomcat }}
  {{- template "liferay.portal.properties" .portalProperties }}
  {{- template "liferay.osgi" .osgiConfig }} 
{{- end }}