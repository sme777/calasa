class MembershipsController < ApplicationController


  def index
  end

  def success
  end

  def error
  end

  def addUser
    # Setup the keys needed to access Mailchimp's API
    url = "https://#{Rails.application.credentials[:MAILCHIMP_DC]}.api.mailchimp.com/3.0/lists/#{Rails.application.credentials[:MAILCHIMP_UNIQUE_ID]}/members"
    "https://us7.api.mailchimp.com/3.0/lists/3c7f74d8c8/members"
    api_key = Rails.application.credentials[:MAILCHIMP_API_KEY]

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
    else
      flash[:danger] = "Oh no, something went wrong. Try again with a different email."
      redirect_to '/membership'
    end
  end

  # Accept parameters into API
  def mailing_list_params
    params.permit(:name, :email_address)
  end
end
