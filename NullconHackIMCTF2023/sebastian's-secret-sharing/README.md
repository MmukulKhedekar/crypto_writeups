# Sebastian's Secret Sharing 
## Problem
```
"I met Adi on a conference and decided to implement my own Secret Sharing Service.

It's pretty rudimentary, but gets the job done. Let's just hope, I didn't do anything wrong..."
```
## Solution
if you observe carefully we are required to find `shares[0]` but we could directly receive that by sending in $ \text{sid} = n$ since they return the values `shares[sid%n]` to us 
```python
from Cryptodome.Util.number import *
x = 111370287875855598506538509804271500535681803123044982950094717
print(long_to_bytes(x))
```
the flag is 
```
ENO{SeCr3t_Sh4m1r_H4sh1ng}
```

