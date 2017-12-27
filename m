From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: Delete an error message for a failed
 memory allocation in msm_pinctrl_probe()
Date: Wed, 27 Dec 2017 15:13:48 -0800
Message-ID: <20171227231348.GG478@tuxbook>
References: <0d5eae19-c8f9-3280-e68e-419646535512@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0d5eae19-c8f9-3280-e68e-419646535512@users.sourceforge.net>
Sender: linux-arm-msm-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed 27 Dec 13:10 PST 2017, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Dec 2017 22:04:22 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thank's Markus,

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 7a960590ecaa..495432f3341b 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -898,10 +898,9 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  	int ret;
>  
>  	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> -	if (!pctrl) {
> -		dev_err(&pdev->dev, "Can't allocate msm_pinctrl\n");
> +	if (!pctrl)
>  		return -ENOMEM;
> -	}
> +
>  	pctrl->dev = &pdev->dev;
>  	pctrl->soc = soc_data;
>  	pctrl->chip = msm_gpio_template;
> -- 
> 2.15.1
> 
