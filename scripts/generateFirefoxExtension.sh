#!/usr/bin/env bash

npm install
npm run process-styles
npm run js-minify
npm run clean
npm install --production
echo $(jq 'del(.background)' manifest.json) > manifest.json
echo $(jq 'del(.action)' manifest.json) > manifest.json
echo $(jq -s 'reduce .[] as $item ({}; . * $item)' manifest.json part.firefox.json) > manifest.json
rm -rf assets && rm -rf .github && rm -rf .git && rm .gitignore package-lock.json package.json part.edge.json part.firefox.json styles/options.css styles/options.css.map styles/options.scss styles/popup.css styles/popup.css.map styles/popup.scss styles/jwt-panel.css styles/jwt-panel.css.map styles/jwt-panel.scss
zip -r jwt-dev-inspector-firefox.xpi .