/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct CoffeeItemResponseModel : Codable, Identifiable {
	let id : Int?
	let uid : String?
	let blend_name : String?
	let origin : String?
	let variety : String?
	let notes : String?
	let intensifier : String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case uid = "uid"
		case blend_name = "blend_name"
		case origin = "origin"
		case variety = "variety"
		case notes = "notes"
		case intensifier = "intensifier"
	}
    init(blendName: String, variety: String, origin: String) {
        self.blend_name = blendName
        self.variety = variety
        self.origin = origin
        id = 1
        uid = ""
        notes = ""
        intensifier = ""
    }
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		uid = try values.decodeIfPresent(String.self, forKey: .uid)
		blend_name = try values.decodeIfPresent(String.self, forKey: .blend_name)
		origin = try values.decodeIfPresent(String.self, forKey: .origin)
		variety = try values.decodeIfPresent(String.self, forKey: .variety)
		notes = try values.decodeIfPresent(String.self, forKey: .notes)
		intensifier = try values.decodeIfPresent(String.self, forKey: .intensifier)
	}

}
