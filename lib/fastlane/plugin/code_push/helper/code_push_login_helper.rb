module Fastlane
  module Helper
    class CodePushLoginHelper
      def self.log_in(access_key, server_url="")
        begin
          unless is_logged_in()
            Action.sh("appcenter login --token #{access_key} #{server_url}", print_command: false)
          end        
        rescue
          UI.user_error!("something went wrong during login with token #{access_key} and server url #{server_url}")
        end
      end

      def self.log_out
        Action.sh("appcenter logout")
      end

      def self.is_logged_in
        value = true
        begin
          Action.sh("appcenter profile list", false)
        rescue
          value = false
        end
        value
      end
    end
  end
end
