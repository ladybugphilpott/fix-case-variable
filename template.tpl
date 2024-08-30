___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Fix Case",
  "description": "Converts a string to snake_case, camelCase, or kabob-case.",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ],
  "brand": {
    "displayName": "Custom Template",
    "id": "cvt_temp_public_id_brand"
  }
}


___TEMPLATE_PARAMETERS___

[
  {
    "displayName": "Input",
    "name": "input",
    "type": "TEXT"
  },
  {
    "displayName": "Conversion Type",
    "name": "conversion",
    "type": "RADIO",
    "radioItems": [
      {
        "displayValue": "snake_case",
        "value": "snake"
      },
      {
        "displayValue": "kabob-case",
        "value": "kabob"
      },
      {
        "displayValue": "camelCase",
        "value": "camel"
      },
      {
        "displayValue": "UpperCamelCase",
        "value": "upper_camel"
      },
      {
        "displayValue": "Title Case",
        "value": "title"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var tokens = [];
var rest = data.input;
while (rest.length > 0) {
  var match = rest.match("\\s*(\\S+)\\s*(.*)");
  if (match) {
    tokens.push(("" + match[1]).toLowerCase());
    rest = match[2];
  } else {
    break;
  }
}

if (data.conversion === 'kabob') {
  return tokens.join('-');
}

if (data.conversion === 'snake') {
  return tokens.join('_');
}

var start = data.conversion === 'camel' ? 1 : 0;
for (var i = start; i < tokens.length; i++) {
  tokens[i] = tokens[i].substring(0, 1).toUpperCase() + tokens[i].substring(1);
}

return tokens.join(data.conversion === 'title' ? ' ' : '');


___NOTES___

Last Updated 08/30/2024
Created on 11/1/2018, 9:07:11 AM
