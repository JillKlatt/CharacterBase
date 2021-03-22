require "./config/environment"

use Rack::MethodOverride

use UsersController
use CharactersController
run ApplicationController
