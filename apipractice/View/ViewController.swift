//
//  ViewController.swift
//  apipractice
//
//  Created by Pravin Kumar on 03/04/22.
//




import UIKit
import WebKit
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let parser = Parser()
    var posts = [Article]()
    var img = [Image]()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        parser.parse { [self] data in
            self.posts = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
            
        }
        }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DataTableViewCell
        cell.titile?.text = posts[indexPath.row].title
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 100%; } </style>
        </head>
        <body>
         \(posts[indexPath.row].summary_html)
        </body>
        </html>
        """

        cell.webview.loadHTMLString(html, baseURL: nil)
        
        
        
    let url = posts[indexPath.row].image.src
        cell.imageview.downloaded(from: url)
        return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController{
            destination.posd = posts[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

}




extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
