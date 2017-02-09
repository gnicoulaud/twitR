# -------------------------------------------------------------------------- #
# twitter.login
# -------------------------------------------------------------------------- #

# cons_key          string*
# cons_secret       string*
# access_token      string*
# access_secret     string*

# Returns TRUE invisibly on success and throws a confirmation message.

twitter.login = function(cons_key, cons_secret, access_token, access_secret) {
	options(warn=-1)
	if(! "httr" %in% .packages()) library(httr, quietly = TRUE)
	if(! "rjson" %in% .packages()) library(rjson, quietly = TRUE)
	if(! "base64enc" %in% .packages()) library(base64enc, quietly = TRUE)
	options(warn=0)
	app <- oauth_app("twitter", cons_key, cons_secret)
	config <- sign_oauth1.0(app, access_token, access_secret)
	url <- "https://api.twitter.com/1.1/account/verify_credentials.json"
	a <- GET(url, config)
	res <- a$status == 200
	if(res) {
		b <- fromJSON(content(a, as = "text", encoding = "UTF-8"))
		.GlobalEnv$.twitter <- list(
			screen_name = b$screen_name,
			token = config)
		cat(paste("Logged in as @", b$screen_name, "\n", sep = ""))
	}
	invisible(res)
}
