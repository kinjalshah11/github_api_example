class UsersController < ApplicationController
	
	def show
		@response = SendHttpRequest.new('users/'+"#{current_user.username}"+'/repos','GET'," ").http_process
	end

	def repo_detail
		url = params["owner"]+'/'+params["repo"]
		@repo_respons = SendHttpRequest.new('repos/'+url,'GET'," ").http_process
		@commit_respons = SendHttpRequest.new('repos/'+url+'/commits','GET'," ").http_process
	end

end
