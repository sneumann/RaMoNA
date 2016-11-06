library(httr)

MONASEARCH <- "http://mona.fiehnlab.ucdavis.edu/rest/spectra/search"
JSONCONTENT <- '"Content-Type" = "application/json"'

req <- POST(MONASEARCH,
            add_headers(JSONCONTENT),
            body = '{"compound":{"metadata":[{"name":"molecule formula","value":{"eq":"C47H74O12S"}}]},"metadata":[{"name":"compoundclass","value":{"eq":"SQDG"}}],"tags":["virtual","lipidblast"],"offset":0}');

cat(content(req, as = "text"))


quit()






##
## http://technistas.com/2013/04/03/working-with-json-rest-apis-from-r/
##

library('RCurl')
library('rjson')
#source("OAuthAccessToken.R")

getCampaignDataframeFromJSON <- function(campaignJSON) {
    namelist <- NULL
    urllist <- NULL
    statuslist <- NULL
    datelist <- NULL
    JSONList <- fromJSON(CampaignJSON)
    results <- JSONList$results
    for (i in 1:length(results)) {
        namelist <- c(namelist, results[i][[1]]$name )
        urllist <- c(urllist, paste("https://api.constantcontact.com/v2/emailmarketing/campaigns/", results[i][[1]]$id, sep="", collapse=NULL))
        statuslist <- c(statuslist, results[i][[1]]$status)
        datelist <- c(datelist, results[i][[1]]$modified_date)
    }
    campaignDF = data.frame(name=namelist,url=urllist,status=statuslist,date=datelist,stringsAsFactors=FALSE)
    return(campaignDF)
}


campaignJSON = getURL(url = paste("https://api.constantcontact.com/v2/emailmarketing/campaigns?",
                                  "access_token=", access_token,
                                  "&api_key=", api_key, sep=""))
campaign.dataframe <- getCampaignDataframeFromJSON(campaignJSON)



##
## https://cran.r-project.org/web/packages/jsonlite/vignettes/json-apis.html
##

library(jsonlite)
hadley_orgs <- fromJSON("https://api.github.com/users/hadley/orgs")
hadley_repos <- fromJSON("https://api.github.com/users/hadley/repos")
gg_commits <- fromJSON("https://api.github.com/repos/hadley/ggplot2/commits")
gg_issues <- fromJSON("https://api.github.com/repos/hadley/ggplot2/issues")

#latest issues
paste(format(gg_issues$user$login), ":", gg_issues$title)



##
## MoNAR
##

# http://mona.fiehnlab.ucdavis.edu/#/documentation/query
query <- '{
                    "compound": {
                        "metadata": [
                            {
                                "name": "molecule formula",
                                "value": {
                                    "eq": "C47H74O12S"
                                }
                            }
                        ]
                    },

                    "metadata": [
                        {
                            "name": "compoundclass",
                            "value": {
                                "eq": "SQDG"
                            }
                        }
                    ],

                    "tags": [
                        "virtual",
                        "lipidblast"
                    ]
                }
'

##curl -H "Content-Type: application/json" -d  




