class UserMailerPreview < ActionMailer::Preview
   def thankyou_email
     UserMailer.thankyou_email(User.last, Order.last)
   end
  end