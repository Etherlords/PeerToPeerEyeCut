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
			Status.instance.addMessage(e.message.user, 'сказал: ' + e.message.text);
		}
	}

}