class ScriptInvokerInstance
  def initialize(context)  
    @scriptPrefix = "./"
    @scriptSuffix = ".sh"
    if RUBY_PLATFORM =~ /(win|w)32/
      @scriptPrefix = ""
      @scriptSuffix = ".bat"
    end
  end  
  
  def HelloWorld(transaction, args)  
    script = @scriptPrefix + "hello_world" + @scriptSuffix
    rd = ""
    IO.popen(script, "r") do |f|
      while x = f.gets
        rd = rd + x
      end
    end
    transaction.complete(rd)  
  end  
end  
  
rubyCoreletDefinition = {  
  'class' => "ScriptInvokerInstance",  
  'name' => "ScriptInvoker",  
  'major_version' => 0,  
  'minor_version' => 0,  
  'micro_version' => 1,  
  'documentation' => 'A GREAT service.',  
  'functions' =>  
  [  
   {  
      'name' => 'HelloWorld',  
      'documentation' => "Say \"hello\" to the world (by invoking a script)",
      'arguments' => [ ]
   }    
  ]   
} 
