package core.net 
{
	import com.reyco1.multiuser.data.MessageObject;
	import com.reyco1.multiuser.data.UserObject;
	import com.reyco1.multiuser.events.ChatMessageEvent;
	import com.reyco1.multiuser.MultiUserSession;
	import core.net.model.PeerConnectionConstants;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Nikro
	 */
	public class PeerConnection extends EventDispatcher implements IConnection 
	{
		private var session:String;
		
		/**
		 * @param	session "multiuser/test12341"
		 */
		public function PeerConnection(session:String) 
		{
			super();
			this.session = session;
			
			initilize();
		}
		
		private function initilize():void 
		{
			var connection:MultiUserSession = new MultiUserSession(PeerConnectionConstants.SERV_KEY, session);
			connection.p2pEventBubblFunction = bubbleEvents;
			
			connection.connect('test'+Math.random());
		}
		
		private function bubbleEvents(e:Event):void 
		{
			trace(e);
			dispatchEvent(e);
		}
		
		
		
	}

}