class ScriptInvokerInstance
  def initialize(context)  
  end  
  
  def HelloWorld(transaction, args)  
    rd = ""
    IO.popen("./hello_world.sh", "r") do |f|
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
