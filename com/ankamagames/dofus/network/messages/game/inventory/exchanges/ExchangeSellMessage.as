﻿package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class ExchangeSellMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var objectToSellId:uint = 0;
        public var quantity:uint = 0;
        public static const protocolId:uint = 5778;

        public function ExchangeSellMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 5778;
        }// end function

        public function initExchangeSellMessage(param1:uint = 0, param2:uint = 0) : ExchangeSellMessage
        {
            this.objectToSellId = param1;
            this.quantity = param2;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.objectToSellId = 0;
            this.quantity = 0;
            this._isInitialized = false;
            return;
        }// end function

        override public function pack(param1:IDataOutput) : void
        {
            var _loc_2:* = new ByteArray();
            this.serialize(_loc_2);
            writePacket(param1, this.getMessageId(), _loc_2);
            return;
        }// end function

        override public function unpack(param1:IDataInput, param2:uint) : void
        {
            this.deserialize(param1);
            return;
        }// end function

        public function serialize(param1:IDataOutput) : void
        {
            this.serializeAs_ExchangeSellMessage(param1);
            return;
        }// end function

        public function serializeAs_ExchangeSellMessage(param1:IDataOutput) : void
        {
            if (this.objectToSellId < 0)
            {
                throw new Error("Forbidden value (" + this.objectToSellId + ") on element objectToSellId.");
            }
            param1.writeInt(this.objectToSellId);
            if (this.quantity < 0)
            {
                throw new Error("Forbidden value (" + this.quantity + ") on element quantity.");
            }
            param1.writeInt(this.quantity);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_ExchangeSellMessage(param1);
            return;
        }// end function

        public function deserializeAs_ExchangeSellMessage(param1:IDataInput) : void
        {
            this.objectToSellId = param1.readInt();
            if (this.objectToSellId < 0)
            {
                throw new Error("Forbidden value (" + this.objectToSellId + ") on element of ExchangeSellMessage.objectToSellId.");
            }
            this.quantity = param1.readInt();
            if (this.quantity < 0)
            {
                throw new Error("Forbidden value (" + this.quantity + ") on element of ExchangeSellMessage.quantity.");
            }
            return;
        }// end function

    }
}