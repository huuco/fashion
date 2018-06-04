class Admin::PaymentsController < Admin::BaseController
  before_action :load_payments, only: %i(edit update destroy)

  def index
    @payments = Payment.list_payments.
      page(params[:page]).per Settings.limit_page
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new payment_params

    if @payment.save
      flash[:success] = t "create_succeed"
      redirect_to admin_payments_path
    else
      flash[:danger] = t "create_failed"
      render :new
    end
  end

  def edit; end

  def update
    if @payment.update_attributes payment_params
      flash[:success] = t "update_succeed"
      redirect_to admin_payments_path
    else
      flash[:danger] = t "update_failed"
      render :edit
    end
  end

  def destroy
    if @payment.destroy
      flash[:success] = t("delete_success")
    else
      flash[:warning] = t("delete_error")
    end
    redirect_to admin_payments_path
  end

  private

  def payment_params
    params.require(:payment).permit Payment::PARAMS
  end

  def load_payments
    @payment = Payment.find_by id: params[:id]
    return if @payment
    flash[:danger] = t "not_found"
    redirect_to payment_path
  end
end
