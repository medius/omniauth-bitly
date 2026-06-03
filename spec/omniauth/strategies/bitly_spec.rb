require 'spec_helper'
require 'debug'

describe OmniAuth::Strategies::Bitly do
  subject do
    OmniAuth::Strategies::Bitly.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('bitly')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api-ssl.bitly.com/')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://bitly.com/oauth/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('https://api-ssl.bitly.com/oauth/access_token')
    end
  end
end
