#  Task3: 

* First Terminal:
```
class Apple

  attr_reader :variety, :origin, :history
  
  def initialize(**args)
  
    @variety = args[:variety]
    
    @origin = args[:origin]
    
    @history = args[:history]
    
  end
  
end

apple = Apple.new(variety: 'Honeycrisp', origin: 'Minnesota', history: 'Introduction to Market: 1991')

File.write "apple_store", Marshal.dump(apple)
```

* Second Terminal:
```
class Apple

  attr_reader :variety, :origin, :history
  
  def initialize(**args)
  
    @variety = args[:variety]
    
    @origin = args[:origin]
    
    @history = args[:history]
    
  end
  
end

apple = Marshal.load File.read('apple_store')
```
