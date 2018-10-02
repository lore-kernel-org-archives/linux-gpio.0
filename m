From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: Actually use function 0 for gpio selection
Date: Mon, 1 Oct 2018 20:50:10 -0700
Message-ID: <20181002035010.GB5008@tuxbook-pro>
References: <20181001214905.12149-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181001214905.12149-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Niklas Cassel <niklas.cassel@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Mon 01 Oct 14:49 PDT 2018, Stephen Boyd wrote:

> This code needs to select function #0, which is the first int in the
> array of functions, not the number 0 which may or may not be the
> function for "GPIO mode" per the enum mapping. We were getting lucky on
> SDM845, where this was tested, because the function 0 matched the enum
> value for "GPIO mode". On other platforms, e.g. MSM8996, the gpio enum
> value is the last one in the list so this code doesn't work and we see a
> warning at boot. Fix it by grabbing the first element out of the array
> of functions.
> 
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Niklas Cassel <niklas.cassel@linaro.org>
> Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
> Fixes: 1de7ddb3a15c ("pinctrl: msm: Mux out gpio function with gpio_request()")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Oops...

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 1684b2da09d5..b925b8feac95 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -188,7 +188,7 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
>  		return 0;
>  
>  	/* For now assume function 0 is GPIO because it always is */
> -	return msm_pinmux_set_mux(pctldev, 0, offset);
> +	return msm_pinmux_set_mux(pctldev, g->funcs[0], offset);
>  }
>  
>  static const struct pinmux_ops msm_pinmux_ops = {
> -- 
> Sent by a computer through tubes
> 
