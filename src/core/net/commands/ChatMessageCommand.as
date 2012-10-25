package core.net.commands 
{
	import core.net.model.ChatCommandModel;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class ChatMessageCommand extends AbstractNetCommand 
	{
		
		public function ChatMessageCommand() 
		{
			super();
			
		}
		
		public function execute(data:ChatCommandModel):void 
		{
			Status.instance.addMessage('['+new Date().hours+':'+new Date().minutes+']'+ ' ' + data.sender.name, 'сказал: ' + striptKey(data.message));
		}
		
		private function striptKey(str:String):String
		{
			return str.substr(10);
		}
	}

}