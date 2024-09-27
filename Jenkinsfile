pipeline {
    agent any
    parameters{
        booleanParam(name: 'IsHotfix', defaultValue: false, description: 'Zaškrtněte, je-li release HotFix')
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
    }
}
