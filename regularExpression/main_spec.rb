# main_spec.rb
require 'rspec'

RSpec.describe 'Regular Expression for C++ Integer Literal' do
  let(:decimal) { /[1-9][0-9]*('?[0-9]+)*/ }   # Must start with non-zero
  let(:octal) { /0[0-7]*('?[0-7]+)*/ }         # Starts with 0, followed by octal digits
  let(:hexadecimal) { /0[xX][0-9A-Fa-f]+('?[0-9A-Fa-f]+)*/ } # 0x or 0X followed by hex digits
  let(:binary) { /0[bB][01]+('?[01]+)*/ }       # 0b or 0B followed by binary digits
  
  # Suffix pattern for C++ integer literals, without the `z`/`Z` size suffix
  let(:unsigned_suffix) { /[uU]?/ }
  let(:long_suffix) { /[lL]{0,2}/ }
  let(:integer_suffix) { /#{unsigned_suffix}#{long_suffix}/ }

  # Combined pattern for the full C++ integer literal
  let(:pattern) { /^-?(#{decimal}|#{octal}|#{hexadecimal}|#{binary})#{integer_suffix}$/ }

  # Test cases
  let(:should_pass) { ["1", "0", "0x2A", "0b101010", "1ul", "0XDeadBEEF", "0b10", "123'456'789", "042", "1234567890uLL", "0b101010ull", "1LL", "0x12'34'56'78ull", "1uL"] }
  let(:should_fail) { ["'1'", "1'''3", "0x", "0b", "afed", "+33", "ul", "lll", "0b102", "0xGHI", "1ULZ", "3uuu", "123LLL", "0UZ"] }

  describe 'should pass' do
    it 'matches all expected strings' do
      should_pass.each do |str|
        expect(str).to match(pattern)
      end
    end
  end

  describe 'should fail' do
    it 'does not match any of the strings' do
      should_fail.each do |str|
        expect(str).not_to match(pattern)
      end
    end
  end
end
