require "net/http"
require "uri"

module Spree::CheckoutControllerDecorator
  def self.prepended(base)
    base.before_action :get_zip_code
    base.before_action :permit_inpost_machine
  end


  def permit_inpost_machine
    Spree::PermittedAttributes.checkout_attributes << :inpost_machine
  end


  private



  def get_zip_code
    if params[:state].present? && params[:state] == "delivery"
      @zipcode = @order.bill_address.zipcode     
    end
  end
end

if ::Spree::CheckoutController.included_modules.exclude?(Spree::CheckoutControllerDecorator)
  ::Spree::CheckoutController.prepend Spree::CheckoutControllerDecorator
end