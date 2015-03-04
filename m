From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: handle input-enable pinconf
 property
Date: Wed, 4 Mar 2015 06:38:53 -0800
Message-ID: <20150304143853.GO26334@sonymobile.com>
References: <1425465717-27747-1-git-send-email-svarbanov@mm-sol.com>
 <1425465717-27747-3-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:5163 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757194AbbCDOjA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Mar 2015 09:39:00 -0500
Content-Disposition: inline
In-Reply-To: <1425465717-27747-3-git-send-email-svarbanov@mm-sol.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>

On Wed 04 Mar 02:41 PST 2015, Stanimir Varbanov wrote:

> This enables support of 'input-enable' pinconf generic property in
> the pinctrl driver.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index d36e511..f3d800f 100644
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

I still don't like this part of the api, but the patch is

Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

>  	default:
>  		return -ENOTSUPP;
>  	}

Regards,
Bjorn
