// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "script.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")