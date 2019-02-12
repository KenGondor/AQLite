package net.spider.modules{
	
    import fl.motion.Color;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.system.*;
	import flash.ui.*;
	import flash.utils.*;
    import net.spider.main;
    import net.spider.handlers.*;
    import net.spider.modules.*;
	
	public class options extends MovieClip{

        public static var events:EventDispatcher = new EventDispatcher();

        private var optTimer:Timer;
        
        public static var cDrops:Boolean;
        public static var sbpcDrops:Boolean;
        public static var draggable:Boolean;
        public static var detaildrop:Boolean;
        public static var mType:Boolean;
        public static var qRates:Boolean;
        public static var qPrev:Boolean;
        public static var detailquest:Boolean;
        public static var qLog:Boolean;

        public static var disableSkillAnim:Boolean;
        public static var skill:Boolean;
        public static var passive:Boolean;
        public static var boost:Boolean;
        public static var untargetMon:Boolean;
        public static var selfTarget:Boolean;

        public static var hideP:Boolean;
        public static var disWepAnim:Boolean;

        public static var chatFilter:Boolean;

        public function options():void{
            this.visible = false;
            options.events.addEventListener(ClientEvent.onEnable, readSettings);

            this.gotoAndStop("general");
            btnGeneral.gotoAndStop(2);
            btnCombat.gotoAndStop(1);
            btnGraphics.gotoAndStop(1);
            btnMisc.gotoAndStop(1);

            btnGeneral.addEventListener(MouseEvent.CLICK, onCategoryClick, false, 0, true);
            btnGeneral.gotoAndStop(2);
            btnGeneral.buttonMode = true;
            setup("btnGeneral");
            btnCombat.addEventListener(MouseEvent.CLICK, onCategoryClick, false, 0, true);
            btnCombat.buttonMode = true;
            btnGraphics.addEventListener(MouseEvent.CLICK, onCategoryClick, false, 0, true);
            btnGraphics.buttonMode = true;
            btnMisc.addEventListener(MouseEvent.CLICK, onCategoryClick, false, 0, true);
            btnMisc.buttonMode = true;

            this.btnClose.addEventListener(MouseEvent.CLICK, onClose, false, 0, true);

            optTimer = new Timer(0);
			optTimer.addEventListener(TimerEvent.TIMER, onTimer);
            optTimer.start();
        }

        public function readSettings(e:ClientEvent):void{
            if(main.sharedObject.data.filterChecks == null)
                main.sharedObject.data.filterChecks = new Object();
            if(main.sharedObject.data.filterChecks["chkRed"] == null){
                main.sharedObject.data.filterChecks["chkRed"] = true;
                main.sharedObject.flush();
            }
            filterChecks["chkRed"] = main.sharedObject.data.filterChecks["chkRed"];
            if(main.sharedObject.data.filterChecks["chkBlue"] == null){
                main.sharedObject.data.filterChecks["chkBlue"] = false;
                main.sharedObject.flush();
            }
            filterChecks["chkBlue"] = main.sharedObject.data.filterChecks["chkBlue"];
            if(main.sharedObject.data.filterChecks["chkName"] == null){
                main.sharedObject.data.filterChecks["chkName"] = false;
                main.sharedObject.flush();
            }
            filterChecks["chkName"] = main.sharedObject.data.filterChecks["chkName"];
            if(main.sharedObject.data.filterChecks["chkSelfOnly"] == null){
                main.sharedObject.data.filterChecks["chkSelfOnly"] = true;
                main.sharedObject.flush();
            }
            filterChecks["chkSelfOnly"] = main.sharedObject.data.filterChecks["chkSelfOnly"];
            if(main.sharedObject.data.filterChecks["chkDisWepAnim"] == null){
                main.sharedObject.data.filterChecks["chkDisWepAnim"] = false;
                main.sharedObject.flush();
            }
            filterChecks["chkDisWepAnim"] = main.sharedObject.data.filterChecks["chkDisWepAnim"];
            cDrops = main.sharedObject.data.cDrops;
            if(cDrops)
                dispatch(dropmenu);

            sbpcDrops = main.sharedObject.data.sbpcDrops;
            if(sbpcDrops)
                dispatch(dropmenutwo);

            draggable = main.sharedObject.data.draggable;
            if(draggable)
                dispatch(drops);

            detaildrop = main.sharedObject.data.detaildrop;
            if(detaildrop)
                dispatch(detaildrops);

            mType = main.sharedObject.data.mType;
            if(mType)
                dispatch(monstype);

            qRates = main.sharedObject.data.qRates;
            if(qRates)
                dispatch(qrates);

            qPrev = main.sharedObject.data.qPrev;
            if(qPrev)
                dispatch(qprev);

            detailquest = main.sharedObject.data.detailquest;
            if(detailquest)
                dispatch(detailquests);

            qLog = main.sharedObject.data.qLog;
            if(qLog)
                dispatch(qlog);

            disableSkillAnim = main.sharedObject.data.disableSkillAnim;
            if(disableSkillAnim)
                dispatch(skillanim);

            skill = main.sharedObject.data.skill;
            if(skill){
                dispatch(skills);
                dispatch(targetskills);
            }

            passive = main.sharedObject.data.passive;
            if(passive)
                dispatch(passives);

            boost = main.sharedObject.data.boost;
            if(boost)
                dispatch(boosts);

            untargetMon = main.sharedObject.data.untargetMon;
            if(untargetMon)
                dispatch(untarget);

            selfTarget = main.sharedObject.data.selfTarget;
            if(selfTarget)
                dispatch(untargetself);

            hideP = main.sharedObject.data.hideP;
            if(hideP)
                dispatch(hideplayers);

            disWepAnim = main.sharedObject.data.disWepAnim;
            if(disWepAnim)
                dispatch(diswepanim);

            chatFilter = main.sharedObject.data.chatFilter;
            if(chatFilter)
                dispatch(chatfilter);

            setup("btnGeneral");
        }

        private function onCategoryClick(e:MouseEvent):void
        {
            btnGeneral.gotoAndStop(1);
            btnCombat.gotoAndStop(1);
            btnGraphics.gotoAndStop(1);
            btnMisc.gotoAndStop(1);
            e.currentTarget.gotoAndStop(2);
            switch (e.currentTarget.name)
            {
                case "btnGeneral":
                    if (this.currentLabel != "general")
                        this.gotoAndStop("general");
                    break;
                case "btnCombat":
                    if (this.currentLabel != "combat")
                        this.gotoAndStop("combat");
                    break;
                case "btnGraphics":
                    if (this.currentLabel != "graphics")
                        this.gotoAndStop("graphics");
                    break;
                case "btnMisc":
                    if (this.currentLabel != "misc")
                        this.gotoAndStop("misc");
                    break;
                default:
                    break;
            }
            setup(e.currentTarget.name);
        }

        private function setup(e:String):void{
            switch(e){
                case "btnGeneral":
                    this.txtCDrops.text = (cDrops ? "ON" : "OFF");
                    this.txtSBPCDrops.text = (sbpcDrops ? "ON" : "OFF");
                    this.txtDraggable.text = (draggable ? "ON" : "OFF");
                    this.txtDetailDrop.text = (detaildrop ? "ON" : "OFF");
                    this.txtMType.text = (mType ? "ON" : "OFF");
                    this.txtQRates.text = (qRates ? "ON" : "OFF");
                    this.txtQPrev.text = (qPrev ? "ON" : "OFF");
                    this.txtDetailQuest.text = (detailquest ? "ON" : "OFF");
                    this.txtQLog.text = (qLog ? "ON" : "OFF");
                    if(this.btnLeftCDrops.hasEventListener(MouseEvent.CLICK))
                        return;
                    this.btnLeftCDrops.addEventListener(MouseEvent.CLICK, onCDrops, false, 0, true);
                    this.btnRightCDrops.addEventListener(MouseEvent.CLICK, onCDrops, false, 0, true);
                    this.btnLeftSBPCDrops.addEventListener(MouseEvent.CLICK, onSBPCDrops, false, 0, true);
                    this.btnRightSBPCDrops.addEventListener(MouseEvent.CLICK, onSBPCDrops, false, 0, true);
                    this.btnLeftDraggable.addEventListener(MouseEvent.CLICK, onDraggable, false, 0, true);
                    this.btnRightDraggable.addEventListener(MouseEvent.CLICK, onDraggable, false, 0, true);
                    this.btnLeftDetailDrop.addEventListener(MouseEvent.CLICK, onDetailDrop, false, 0, true);
                    this.btnRightDetailDrop.addEventListener(MouseEvent.CLICK, onDetailDrop, false, 0, true);
                    this.btnLeftMType.addEventListener(MouseEvent.CLICK, onMType, false, 0, true);
                    this.btnRightMType.addEventListener(MouseEvent.CLICK, onMType, false, 0, true);
                    this.btnLeftQRates.addEventListener(MouseEvent.CLICK, onQRates, false, 0, true);
                    this.btnRightQRates.addEventListener(MouseEvent.CLICK, onQRates, false, 0, true);
                    this.btnLeftQPrev.addEventListener(MouseEvent.CLICK, onQPrev, false, 0, true);
                    this.btnRightQPrev.addEventListener(MouseEvent.CLICK, onQPrev, false, 0, true);
                    this.btnLeftDetailQuest.addEventListener(MouseEvent.CLICK, onDetailQuest, false, 0, true);
                    this.btnRightDetailQuest.addEventListener(MouseEvent.CLICK, onDetailQuest, false, 0, true);
                    this.btnLeftQLog.addEventListener(MouseEvent.CLICK, onQLog, false, 0, true);
                    this.btnRightQLog.addEventListener(MouseEvent.CLICK, onQLog, false, 0, true);
                    break;
                case "btnCombat":
                    this.chkSelfOnly.checkmark.visible = filterChecks["chkSelfOnly"];
                    this.txtSkillAnim.text = (disableSkillAnim ? "ON" : "OFF");
                    this.txtSkill.text = (skill ? "ON" : "OFF");
                    this.txtSkillP.text = (passive ? "ON" : "OFF");
                    this.txtBoosts.text = (boost ? "ON" : "OFF");
                    this.txtEsc.text = (untargetMon ? "ON" : "OFF");
                    this.txtEscSelf.text = (selfTarget ? "ON" : "OFF");
                    if(this.btnLeftSkillAnim.hasEventListener(MouseEvent.CLICK))
                        return;
                    this.btnLeftSkillAnim.addEventListener(MouseEvent.CLICK, onSkillAnim, false, 0, true);
                    this.btnRightSkillAnim.addEventListener(MouseEvent.CLICK, onSkillAnim, false, 0, true);
                    this.chkSelfOnly.addEventListener(MouseEvent.CLICK, onCheckPressed, false, 0, true);
                    this.btnLeftSkill.addEventListener(MouseEvent.CLICK, onSkill, false, 0, true);
                    this.btnRightSkill.addEventListener(MouseEvent.CLICK, onSkill, false, 0, true);
                    this.btnLeftSkillP.addEventListener(MouseEvent.CLICK, onSkillP, false, 0, true);
                    this.btnRightSkillP.addEventListener(MouseEvent.CLICK, onSkillP, false, 0, true);
                    this.btnLeftBoosts.addEventListener(MouseEvent.CLICK, onBoosts, false, 0, true);
                    this.btnRightBoosts.addEventListener(MouseEvent.CLICK, onBoosts, false, 0, true);
                    this.btnLeftEsc.addEventListener(MouseEvent.CLICK, onEsc, false, 0, true);
                    this.btnRightEsc.addEventListener(MouseEvent.CLICK, onEsc, false, 0, true);
                    this.btnLeftEscSelf.addEventListener(MouseEvent.CLICK, onEscSelf, false, 0, true);
                    this.btnRightEscSelf.addEventListener(MouseEvent.CLICK, onEscSelf, false, 0, true);
                    break;
                case "btnGraphics":
                    this.chkName.checkmark.visible = filterChecks["chkName"];
                    this.chkDisWepAnim.checkmark.visible = filterChecks["chkDisWepAnim"];
                    this.txtHideP.text = (hideP ? "ON" : "OFF");
                    this.txtDisWepAnim.text = (disWepAnim ? "ON" : "OFF");
                    if(this.btnLeftHideP.hasEventListener(MouseEvent.CLICK))
                        return;
                    this.btnLeftHideP.addEventListener(MouseEvent.CLICK, onHideP, false, 0, true);
                    this.btnRightHideP.addEventListener(MouseEvent.CLICK, onHideP, false, 0, true);
                    this.chkName.addEventListener(MouseEvent.CLICK, onCheckPressed, false, 0, true);
                    this.btnLeftDisWepAnim.addEventListener(MouseEvent.CLICK, onDisWepAnim, false, 0, true);
                    this.btnRightDisWepAnim.addEventListener(MouseEvent.CLICK, onDisWepAnim, false, 0, true);
                    this.chkDisWepAnim.addEventListener(MouseEvent.CLICK, onCheckPressed, false, 0, true);
                    break;
                case "btnMisc":
                    this.txtChat.text = (chatFilter ? "ON" : "OFF");
                    this.chkRed.checkmark.visible = filterChecks["chkRed"];
                    this.chkBlue.checkmark.visible = filterChecks["chkBlue"];
                    if(this.btnLeftChat.hasEventListener(MouseEvent.CLICK))
                        return;
                    this.btnLeftChat.addEventListener(MouseEvent.CLICK, onChat, false, 0, true);
                    this.btnRightChat.addEventListener(MouseEvent.CLICK, onChat, false, 0, true);
                    this.chkRed.addEventListener(MouseEvent.CLICK, onCheckPressed, false, 0, true);
                    this.chkBlue.addEventListener(MouseEvent.CLICK, onCheckPressed, false, 0, true);
                    this.btnColor.addEventListener(MouseEvent.CLICK, onBtColor, false, 0, true);
                    this.btnClear.addEventListener(MouseEvent.CLICK, onBtClear, false, 0, true);
                    this.btnShowCDrop.addEventListener(MouseEvent.CLICK, onBtShowCDrop, false, 0, true);
                    break;
                default: break;
            }
        }

        private function onBtShowCDrop(evt:MouseEvent):void{
            if(cDrops)
                dropmenu.events.dispatchEvent(new ClientEvent(ClientEvent.onShow));
        }

        private function onBtColor(evt:MouseEvent):void{
            main.Game.ui.mcPopup.onClose();
            stage.addEventListener(MouseEvent.MOUSE_DOWN, getColor);
        }

        private function onBtClear(evt:MouseEvent):void{
            if(main.Game.ui.dropStack.numChildren < 1)
                return;			
            for(var i:int = 0; i < main.Game.ui.dropStack.numChildren; i++){
                try{
                    main.Game.ui.dropStack.getChildAt(i).cnt.nbtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                    if(cDrops)
                        dropmenu.events.dispatchEvent(new ClientEvent(ClientEvent.onUpdate));
                    if(sbpcDrops)
                        dropmenutwo.events.dispatchEvent(new ClientEvent(ClientEvent.onUpdate));
                }catch(e){
                    continue;
                }
            }
        }

        private var _stageBitmap:BitmapData;
        private function getColor(evt:MouseEvent):void{
            if (_stageBitmap == null) 
                _stageBitmap = new BitmapData(stage.width, stage.height);
            _stageBitmap.draw(stage);

            var rgb:uint = _stageBitmap.getPixel(stage.mouseX,stage.mouseY);

            var red:int =  (rgb >> 16 & 0xff);
            var green:int =  (rgb >> 8 & 0xff);
            var blue:int =  (rgb & 0xff);

            this.txtRed.text = red.toString();
            this.txtGreen.text = green.toString();
            this.txtBlue.text = blue.toString();

            this.txtHex.text = "#" + rgb.toString(16);

            var c:Color=new Color();
            c.setTint(rgb, 1);
            this.colorPreview.transform.colorTransform = c;

            main.Game.ui.mcPopup.fOpen("Option");
            stage.removeEventListener(MouseEvent.MOUSE_DOWN, getColor);
        }

        public static var filterChecks:Object = new Object();
        public function onCheckPressed(evt:MouseEvent):void{
            evt.currentTarget.checkmark.visible = !evt.currentTarget.checkmark.visible;
            filterChecks[evt.currentTarget.name] = evt.currentTarget.checkmark.visible;
            main.sharedObject.data.filterChecks[evt.currentTarget.name] = evt.currentTarget.checkmark.visible;
			main.sharedObject.flush();
        }

        public function onClose(evt:MouseEvent):void{
            main.Game.ui.mcPopup.onClose();
        }

        public function onChat(evt:MouseEvent):void{
            chatFilter = !chatFilter;
            dispatch(chatfilter);
            this.txtChat.text = chatFilter ? "ON" :"OFF";
            main.sharedObject.data.chatFilter = chatFilter;
			main.sharedObject.flush();
        }

        public function onSkillAnim(evt:MouseEvent):void{
            disableSkillAnim = !disableSkillAnim;
            dispatch(skillanim);
            this.txtSkillAnim.text = disableSkillAnim ? "ON" : "OFF";
            main.sharedObject.data.disableSkillAnim = disableSkillAnim;
			main.sharedObject.flush();
        }

        public function onSkill(evt:MouseEvent):void{
            skill = !skill;
            dispatch(skills);
            dispatch(targetskills);
            this.txtSkill.text = skill ? "ON" : "OFF";
            main.sharedObject.data.skill = skill;
			main.sharedObject.flush();
        }

        public function onSkillP(evt:MouseEvent):void{
            passive = !passive;
            dispatch(passives);
            this.txtSkillP.text = passive ? "ON" : "OFF";
            main.sharedObject.data.passive = passive;
			main.sharedObject.flush();
        }

        public function onBoosts(evt:MouseEvent):void{
            boost = !boost;
            dispatch(boosts);
            this.txtBoosts.text = boost ? "ON" : "OFF";
            main.sharedObject.data.boost = boost;
			main.sharedObject.flush();
        }

        public function onEsc(evt:MouseEvent):void{
            untargetMon = !untargetMon;
            dispatch(untarget);
            this.txtEsc.text = untargetMon ? "ON" : "OFF";
            main.sharedObject.data.untargetMon = untargetMon;
			main.sharedObject.flush();
        }

        public function onEscSelf(evt:MouseEvent):void{
            selfTarget = !selfTarget;
            dispatch(untargetself);
            this.txtEscSelf.text = selfTarget ? "ON" : "OFF";
            main.sharedObject.data.selfTarget = selfTarget;
			main.sharedObject.flush();
        }

        public function onCDrops(evt:MouseEvent):void{
            cDrops = !cDrops;
            if(cDrops && sbpcDrops){
                sbpcDrops = false;
                this.txtSBPCDrops.text = sbpcDrops ? "ON" : "OFF";
                main.sharedObject.data.sbpcDrops = sbpcDrops;
			    main.sharedObject.flush();
                dispatch(dropmenutwo);
            }
            dispatch(dropmenu);
            this.txtCDrops.text = cDrops ? "ON" : "OFF";
            main.sharedObject.data.cDrops = cDrops;
			main.sharedObject.flush();
        }

        public function onSBPCDrops(evt:MouseEvent):void{
            sbpcDrops = !sbpcDrops;
            if(sbpcDrops && cDrops){
                cDrops = false;
                this.txtCDrops.text = cDrops ? "ON" : "OFF";
                main.sharedObject.data.cDrops = cDrops;
			    main.sharedObject.flush();
                dispatch(dropmenu);
            }
            dispatch(dropmenutwo);
            this.txtSBPCDrops.text = sbpcDrops ? "ON" : "OFF";
            main.sharedObject.data.sbpcDrops = sbpcDrops;
			main.sharedObject.flush();
        }

        public function onDraggable(evt:MouseEvent):void{
            draggable = !draggable;
            dispatch(drops);
            this.txtDraggable.text = draggable ? "ON" : "OFF";
            main.sharedObject.data.draggable = draggable;
			main.sharedObject.flush();
        }

        public function onDetailDrop(evt:MouseEvent):void{
            detaildrop = !detaildrop;
            dispatch(detaildrops);
            this.txtDetailDrop.text = detaildrop ? "ON" : "OFF";
            main.sharedObject.data.detaildrop = detaildrop;
			main.sharedObject.flush();
        }

        public function onHideP(evt:MouseEvent):void{
            hideP = !hideP;
            dispatch(hideplayers);
            this.txtHideP.text = hideP ? "ON" : "OFF";
            main.sharedObject.data.hideP = hideP;
			main.sharedObject.flush();
        }

        public function onDisWepAnim(evt:MouseEvent):void{
            disWepAnim = !disWepAnim;
            dispatch(diswepanim);
            this.txtDisWepAnim.text = disWepAnim ? "ON" : "OFF";
            main.sharedObject.data.disWepAnim = disWepAnim;
			main.sharedObject.flush();
        }

        public function onMType(e:MouseEvent):void{
            mType = !mType;
            dispatch(monstype);
            this.txtMType.text = mType ? "ON" : "OFF";
            main.sharedObject.data.mType = mType;
			main.sharedObject.flush();
        }

        public function onQRates(e:MouseEvent):void{
            qRates = !qRates;
            dispatch(qrates);
            this.txtQRates.text = qRates ? "ON" : "OFF";
            main.sharedObject.data.qRates = qRates;
			main.sharedObject.flush();
        }

        public function onQPrev(e:MouseEvent):void{
            qPrev = !qPrev;
            dispatch(qprev);
            this.txtQPrev.text = qPrev ? "ON" : "OFF";
            main.sharedObject.data.qPrev = qPrev;
			main.sharedObject.flush();
        }

        public function onDetailQuest(evt:MouseEvent):void{
            detailquest = !detailquest;
            dispatch(detailquests);
            this.txtDetailQuest.text = detailquest ? "ON" : "OFF";
            main.sharedObject.data.detailquest = detailquest;
			main.sharedObject.flush();
        }
        
        public function onQLog(e:MouseEvent):void{
            qLog = !qLog;
            dispatch(qlog);
            this.txtQLog.text = qLog ? "ON" : "OFF";
            main.sharedObject.data.qLog = qLog;
			main.sharedObject.flush();
        }

        public function onTimer(e:TimerEvent):void{
            if(!main.Game){
                this.visible = false;
                return;
            }
            if(!main.Game.ui){
                this.visible = false;
                return;
            }
            this.visible = flags.isOptions();
		}

        public function onDestroy():void{
            optTimer.reset();
            optTimer.removeEventListener(TimerEvent.TIMER, onTimer);
        }

        public function dispatch(e:*):void{
            e.events.dispatchEvent(new ClientEvent(ClientEvent.onToggle));
        }
	}
	
}
