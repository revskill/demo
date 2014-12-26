<script>


      function gen_pass()
      {
        
        o = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z".split(',');
        var p = new Array();
        for (i = 0; i < 3; i++)
        {
          var k = getRandomInt(0, o.length);
          p[i] = o[k];
        }




        o2 = "0,1,2,3,4,5,6,7,8,9".split(',');
        var p2 = new Array();
        for (i = 0; i < 3; i++)
        {
          var k = getRandomInt(0, o2.length);
          p2[i] = o2[k];
        }




        var o3 = ['~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '|', '}', '{', '\\'];
        var p3 = new Array();
        for (i = 0; i < 2; i++)
        {
          var k = getRandomInt(0, o3.length);
          p3[i] = o3[k];
        };


        var pass = p.concat(p2).concat(p3);
        pass_shuffle = shuffle(pass);
       
        document.getElementById("input_password").value = pass_shuffle.join("")
      
      }




      function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
      }



      function shuffle(array) {
        var currentIndex = array.length, temporaryValue, randomIndex;

        // While there remain elements to shuffle...
        while (0 !== currentIndex) {

          // Pick a remaining element...
          randomIndex = Math.floor(Math.random() * currentIndex);
          currentIndex -= 1;

          // And swap it with the current element.
          temporaryValue = array[currentIndex];
          array[currentIndex] = array[randomIndex];
          array[randomIndex] = temporaryValue;
        }

        return array;
      }
      
      function show_pass(){
      
          document.getElementById("input_password").type = "text";
       
      }
       function hide_pass(){
        
       
          document.getElementById("input_password").type = "password";
        
      }


    </script>