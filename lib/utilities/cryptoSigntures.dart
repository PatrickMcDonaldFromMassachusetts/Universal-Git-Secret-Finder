class signitures {
  List<Map<String, String>> signiture = [
    {
      "part": "extension",
      "regex": ".*\.pem",
      "name": "Potential cryptographic private key"
    },
    {"part": "extension", "regex": ".log", "name": "Log file"},
    {
      "part": "extension",
      "regex": ".*\.pkcs12",
      "name": "Potential cryptographic key bundle"
    },
    {
      "part": "extension",
      "regex": ".*\.p12",
      "name": "Potential cryptographic key bundle"
    },
    {
      "part": "extension",
      "regex": ".*\.pfx",
      "name": "Potential cryptographic key bundle"
    },
    {
      "part": "extension",
      "regex": ".*\.asc",
      "name": "Potential cryptographic key bundle"
    },
    {
      "part": "filename",
      "regex": "otr.private_key",
      "name": "Pidgin OTR private key"
    },
    {
      "part": "extension",
      "regex": ".*\.ovpn",
      "name": "OpenVPN client configuration file"
    },
    {
      "part": "extension",
      "regex": ".*\.cscfg",
      "name": "Azure service configuration schema file"
    },
    {
      "part": "extension",
      "regex": ".*\.rdp",
      "name": "Remote Desktop connection file"
    },
    {
      "part": "extension",
      "regex": ".*\.mdf",
      "name": "Microsoft SQL database file"
    },
    {
      "part": "extension",
      "regex": ".*\.sdf",
      "name": "Microsoft SQL server compact database file"
    },
    {
      "part": "extension",
      "regex": ".*\.sqlite",
      "name": "SQLite database file"
    },
    {
      "part": "extension",
      "regex": ".*\.sqlite3",
      "name": "SQLite3 database file"
    },
    {
      "part": "extension",
      "regex": ".*\.bek",
      "name": "Microsoft BitLocker recovery key file"
    },
    {
      "part": "extension",
      "regex": ".*\.tpm",
      "name": "Microsoft BitLocker Trusted Platform Module password file"
    },
    {
      "part": "extension",
      "regex": ".*\.fve",
      "name": "Windows BitLocker full volume encrypted data file"
    },
    {"part": "extension", "regex": ".*\.jks", "name": "Java keystore file"},
    {
      "part": "extension",
      "regex": ".*\.psafe3",
      "name": "Password Safe database file"
    },
    {
      "part": "filename",
      "regex": ".*secret_token.rb",
      "name": "Ruby On Rails secret token configuration file"
    },
    {
      "part": "filename",
      "regex": ".*carrierwave.rb",
      "name": "Carrierwave configuration file"
    },
    {
      "part": "filename",
      "regex": ".*database.yml",
      "name": "Potential Ruby On Rails database configuration file"
    },
    {
      "part": "filename",
      "regex": ".*omniauth.rb",
      "name": "OmniAuth configuration file"
    },
    {
      "part": "filename",
      "regex": ".*settings.py",
      "name": "Django configuration file"
    },
    {
      "part": "extension",
      "regex": ".*\.agilekeychain",
      "name": "1Password password manager database file"
    },
    {
      "part": "extension",
      "regex": ".*\.keychain",
      "name": "Apple Keychain database file"
    },
    {
      "part": "extension",
      "regex": ".*\.pcap",
      "name": "Network traffic capture file"
    },
    {
      "part": "extension",
      "regex": ".*\.gnucash",
      "name": "GnuCash database file"
    },
    {
      "part": "filename",
      "regex": ".*jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.xml",
      "name": "Jenkins publish over SSH plugin file"
    },
    {
      "part": "filename",
      "regex": ".*credentials.xml",
      "name": "Potential Jenkins credentials file"
    },
    {
      "part": "extension",
      "regex": ".*\.kwallet",
      "name": "KDE Wallet Manager database file"
    },
    {
      "part": "filename",
      "regex": "LocalSettings.php",
      "name": "Potential MediaWiki configuration file"
    },
    {
      "part": "extension",
      "regex": ".*\.tblk",
      "name": "Tunnelblick VPN configuration file"
    },
    {
      "part": "filename",
      "regex": ".*Favorites.plist",
      "name": "Sequel Pro MySQL database manager bookmark file"
    },
    {
      "part": "filename",
      "regex": "configuration.user.xpl",
      "name": "Little Snitch firewall configuration file"
    },
    {
      "part": "extension",
      "regex": ".*\.dayone",
      "name": "Day One journal file"
    },
    {
      "part": "filename",
      "regex": ".*journal.txt",
      "name": "Potential jrnl journal file"
    },
    {
      "part": "filename",
      "regex": ".*knife.rb",
      "name": "Chef Knife configuration file"
    },
    {
      "part": "filename",
      "regex": ".*proftpdpasswd",
      "name": "cPanel backup ProFTPd credentials file"
    },
    {
      "part": "filename",
      "regex": ".*robomongo.json",
      "name": "Robomongo MongoDB manager configuration file"
    },
    {
      "part": "filename",
      "regex": ".*filezilla.xml",
      "name": "FileZilla FTP configuration file"
    },
    {
      "part": "filename",
      "regex": ".*recentservers.xml",
      "name": "FileZilla FTP recent servers file"
    },
    {
      "part": "filename",
      "regex": ".*ventrilo_srv.ini",
      "name": "Ventrilo server configuration file"
    },
    {
      "part": "filename",
      "regex": ".*terraform.tfvars",
      "name": "Terraform variable config file"
    },
    {
      "part": "filename",
      "regex": ".*\.exports",
      "name": "Shell configuration file"
    },
    {
      "part": "filename",
      "regex": ".*\.functions",
      "name": "Shell configuration file"
    },
    {
      "part": "filename",
      "regex": ".*\.extra",
      "name": "Shell configuration file"
    },
    {"part": "filename", "regex": "^.*_rsa\$", "name": "Private SSH key"},
    {"part": "filename", "regex": "^.*_dsa\$", "name": "Private SSH key"},
    {"part": "filename", "regex": "^.*_ed25519\$", "name": "Private SSH key"},
    {"part": "filename", "regex": "^.*_ecdsa\$", "name": "Private SSH key"},
    {
      "part": "path",
      "regex": "\\.?ssh/config\$",
      "name": "SSH configuration file"
    },
    {
      "part": "extension",
      "regex": "^key(pair)?\$",
      "name": "Potential cryptographic private key"
    },
    {
      "part": "filename",
      "regex": "^\\.?(bash_|zsh_|sh_|z)?history\$",
      "name": "Shell command history file"
    },
    {
      "part": "filename",
      "regex": "^\\.?mysql_history\$",
      "name": "MySQL client command history file"
    },
    {
      "part": "filename",
      "regex": "^\\.?psql_history\$",
      "name": "PostgreSQL client command history file"
    },
    {
      "part": "filename",
      "regex": "^\\.?pgpass\$",
      "name": "PostgreSQL password file"
    },
    {
      "part": "filename",
      "regex": "^\\.?irb_history\$",
      "name": "Ruby IRB console history file"
    },
    {
      "part": "path",
      "regex": "\\.?purple/accounts\\.xml\$",
      "name": "Pidgin chat client account configuration file"
    },
    {
      "part": "path",
      "regex": "\\.?xchat2?/servlist_?\\.conf\$",
      "name": "Hexchat/XChat IRC client server list configuration file"
    },
    {
      "part": "path",
      "regex": "\\.?irssi/config\$",
      "name": "Irssi IRC client configuration file"
    },
    {
      "part": "path",
      "regex": "\\.?recon-ng/keys\\.db\$",
      "name": "Recon-ng web reconnaissance framework API key database"
    },
    {
      "part": "filename",
      "regex": "^\\.?dbeaver-data-sources.xml\$",
      "name": "DBeaver SQL database manager configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?muttrc\$",
      "name": "Mutt e-mail client configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?s3cfg\$",
      "name": "S3cmd configuration file"
    },
    {
      "part": "path",
      "regex": "\\.?aws/credentials\$",
      "name": "AWS CLI credentials file"
    },
    {
      "part": "filename",
      "regex": "^sftp-config(\\.json)?\$",
      "name": "SFTP connection configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?trc\$",
      "name": "T command-line Twitter client configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?(bash|zsh|csh)rc\$",
      "name": "Shell configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?(bash_|zsh_)?profile\$",
      "name": "Shell profile configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?(bash_|zsh_)?aliases\$",
      "name": "Shell command alias configuration file"
    },
    {
      "part": "filename",
      "regex": "config(\\.inc)?\\.php\$",
      "name": "PHP configuration file"
    },
    {
      "part": "extension",
      "regex": "^key(store|ring)\$",
      "name": "GNOME Keyring database file"
    },
    {
      "part": "extension",
      "regex": "^kdbx?\$",
      "name": "KeePass password manager database file"
    },
    {"part": "extension", "regex": "^sql(dump)?\$", "name": "SQL dump file"},
    {
      "part": "filename",
      "regex": "^\\.?htpasswd\$",
      "name": "Apache htpasswd file"
    },
    {
      "part": "filename",
      "regex": "^(\\.|_)?netrc\$",
      "name": "Configuration file for auto-login process"
    },
    {
      "part": "path",
      "regex": "\\.?gem/credentials\$",
      "name": "Rubygems credentials file"
    },
    {
      "part": "filename",
      "regex": "^\\.?tugboat\$",
      "name": "Tugboat DigitalOcean management tool configuration"
    },
    {
      "part": "path",
      "regex": "doctl/config.yaml\$",
      "name": "DigitalOcean doctl command-line client configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?git-credentials\$",
      "name": "git-credential-store helper credentials file"
    },
    {
      "part": "path",
      "regex": "config/hub\$",
      "name": "GitHub Hub command-line client configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?gitconfig\$",
      "name": "Git configuration file"
    },
    {
      "part": "path",
      "regex": "\\.?chef/(.*)\\.pem\$",
      "name": "Chef private key"
    },
    {
      "part": "path",
      "regex": "etc/shadow\$",
      "name": "Potential Linux shadow file"
    },
    {
      "part": "path",
      "regex": "etc/passwd\$",
      "name": "Potential Linux passwd file",
      "comment": "Contains system user information"
    },
    {
      "part": "filename",
      "regex": "^\\.?dockercfg\$",
      "name": "Docker configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?npmrc\$",
      "name": "NPM configuration file"
    },
    {
      "part": "filename",
      "regex": "^\\.?env\$",
      "name": "Environment configuration file"
    },
    {
      "part": "contents",
      "regex": "(A3T[A-Z0-9]|AKIA|AGPA|AROA|AIPA|ANPA|ANVA|ASIA)[A-Z0-9]{16}",
      "name": "AWS Access Key ID Value"
    },

    {
      "part": "contents",
      "regex":
          "((\\\"|'|`)?(aws)?_?(secret)_?(access)?_?(key)?_?(id)?(\\\"|'|`)?\\\\s{0,50}(:|=>|=)\\\\s{0,50}(\\\"|'|`)?[A-Za-z0-9/+=]{40}(\\\"|'|`)?)",
      "name": "AWS Secret Access Key"
    },

    {
      "part": "contents",
      "regex": "EAACEdEose0cBA[0-9A-Za-z]+",
      "name": "Facebook access token"
    },
    {
      "part": "contents",
      "regex": "(?:r|s)k_[live|test]_[0-9a-zA-Z]{24}",
      "name": "Stripe API key"
    },
    {
      "part": "contents",
      "regex": "[0-9]+-[0-9A-Za-z_]{32}\\.apps\\.googleusercontent\\.com",
      "name": "Google OAuth Key"
    },
    {
      "part": "contents",
      "regex": "AIza[0-9A-Za-z\\\\-_]{35}",
      "name": "Google Cloud API Key"
    },
    {
      "part": "contents",
      "regex": "ya29\\\\.[0-9A-Za-z\\\\-_]+",
      "name": "Google OAuth Access Token"
    },
    {
      "part": "contents",
      "regex": "sk_[live|test]_[0-9a-z]{32}",
      "name": "Picatic API key"
    },
    {
      "part": "contents",
      "regex": "sq0atp-[0-9A-Za-z\\-_]{22}",
      "name": "Square Access Token"
    },
    {
      "part": "contents",
      "regex": "sq0csp-[0-9A-Za-z\\-_]{43}",
      "name": "Square OAuth Secret"
    },
    {
      "part": "contents",
      "regex": "access_token\\\$production\\\$[0-9a-z]{16}\\\$[0-9a-f]{32}",
      "name": "PayPal/Braintree Access Token"
    },
    {
      "part": "contents",
      "regex":
          "amzn\\.mws\\.[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}",
      "name": "Amazon MWS Auth Token"
    },
    {"part": "contents", "regex": "SK[0-9a-fA-F]{32}", "name": "Twilo API Key"},
    {
      "part": "contents",
      "regex": "SG\\.[0-9A-Za-z\\-_]{22}\\.[0-9A-Za-z\\-_]{43}",
      "name": "SendGrid API Key"
    },
    {
      "part": "contents",
      "regex": "key-[0-9a-zA-Z]{32}",
      "name": "MailGun API Key"
    },
    {
      "part": "contents",
      "regex": "[0-9a-f]{32}-us[0-9]{12}",
      "name": "MailChimp API Key"
    },
    {
      "part": "contents",
      "regex": "sshpass -p.*['|\\\"]",
      "name": "SSH Password"
    },
    {
      "part": "contents",
      "regex":
          "(https\\\\://outlook\\\\.office.com/webhook/[0-9a-f-]{36}\\\\@)",
      "name": "Outlook team"
    },
    // {
    //   "part": "contents",
    //   "regex": "sauce.{0,50}(\\\"|'|`)?[0-9a-f-]{36}(\\\"|'|`)?",
    //   "name": "Sauce Token"
    // },
    {
      "part": "contents",
      "regex": "(xox[pboa]-[0-9]{12}-[0-9]{12}-[0-9]{12}-[a-z0-9]{32})",
      "name": "Slack Token"
    },
    {
      "part": "contents",
      "regex":
          "https://hooks.slack.com/services/T[a-zA-Z0-9_]{8}/B[a-zA-Z0-9_]{8}/[a-zA-Z0-9_]{24}",
      "name": "Slack Webhook"
    },
    {
      "part": "contents",
      "regex":
          "([\\w+]{1,24})(://)([^\$<]{1})([^\\s\";]{1,}):([^\$<]{1})([^\\s\";/]{1,})@[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,24}([^\\s]+)",
      "name": "Username and password in URI"
    },
    {"part": "contents", "regex": "oy2[a-z0-9]{43}", "name": "NuGet API Key"},
    {
      "part": "contents",
      "regex": "hawk\\.[0-9A-Za-z\\-_]{20}\\.[0-9A-Za-z\\-_]{20}",
      "name": "StackHawk API Key"
    },
    {
      "part": "extension",
      "regex": ".*\.ppk",
      "name": "Potential PuTTYgen private key"
    },
    {
      "part": "filename",
      "regex": ".*heroku.json",
      "name": "Heroku config file"
    },
    {"part": "extension", "regex": ".*\.sqldump", "name": "SQL Data dump file"},
    {
      "part": "filename",
      "regex": "dump.sql",
      "name": "MySQL dump w/ bcrypt hashes"
    },
    {"part": "filename", "regex": ".*id_rsa_pub", "name": "Public ssh key"},
    {
      "part": "filename",
      "regex": ".*mongoid.yml",
      "name": "Mongoid config file"
    },
    {
      "part": "filename",
      "regex": ".*salesforce.js",
      "name": "Salesforce credentials in a nodejs project"
    },
    {
      "part": "extension",
      "regex": ".*\.netrc",
      "name": "netrc with SMTP credentials"
    },
    {
      "part": "filename",
      "regex": ".remote-sync.json\$",
      "name":
          "Created by remote-sync for Atom, contains FTP and/or SCP/SFTP/SSH server details and credentials"
    },
    {"part": "filename", "regex": ".esmtprc\$", "name": "esmtp configuration"},
    {
      "part": "filename",
      "regex": "^deployment-config.json?\$",
      "name":
          "Created by sftp-deployment for Atom, contains server details and credentials"
    },
    {
      "part": "filename",
      "regex": ".ftpconfig\$",
      "name":
          "Created by sftp-deployment for Atom, contains server details and credentials"
    },
    {
      "part": "contents",
      "regex": "-----BEGIN (EC|RSA|DSA|OPENSSH|PGP) PRIVATE KEY",
      "name": "Contains a private key"
    },
    {
      "part": "contents",
      "regex":
          "define(.{0,20})?(DB_CHARSET|NONCE_SALT|LOGGED_IN_SALT|AUTH_SALT|NONCE_KEY|DB_HOST|DB_PASSWORD|AUTH_KEY|SECURE_AUTH_KEY|LOGGED_IN_KEY|DB_NAME|DB_USER)(.{0,20})?['|\"].{10,120}['|\"]",
      "name": "WP-Config"
    },
    {
      "part": "contents",
      "regex":
          "(aws_access_key_id|aws_secret_access_key)(.{0,20})?=.[0-9a-zA-Z\\/+]{20,40}",
      "name": "AWS cred file info"
    },
    {
      "part": "contents",
      "regex": "(facebook|fb)(.{0,20})?(?-i)['\\\"][0-9a-f]{32}['\\\"]",
      "name": "Facebook Secret Key"
    },
    {
      "part": "contents",
      "regex": "(facebook|fb)(.{0,20})?['\\\"][0-9]{13,17}['\\\"]",
      "name": "Facebook Client ID"
    },
    {
      "part": "contents",
      "regex": "twitter(.{0,20})?['\\\"][0-9a-z]{35,44}['\\\"]",
      "name": "Twitter Secret Key"
    },
    {
      "part": "contents",
      "regex": "twitter(.{0,20})?['\\\"][0-9a-z]{18,25}['\\\"]",
      "name": "Twitter Client ID"
    },
    {
      "part": "contents",
      "regex": "github(.{0,20})?(?-i)['\\\"][0-9a-zA-Z]{35,40}['\\\"]",
      "name": "Github Key"
    },
    {
      "part": "contents",
      "regex":
          "heroku(.{0,20})?['\"][0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}['\"]",
      "name": "Heroku API key"
    },
    {
      "part": "contents",
      "regex": "linkedin(.{0,20})?(?-i)['\\\"][0-9a-z]{12}['\\\"]",
      "name": "Linkedin Client ID"
    },
    {
      "part": "contents",
      "regex": "linkedin(.{0,20})?['\\\"][0-9a-z]{16}['\\\"]",
      "name": "LinkedIn Secret Key"
    },
    {
      "part": "path",
      "regex": "\\.?idea[\\\\\\/]WebServers.xml\$",
      "name":
          "Created by Jetbrains IDEs, contains webserver credentials with encoded passwords (not encrypted!)"
    },
    {
      "part": "path",
      "regex": "\\.?vscode[\\\\\\/]sftp.json\$",
      "name":
          "Created by vscode-sftp for VSCode, contains SFTP/SSH server details and credentials"
    },
    {
      "part": "path",
      "regex": "web[\\\\\\/]ruby[\\\\\\/]secrets.yml",
      "name": "Ruby on rails secrets.yml file (contains passwords)"
    },
    {
      "part": "path",
      "regex": "\\.?docker[\\\\\\/]config.json\$",
      "name": "Docker registry authentication file"
    },
    {
      "part": "path",
      "regex": "ruby[\\\\\\/]config[\\\\\\/]master.key\$",
      "name":
          "Rails master key (used for decrypting credentials.yml.enc for Rails 5.2+)"
    },
    {
      "part": "path",
      "regex": "\\.?mozilla[\\\\\\/]firefox[\\\\\\/]logins.json\$",
      "name":
          "Firefox saved password collection (can be decrypted using keys4.db)"
    }
  ];
}
