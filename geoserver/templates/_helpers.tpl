{{/* vim: set filetype=helm: */}}


{{/*Expand the name of the chart.*/}}
{{- define "geoserver.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create a default fully qualified app name.
  We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
  If release name contains chart name it will be used as a full name.
*/}}
{{- define "geoserver.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*Create chart name and version as used by the chart label.*/}}
{{- define "geoserver.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*Common labels*/}}
{{- define "geoserver.labels" -}}
helm.sh/chart: {{ include "geoserver.chart" . }}
{{ include "geoserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*Selector labels*/}}
{{- define "geoserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "geoserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*Create the name of the service account to use*/}}
{{- define "geoserver.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "geoserver.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "geoserver.serviceName" -}}
{{ .Values.serviceName | default (include "geoserver.fullname" .) }}
{{- end }}

{{- define "geoserver.serviceDomain" -}}
{{  printf "%s.%s.svc.cluster.local" (include "geoserver.serviceName" .) .Release.Namespace }}
{{- end }}

{{- define "geoserver.adminPassword.secretName" -}}
{{ .Values.adminPassword.secretName | default (printf "%s-admin-password" (include "geoserver.fullname" .)) }}
{{- end }}


{{- define "geoserver.maxHeapMemory" -}}
{{- with .Values.resources.requests }}
{{- if (hasSuffix "Mi" .memory) }}
{{- printf "%dm" (max (div (mul (trimSuffix "Mi" .memory) 3) 4) 1024) }}
{{- else if (hasSuffix "Gi" .memory) }}
{{- printf "%dm" (max (div (mul (trimSuffix "Gi" .memory) 3072) 4) 1024) }}
{{- else }}
{{- fail "memory request is expected in following units: Mi, Gi" }}
{{- end }}{{/*if*/}}
{{- end }}{{/*with*/}}
{{- end }}
