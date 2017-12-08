FROM ruby:2-onbuild
EXPOSE 9292
CMD ["bundle", "exec", "rackup"]
