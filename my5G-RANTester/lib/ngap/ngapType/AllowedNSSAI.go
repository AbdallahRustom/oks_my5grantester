package ngapType

// Need to import "free5gc/lib/aper" if it uses "aper"

/* Sequence of = 35, FULL Name = struct AllowedNSSAI */
/* AllowedNSSAIItem */
type AllowedNSSAI struct {
	List []AllowedNSSAIItem `aper:"valueExt,sizeLB:1,sizeUB:8"`
}
