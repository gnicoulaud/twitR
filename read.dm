# -------------------------------------------------------------------------- #
# read.dm

# Reads direct messages sent to the authentifying user

# count             number of DMs to be returned (defaults to 20, you may 
#                   retrieve up to 200 DMs by call*)
# since             id to start with (as string)*
# max               id to stop with (as string)*

# Returns a list of tweet objects.
# (*) If you want to retrieve more than 200 DMs, use *since* or *max* with
#     *count* to iterate calls.

read.dm = function(count = 20, since = NULL, max = NULL, replies = TRUE) {
	q <- list(count = count, since_id = since, max_ix = max,
		include_entities = TRUE, skip_status = FALSE)
	u <- "https://api.twitter.com/1.1/direct_messages.json"
	token <- .GlobalEnv$.twitter$token
	ans <- try(GET(u, query = q, token), silent = TRUE)
	if(ans$status == 200) {
		res <- fromJSON(content(ans, as = "text", encoding = "UTF-8"))
	} else {
		stop("Failed to read DMs!")
	}
	return(res)
}
