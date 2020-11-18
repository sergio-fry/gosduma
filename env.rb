require "dotenv"
require "devup/dotenv_load_list"

class Environment
  def initialize(name)
    @name = name
  end

  def load
    Dotenv.load(*dotenv_files)
  end

  def dotenv_files
    Devup::DotenvLoadList.new(env: @name)
  end
end

Env = Environment.new ENV.fetch("APP_ENV", "development")
Env.load
