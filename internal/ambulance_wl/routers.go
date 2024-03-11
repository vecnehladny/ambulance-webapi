/*
 * Waiting List Api
 *
 * Ambulance Waiting List management for Web-In-Cloud system
 *
 * API version: 1.0.0
 * Contact: me@me.com
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package ambulance_wl

import (
    "github.com/gin-gonic/gin"
)

func AddRoutes(engine *gin.Engine) {
  group := engine.Group("/api")
  
  {
    api := newAmbulanceConditionsAPI()
    api.addRoutes(group)
  }
  
  {
    api := newAmbulanceWaitingListAPI()
    api.addRoutes(group)
  }
  
  {
    api := newAmbulancesAPI()
    api.addRoutes(group)
  }
  
}