class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :morningstar_rating
      t.string :name
      t.string :symbol
      t.string :category
      t.string :description
      t.string :price
      t.string :expense_ratio
      t.string :div_yield
      t.string :ytd_return
      t.string :five_yr_return
      t.string :total_assets
      t.string :rank_in_category
      t.string :percent_rank_in_category

      t.string :morningstar_risk_rating
      t.string :num_yrs_up
      t.string :num_yrs_down
      t.string :best_one_yr_return
      t.string :worst_one_yr_return

      t.string :three_yr_alpha
      t.string :three_yr_alpha_cat
      t.string :three_yr_beta
      t.string :three_yr_beta_cat
      t.string :three_yr_mean_annual_return
      t.string :three_yr_mean_annual_return_cat
      t.string :three_yr_r_squared
      t.string :three_yr_r_squared_cat
      t.string :three_yr_std_deviation
      t.string :three_yr_std_deviation_cat
      t.string :three_yr_sharpe_ratio
      t.string :three_yr_sharpe_ratio_cat
      t.string :three_yr_treynor_ratio
      t.string :three_yr_treynor_ratio_cat

      t.string :five_yr_alpha
      t.string :five_yr_alpha_cat
      t.string :five_yr_beta
      t.string :five_yr_beta_cat
      t.string :five_yr_mean_annual_return
      t.string :five_yr_mean_annual_return_cat
      t.string :five_yr_r_squared
      t.string :five_yr_r_squared_cat
      t.string :five_yr_std_deviation
      t.string :five_yr_std_deviation_cat
      t.string :five_yr_sharpe_ratio
      t.string :five_yr_sharpe_ratio_cat
      t.string :five_yr_treynor_ratio
      t.string :five_yr_treynor_ratio_cat

      t.string :ten_yr_alpha
      t.string :ten_yr_alpha_cat
      t.string :ten_yr_beta
      t.string :ten_yr_beta_cat
      t.string :ten_yr_mean_annual_return
      t.string :ten_yr_mean_annual_return_cat
      t.string :ten_yr_r_squared
      t.string :ten_yr_r_squared_cat
      t.string :ten_yr_std_deviation
      t.string :ten_yr_std_deviation_cat
      t.string :ten_yr_sharpe_ratio
      t.string :ten_yr_sharpe_ratio_cat
      t.string :ten_yr_treynor_ratio
      t.string :ten_yr_treynor_ratio_cat

      t.timestamps
    end
  end
end