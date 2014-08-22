require 'spec_fast_helper'
require 'i18n'
require 'hydramata/core/translator'

module Hydramata
  module Core
    describe 'Translation services' do

      it 'allows overriding the :base_scope and nested lookup of scopes' do
        result = Translator.translate('my_message_key', base_scope: ['other'], scopes: ['nested'], name: 'Jeremy')
        expect(result).to eq('Thanks but no thanks Jeremy!')
      end

      it 'has a default :base_scope' do
        result = Translator.translate('my_message_key', name: 'Jeremy')
        expect(result).to eq('Thanks Jeremy!')
      end

      around do |example|
        begin
          # @TODO - The structure of the hash is not ideal. The order of keys is
          # somewhat counter-intuitive.
          old_backend = I18n.backend
          I18n.backend = old_backend.clone
          core = Psych.load_file(File.expand_path('../../fixtures/core.translations.yml', __FILE__))
          I18n.backend.store_translations(:en, core.fetch('en'))
          example.run
        ensure
          I18n.backend = old_backend
        end
      end

    end
  end
end
