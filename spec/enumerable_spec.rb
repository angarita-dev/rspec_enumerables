
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
    it ' prints the value in the array + integer' do
      arr = [1,5,76,2,3]
      expect { arr.my_each_with_index{ |x,i| print x+i } }.to output('167857').to_stdout
      expect { arr.my_each_with_index{ |x,i| print x-i } }.to output('1474-1-1').to_stdout
      expect { arr.my_each_with_index{ |x,i| print x*i } }.to output('05152612').to_stdout
    end
    it ' prints the string in the array + str' do
      arr = ['this','is','the','original']
      expect { arr.my_each_with_index{ |x,i| i.times{print x} } }.to output('isthetheoriginaloriginaloriginal').to_stdout
      expect { arr.my_each_with_index{ |x,i| print i } }.to output('0123').to_stdout
      expect { arr.my_each_with_index{ |x,i| print x } }.to output('thisistheoriginal').to_stdout
    end
  end
end