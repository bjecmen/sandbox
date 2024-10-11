pipeline {
    agent any
    parameters{
        booleanParam(name: 'IsHotfix', defaultValue: false, description: 'Zaškrtněte, je-li release HotFix')
    }

     environment {
        REMOTE_USER = 'git'                      // Uživatelské jméno na vzdáleném serveru
        REMOTE_HOST = '172.17.0.2'            // IP adresa nebo hostname vzdáleného serveru
        REMOTE_SCRIPT_PATH = '/usr/local/bin/log-ip.sh' // Cesta ke skriptu na vzdáleném serveru
        SSH_KEY_PATH = '/Users/bjecmen/.ssh/id_rsa'  // Cesta k privátnímu SSH klíči Jenkins agenta (může být jiná)
    }

    stages {
        stage('Compile') {
            steps {
                echo 'Kopirovani kodu na HERAS'
                echo 'Oveřovací kompilace'
            }
        }
        stage('Validate') {
            steps {
                echo 'Validace kompilace'
                 script {
                    // Příkaz k připojení a spuštění skriptu na vzdáleném serveru přes SSH
                    sh """
                    ssh -i ${SSH_KEY_PATH} -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_HOST} 'bash ${REMOTE_SCRIPT_PATH}'
                    """
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Kopírování do jednoho ze tří adresářů'
                echo 'Rekompilace pro cílovou DB'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Překlopení'
                
            }
        }
        stage('HotFix') {
            when {
                    expression {
                        return params.IsHotfix
                    }
                    
                }
            steps {
                echo 'HotFix identifikován'
                echo 'Kopírování do Hotfix'
            }
        }
    }
}
