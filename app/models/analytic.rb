class Analytic < ActiveRecord::Base
  belongs_to :link
  attr_accessible :browsers, :clicks, :countries, :platforms
  before_save :default_values

  def default_values

    browserJSON = '{"Chrome":"0", "Internet Explorer":"0",' + 
                  '"Firefox":"0", "Opera":"0", "Safari":"0", "Others":"0"}'
    self.browsers ||= browserJSON

    platformJSON = '{"Mac":"0", "Windows":"0",' + 
                  '"Linux":"0", "Others":"0"}'
    self.platforms ||= platformJSON

  end

  def self.get_browser(user_agent)

    if user_agent.downcase.match(/chrome/i)
      "Chrome"
    elsif user_agent.downcase.match(/msie/i)
      "Internet Explorer"
    elsif user_agent.downcase.match(/firefox/i)
      "Firefox"
    elsif user_agent.downcase.match(/opera/i)
      "Opera"
    elsif user_agent.downcase.match(/safari/i)
      "Safari"
    else
      "Others"
    end

  end

  def self.get_platform(user_agent)

    if user_agent.downcase.match(/mac/i)
      "Mac"
    elsif user_agent.downcase.match(/windows/i)
      "Windows"
    elsif user_agent.downcase.match(/linux/i)
      "Linux"
    else
      "Others"
    end

  end

end
