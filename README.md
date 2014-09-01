# SH24 Exercise 1

### Usage

Search for a github account using a web form.

Alternatively browse directly via a valid url, for example:

For example:
```
[
  /github_accounts/neilbilly
]
```

With a valid account the system will return counts of dominate languages used in the account's projects and suggest a favorite language based on which one is most common.

### Language and Framework

Ruby 2.1.2
Ruby on Rails 4.1.1

### Testing

BDD using RSpec and Capybara

### Github rate limits.

This system is restricted to a small number of queries by Github ([more info...](https://developer.github.com/v3/#rate-limiting))
