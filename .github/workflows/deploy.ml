

name: CI - Test and Validate

on:
    push:
        branches: [ "main" ]
    pull_request:

jobs:
    test:
        runs-on: ubuntu-latest
        steps:
            - uses: actions/checkout@v4

            - name: Setup Node.js
              uses: actions/setup-node@v4
              with:
                node-version: 18

            - name: Install dependencies & run tests
              working-directory: app
              run: |
                npm ci
                npm test

            - name: Validate Terraform
              working-directory: infra
              run: |
                terraform init -backend=false
                terraform fmt -check
                terraform validate
