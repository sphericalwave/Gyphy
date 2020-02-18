//
//  GifDataTests.swift
//  JSONTests
//
//  Created by Aaron Anthony on 2020-02-17.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import XCTest
@testable import Gyphs

class GifTests: XCTestCase
{
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    //FIXME: This is hard to read
    let gif = Gif(images: Images(original: OriginalImage(url: URL(string: "https://giphy.com/gifs/last-week-tonight-with-john-oliver-fake-paws-real-animals-dCBZcE46p8Yqj7RA4P")!)), id: "dCBZcE46p8Yqj7RA4P")

    override func setUp() {
        encoder.keyEncodingStrategy = .convertToSnakeCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func testEncodeDecode() {
        guard let data = try? encoder.encode(gif) else { fatalError() }
        XCTAssertNotNil(data)
        guard let aGif = try? decoder.decode(Gif.self, from: data) else { fatalError() }
        XCTAssertEqual(aGif.id, gif.id)
        //XCTAssertEqual(aGif., gif)

    }
    
    func testSerialization() {
        //print(jsonString)
        guard let jsonData = jsonString.data(using: .utf8) else { fatalError() }
        do {
            let aGif = try decoder.decode(Gif.self, from: jsonData)
            XCTAssertNotNil(aGif)
        }
        catch {
            print(error)
            XCTFail()
        }
    }
    
    let jsonString = """
    {
        "type": "gif",
        "id": "dCBZcE46p8Yqj7RA4P",
        "url": "https://giphy.com/gifs/last-week-tonight-with-john-oliver-fake-paws-real-animals-dCBZcE46p8Yqj7RA4P",
        "slug": "last-week-tonight-with-john-oliver-fake-paws-real-animals-dCBZcE46p8Yqj7RA4P",
        "bitly_gif_url": "https://gph.is/g/ZPOWPoQ",
        "bitly_url": "https://gph.is/g/ZPOWPoQ",
        "embed_url": "https://giphy.com/embed/dCBZcE46p8Yqj7RA4P",
        "username": "",
        "source": "",
        "title": "Last Week Tonight With John Oliver Please GIF by moodman",
        "rating": "g",
        "content_url": "",
        "source_tld": "",
        "source_post_url": "",
        "is_sticker": 0,
        "import_datetime": "2019-05-24 23:12:33",
        "trending_datetime": "2020-01-31 13:15:08",
        "images": {
            "downsized_large": {
                "height": "270",
                "size": "1570973",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy.gif",
                "width": "480"
            },
            "fixed_height_small_still": {
                "height": "100",
                "size": "8508",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/100_s.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=100_s.gif",
                "width": "178"
            },
            "original": {
                "frames": "42",
                "hash": "9552a31e3c1acfa201b43b9363482659",
                "height": "270",
                "mp4": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy.mp4?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy.mp4",
                "mp4_size": "173991",
                "size": "1570973",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy.gif",
                "webp": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy.webp?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy.webp",
                "webp_size": "365730",
                "width": "480"
            },
            "fixed_height_downsampled": {
                "height": "200",
                "size": "146736",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200_d.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200_d.gif",
                "webp": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200_d.webp?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200_d.webp",
                "webp_size": "67988",
                "width": "356"
            },
            "downsized_still": {
                "height": "270",
                "size": "43909",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy_s.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy_s.gif",
                "width": "480"
            },
            "fixed_height_still": {
                "height": "200",
                "size": "21010",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200_s.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200_s.gif",
                "width": "356"
            },
            "downsized_medium": {
                "height": "270",
                "size": "1570973",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy.gif",
                "width": "480"
            },
            "downsized": {
                "height": "270",
                "size": "1570973",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy.gif",
                "width": "480"
            },
            "preview_webp": {
                "height": "142",
                "size": "48672",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy-preview.webp?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy-preview.webp",
                "width": "252"
            },
            "original_mp4": {
                "height": "270",
                "mp4": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy.mp4?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy.mp4",
                "mp4_size": "173991",
                "width": "480"
            },
            "fixed_height_small": {
                "height": "100",
                "mp4": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/100.mp4?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=100.mp4",
                "mp4_size": "51796",
                "size": "274856",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/100.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=100.gif",
                "webp": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/100.webp?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=100.webp",
                "webp_size": "137264",
                "width": "178"
            },
            "fixed_height": {
                "height": "200",
                "mp4": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200.mp4?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200.mp4",
                "mp4_size": "117617",
                "size": "776979",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200.gif",
                "webp": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200.webp?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200.webp",
                "webp_size": "291964",
                "width": "356"
            },
            "downsized_small": {
                "height": "270",
                "mp4": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy-downsized-small.mp4?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy-downsized-small.mp4",
                "mp4_size": "173991",
                "width": "480"
            },
            "preview": {
                "height": "216",
                "mp4": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy-preview.mp4?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy-preview.mp4",
                "mp4_size": "33429",
                "width": "384"
            },
            "fixed_width_downsampled": {
                "height": "113",
                "size": "57908",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200w_d.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200w_d.gif",
                "webp": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200w_d.webp?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200w_d.webp",
                "webp_size": "31078",
                "width": "200"
            },
            "fixed_width_small_still": {
                "height": "57",
                "size": "3750",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/100w_s.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=100w_s.gif",
                "width": "100"
            },
            "fixed_width_small": {
                "height": "57",
                "mp4": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/100w.mp4?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=100w.mp4",
                "mp4_size": "25856",
                "size": "110128",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/100w.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=100w.gif",
                "webp": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/100w.webp?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=100w.webp",
                "webp_size": "71184",
                "width": "100"
            },
            "original_still": {
                "height": "270",
                "size": "43909",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy_s.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy_s.gif",
                "width": "480"
            },
            "fixed_width_still": {
                "height": "113",
                "size": "10733",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200w_s.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200w_s.gif",
                "width": "200"
            },
            "looping": {
                "mp4": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy-loop.mp4?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy-loop.mp4",
                "mp4_size": "872330"
            },
            "fixed_width": {
                "height": "113",
                "mp4": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200w.mp4?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200w.mp4",
                "mp4_size": "53376",
                "size": "318725",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200w.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200w.gif",
                "webp": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/200w.webp?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=200w.webp",
                "webp_size": "153404",
                "width": "200"
            },
            "preview_gif": {
                "height": "62",
                "size": "49000",
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/giphy-preview.gif?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=giphy-preview.gif",
                "width": "110"
            },
            "480w_still": {
                "url": "https://media2.giphy.com/media/dCBZcE46p8Yqj7RA4P/480w_s.jpg?cid=ff71a59d310c2923f92aa4770251539be5aab4a335e78363&rid=480w_s.jpg",
                "width": "480",
                "height": "270"
            }
        },
        "analytics": {
            "onload": {
                "url": "https://giphy-analytics.giphy.com/simple_analytics?response_id=310c2923f92aa4770251539be5aab4a335e78363&event_type=GIF_TRENDING&gif_id=dCBZcE46p8Yqj7RA4P&action_type=SEEN"
            },
            "onclick": {
                "url": "https://giphy-analytics.giphy.com/simple_analytics?response_id=310c2923f92aa4770251539be5aab4a335e78363&event_type=GIF_TRENDING&gif_id=dCBZcE46p8Yqj7RA4P&action_type=CLICK"
            },
            "onsent": {
                "url": "https://giphy-analytics.giphy.com/simple_analytics?response_id=310c2923f92aa4770251539be5aab4a335e78363&event_type=GIF_TRENDING&gif_id=dCBZcE46p8Yqj7RA4P&action_type=SENT"
            }
        }
    }
    """
}



