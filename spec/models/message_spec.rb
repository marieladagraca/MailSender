require 'rails_helper'

RSpec.describe Message, type: :model do
  
  describe '#validations' do
    subject { message.errors }

    let(:message) { described_class.new(message_attributes) }

    before { message.valid? }

    context 'when it validates presence of to_name' do
      context 'with to_name' do
        let(:message_attributes) { { to_name: 'John' } }
        
        it 'does not fail validation' do
          expect(subject).not_to include :to_name
        end
      end

      context 'without to_name' do
        let(:message_attributes) { { email: 'john@test.com' } }
        
        it 'fails validation' do
          expect(subject).to include :to_name
        end
      end
    end

    context 'when it validates presence of email' do
      context 'with valid email' do
        let(:message_attributes) { { email: 'john@test.com' } }
        
        it 'does not fail validation' do
          expect(subject).not_to include :email
        end
      end

      context 'with invalid email' do
        let(:message_attributes) { { email: 'john@test' } }
        
        it 'fails validation' do
          expect(subject).to include :email
        end
      end

      context 'without email' do
        let(:message_attributes) { { to_name: 'John' } }
        
        it 'fails validation' do
          expect(subject).to include :email
        end
      end
    end

    context 'when it validates presence of from_name' do
      context 'with from_name' do
        let(:message_attributes) { { from_name: 'John' } }
        
        it 'does not fail validation' do
          expect(subject).not_to include :from_name
        end
      end

      context 'without from_name' do
        let(:message_attributes) { { from: 'paul@test.com' } }
        
        it 'fails validation' do
          expect(subject).to include :from_name
        end
      end
    end

    context 'when it validates presence of from email' do
      context 'with valid email' do
        let(:message_attributes) { { from: 'john@test.com' } }
        
        it 'does not fail validation' do
          expect(subject).not_to include :from
        end
      end

      context 'with invalid email' do
        let(:message_attributes) { { from: 'john.' } }
        
        it 'fails validation' do
          expect(subject).to include :from
        end
      end

      context 'without email' do
        let(:message_attributes) { { from_name: 'Paul' } }
        
        it 'fails validation' do
          expect(subject).to include :from
        end
      end
    end

    context 'when it validates presence of body' do
      context 'with body' do
        let(:message_attributes) { { body: 'Hello World' } }
        
        it 'does not fail validation' do
          expect(subject).not_to include :body
        end
      end

      context 'without body' do
        let(:message_attributes) { { email: 'john@test.com' } }
        
        it 'fails validation' do
          expect(subject).to include :body
        end
      end
    end

    context 'when it validates presence of subject' do
      context 'with subject' do
        let(:message_attributes) { { subject: 'Hello World' } }
        
        it 'does not fail validation' do
          expect(subject).not_to include :subject
        end
      end

      context 'without body' do
        let(:message_attributes) { { email: 'john@test.com' } }
        
        it 'fails validation' do
          expect(subject).to include :subject
        end
      end
    end
  end
end
