From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] pinctrl: msm: Add sleep pinctrl state transitions
Date: Fri, 16 Nov 2018 12:14:24 -0800
Message-ID: <20181116201424.GQ10915@tuxbook-pro>
References: <20181116185853.128207-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116185853.128207-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri 16 Nov 10:58 PST 2018, Evan Green wrote:

> Add PM suspend callbacks to the msm core driver that select the
> sleep and default pinctrl states. Then wire those callbacks up
> in the sdm845 driver, for those boards that may have GPIO hogs
> that need to change state during suspend.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> Changes in v2:
>  - Moved dev_pm_ops structure to pinctrl-msm [Bjorn]
> 
>  drivers/pinctrl/qcom/pinctrl-msm.c    | 19 +++++++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.h    |  2 ++
>  drivers/pinctrl/qcom/pinctrl-sdm845.c |  1 +
>  3 files changed, 22 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 7c7d083e2c0dc..87cbebe217fd2 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1072,6 +1072,25 @@ static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
>  		}
>  }
>  
> +static int msm_pinctrl_suspend(struct device *dev)
> +{
> +	struct msm_pinctrl *pctrl = dev_get_drvdata(dev);
> +
> +	return pinctrl_force_sleep(pctrl->pctrl);
> +}
> +
> +static int msm_pinctrl_resume(struct device *dev)
> +{
> +	struct msm_pinctrl *pctrl = dev_get_drvdata(dev);
> +
> +	return pinctrl_force_default(pctrl->pctrl);
> +}
> +
> +SIMPLE_DEV_PM_OPS(msm_pinctrl_dev_pm_ops, msm_pinctrl_suspend,
> +		  msm_pinctrl_resume);
> +
> +EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
> +
>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data)
>  {
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index 29172fdf5882c..c12048e54a6f0 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -123,6 +123,8 @@ struct msm_pinctrl_soc_data {
>  	unsigned int ntiles;
>  };
>  
> +extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> +
>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data);
>  int msm_pinctrl_remove(struct platform_device *pdev);
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> index 2ab7a88857579..c97f20fca5fd3 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> @@ -1300,6 +1300,7 @@ static const struct of_device_id sdm845_pinctrl_of_match[] = {
>  static struct platform_driver sdm845_pinctrl_driver = {
>  	.driver = {
>  		.name = "sdm845-pinctrl",
> +		.pm = &msm_pinctrl_dev_pm_ops,
>  		.of_match_table = sdm845_pinctrl_of_match,
>  	},
>  	.probe = sdm845_pinctrl_probe,
> -- 
> 2.16.4
> 
