(function($,undefined){var rails;$.rails=rails={linkClickSelector:'a[data-confirm], a[data-method], a[data-remote]',selectChangeSelector:'select[data-remote]',formSubmitSelector:'form',formInputClickSelector:'form input[type=submit], form input[type=image], form button[type=submit], form button:not([type])',disableSelector:'input[data-disable-with], button[data-disable-with], textarea[data-disable-with]',enableSelector:'input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled',requiredInputSelector:'input[name][required]:not([disabled]),textarea[name][required]:not([disabled])',fileInputSelector:'input:file',CSRFProtection:function(xhr){var token=$('meta[name="csrf-token"]').attr('content');if(token)xhr.setRequestHeader('X-CSRF-Token',token);},fire:function(obj,name,data){var event=$.Event(name);obj.trigger(event,data);return event.result!==false;},confirm:function(message){return confirm(message);},ajax:function(options){return $.ajax(options);},handleRemote:function(element){var method,url,data,crossDomain=element.data('cross-domain')||null,dataType=element.data('type')||($.ajaxSettings&&$.ajaxSettings.dataType);if(rails.fire(element,'ajax:before')){if(element.is('form')){method=element.attr('method');url=element.attr('action');data=element.serializeArray();var button=element.data('ujs:submit-button');if(button){data.push(button);element.data('ujs:submit-button',null);}}else if(element.is('select')){method=element.data('method');url=element.data('url');data=element.serialize();if(element.data('params'))data=data+"&"+element.data('params');}else{method=element.data('method');url=element.attr('href');data=element.data('params')||null;}
options={type:method||'GET',data:data,dataType:dataType,crossDomain:crossDomain,beforeSend:function(xhr,settings){if(settings.dataType===undefined){xhr.setRequestHeader('accept','*/*;q=0.5, '+settings.accepts.script);}
return rails.fire(element,'ajax:beforeSend',[xhr,settings]);},success:function(data,status,xhr){element.trigger('ajax:success',[data,status,xhr]);},complete:function(xhr,status){element.trigger('ajax:complete',[xhr,status]);},error:function(xhr,status,error){element.trigger('ajax:error',[xhr,status,error]);}};if(url){$.extend(options,{url:url});}
rails.ajax(options);}},handleMethod:function(link){var href=link.attr('href'),method=link.data('method'),csrf_token=$('meta[name=csrf-token]').attr('content'),csrf_param=$('meta[name=csrf-param]').attr('content'),form=$('<form method="post" action="'+href+'"></form>'),metadata_input='<input name="_method" value="'+method+'" type="hidden" />';if(csrf_param!==undefined&&csrf_token!==undefined){metadata_input+='<input name="'+csrf_param+'" value="'+csrf_token+'" type="hidden" />';}
form.hide().append(metadata_input).appendTo('body');form.submit();},disableFormElements:function(form){form.find(rails.disableSelector).each(function(){var element=$(this),method=element.is('button')?'html':'val';element.data('ujs:enable-with',element[method]());element[method](element.data('disable-with'));element.attr('disabled','disabled');});},enableFormElements:function(form){form.find(rails.enableSelector).each(function(){var element=$(this),method=element.is('button')?'html':'val';if(element.data('ujs:enable-with'))element[method](element.data('ujs:enable-with'));element.removeAttr('disabled');});},allowAction:function(element){var message=element.data('confirm'),answer=false,callback;if(!message){return true;}
if(rails.fire(element,'confirm')){answer=rails.confirm(message);callback=rails.fire(element,'confirm:complete',[answer]);}
return answer&&callback;},blankInputs:function(form,specifiedSelector,nonBlank){var inputs=$(),input,selector=specifiedSelector||'input,textarea';form.find(selector).each(function(){input=$(this);if(nonBlank?input.val():!input.val()){inputs=inputs.add(input);}});return inputs.length?inputs:false;},nonBlankInputs:function(form,specifiedSelector){return rails.blankInputs(form,specifiedSelector,true);},stopEverything:function(e){$(e.target).trigger('ujs:everythingStopped');e.stopImmediatePropagation();return false;},callFormSubmitBindings:function(form){var events=form.data('events'),continuePropagation=true;if(events!==undefined&&events['submit']!==undefined){$.each(events['submit'],function(i,obj){if(typeof obj.handler==='function')return continuePropagation=obj.handler(obj.data);});}
return continuePropagation;}};$.ajaxPrefilter(function(options,originalOptions,xhr){if(!options.crossDomain){rails.CSRFProtection(xhr);}});$(rails.linkClickSelector).live('click.rails',function(e){var link=$(this);if(!rails.allowAction(link))return rails.stopEverything(e);if(link.data('remote')!==undefined){rails.handleRemote(link);return false;}else if(link.data('method')){rails.handleMethod(link);return false;}});$(rails.selectChangeSelector).live('change.rails',function(e){var link=$(this);if(!rails.allowAction(link))return rails.stopEverything(e);rails.handleRemote(link);return false;});$(rails.formSubmitSelector).live('submit.rails',function(e){var form=$(this),remote=form.data('remote')!==undefined,blankRequiredInputs=rails.blankInputs(form,rails.requiredInputSelector),nonBlankFileInputs=rails.nonBlankInputs(form,rails.fileInputSelector);if(!rails.allowAction(form))return rails.stopEverything(e);if(blankRequiredInputs&&form.attr("novalidate")==undefined&&rails.fire(form,'ajax:aborted:required',[blankRequiredInputs])){return rails.stopEverything(e);}
if(remote){if(nonBlankFileInputs){return rails.fire(form,'ajax:aborted:file',[nonBlankFileInputs]);}
if(!$.support.submitBubbles&&rails.callFormSubmitBindings(form)===false)return rails.stopEverything(e);rails.handleRemote(form);return false;}else{setTimeout(function(){rails.disableFormElements(form);},13);}});$(rails.formInputClickSelector).live('click.rails',function(event){var button=$(this);if(!rails.allowAction(button))return rails.stopEverything(event);var name=button.attr('name'),data=name?{name:name,value:button.val()}:null;button.closest('form').data('ujs:submit-button',data);});$(rails.formSubmitSelector).live('ajax:beforeSend.rails',function(event){if(this==event.target)rails.disableFormElements($(this));});$(rails.formSubmitSelector).live('ajax:complete.rails',function(event){if(this==event.target)rails.enableFormElements($(this));});})(jQuery);!function($){var transitionEnd
$(document).ready(function(){$.support.transition=(function(){var thisBody=document.body||document.documentElement,thisStyle=thisBody.style,support=thisStyle.transition!==undefined||thisStyle.WebkitTransition!==undefined||thisStyle.MozTransition!==undefined||thisStyle.MsTransition!==undefined||thisStyle.OTransition!==undefined
return support})()
if($.support.transition){transitionEnd="TransitionEnd"
if($.browser.webkit){transitionEnd="webkitTransitionEnd"}else if($.browser.mozilla){transitionEnd="transitionend"}else if($.browser.opera){transitionEnd="oTransitionEnd"}}})
var Twipsy=function(element,options){this.$element=$(element)
this.options=options
this.enabled=true
this.fixTitle()}
Twipsy.prototype={show:function(){var pos,actualWidth,actualHeight,placement,$tip,tp
if(this.getTitle()&&this.enabled){$tip=this.tip()
this.setContent()
if(this.options.animate){$tip.addClass('fade')}
$tip.remove().css({top:0,left:0,display:'block'}).prependTo(document.body)
pos=$.extend({},this.$element.offset(),{width:this.$element[0].offsetWidth,height:this.$element[0].offsetHeight})
actualWidth=$tip[0].offsetWidth
actualHeight=$tip[0].offsetHeight
placement=maybeCall(this.options.placement,this,[$tip[0],this.$element[0]])
switch(placement){case'below':tp={top:pos.top+pos.height+this.options.offset,left:pos.left+pos.width/2-actualWidth/2}
break
case'above':tp={top:pos.top-actualHeight-this.options.offset,left:pos.left+pos.width/2-actualWidth/2}
break
case'left':tp={top:pos.top+pos.height/2-actualHeight/2,left:pos.left-actualWidth-this.options.offset}
break
case'right':tp={top:pos.top+pos.height/2-actualHeight/2,left:pos.left+pos.width+this.options.offset}
break}
$tip.css(tp).addClass(placement).addClass('in')}},setContent:function(){var $tip=this.tip()
$tip.find('.twipsy-inner')[this.options.html?'html':'text'](this.getTitle())
$tip[0].className='twipsy'},hide:function(){var that=this,$tip=this.tip()
$tip.removeClass('in')
function removeElement(){$tip.remove()}
$.support.transition&&this.$tip.hasClass('fade')?$tip.bind(transitionEnd,removeElement):removeElement()},fixTitle:function(){var $e=this.$element
if($e.attr('title')||typeof($e.attr('data-original-title'))!='string'){$e.attr('data-original-title',$e.attr('title')||'').removeAttr('title')}},getTitle:function(){var title,$e=this.$element,o=this.options
this.fixTitle()
if(typeof o.title=='string'){title=$e.attr(o.title=='title'?'data-original-title':o.title)}else if(typeof o.title=='function'){title=o.title.call($e[0])}
title=(''+title).replace(/(^\s*|\s*$)/,"")
return title||o.fallback},tip:function(){if(!this.$tip){this.$tip=$('<div class="twipsy" />').html('<div class="twipsy-arrow"></div><div class="twipsy-inner"></div>')}
return this.$tip},validate:function(){if(!this.$element[0].parentNode){this.hide()
this.$element=null
this.options=null}},enable:function(){this.enabled=true},disable:function(){this.enabled=false},toggleEnabled:function(){this.enabled=!this.enabled}}
function maybeCall(thing,ctx,args){return typeof thing=='function'?thing.apply(ctx,args):thing}
$.fn.twipsy=function(options){$.fn.twipsy.initWith.call(this,options,Twipsy,'twipsy')
return this}
$.fn.twipsy.initWith=function(options,Constructor,name){var twipsy,binder,eventIn,eventOut
if(options===true){return this.data(name)}else if(typeof options=='string'){twipsy=this.data(name)
if(twipsy){twipsy[options]()}
return this}
options=$.extend({},$.fn[name].defaults,options)
function get(ele){var twipsy=$.data(ele,name)
if(!twipsy){twipsy=new Constructor(ele,$.fn.twipsy.elementOptions(ele,options))
$.data(ele,name,twipsy)}
return twipsy}
function enter(){var twipsy=get(this)
twipsy.hoverState='in'
if(options.delayIn==0){twipsy.show()}else{twipsy.fixTitle()
setTimeout(function(){if(twipsy.hoverState=='in'){twipsy.show()}},options.delayIn)}}
function leave(){var twipsy=get(this)
twipsy.hoverState='out'
if(options.delayOut==0){twipsy.hide()}else{setTimeout(function(){if(twipsy.hoverState=='out'){twipsy.hide()}},options.delayOut)}}
if(!options.live){this.each(function(){get(this)})}
if(options.trigger!='manual'){binder=options.live?'live':'bind'
eventIn=options.trigger=='hover'?'mouseenter':'focus'
eventOut=options.trigger=='hover'?'mouseleave':'blur'
this[binder](eventIn,enter)[binder](eventOut,leave)}
return this}
$.fn.twipsy.Twipsy=Twipsy
$.fn.twipsy.defaults={animate:true,delayIn:0,delayOut:0,fallback:'',placement:'above',html:false,live:false,offset:0,title:'title',trigger:'hover'}
$.fn.twipsy.elementOptions=function(ele,options){return $.metadata?$.extend({},options,$(ele).metadata()):options}}(window.jQuery||window.ender);!function($){var Popover=function(element,options){this.$element=$(element)
this.options=options
this.enabled=true
this.fixTitle()}
Popover.prototype=$.extend({},$.fn.twipsy.Twipsy.prototype,{setContent:function(){var $tip=this.tip()
$tip.find('.title')[this.options.html?'html':'text'](this.getTitle())
$tip.find('.content p')[this.options.html?'html':'text'](this.getContent())
$tip[0].className='popover'},getContent:function(){var content,$e=this.$element,o=this.options
if(typeof this.options.content=='string'){content=$e.attr(o.content)}else if(typeof this.options.content=='function'){content=this.options.content.call(this.$element[0])}
return content},tip:function(){if(!this.$tip){this.$tip=$('<div class="popover" />').html('<div class="arrow"></div><div class="inner"><h3 class="title"></h3><div class="content"><p></p></div></div>')}
return this.$tip}})
$.fn.popover=function(options){if(typeof options=='object')options=$.extend({},$.fn.popover.defaults,options)
$.fn.twipsy.initWith.call(this,options,Popover,'popover')
return this}
$.fn.popover.defaults=$.extend({},$.fn.twipsy.defaults,{content:'data-content',placement:'right'})}(window.jQuery||window.ender);$.extend({show_milestone_comments:function(){$('.hito_header').click(function(){visible=$('.hito_content:visible').attr('id');$('.hito_content').slideUp(600);number=$(this).attr('id').substr(12)
content=$('#hito_content_'+number);if(visible!=content.attr('id')){content.slideDown(600);}})},do_comment:function(){$('#do_comment').click(function(){$('.post_comment').toggle();return false;});},search_select:function(){$('#buscar_por').change(function(){$('#promise_search').find('input:text').attr('disabled','disabled').hide();switch($(this).attr('value')){case'promesa':$('#search_title_contains').removeAttr('disabled').show();break;case'representante':$('#search_official_name_contains').removeAttr('disabled').show();break;case'region':$('#search_official_state_name_contains').removeAttr('disabled').show();break;case'partido':$('#search_official_political_party_name_contains').removeAttr('disabled').show();break;case'tema':$('#search_topics_contains').removeAttr('disabled').show();break;case'dias_progreso':$('#search_dias_progreso_contains').removeAttr('disabled').show();break;};});},topics_filter:function(){$('select#tema').change(function(){host=window.location.host;value=$(this).attr('value');window.location='http://'+host+'/promesas?search[topics_contains]='+value;});}});$(document).ready(function(){$.show_milestone_comments();$.do_comment();$.search_select();$.topics_filter();});(function($){window.Provincia=Backbone.Model.extend({})
window.Representante=Backbone.Model.extend({})
window.ProvinciasList=Backbone.Collection.extend({model:Provincia,state:undefined,url:function(){return'/estados/'+this.state+'/provincias';}});window.Provincias=new ProvinciasList();window.ProvinciaView=Backbone.View.extend({tagName:'li',className:'provincia',initialize:function(){this.template=_.template($('#provincia-template').html());},render:function(){$(this.el).html(this.template(this.model.toJSON()));return this;}});window.EstadoView=Backbone.View.extend({tagName:'li',className:'provincia estado',initialize:function(){this.template=_.template($('#estado-template').html());},render:function(){$(this.el).html(this.template(this.model.toJSON()));return this;}});window.RepresentanteView=Backbone.View.extend({initialize:function(){this.template=_.template($('#representante-template').html());_.bindAll(this,'render');this.model.bind('change',this.render);},render:function(){$('.representante').html(this.template(this.model.toJSON()));return this;}});window.ProvinciasListView=Backbone.View.extend({tagName:'ul',className:'provincias',initialize:function(){_.bindAll(this,'render');this.collection.bind('reset',this.render);},addState:function(){stateModel=new Provincia({name:this.state});var stateView=new EstadoView({model:stateModel});$(this.el).append(stateView.render().el);},render:function(){this.addState();this.collection.each(function(provincia){var view=new ProvinciaView({model:provincia,collection:this.collection});if(_.include(['cusco','san martin','chiclayo'],provincia.get('name'))){$(view.render().el).addClass('underline');}
$(this.el).append(view.el);});$('.region').html(this.el)
return this;}});window.Directorio=Backbone.Router.extend({routes:{':estado/provincias':'provincias','representante/:lugar/:posicion':'representante'},initialize:function(){},provincias:function(estado){Provincias.state=estado;pro_vista=new ProvinciasListView({collection:Provincias})
pro_vista.state=estado;Provincias.fetch();},representante:function(lugar,posicion){representante=new Representante();representante.url='/representantes/'+lugar+'?posicion='+posicion;representante.fetch();representanteVista=new RepresentanteView({model:representante});if(representante.get('name')==undefined){$('.representante').html('La información no se enuentra disponible');}}});$(function(){window.App=new Directorio();Backbone.history.start();})})(jQuery);