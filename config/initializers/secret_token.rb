# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
ValueObjectsExample::Application.config.secret_token =
  ENV['SECRET_TOKEN'] ||
  '1306b4bc21b03cdfd308c2a7ae16ee65fcd96a4f927685282e631b28dc1204bc69171a9885fb5534b9ae573d6d2d8ae650f672b65a9e4295691578b7b81a4649'
