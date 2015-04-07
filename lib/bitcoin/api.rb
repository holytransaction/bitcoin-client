class Bitcoin::API
  attr_reader :options
  attr_reader :params
  
  def user; options[:user]; end
  def pass; options[:pass]; end
  def host; options[:host]; end
  def port; options[:port]; end
  def ssl;  options[:ssl];  end
  def ssl?; options[:ssl];  end
  def open_timeout; options[:open_timeout]; end
  def read_timeout; options[:read_timeout]; end
  def user=(a); options[:user] = a; end
  def pass=(a); options[:pass] = a; end
  def host=(a); options[:host] = a; end
  def port=(a); options[:port] = a; end
  def open_timeout=(a); options[:open_timeout] = a; end
  def read_timeout=(a); options[:read_timeout] = a; end
  def ssl=(a);  options[:ssl]  = a; end

  def initialize(options = {})
    @options = {
      :host => 'localhost',
      :port => 8332,
      :ssl  => false,
      :open_timeout => 30,
      :read_timeout => 30
    }.merge(options)
  end
  
  def to_hash
    @options.dup
  end
  
  def request(service_name, *params)
    req = Bitcoin::Request.new(service_name, params)
    Bitcoin::RPC.new(to_hash).dispatch(req)
  end
end
