//
//  ProgrammaticUIVC.swift
//  TitlecaseConverter
//
//  Created by Nimap on 08/02/24.
//

import UIKit

class ProgrammaticUIVC: UIViewController {
    
    
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Login"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            return label
        }()
    
        var TopView : UIView?
        var LoginView : UIView?
        var tableView : UITableView?
    

        private let usernameTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Username"
            textField.borderStyle = .roundedRect
            return textField
        }()

        private let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
            textField.borderStyle = .roundedRect
            return textField
        }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(ProgrammaticUIVC.loginButtonTapped), for: .touchUpInside)
        return button
    }()

        // MARK: - View Lifecycle

        override func viewDidLoad() {
            super.viewDidLoad()
            configureUI()
        }

        // MARK: - UI Configuration

        private func configureUI() {
            view.backgroundColor = .white
            
            
            TopView = UIView()
            TopView?.backgroundColor = .lightGray
            view.addSubview(TopView!)
            
            
            LoginView = UIView()
            LoginView?.backgroundColor = .cyan
            view.addSubview(LoginView!)
            
            tableView = UITableView()
            tableView?.backgroundColor = .orange
            
            loginButton.backgroundColor = .blue
            // Add UI components to the view
            TopView!.addSubview(titleLabel)
            view.addSubview(usernameTextField)
            view.addSubview(passwordTextField)
            view.addSubview(loginButton)
            view.addSubview(tableView!)
            

            // Configure layout constraints
            titleLabel.textColor = .white
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
//                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                titleLabel.centerXAnchor.constraint(equalTo: TopView!.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: TopView!.centerYAnchor)
            ])

            usernameTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                usernameTextField.topAnchor.constraint(equalTo: TopView!.bottomAnchor, constant: 20),
                usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])

            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
                passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])

            loginButton.layer.cornerRadius = 10
            loginButton.tintColor = .white
            loginButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
                loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginButton.bottomAnchor.constraint(equalTo: LoginView!.bottomAnchor, constant: -15),
                loginButton.heightAnchor.constraint(equalToConstant: 40.0),
                loginButton.widthAnchor.constraint(equalToConstant: 80.0)
            ])
            
            LoginView?.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                LoginView!.topAnchor.constraint(equalTo: self.TopView!.bottomAnchor),
                LoginView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                LoginView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                LoginView!.heightAnchor.constraint(equalToConstant: 180.0)
            ])
            
            tableView?.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                tableView!.topAnchor.constraint(equalTo: LoginView!.bottomAnchor),
                tableView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                tableView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                tableView!.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
            
            TopView?.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                TopView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                TopView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                TopView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                
                TopView!.heightAnchor.constraint(equalToConstant: 60.0)
            ])
        }

        // MARK: - Action Methods

        @objc private func loginButtonTapped() {
            // Add your login logic here
            print("Login button tapped")
        }
}
extension ProgrammaticUIVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "SubtitleCell")
            
            // Configure the cell
            cell.textLabel?.text = "Main Text"
            cell.detailTextLabel?.text = "Subtitle Text"
            
            return cell
    }
}
