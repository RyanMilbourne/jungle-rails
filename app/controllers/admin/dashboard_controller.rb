class Admin::DashboardController < ApplicationController
  # admin authentication
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def show
    # get all products
    @product = Product.all
    # count all products
    @product_count = @product.count

    # get all categories
    @category = Category.all
    # count all categories
    @category_count = @category.count
  end
end
