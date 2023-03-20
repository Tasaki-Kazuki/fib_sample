require 'rails_helper'

RSpec.describe FibonacciController, type: :request do
  describe 'GET fib' do
    context 'nが有効な値のとき' do
      context 'nが0のとき' do
        let(:n) { '0' }
        it 'nに対応したフィボナッチ数を返す' do
          get fib_path, params: { n: n }
          expect(response).to have_http_status(:ok)

          json_response = JSON.parse(response.body)
          expect(json_response['fib']).to eq(0)
        end
      end

      context 'nが1のとき' do
        let(:n) { '1' }
        it 'nに対応したフィボナッチ数を返す' do
          get fib_path, params: { n: n }
          expect(response).to have_http_status(:ok)

          json_response = JSON.parse(response.body)
          expect(json_response['fib']).to eq(1)
        end
      end

      context 'nが100のとき' do
        let(:n) { '100' }
        it 'nに対応したフィボナッチ数を返す' do
          get fib_path, params: { n: n }
          expect(response).to have_http_status(:ok)

          json_response = JSON.parse(response.body)
          expect(json_response['fib']).to eq(354224848179261915075)
          # 100番目のフィボナッチ数が正しいことはhttps://miniwebtool.com/ja/list-of-fibonacci-numbers/?number=101　こちらで検証した
        end
      end
    end

    context 'nが無効な値のとき' do
      context "nがnilのとき" do
        it " bad_request responseを返す" do
          get fib_path, params: { n: nil }
          expect(response).to have_http_status(:bad_request)
        end
      end
  
      context "when n is less than 0" do
        it "bad_request responseを返す" do
          get fib_path, params: { n: "-1" }
          expect(response).to have_http_status(:bad_request)
        end
      end
  
      context "when n is not an integer" do
        it "bad_request responseを返す" do
          get fib_path, params: { n: "1.5" }
          expect(response).to have_http_status(:bad_request)
        end
      end
    end
  end

  describe "#valid_parameter?" do
    it "引数がnilのときにfalseを返す" do
      expect(FibonacciController.new.send(:valid_parameter?, nil)).to eq(false)
    end

    it "引数が文字列のときにfalseを返す" do
      expect(FibonacciController.new.send(:valid_parameter?, 'hoge')).to eq(false)
    end

    it "引数が整数以外の数の場合にfalseを返す" do
      expect(FibonacciController.new.send(:valid_parameter?, 1.5)).to eq(false)
    end

    it "引数が負の整数の場合にfalseを返す" do
      expect(FibonacciController.new.send(:valid_parameter?, -1)).to eq(false)
    end

    it "引数が正の整数の場合にtrueを返す" do
      expect(FibonacciController.new.send(:valid_parameter?, 10)).to eq(true)
    end
  end
end