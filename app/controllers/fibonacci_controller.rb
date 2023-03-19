class FibonacciController < ApplicationController
  def fib
    n = params[:n].to_i

    response = { n: n, fib: calculate_fibonacci(n) }
    render json: response
  end

  private

  def calculate_fibonacci(n)
    return 0 if n == 0
    return 1 if n == 1

    before_last_num = 0
    last_num = 1
    fib_num = 0

    (2..n).each do |i|
      fib_num = last_num + before_last_num
      before_last_num = last_num
      last_num = fib_num
    end

    return fib_num
  end
end
