require './lib/validate_ssn';

describe ValidateSSN do
    describe ".validate" do
        
    it "SSN should be valid" do
        validateSSN = ValidateSSN.new
        expect(validateSSN.validate("970409-3914")).to eq(true)
    end
    it "SSN should be invalid" do
        validateSSN = ValidateSSN.new 
        expect(validateSSN.validate("970409-39144")).to eq(false)
    end
end
end