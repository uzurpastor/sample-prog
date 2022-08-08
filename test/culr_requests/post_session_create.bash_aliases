#!/bin/bash

curl -X POST localhost:3000/login \
  -H "Content-Type: application/json" \
  -d '{
        "session":
        {
          "email": "shevchenko@mail.com",
          "password": "passwd",
          "remember_me": "1"
        }
      }' \
  -v -o /dev/null