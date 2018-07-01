class PurchasesController < ApplicationController
    before_action :set_purchase, only: %i[show edit update destroy]

    def index
        @purchases = Purchase.all
    end

    def show; end

    def new
      @purchase = Purchase.new
    end
  
    def edit; end


    def create
    end

    def destroy

    end

    private

    def set_purchase
      @purchase = Purchase.find(params[:id])
    end
  
    def purchase_params
      params.require(:purchase).permit(:process_file)
    end

end