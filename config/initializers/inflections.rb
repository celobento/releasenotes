# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
ActiveSupport::Inflector.inflections do |inflect|
inflect.clear

# classes sistema
inflect.irregular 'sistema', 'sistemas'
inflect.irregular 'pessoa', 'pessoas'
inflect.irregular 'caracteristica', 'caracteristicas'
inflect.irregular 'observacao', 'observacoes'
inflect.irregular 'defeito', 'defeitos'
inflect.irregular 'tipo_integracao', 'tipos_integracao'
inflect.irregular 'integracao', 'integracoes'
inflect.irregular 'release_note', 'release_notes'
end