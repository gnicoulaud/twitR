# -------------------------------------------------------------------------- #
# delete.dm
# -------------------------------------------------------------------------- #

# Deletes a direct message

# user              screen_name
# text              text

# Returns TRUE on success.
# Warning: not sure it's working properly. May depend on the setting of your
# app.

delete.dm = function(id) {
	u <- "https://api.twitter.com/1.1/direct_messages/destroy.json"
	query <- list(id = id)
	token <- .GlobalEnv$.twitter$token
	ans <- try(POST(u, query = query, token), silent = TRUE)
	res <- ans$status == 200
	return(res)
}
