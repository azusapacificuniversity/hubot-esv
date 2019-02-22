# hubot-esv

Simple ESV passage lookup based on api.esv.org.

See [`src/esv.coffee`](src/esv.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-esv --save`

Then add **hubot-esv** to your `external-scripts.json`:

```json
[
  "hubot-esv"
]
```

This plugin requires an API key from api.esv.org.  Set this 
as HUBOT_ESV_API_KEY in the hubot environment.
An API key can be obtained at https://api.esv.org/account/create-application/

## Sample Interaction

```
user1>> hubot esv John 3:16
hubot>> [16] “For God so loved the world, that he gave his only Son, that whoever believes in him should not perish but have eternal life. (ESV)
```

## NPM Module

https://www.npmjs.com/package/hubot-esv
