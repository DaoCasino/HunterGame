WebVR game example. When you hover the desired object, the flag is set to 1

```
AFRAME.registerComponent('change-color-on-hover', {
  schema: {
    color: {
      default: 'red'
    }
  },
  init: function() {
    var data = this.data;
    var el = this.el;

    var defaultColor = el.getAttribute('material').color;
    el.addEventListener('mouseenter', function() {
      el.setAttribute('color', data.color);
      sight = 1;

    });
    el.addEventListener('mouseleave', function() {
      el.setAttribute('color', defaultColor);
      sight = 0;
    });
  }
});
```
If player make shoot at this moment then DCLib execute "App.call" whitch make call to the bankroller.

```
function shoot() {
  var randomSeed = DCLib.Utils.makeSeed();
  App.call('maketx', [1, 'confirm(' + randomSeed + ')'], function(result) {
    AFRAME.utils.entity.setComponentProperty(document.querySelector('#score'), 'text.value', "score \n" + App.logic.payChannel.getBalance());
    $("#whitepano").show().fadeOut(500);
  });
}

document.body.onkeyup = function(e) {
  if (e.keyCode == 32) {
    shoot();
  }
}

window.addEventListener('touchstart', function(e) {
  shoot();
});
```

logic.js
```
DCLib.defineDAppLogic('vrducks', function(){
  const _self = this

  var maketx = function(n,random_hash){
    const random_num = DCLib.numFromHash(random_hash, 0, 1);
    if (random_num == 1) _self.payChannel.addTX( 1 )
    if (random_num == 0) _self.payChannel.addTX( -1 )  
    return random_num
  }

  return {
    maketx    : maketx
  }
})
```
