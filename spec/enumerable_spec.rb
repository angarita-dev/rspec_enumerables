
require './lib/enumerable'
RSpec.describe Enumerable do
  describe "#my_each" do
    it ' prints the value in the array + integer' do
      arr = [1,5,76,2,3]
      expect { arr.my_each{ |x| print x+3 } }.to output('487956').to_stdout
      expect { arr.my_each{ |x| print x+0 } }.to output('157623').to_stdout
      expect { arr.my_each{ |x| print x+5 } }.to output('6108178').to_stdout
    end
    it ' prints the string in the array + str' do
      arr = ['this','is','the','original']
      expect { arr.my_each{ |x| print x+'' } }.to output('thisistheoriginal').to_stdout
      expect { arr.my_each{ |x| print x<<',' } }.to output('this,is,the,original,').to_stdout
      expect { arr.my_each{ |x| print x+'.' } }.to output('this,.is,.the,.original,.').to_stdout
    end
  end
  describe "#my_each_with_index" do
    it ' prints the value in the array modified by the index' do
      arr = [1,5,76,2,3]
      expect { arr.my_each_with_index{ |x,i| print x+i } }.to output('167857').to_stdout
      expect { arr.my_each_with_index{ |x,i| print x-i } }.to output('1474-1-1').to_stdout
      expect { arr.my_each_with_index{ |x,i| print x*i } }.to output('05152612').to_stdout
    end
    it ' prints the string in the array modified by the index' do
      arr = ['this','is','the','original']
      expect { arr.my_each_with_index{ |x,i| i.times{print x} } }.to output('isthetheoriginaloriginaloriginal').to_stdout
      expect { arr.my_each_with_index{ |x,i| print i } }.to output('0123').to_stdout
      expect { arr.my_each_with_index{ |x,i| print x } }.to output('thisistheoriginal').to_stdout
    end
  end
  describe "#my_select" do
    it ' prints the integer array were specified condition is met' do
      arr = [1,5,76,2,3]
      expect( arr.my_select{ |x| x%2 != 0 } ).to eql([1,5,3])
      expect( arr.my_select{ |x| x%5 == 0 } ).to eql([5])
      expect( arr.my_select{ |x| x == 100 } ).to eql([])
    end
    it ' prints the string array were specified condition is met' do
      arr = ['this','is','the','original']
      expect( arr.my_select{ |x| x.length > 3 }).to eql(['this','original'])
      expect( arr.my_select{ |x| x.length == 2 }).to eql(['is'])
      expect( arr.my_select{ |x| x.length > 10 }).to eql([])
    end
  end
  describe "#my_all?" do
    it ' returns true when condition is met with elements in the array' do
      arr = [1,5,76,2,3]
      expect( arr.my_all?{ |x| x%2 != 0 } ).to eql(false)
      expect( arr.my_all?{ |x| x%1 == 0 } ).to eql(true)
      expect( arr.my_all?{ |x| x == 100 } ).to eql(false)
    end
    it ' returns true when condition is met with elements in the array' do
      arr = ['this','is','the','original']
      expect( arr.my_all?{ |x| x.length >= 2 }).to eql(true)
      expect( arr.my_all?{ |x| x.length == 2 }).to eql(false)
      expect( arr.my_all?{ |x| x.length > 3 }).to eql(false)
    end
  end
  describe "#my_none?" do
    it ' returns true when none of the condition is met with elements in the array' do
      arr = [1,5,76,2,3]
      expect( arr.my_none?{ |x| x%2 != 0 } ).to eql(false)
      expect( arr.my_none?{ |x| x%1 == 0 } ).to eql(false)
      expect( arr.my_none?{ |x| x == 100 } ).to eql(true)
    end
    it ' returns true when  none of thecondition is met with elements in the array' do
      arr = ['this','is','the','original']
      expect( arr.my_none?{ |x| x.length >= 2 }).to eql(false)
      expect( arr.my_none?{ |x| x.length == 10 }).to eql(true)
      expect( arr.my_none?{ |x| x.length > 3 }).to eql(false)
    end
  end
end