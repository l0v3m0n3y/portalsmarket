# portalsmarket
telegram mini app api for portalsmarket bot nim-lang library
# Example
```nim
import asyncdispatch, portalsmarket, json

discard waitFor auth("initdata")

let data = waitFor collections_floors()
let floorPrices = data["floorPrices"]

for itemName, price in floorPrices:
  echo itemName, ": $TON ", price.getStr()
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
