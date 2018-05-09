//
//	City.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct City{

	var coord : Coord!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let coordData = dictionary["coord"] as? [String:Any]{
				coord = Coord(fromDictionary: coordData)
			}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if coord != nil{
			dictionary["coord"] = coord.toDictionary()
		}
		return dictionary
	}

}