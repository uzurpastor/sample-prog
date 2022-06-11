class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com",
          template_path: 'mailers'
          
  layout "mailers/layouts/mailer"
end
