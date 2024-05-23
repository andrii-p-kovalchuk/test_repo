/* groovylint-disable DuplicateStringLiteral */
pipeline {
    agent any
    parameters {
        choice(name: 'DESTROY', choices: ['Yes', 'No'], description: 'Do you want to destroy terraform after building?')
    }
    stages {
        // stage('Git checkout') {
        //     steps {
        //         echo 'Git checkout'
        //         git branch: '01_test_branch', credentialsId: 'github', url: 'git@github.com:andrii-p-kovalchuk/test_repo.git'
        //     }
        // }
        stage('Terraform init') {
            steps {
                echo 'Terraform init'
                sh 'terraform init'
            }
        }
        stage('Terraform format') {
            steps {
                echo 'Terraform format'
                sh 'terraform fmt && terraform validate'
            }
        }
        stage('Terraform Plan') {
            steps {
                echo 'Terraform plan'
                sh 'terraform plan'
            }
        }
        stage('Terraform apply') {
            steps {
                echo 'Terraform apply'
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Ansible') {
            steps {
                echo 'Ansible'
                sh 'ansible-playbook first_playbook.yml'
            }
        }
        stage('Terraform destroy') {
            steps {
                script {
                    if ("${params.DESTROY}" == 'Yes') {
                        echo 'Terraform destroy'
                        sh 'terraform destroy -auto-approve'
                    } else {
                        echo 'Jankins ended succeded!'
                }
            }
        }
    }
}
}
