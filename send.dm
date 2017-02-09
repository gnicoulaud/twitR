# -------------------------------------------------------------------------- #
# send.dm
# -------------------------------------------------------------------------- #

# Sends a direct message

# user              screen_name
# text              text

# Returns the id of the message as a string

send.dm = function(user, text) {
	if(substr(user, 1, 1) != "@") stop("'user' must a valid screen_name!")
	u <- "https://api.twitter.com/1.1/direct_messages/new.json"
	query <- list(screen_name = user, text = text)
	token <- .GlobalEnv$.twitter$token
	ans <- try(POST(u, query = query, token), silent = TRUE)
	if(ans$status == 200) {
		r <- fromJSON(content(ans, as = "text", encoding = "UTF-8"))
		res <- r$id_str
	} else {
		stop("Could not send DM!")
	}
	return(res)
}
