import asyncdispatch, httpclient, json, strutils

const api = "https://portals-market.com/api"
var headers = newHttpHeaders({"Connection": "keep-alive",  "Host": "portals-market.com",  "Content-Type": "application/json",  "accept": "application/json, text/plain, */*", "user-agent":"Mozilla/5.0 (Linux; Android 12; K) Telegram-Android/12.1.1 (Samsung SM-S9210; Android 12; SDK 32; AVERAGE)"})

proc auth*(initdata:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    headers["Authorization"] = initdata
    client.headers = headers
    let response = await client.get(api & "/users/auth")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc my_points*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/points/me")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc users_wallets*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/users/wallets/")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc collections_filters*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/collections/filters/preview?owned_only=false")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc collections_floors*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/collections/floors")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc collections_backdrops*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/collections/filters/backdrops")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc backdrops_floors*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/collections/filters/backdrops/floors")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc search_nfts*(offset:int=0,status:string="listed",premarket_status:string="all"): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/nfts/search?offset=" & $offset & "&limit=50&status=" & status & "&exclude_bundled=true&premarket_status=" & premarket_status)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc collections_symbols*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/collections/filters/symbols")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc check_membership*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/telegram/check-channel-membership")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc market_config*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/market/config")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc wallet_history*(offset:int=0): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/users/wallets/history?offset=" & $offset & "limit=30&types=")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc wallet_limits*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/users/wallets/limits")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
