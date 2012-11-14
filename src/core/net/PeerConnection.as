package core.net 
{
	import com.reyco1.multiuser.data.MessageObject;
	import com.reyco1.multiuser.data.UserObject;
	import com.reyco1.multiuser.events.ChatMessageEvent;
	import com.reyco1.multiuser.MultiUserSession;
	import core.game.GameProcessor;
	import core.net.events.ConnectionActivityEvent;
	import core.net.model.DataModel;
	import core.net.model.PeerConnectionConstants;
	import core.net.model.UserModel;
	import core.services.ServicesLocator;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.NetDataEvent;
	import patterns.events.ReycoP2PEventsSolver;
	/**
	 * ...
	 * @author Nikro
	 */
	public class PeerConnection extends EventDispatcher implements IConnection 
	{
		private var session:String;
		private var connection:MultiUserSession;
		private var reycoConnectionEventSolver:ReycoP2PEventsSolver;
		
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
			reycoConnectionEventSolver = new ReycoP2PEventsSolver();
			
			connection = new MultiUserSession(PeerConnectionConstants.SERV_KEY, session);
			connection.p2pEventBubblFunction = bubbleEvents;
			connection.onObjectRecieve = handleObjectRecive;
			
			connection.connect('Лещь' + String.fromCharCode(int(100+Math.random() * 100))+ int(Math.random() * 100));
		}
		
		private function handleObjectRecive(peerID:String, object:Object):void
		{
			//Status.instance.addMessage('handl object recive', peerID, object);
			var data:DataModel = object as DataModel;
			data.sender = new UserModel(peerID, '');
			dispatchEvent(new ConnectionActivityEvent(ConnectionActivityEvent.CONENCTION_ACTIVITY, data));
		}
		
		public function sendChatMessage(message:String):void
		{
			
			connection.sendChatMessage(message);
		}
		
		/* INTERFACE core.net.IConnection */
		
		public function sendData(data:Object):void 
		{
			//Status.instance.addMessage('send data', data);
			connection.sendObject(data);
		}
		
		private function bubbleEvents(e:Event):void 
		{
			var data:DataModel = reycoConnectionEventSolver.eventSolverFunction(e);
			
			dispatchEvent(new ConnectionActivityEvent(ConnectionActivityEvent.CONENCTION_ACTIVITY, data));
		}
		
		
		
	}

}