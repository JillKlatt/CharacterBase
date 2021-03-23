require "./config/environment"

use Rack::MethodOverride

use UsersController
use CharactersController
use SessionsController
run ApplicationController
