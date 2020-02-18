require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe '#create' do
    subject(:send_email) { post :create, params: create_params }
    
    context 'with Sendgrid' do
      let(:sendgrid) { SendgridSender.new }
      before do
        Rails.configuration.mail_strategy = 'sendgrid'
        allow(sendgrid).to receive(:send_email).and_return('Email sent') 
        send_email
      end

      context 'with valid params' do
        let(:create_params) do
          {
            email: 'john@test.com',
            to_name: 'John',
            from: 'paul@test.com',
            from_name: 'Paul',
            subject: 'Hello!',
            body: 'Hi!! How are you?'
          }
        end
        let(:expected_response) { 'Email queued to be sent' } 
        
        it 'sends an email', :aggregate_failures do
          expect(response).to have_http_status :ok
          expect(response.body).to eq(expected_response)
        end
      end

      context 'with invalid params' do
        let(:create_params) do
          {
            email: 'john@test.com',
            from: 'paul@test.com',
            from_name: 'Paul',
            body: 'Hi!! How are you?'
          }
        end
        
        it 'raises unprocessable entity error', :aggregate_failures do
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end

    context 'with Mailgun' do
      let(:mailgun) { MailgunSender.new }
      let(:expected_response) do 
        {
          "id": "<20200204070148.1.01EDF76330F99C37@sandbox735f50b086c34f0e967142d4ad6d77f8.mailgun.org>",
          "message": "Queued. Thank you."
        }.to_json
      end

      before do
        Rails.configuration.mail_strategy = 'mailgun'
        allow(mailgun).to receive(:send_email).and_return(expected_response) 
        send_email
      end

      context 'with valid params' do
        let(:create_params) do
          {
            email: 'john@test.com',
            to_name: 'John',
            from: 'paul@test.com',
            from_name: 'Paul',
            subject: 'Hello!',
            body: 'Hi!! How are you?'
          }
        end
        let(:expected_response) { 'Email queued to be sent' } 
        
        it 'sends an email', :aggregate_failures do
          expect(response).to have_http_status :ok
          expect(response.body).to eq(expected_response)
        end
      end

      context 'with invalid params' do
        let(:create_params) do
          {
            email: 'john@test.com',
            from: 'paul@test.com',
            from_name: 'Paul',
            body: 'Hi!! How are you?'
          }
        end
        
        it 'raises unprocessable entity error', :aggregate_failures do
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end
end