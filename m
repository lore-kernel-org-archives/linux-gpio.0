From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v3 0/3] pinctrl: msm interrupt and muxing fixes
Date: Mon, 1 Oct 2018 21:34:14 +0200
Message-ID: <20181001193414.GA4441@centauri.lan>
References: <20180816200648.90458-1-swboyd@chromium.org>
 <20180912103431.GA27204@centauri.ideon.se>
 <153841961783.119890.13486677118739554119@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153841961783.119890.13486677118739554119@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 01, 2018 at 11:46:57AM -0700, Stephen Boyd wrote:
> Quoting Niklas Cassel (2018-09-12 03:34:31)
> > Hello Stephen,
> > 
> > I'm getting this warning on dragonboard 820c (msm8996) when booting linux-next:
> > 
> > [    3.211575] WARNING: CPU: 1 PID: 1 at drivers/pinctrl/qcom/pinctrl-msm.c:164 msm_pinmux_set_mux+0xc8/0x150
> > [    3.212127] l28: ramp_delay not set
> 
> Thanks for testing. I think the problem is I messed up the function 0
> and enum 0. Can you try this patch?

Hello Stephen,

This patch does indeed remove the warning.
Thanks!

Kind regards,
Niklas

> 
> --8<---
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
