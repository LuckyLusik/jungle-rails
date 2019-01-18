class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def thankyou_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Your order# #{@order.id} is successfully placed")
  end


end
