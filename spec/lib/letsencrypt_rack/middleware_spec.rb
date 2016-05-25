require 'spec_helper'

describe LetsencryptRack::Middleware do
  let(:middleware) { described_class.new(->(env) { [200, {}, [:app_content]] }) }
  let(:env) { { 'REQUEST_PATH' => '/.well-known/acme-challenge/foo' } }
  let(:result) { middleware.call(env).last.last }

  before { ENV['LETSENCRYPT_RESPONSE'] = 'foo.bar' }

  describe '#call' do
    it 'calls through if not challenge path' do
      env['REQUEST_PATH'] = 'something'
      expect(result).to eq :app_content
    end

    it 'shows error if challenge is empty' do
      env['REQUEST_PATH'] = '/.well-known/acme-challenge/'
      expect(result).to eq 'Challenge failed - Empty challenge request'
    end

    it 'shows error if response is empty' do
      ENV['LETSENCRYPT_RESPONSE'] = nil
      expect(result).to eq 'Challenge failed - No LETSENCRYPT_RESPONSE found in env'
    end

    it 'shows error if challenge does not match response' do
      ENV['LETSENCRYPT_RESPONSE'] = 'baz.baz'
      expect(result).to eq 'Challenge failed - The challenge did not match LETSENCRYPT_RESPONSE'
    end

    it 'returns response if challenge is correct' do
      expect(result).to eq 'foo.bar'
    end
  end
end
