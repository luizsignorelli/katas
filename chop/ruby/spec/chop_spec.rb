require 'rspec'

def chop(element_to_find, list)
  return -1 if list.empty?

  chop_index = list.size / 2
  index_complement = 0
  begin
    if list[chop_index] > element_to_find
      list = list[0...chop_index]
    else
      list = list[chop_index..list.size]
      index_complement += chop_index
    end

    chop_index = list.size / 2
    return chop_index + index_complement if list[chop_index] == element_to_find
  end while chop_index > 0

  return -1
end

describe "chop" do
  it "searches for the element on the array" do
    expect( chop(1,[]) ).to eq -1
    expect( chop(1,[2]) ).to eq -1
    expect( chop(1,[1]) ).to eq 0
    expect( chop(2,[1,2]) ).to eq 1
    expect( chop(1,[1,2,4]) ).to eq 0

    expect( chop(1, [1, 3, 5])).to eq 0

    expect( chop(3, [1, 3, 5])).to eq 1
    expect( chop(5, [1, 3, 5])).to eq 2

    expect( chop(0, [1, 3, 5])).to eq -1
    expect( chop(2, [1, 3, 5])).to eq -1
    expect( chop(4, [1, 3, 5])).to eq -1
    expect( chop(6, [1, 3, 5])).to eq -1
    # #
    expect( chop(1, [1, 3, 5, 7])).to eq 0
    expect( chop(3, [1, 3, 5, 7])).to eq 1
    expect( chop(5, [1, 3, 5, 7])).to eq 2
    expect( chop(7, [1, 3, 5, 7])).to eq 3
    expect( chop(0, [1, 3, 5, 7])).to eq -1
    expect( chop(2, [1, 3, 5, 7])).to eq -1
    expect( chop(4, [1, 3, 5, 7])).to eq -1
    expect( chop(6, [1, 3, 5, 7])).to eq -1
    expect( chop(8, [1, 3, 5, 7])).to eq -1
  end

end
