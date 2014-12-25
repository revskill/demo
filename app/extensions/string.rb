class String
   def just_latin?
     !!self.match(/^[a-zA-Z0-9\~\!\@\#\$\%\^\&\*\(\)\_\+\|\}\{\\]*$/)
   end
 end