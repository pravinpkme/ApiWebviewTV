//
//  SecondViewController.swift
//  apipractice
//
//  Created by Pravin Kumar on 03/04/22.
//

import UIKit
import WebKit
class SecondViewController: UIViewController {
    var posd : Article?

    
    

    
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 100%; } </style>
        </head>
        <body>
        "\((posd?.body_html)!)"
        </body>
        </html>
        """

        webview.loadHTMLString(html, baseURL: nil)
    

    }

}
