locals {
    tags = {
        environment = var.environment
        channel = var.channel
        project = var.project_short
    }

web_app_settings = {
    "SLACK_BOT_TOKEN"           = "@Microsoft.KeyVault(VaultName=kv-aue-eric-01;SecretName=SLACK-BOT-TOKEN)"
    "SLACK_BOT_USER_ID"                 = "@Microsoft.KeyVault(VaultName=kv-aue-eric-01;SecretName=SLACK-BOT-USER-ID)"
    "OPENAI_API_KEY"             = "@Microsoft.KeyVault(VaultName=kv-aue-eric-01;SecretName=OPENAI-API-KEY)"
    "SLACK_SIGNING_SECRET"           = "@Microsoft.KeyVault(VaultName=kv-aue-eric-01;SecretName=SLACK-SIGNING-SECRET)"

    "DOCKER_REGISTRY_SERVER_URL" = "https://index.docker.io/v1"
    
    "WEBSITES_PORT"              = "5000"
  }
}