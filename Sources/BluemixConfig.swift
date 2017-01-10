import SwiftConfiguration

let cloudantConfigKey = "Bluemix:services:cloudant"

/**
 Cloudant, MongoDB, Redis, PostgreSQL
 */

extension ConfigurationManager {

    
    private func loadCloudantConfig () -> BluemixService {
        
        let username = self.getValue(for: "VCAP_SERVICES:cloudantNoSQLDB:credentials:username") as? String
        let password = self.getValue(for: "VCAP_SERVICES:cloudantNoSQLDB:credentials:password") as? String
        let host     = self.getValue(for: "VCAP_SERVICES:cloudantNoSQLDB:credentials:host") as? String
        let url      = self.getValue(for: "VCAP_SERVICES:cloudantNoSQLDB:credentials:url") as? String
        let port     = self.getValue(for: "VCAP_SERVICES:cloudantNoSQLDB:credentials:port") as? Int
        
        var service = BluemixService()
        service.username = username
        service.password = password
        service.port     = port
        service.host     = host
        service.url      = url
        
        return service
        
    }

    public func getService(type: BluemixServiceType) -> BluemixService? {
        
        switch type {
            case .cloudant:
                return loadCloudantConfig()
        default:
            return nil
        }
        
    }
    
    
}