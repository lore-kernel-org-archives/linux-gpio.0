From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH][next] pinctrl: actions: fix missing break in
 PIN_CONFIG_DRIVE_STRENGTH case.
Date: Mon, 30 Apr 2018 18:49:08 +0530
Message-ID: <20180430131908.gaah7bkt4htjibbs@linaro.org>
References: <20180430131420.6155-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180430131420.6155-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Colin,

On Mon, Apr 30, 2018 at 02:14:20PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a missing break in case PIN_CONFIG_DRIVE_STRENGTH leading to
> a fall-through to the PIN_CONFIG_SLEW_RATE case that performs different
> checks against *arg. This looks like an unintentional missing break so
> add in the break.
> 

Yes, break has been left out by mistake. Thanks for fixing!

> Detected by CoverityScan, CID#1468459 ("Missing break in switch")
> 
> Fixes: 513d7a2f7e0f ("pinctrl: actions: Add Actions S900 pinctrl driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> 

Thanks,
Mani

> ---
>  drivers/pinctrl/actions/pinctrl-owl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
> index 928b40f71a3c..d15abb97821e 100644
> --- a/drivers/pinctrl/actions/pinctrl-owl.c
> +++ b/drivers/pinctrl/actions/pinctrl-owl.c
> @@ -441,6 +441,7 @@ static int owl_group_pinconf_val2arg(const struct owl_pingroup *g,
>  		default:
>  			return -EINVAL;
>  		}
> +		break;
>  	case PIN_CONFIG_SLEW_RATE:
>  		if (*arg)
>  			*arg = 1;
> -- 
> 2.17.0
> 
