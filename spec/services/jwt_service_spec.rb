require 'rails_helper'

describe JwtService do
  subject(&method(:described_class))

  let(:payload) { { name: 'Jan' } }
  let(:token) do
    'eyJhbGciOiJIUzI1NiJ9.' \
    'eyJuYW1lIjoiSmFuIn0.' \
    'Gh1sORbUMGNIB4wuc2X1-2QhQMlAt2EauXW3mjGRP2c'
  end

  describe '.encode' do
    it 'should calculate correct token' do
      expect(subject.encode(payload)).to eq(token)
    end
  end

  describe '.decode' do
    it 'should calculate correct payload' do
      expect(subject.decode(token).symbolize_keys).to eq(payload)
    end
  end
end