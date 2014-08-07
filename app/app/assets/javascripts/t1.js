//= require jquery
//= require bootstrap
//= require skrollr
//= require skrollr-stylesheets
'use strict';

window.app = {
  
  document : $(document),
  
  nav : $("#nav"),
  
  view : skrollr.init({
      edgeStrategy : 'edge',
      easing: 'linear',
      forceHeight: false
  }),
  
  preload: {
    total : 0,
    completed : 0,
    images : [],
    start : function(complete){
      var self = this;
      var finish = function(){
        if( self.completed == self.total){
          complete();
        }
      ;}
      $.each( this.images, function(index, value){
          var img = new Image(); 
          img.onload = function(){
            self.completed++;finish();
          }
          img.onerror = function(){
            console.log("@preload: unavailable resource "+this.src); 
            self.total--;finish();
          }
          img.src = value;
          //self.completed++;
          //finish();
      });
    },
    register : function( url){
      this.total++;
      this.images.push( url);
    },
    init : function( complete){
      var self = this;
      $('*').filter(function() {
          var tag = $(this).prop("tagName"), img = $(this).css("background-image");
          if( !$(this).hasClass("ignore-preload") ){
              if(img.match(/.*\s?url\([\'\"]?/)){
                img = img.replace(/.*\s?url\([\'\"]?/, '').replace(/[\'\"]?\).*/, '');
              }else{img = 'none';}
              if( tag == 'IMG' ){img = $(this).prop("src");}                 
              if( img != 'none' ) self.register( img);   
          }                               
      });
      this.start(complete);
    }
  },
  
  testimonial : {
    
    slider : $("#carousel-testimonials"),
    selector : $("#testimonial-selector"),
    init : function(){
      
      console.log("@init testimonials");
      var self = this;
      
      this.slider.on('slide.bs.carousel', function (e) {
        var index = $(e.relatedTarget).index();
        self.selector
          .find(".square")
          .removeClass("active")
          .eq(index).addClass("active");
      });
      this.selector.on("click", ".square", function(){
        
        var index = $(".square", $(this).parent()).index(this); 
        self.slider.carousel(index);
      });
      
    }
    
  },
  
  init : function(){
    
    console.log("@init");
    
    var self = this;
    
    var loading = $("#preloader"),
        content = $("#wrapper").hide();
    
    this.preload.init(function(){
      
      loading.hide();
      content.show();
      self.view.refresh();
    
    });
    
    this.testimonial.init();
    
    this.document
      .on("scroll", function(e){
          
         var top = $(this).scrollTop();
         if( top > 200 ){
            self.nav.removeClass("opaque");
         }else{
            self.nav.addClass("opaque");
         }
        
      })
      .trigger("scroll");
    
  }
  
}


app.init();


