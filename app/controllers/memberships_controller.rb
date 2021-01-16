class MembershipsController < ApplicationController


  def index
  end

  def success
  end

  def error
  end

  def addUser
    # Setup the keys needed to access Mailchimp's API
    dc = 'us7'
    unique_id = "3c7f74d8c8"
    url = "https://#{dc}.api.mailchimp.com/3.0/lists/#{unique_id}/members"
    api_key = "aa68e2ed1a0f1835a20a02742720c81d-us7"

    user_details = {
      email_address: params[:email_address],
      status: "subscribed",
      merge_fields: {
        FNAME: params[:name]
      },
    };

    # Create a new connection using Faraday
    conn = Faraday.new(
      url: url,
      headers: {'Content-Type' => 'application/json',
                'Authorization': "Bearer #{api_key}"}
    )

    response = conn.post() do |req|
      req.body = user_details.to_json
    end

    # Parse the JSON response sent back from the Mailchimp servers
    response_body = JSON.parse(response.body)

    if response.status == 200
      flash[:success] = "Successfully subscribed to email newsletter!"
      redirect_to '/membership'
      # render json: {
      #   status: response.status,
      #   message: "#{user_details[:email_address]} has been added to the mailing list"
      # }
    else
      flash[:danger] = "Oh no, something went wrong. Try again with a different email."
      redirect_to '/membership'
      # render json: {
      #   status: response.status,
      #   message: response_body["details"]
      # }
    end
  end

  # Accept parameters into API
  def mailing_list_params
    params.permit(:name, :email_address)
  end
end