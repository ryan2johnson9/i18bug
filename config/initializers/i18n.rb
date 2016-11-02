#  PROBLEM
# I18n.t(:'i18n.plural.rule', :locale => 'en', :resolve => false)
# => "translation missing: en.i18n.plural.rule"

require "i18n/backend/pluralization"

I18n::Backend::KeyValue.send(:include, I18n::Backend::Pluralization)

I18n.backend= I18n::Backend::KeyValue.new(Redis.new(db: 0, password: 123456))
# swap above line for below lines and the problem is resolved
# I18n.backend= I18n::Backend::Chain.new(
#     I18n::Backend::KeyValue.new(Redis.new(db: 0, password: 123456)),
#     I18n.backend
# ) #need chained backend because pluralization is not working with only KeyValue backend

