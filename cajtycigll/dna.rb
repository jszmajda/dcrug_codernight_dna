class DNAController
    def initialize
        @library = {
            '0' => 'ATAT',
            '1' => 'ATTA',
            '2' => 'TATA',
            '3' => 'TAAT',
            '4' => 'ATCG',
            '5' => 'ATGC',
            '6' => 'TACG',
            '7' => 'TAGC',
            '8' => 'GCTA',
            '9' => 'GCAT'
        }
    end

    def encode(string)
        arr = []

        string.each_byte do |c|
            arr.push(c)
        end
        arr.collect! { |x| (x-32).to_s }
        i = 0
        while i < arr.length
            if arr[i].length == 1
                arr[i] = "0" << arr[i]
            end
            i+=1
        end
        string = ''
        i = 0
        while i < arr.length
            string << @library[arr[i][0]]
            string << @library[arr[i][1]]
            i+=1
        end
        string
    end

    def decode(string)
        arr = []
        i = 0
        while i < string.length
            arr.push(@library.key(string[i, 4]))
            i+=4
        end

        newArr = []
        i = 0
        while i < arr.length
            string = ''
            string << arr[i]
            string << arr[i+1]
            string = (string.to_i)+32
            newArr.push(string.chr)
            i+=2
        end
        newArr.join.to_s
    end
end

DNA = DNAController.new
string = DNA.encode('hello there')
puts DNA.decode(string)
