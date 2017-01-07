//
//  ViewController.swift
//  AppBanhang
//
//  Created by Cam Nhung on 12/15/16.
//  Copyright © 2016 Cam Nhung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewtrang:UIView = {
    let v = UIView()
        v.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let viewdo:UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let arrChat:Array<String> = ["001","xin chao","002","hi","003","how are you","toi dang cuc ky buc minh, dung choc toi, khong thoi toi se can cho mot phat bay gio","Lam an the nao roi","Hoi hoai buc minh qua di thoi","Tet nay co di dau choi khong","Dong duc chat choi di dau cho met"]
    // TẠO TABLEVIEW
    lazy var tblView:UITableView = {
    let tbl = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        tbl.register(Cell.self, forCellReuseIdentifier: "Cell")
        tbl.register(Cell2.self, forCellReuseIdentifier: "Cell2")
        tbl.translatesAutoresizingMaskIntoConstraints = false
      //bước 4 của auto layout tự co giãn label theo chữ: huỷ kích thước mặc định của table bằng 2 dòng lệnh bên dưới:
      
        tbl.estimatedRowHeight = 100
        tbl.rowHeight = UITableViewAutomaticDimension
        tbl.dataSource = self
       
        return tbl
    }()
    
    //Tạo collection View:
    //FlowLayout: các ô vuông đều hoặc tròn đều hoặc chữ nhật đều
    // Các kích thước ko đồng nhất thì FlowLayout ko làm được.
    // Pinterest: UICollectionView Custom Layout : layout bất đối xứng)
    lazy var collView:UICollectionView = {
        let coll:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        coll.translatesAutoresizingMaskIntoConstraints = false
        coll.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        coll.register(collcell1.self, forCellWithReuseIdentifier: "Coll")
         coll.delegate = self
        coll.dataSource = self
        return coll
    }()
    
