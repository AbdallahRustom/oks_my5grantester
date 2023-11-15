/*
 * Namf_Communication
 *
 * AMF Communication Service
 *
 * API version: 1.0.0
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package models

type PduSessionContext struct {
	PduSessionId     int32           `json:"pduSessionId"`
	SmContextRef     string          `json:"smContextRef"`
	SNssai           *Snssai         `json:"sNssai"`
	Dnn              string          `json:"dnn"`
	AccessType       AccessType      `json:"accessType"`
	AllocatedEbiList []EbiArpMapping `json:"allocatedEbiList"`
	HsmfId           string          `json:"hsmfId,omitempty"`
	VsmfId           string          `json:"vsmfId,omitempty"`
	NsInstance       string          `json:"nsInstance,omitempty"`
}
