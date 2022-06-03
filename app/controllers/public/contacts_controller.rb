class Public::ContactsController < ApplicationController
  def new
    @Contact = Contact.new
    @date = Date.current.strftime('%Y年 %m月 %d日')
  end

  def index
  end

  def show
  end
end