//    func setupMenubar(){
//        view.addSubview(viewtrang)
//         view.addSubview(viewdo)
//        //AUTOLAYOUT VIEWTRANG:
////        // * Cách 1:
////        viewtrang.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
////        viewtrang.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
////        viewtrang.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
////        viewtrang.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
//        
////  // * Cách 2:(cho chiều cao viewtrang bằng 200, neo top trên)
////        view.addContrainWithVS(format: "V:|[v0(200)]|", views: viewtrang)
////        view.addContrainWithVS(format: "H:|[v0]|", views: viewtrang)
//        
//        // AUTOLAYOUT VIEWDO nằm dưới viewtrang, chiều cao viewtrang bằng 1/2 màn hình, phần dưới là viewdo
//        //* cách 1 theo kích thước 1/2 màn hình bằng cách bắt biến:
////       let height = UIScreen.main.bounds.height / 2
////        view.addContrainWithVS(format: "V:|[v0(\(height))][v1]|", views: viewtrang,viewdo)
//        //* cách 2 bằng cách neo theo heightAnchor
//        view.addContrainWithVS(format: "V:|[v0][v1]|", views: viewtrang,viewdo)
//        viewtrang.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
//        view.addContrainWithVS(format: "H:|[v0]|", views: viewtrang)
//        view.addContrainWithVS(format: "H:|[v0]|", views: viewdo)
//    }
    // Set up Collview:
    func setupCollView(){
        viewtrang.addSubview(collView)
        viewtrang.addContrainWithVS(format: "V:|-64-[v0]|", views: collView)
        viewtrang.addContrainWithVS(format: "H:|[v0]|", views: collView)
        
    }
    
    func setupMenubar(){
        view.addSubview(viewtrang)
        
//        AUTOLAYOUT VIEWTRANG:
                // * Cách 1:
                viewtrang.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                viewtrang.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
                viewtrang.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
                viewtrang.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setupTableView(){
//        viewtrang.addSubview(tblView)
//        viewtrang.addContrainWithVS(format: "V:|[v0]|", views: tblView)
//        viewtrang.addContrainWithVS(format: "H:|[v0]|", views: tblView)
        
        view.addSubview(tblView)
        view.addContrainWithVS(format: "V:|-64-[v0]|", views: tblView)
        view.addContrainWithVS(format: "H:|[v0(200)]|", views: tblView)
        }
    
    func setupGesture(){
        let VuotTuPhaiveTrai:UISwipeGestureRecognizer = UISwipeGestureRecognizer()
        VuotTuPhaiveTrai.direction = .left
        VuotTuPhaiveTrai.addTarget(self, action: #selector(ViewController.MenuDong(_:)))
       
        let VuottuTraivePhai:UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer()
        VuottuTraivePhai.edges = .left
        VuottuTraivePhai.addTarget(self, action: #selector(ViewController.MenuMo(_:)))
        
        viewtrang.addGestureRecognizer(VuottuTraivePhai)
        viewtrang.addGestureRecognizer(VuotTuPhaiveTrai)
    }
    func MenuDong(_ sender: UIScreenEdgePanGestureRecognizer){
        print("dong")
        if sender.state == .ended{
            UIView.animate(withDuration: 3, animations: {
            self.action()
            })
        }
    }
    func MenuMo(_ sender: UISwipeGestureRecognizer){
        print("mo")
        if sender.state == .ended{
            UIView.animate(withDuration: 3, animations: {self.action()
            })
        }
    }
    //muốn đẩy cái gì thì trong hàm fun selecbluecell(), trong () đặt biến cần truyền
    func selectbluecell(bien: Notification){
        let vd =  bien.object as! Video
      //  print(indexPath)
        let mhd = ViewController02()
        mhd.video = vd
        self.navigationController?.pushViewController(mhd, animated: true)
    }
    var arrPlaylist:Array<Playlist> = []
    func loaddata(){
        //http://hidaacademy.com/data.json
        loadJson(linkAPI: API.getCata) {(objectJson) in
            if objectJson == nil{
             self.present(ViewControllerError(), animated: true, completion: nil)
            }else{
                let object:Array<AnyObject> = objectJson as! Array<AnyObject>
                for i in object{
                    let playlist:Playlist = Playlist(object: i)
                   self.arrPlaylist.append(playlist)
                }
                    self.collView.reloadData()
        }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //["index":0,"numberPages":4]  --> về viết sao cho ra cái này
        // không chạy kiểu này
        
//        loadJson(linkAPI: API.getSP,parameter: "index=0&numberPages=4") {(object) in
//        print(object)
//        }
        let img = UIImage(named: "menu")
        loadJson(linkAPI: API.postImage, method: .post, parameter: ["file":img,"sa":"sa"]) {(object) in
            print(object!)
        }

        //Nhận hành động truyền từ collcell.swift
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.selectbluecell), name: NSNotification.Name.init("clickbluecell"), object: nil)
//        setupMenubar()
//        setupTableView()
       // chuyển tableview qua view gốc ban đầu thì phải đổi thứ tự addsubview
        setupTableView()
        setupMenubar()
        setupGesture()
        setupCollView()
        
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.navigationItem.title = "Home"
        let LeftButton = UIBarButtonItem(image: UIImage(named: "button"), style: .plain, target: self, action: #selector(ViewController.action))
        self.navigationItem.leftBarButtonItem = LeftButton
        automaticallyAdjustsScrollViewInsets = false
        
    }
    var isMenu:Bool = false
    
    func action(){
        if isMenu == false{
            print("AAAAAAA")
            let dichuyen = CATransform3DTranslate(CATransform3DIdentity, 200, 0, 0)
            UIView.animate(withDuration: 0, animations: {
                self.navigationController?.navigationBar.layer.transform = dichuyen
            }, completion: {(true) in
                self.viewtrang.layer.transform = dichuyen
            })
        }else{
            
            self.navigationController?.navigationBar.layer.transform = CATransform3DIdentity
            self.viewtrang.layer.transform = CATransform3DIdentity
            
        }
        isMenu = !isMenu
        
    }
//    //set vị trí navigation
//    override func viewDidDisappear(_ animated: Bool) {
//        self.navigationController?.navigationBar.frame.origin.x = 100
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//Cấu hình tableview:
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrChat.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 != 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
            //  cell.textLabel?.text = "den gio ve roi"
            cell.lblKH.text = arrChat[indexPath.row]
            return cell
        }else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! Cell2
            cell2.imgView.image = UIImage(named: arrChat[indexPath.row])
            return cell2
        }
 
        }
}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPlaylist.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 100)
    }
    // khi scroll theo chiều đứng, nó sẽ khít dọc khi cho return về 0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // khi scroll theo chiều đứng, sẽ khít ngang khi cho return về 0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll", for: indexPath) as! collcell1
        
       cell.listvideo = arrPlaylist[indexPath.row].listPlaylist
        cell.collView1.reloadData()
        
        return cell
    }
    // tạo hiệu ứng cho collview:
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        let tranform = CATransform3DTranslate(CATransform3DIdentity, 600, 0, 0)
        cell.layer.transform = tranform
        UIView.animate(withDuration: 3, animations: {
        cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        })
    }
   
}
