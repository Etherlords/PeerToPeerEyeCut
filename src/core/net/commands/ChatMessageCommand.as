package core.net.commands 
{
	import com.reyco1.multiuser.events.ChatMessageEvent;
	
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
		
		public function execute(e:ChatMessageEvent):void 
		{
			Status.instance.addMessage('['+new Date().hours+':'+new Date().minutes+']'+ ' ' + e.message.user, 'сказал: ' + striptKey(e.message.text));
		}
		
		private function striptKey(str:String):String
		{
			return str.substr(10);
		}
	}

}