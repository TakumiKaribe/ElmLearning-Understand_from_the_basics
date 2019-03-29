setup:
	npm init
	npm install --save-dev elm

makejs:
	elm make src/Main.js --output=script.js
