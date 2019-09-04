# moyaDemo
对moya进行封装  适用于自己的项目

区分测试与生产环境

enum APIEnvironments {
    
    case debug,production
}


    var environments:APIEnvironments{
        
        return .debug
    }
    
    var enviromentBaseUrl:String{
        
        
        switch environments {
            
        case .debug:
            
            return ""
            
        case .production:
            
            return ""
        }
        
    }


    增加泛型 
struct Results<T:Codable>: Codable {
    
    var msg: String
    
    var status: Int
    
    var data:T
    
    
}
    调用简单


  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

         let manager = NetworkManager<LoginModel>()
        
        manager.login(account: "", password: "") { (model, error) in
            
            //直接转换模型
              model?.data.token
            
            
        }
    }


