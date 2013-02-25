require 'json'
class LinksController < ApplicationController

  def index
    @links = Link.find(:all)
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    @analytic = @link.build_analytic
    @link.save
    redirect_to :action => "index"
  end

  def go
    @link = Link.find_by_short_url(params[:short_url])
    unless @link.blank?
      updateAnalytic(@link.analytic)
      redirect_to @link.long_url, :status => @link.http_status
    else 
      redirect_to :action => "new"
    end
  end

  private

  def updateAnalytic(analytic)
    #analytic = Analytic.find_by_link_id(link_id)

    browser = Analytic.get_browser(request.env['HTTP_USER_AGENT'])
    browserHash = JSON.parse(analytic.browsers)
    browserHash[browser] = (browserHash[browser].to_i + 1).to_s

    platform = Analytic.get_platform(request.env['HTTP_USER_AGENT'])
    platformHash = JSON.parse(analytic.platforms)
    platformHash[platform] = (platformHash[platform].to_i + 1).to_s
  
    clicks = (analytic.clicks.to_i + 1).to_s

    Analytic.update(analytic.id, :browsers => browserHash.to_json,
                    :platforms => platformHash.to_json,
                    :clicks => clicks)

  end

end
