location = "East US 2"

resource_group_name = "boardgame-dev-RG"

app_service_plan_name = "boardgame-dev-appservice-plan"

webapp_name = "boardgame-dev-webapp"

app_service_plan_sku_name = "B1"

webapp_java_version = "17"

webapp_app_jar_name = "app.jar"

webapp_app_settings = {
  "SERVER_PORT" = "80"
  "WEBSITES_CONTAINER_START_TIME_LIMIT" = "300"
  # Dev database specific settings
  "SPRING_DATASOURCE_URL"      = "jdbc:h2:mem:testdb" # Example for in-memory H2 for local dev
  "SPRING_DATASOURCE_USERNAME" = "sa"
  "SPRING_DATASOURCE_PASSWORD" = ""
  "SOME_API_KEY" = "your_dev_api_key_12345"
}
