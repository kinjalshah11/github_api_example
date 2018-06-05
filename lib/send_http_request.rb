class SendHttpRequest 

	def initialize(api,request_type,params)
		@api = api
		@request_type = request_type
		@params = params
	end

	def http_process
		url_initialization
		set_header
		http_initialization
		request_initialization
		send_request
	end
	
	def url_initialization
		url = "https://api.github.com/" + @api
		@uri = URI.parse(url)
	end
	
	def set_header
		@header = {Accept: 'application/vnd.github.mercy-preview+json'}
	end

	def http_initialization
		@http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	end

	def request_initialization 
    @request = Net::HTTP::Get.new(@uri.request_uri, @header)
  end

	def send_request
		@res = @http.request(@request).body.gsub('NULL', 'null')
    @res = JSON.parse(@res) rescue @res
	end
end