class FibonacciController < ApplicationController
  def fib
    n = params[:n].to_i

    unless valid_parameter?(n)
      render json: { error: "Invalid parameter: n must be a non-negative half-width integer" }, status: :bad_request
      return
    end

    fib = fibonacci(n)

    response = { n: n, fib: fib }
    render json: response
  end

  private

  def valid_parameter?(n)
    n.is_a?(Integer) && n >= 0 && n.to_s.match?(/\A[0-9]+\z/)
  end

  def fibonacci(n)
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

    fib_num
  end
end
