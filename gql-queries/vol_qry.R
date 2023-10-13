# Problem 4b
# vol_qry(id, from, to)

vol_qry <- function(id, from, to){
  glue::glue(.open = "{{", .close = "}}", '{
  trafficData(trafficRegistrationPointId: "{{id}}") {
    volume {
      byHour(from: "{{from}}", to: "{{to}}") {
        edges {
          node {
            from
            to
            total {
              volumeNumbers {
                volume
              }
            }
          }
        }
      }
    }
  }
}'
)
}

# I do not understand why it does not work with the general code, 
# but this way with specific numbers it does works
GQL(
  vol_qry(
    id="97411V72313", 
    from="2022-05-01T06:55:47Z",
    to="2022-05-08T06:55:47Z"
  ),
  .url = configs$vegvesen_url
)



