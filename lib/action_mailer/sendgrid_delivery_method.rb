require "sendgrid-ruby"
include SendGrid

module ActionMailer
  class SendgridDeliveryMethod
    def initialize(options = {})
      @api_key = options[:api_key] || ENV["SENDER_API_KEY"]
    end

    def deliver!(mail)
      from = Email.new(email: mail.from.first)
      to = Email.new(email: mail.to.first)
      content = Content.new(type: "text/html", value: mail.body.decoded)
      subject = mail.subject

      sg_mail = Mail.new(from, subject, to, content)
      sg = SendGrid::API.new(api_key: @api_key)
      response = sg.client.mail._("send").post(request_body: sg_mail.to_json)

      Rails.logger.info "SendGrid API response: #{response.status_code}"
      response
    end
  end
end
