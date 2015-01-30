From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom: handle input-enable pinconf property
Date: Fri, 30 Jan 2015 08:20:05 -0800
Message-ID: <20150130162004.GT11960@sonymobile.com>
References: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
 <1422613644-13060-4-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:13220 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751976AbbA3QUI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 30 Jan 2015 11:20:08 -0500
Content-Disposition: inline
In-Reply-To: <1422613644-13060-4-git-send-email-svarbanov@mm-sol.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>

On Fri 30 Jan 02:27 PST 2015, Stanimir Varbanov wrote:

> This enables support of 'input-enable' pinconf generic property in
> the pinctrl driver.

Patch looks good, but I think the api is broken for boolean properties.

> 
> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index b66cd58..55a64ea 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -193,6 +193,7 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
>  		*mask = 7;
>  		break;
>  	case PIN_CONFIG_OUTPUT:
> +	case PIN_CONFIG_INPUT_ENABLE:
>  		*bit = g->oe_bit;
>  		*mask = 1;
>  		break;
> @@ -260,6 +261,12 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
>  		val = readl(pctrl->regs + g->io_reg);
>  		arg = !!(val & BIT(g->in_bit));
>  		break;
> +	case PIN_CONFIG_INPUT_ENABLE:
> +		/* Pin is output */
> +		if (arg)
> +			return -EINVAL;
> +		arg = 1;
> +		break;

My idea of this function is to query if we have the specific option
enabled, so I don't like the fact that we're returning an error here, we
should just return 0 with arg 0 (or something like that).

However, that would not give the results we expect and your patch is
"correct".

Linus, conf_items in pinconf_generic_dump_one() seems to represent
boolean properties of the pins. Returning 0 from pin_config_*_get()
should in my view then be treated as it not being active.

Is this in line with your view and should we modify
pinconf_generic_dump_one() to continue for these values if the getter
returns 0?


If not, at least all the bias properties here should return -EINVAL as
well. (which I think is wrong)

>  	default:
>  		return -EINVAL;
>  	}
> @@ -330,6 +337,10 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
>  			/* enable output */
>  			arg = 1;
>  			break;
> +		case PIN_CONFIG_INPUT_ENABLE:
> +			/* disable output */
> +			arg = 0;
> +			break;
>  		default:
>  			dev_err(pctrl->dev, "Unsupported config parameter: %x\n",
>  				param);

Regards,
Bjorn
