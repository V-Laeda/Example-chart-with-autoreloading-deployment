{{- define "my-app-separated-config.fullname" -}}
{{- include "common.names.fullname" . | default .Chart.Name -}}
{{- end -}}

{{- define "my-app-separated-config.envHash" -}}
{{ include (print $.Values.configFilePath) . | sha256sum }}
{{- end -}}

{{- define "my-app-separated-config.appConfigHash" -}}
{{ include (print $.Values.appConfigPath) . | sha256sum }}
{{- end -}}

{{- define "my-app-separated-config.fullHash" -}}
{{/* Объединяем хеши обоих файлов */}}
{{ $envHash := include "my-app-separated-config.envHash" . }}
{{ $appHash := include "my-app-separated-config.appConfigHash" . }}
{{ printf "%s%s" $envHash $appHash | sha256sum }}
{{- end -}}
