tests-Getting Started
testShowingProgressBar

	(environment includesKey: #FLProgressSerialization) ifFalse: [
		" Needs:
		(ConfigurationOfFuel project latestVersion) load: 'FuelProgressUpdate'.
		"
		^self ].
	
	FLPlatform current
		fileNamed: 'numbers.fuel'
		writeStreamDo: [:aStream |
			FLSerializer newDefault 
				showProgress;
				serialize: (1 to: 200000) asArray 
				on: aStream ].
	
	FLPlatform current
		fileNamed: 'numbers.fuel'
		readStreamDo: [:aStream | 
			FLMaterializer newDefault 
				showProgress;
				materializeFrom: aStream ]