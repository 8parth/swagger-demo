Swagger::Docs::Config.base_api_controller = ActionController::API
Swagger::Docs::Config.register_apis({
  "1.0" => {
    # location where our api doc files will be generated, as of now we will keep public
    :api_file_path => "public/",
    # base path url of our application 
    # do not forget to change this when not running in development mode 
    :base_path => "http://localhost:3000",
    # setting this option true tells swagger to clean all files generated in api_file_path directory before any files are generated
    :clean_directory => true,
    # As we are using Rails-API, our ApplicationController inherits ActionController::API instead of ActionController::Base
    # Hence, we need to add ActionController::API instead of default ActionController::Base
    # :base_api_controller => ActionController::API,
    :base_api_controller => ActionController::API,
    :attributes => {
      :info => {
        "title" => "Swagger Demo",
        "description" => "How Swagger works",
        "contact" => "parthmodi54@yahoo.com",
        "license" => "Apache 2.0",
        "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
      }
    }
  }
})