class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_email(order, user)
    @order = order
    @user = user
    mail(to: @user.email, subject: 'Order has been placed!')
  end

end
