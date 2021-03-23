//
//  UploadViewController.swift
//  ImgurApp
//
//  Created by Ferran Hendriks on 21/03/2021.
//

import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var uploadImageButton: UIButton!

        var selectedImage: UIImage!
        var imagePicker = UIImagePickerController()
        var imgurUrl: String = ""
        var imgurDate: String = ""
        var imgurType: String = ""
        let CLIENT_ID = "0c5ba464f4f237f"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapButton(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage
        {
            imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
      @IBAction func uploadImageButtonAction(_ sender: UIButton) {
        if(imageView.image != nil){
            uploadImageToImgur(image: imageView.image!)
        }
      }

        func uploadImageToImgur(image: UIImage) {
            getBase64Image(image: image) { base64Image in
                let boundary = "Boundary-\(UUID().uuidString)"

                var request = URLRequest(url: URL(string: "https://api.imgur.com/3/image")!)
                request.addValue("Client-ID \(self.CLIENT_ID)", forHTTPHeaderField: "Authorization")
                request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

                request.httpMethod = "POST"

                var body = ""
                body += "--\(boundary)\r\n"
                body += "Content-Disposition:form-data; name=\"image\""
                body += "\r\n\r\n\(base64Image ?? "")\r\n"
                body += "--\(boundary)--\r\n"
                let postData = body.data(using: .utf8)

                request.httpBody = postData

                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("failed with error: \(error)")
                        return
                    }
                    guard let response = response as? HTTPURLResponse,
                        (200...299).contains(response.statusCode) else {
                        print("server error")
                        return
                    }
                    if let mimeType = response.mimeType, mimeType == "application/json", let data = data, let dataString = String(data: data, encoding: .utf8) {
                        print("imgur upload results: \(dataString)")
                                        
                        let parsedResult: [String: AnyObject]
                        do {
                            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                            if let dataJson = parsedResult["data"] as? [String: Any] {
                                print("Link is : \(dataJson["link"] as? String ?? "Link not found")")
                                print("Date is : \(dataJson["datetime"] ?? "Date not found")")
                                print("Type is : \(dataJson["type"] as? String ?? "Type not found")")
                                self.imgurUrl = dataJson["link"] as? String ?? ""
                                self.imgurDate = "\(dataJson["datetime"] ?? "0")"
                                self.imgurType = dataJson["type"] as? String ?? ""
                                
                                DispatchQueue.main.async {
                                    self.performSegue(withIdentifier: "detailsseg", sender: self)
                                }
                            }
                        } catch {
                            // Display an error
                        }
                    }
                }.resume()
            }
        }
        

        func getBase64Image(image: UIImage, complete: @escaping (String?) -> ()) {
            DispatchQueue.main.async {
                let imageData = image.pngData()
                let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
                complete(base64Image)
            }
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "detailsseg" {
                let destViewController = segue.destination as? DetailViewController
                destViewController?.imgurUrl = imgurUrl
                destViewController?.imgurType = imgurType
                destViewController?.imgurDate = imgurDate

            }
        }
    
}
