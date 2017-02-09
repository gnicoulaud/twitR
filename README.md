# twitR
R functions to interact with Twitter.

## Prerequisites

Before anything else, you must:

1. Have a Twitter account with a valid phone number saved in parameters/mobile;

2. Create an app at apps.twitter.com with read/write permissions and get a consumer key, a consumer secret, an access token and an access secret

3. Install the following packages: httr, rjson and base64enc (use install.packages with admin privileges).

## Usage

Every session must start with a call to twitter.login. If successful, it will store a .twitter object in .GlobalEnv that will be used for all calls to the API and confirm on which account you've logged in. The rest is pretty straightforward.
