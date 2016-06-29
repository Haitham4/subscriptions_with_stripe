class ChargesController < ApplicationController
  before_action :set_charge, only: [:show]

  # GET /charges/1
  # GET /charges/1.json
  def show
    respond_to do |format|
      format.pdf do
        send_data(@charge.to_pdf.render,
                  filename: "Testing.pdf",
                  type: "application/pdf",
                  disposition: :inline)
      end

      format.html {render 'charges/show'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end
end
