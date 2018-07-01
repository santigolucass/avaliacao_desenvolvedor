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
    imported = true
    if params[:purchase]
      file = params[:purchase][:process_file] if params[:purchase]
      if file.content_type == 'text/plain' # #Check file format.
        begin
          file_value = Purchase.process(file.read)
        rescue StandardError
          imported = false
          error = 'Something went wrong with file processing.'
        end
      else
        imported = false
        error = 'Format not supported.'
      end
      respond_to do |format|
        if imported
          format.html { redirect_to purchases_url }
          flash[:notice] = "File processed with success. The total value of the purchases was R$#{file_value}"
        else
          format.html { redirect_to purchases_url }
          flash[:error] = error
        end
      end
    else
      redirect_to purchases_path
      flash[:error] = 'Upload a file to process.'
    end
  end

  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:process_file)
  end
  end
