class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://jungle.com/login'
    mail(to: @user.email, subject: 'Welcome to Jungle')
  end

  def order_receipt_email(order, line_items) 
    @order = order
    @line_items = line_items
    mail(to: @order.email, subject: "Confirmation for Order##{order.id}")
  end
end