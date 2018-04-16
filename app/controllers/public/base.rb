class Public::Base < ApplicationController
     layout 'public', except: [:home]
end