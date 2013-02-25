class AnalyticsController < ApplicationController

  def info
    link = Link.find_by_short_url(params[:short_url])
    analytic = Analytic.find_by_link_id(link.id)

    respond_to do |format|
      if params[:query] == "browsers"
        format.json{ render :json => analytic.browsers, status => 200}
      elsif params[:query] == "platforms"
        format.json{ render :json => analytic.platforms, status => 200}
      elsif params[:query] == "clicks"
        format.json{ render :json => analytic.clicks, status => 200}
      else
        format.json{ render :json => {:browsers => analytic.browsers,
                         :platforms => analytic.platforms,
                         :clicks => analytic.clicks} , status => 200}
      end
    end
  end

end
