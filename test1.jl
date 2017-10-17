function byfrequency(xor1, xor2) 
	printables = " etaonisrhlducmfwgpybvkxjqzTAOSIWHBCFMPDLRENGUVYKJQXZ,.?!;:0123456789()<>/\$%@#^*+-_={}|\'\""
	pset = map(c ->Int(c), collect(printables))
	diffset = setdiff(Set(0:255), (Set(pset)))
	allset = vcat(pset, collect(diffset))
	xorchar = xor1 $ xor2
	return map(c -> UInt8(c $ xorchar), allset)
end

print(byfrequency(35, 132))
print(join(map(c -> Char(c), byfrequency(01, 02))))
