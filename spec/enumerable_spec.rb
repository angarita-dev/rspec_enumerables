require './lib/enumerable'
RSpec.describe Enumerable do
  let(:arr_i) {[1,5,76,2,3]}
  let(:arr_s) {['this','is','the','original']}
  describe "#my_each" do
    it ' prints the value in the array + integer' do
      expect { arr_i.my_each{ |x| print x+3 } }.to output('487956').to_stdout
      expect { arr_i.my_each{ |x| print x+0 } }.to output('157623').to_stdout
      expect { arr_i.my_each{ |x| print x+5 } }.to output('6108178').to_stdout
    end
    it ' prints the string in the array + str' do
      expect { arr_s.my_each{ |x| print x+'' } }.to output('thisistheoriginal').to_stdout
      expect { arr_s.my_each{ |x| print x+',' } }.to output('this,is,the,original,').to_stdout
      expect { arr_s.my_each{ |x| print x+'.' } }.to output('this.is.the.original.').to_stdout
    end
  end
  describe "#my_each_with_index" do
    it ' prints the value in the array modified by the index' do
      expect { arr_i.my_each_with_index{ |x,i| print x+i } }.to output('167857').to_stdout
      expect { arr_i.my_each_with_index{ |x,i| print x-i } }.to output('1474-1-1').to_stdout
      expect { arr_i.my_each_with_index{ |x,i| print x*i } }.to output('05152612').to_stdout
    end
    it ' prints the string in the array modified by the index' do
      expect { arr_s.my_each_with_index{ |x,i| i.times{print x} } }.to output('isthetheoriginaloriginaloriginal').to_stdout
      expect { arr_s.my_each_with_index{ |x,i| print i } }.to output('0123').to_stdout
      expect { arr_s.my_each_with_index{ |x,i| print x } }.to output('thisistheoriginal').to_stdout
    end
  end
  describe "#my_select" do
    it ' prints the integer array were specified condition is met' do
      expect( arr_i.my_select{ |x| x%2 != 0 } ).to eql([1,5,3])
      expect( arr_i.my_select{ |x| x%5 == 0 } ).to eql([5])
      expect( arr_i.my_select{ |x| x == 100 } ).to eql([])
    end
    it ' prints the string array were specified condition is met' do
      expect( arr_s.my_select{ |x| x.length > 3 }).to eql(['this','original'])
      expect( arr_s.my_select{ |x| x.length == 2 }).to eql(['is'])
      expect( arr_s.my_select{ |x| x.length > 10 }).to eql([])
    end
  end
  describe "#my_all?" do
    it ' returns true when condition is met with elements in the array' do
      expect( arr_i.my_all?{ |x| x%2 != 0 } ).to eql(false)
      expect( arr_i.my_all?{ |x| x%1 == 0 } ).to eql(true)
      expect( arr_i.my_all?{ |x| x == 100 } ).to eql(false)
    end
    it ' returns true when condition is met with elements in the array' do
      expect( arr_s.my_all?{ |x| x.length >= 2 }).to eql(true)
      expect( arr_s.my_all?{ |x| x.length == 2 }).to eql(false)
      expect( arr_s.my_all?{ |x| x.length > 3 }).to eql(false)
    end
  end
  describe "#my_none?" do
    it ' returns true when none of the condition is met with elements in the array' do
      expect( arr_i.my_none?{ |x| x%2 != 0 } ).to eql(false)
      expect( arr_i.my_none?{ |x| x%1 == 0 } ).to eql(false)
      expect( arr_i.my_none?{ |x| x == 100 } ).to eql(true)
    end
    it ' returns true when  none of thecondition is met with elements in the array' do
      expect( arr_s.my_none?{ |x| x.length >= 2 }).to eql(false)
      expect( arr_s.my_none?{ |x| x.length == 10 }).to eql(true)
      expect( arr_s.my_none?{ |x| x.length > 3 }).to eql(false)
    end
  end
  describe "#my_count" do
    it ' counts using the proc' do
      proc1 = Proc.new { |element|
        element+10 >= 15
      }
      proc2 = Proc.new { |element|
        element%2 == 0
      }
      proc3 = Proc.new { |element|
        element%2 != 0
      }
      expect( arr_i.my_count(proc1) ).to eql(2)
      expect( arr_i.my_count(proc2) ).to eql(2)
      expect( arr_i.my_count(proc3) ).to eql(3)
    end
    it ' counts using the block' do
      expect( arr_i.my_count{ |x| x+10 >= 15} ).to eql(2)
      expect( arr_i.my_count{ |x| x%2 == 0} ).to eql(2)
      expect( arr_i.my_count{ |x| x%2 != 0} ).to eql(3)
    end
    it ' counts with empty block and without proc' do
      expect( arr_i.my_count{} ).to eql(5)
    end
  end
  describe "#my_map" do
    it ' maps through array using the proc' do
      proc1 = Proc.new { |element|
        element+10
      }
      proc2 = Proc.new { |element|
        element/2
      }
      proc3 = Proc.new { |element|
        element+1
      }
      expect( arr_i.my_map(proc1) ).to eql([11,15,86,12,13])
      expect( arr_i.my_map(proc2) ).to eql([0,2,38,1,1])
      expect( arr_i.my_map(proc3) ).to eql([2,6,77,3,4])
    end
    it ' maps through array using the block' do
      expect( arr_i.my_map{ |x| x+10 } ).to eql([11,15,86,12,13])
      expect( arr_i.my_map{ |x| x/2 } ).to eql([0,2,38,1,1])
      expect( arr_i.my_map{ |x| x+1 } ).to eql([2,6,77,3,4])
    end
  end
  describe "#my_inject" do
     it ' injects all elements of array' do
      expect( arr_i.my_inject{ |x,y| x + y } ).to eql(88)
      expect( arr_i.my_inject{ |x,y| x * y } ).to eql(2280)
      expect( arr_i.my_inject{ |x,y| x - y } ).to eql(-86)
    end
  end
  describe "#multiply_els" do
    it ' returns the product of array elements using inject method' do
     expect( arr_i.multiply_els ).to eql(2280)
   end
 end
end