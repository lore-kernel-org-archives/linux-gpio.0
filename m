From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH RESEND] pinctrl: freescale: make of_device_id array const
Date: Mon, 2 Mar 2015 19:38:28 +0800
Message-ID: <20150302113826.GB3040@dragon>
References: <1425281101-6033-1-git-send-email-sanjeev_sharma@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:43168 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbbCBLio (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 06:38:44 -0500
Received: by pdjp10 with SMTP id p10so1810320pdj.10
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2015 03:38:44 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1425281101-6033-1-git-send-email-sanjeev_sharma@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sanjeev Sharma <sanjeev_sharma@mentor.com>
Cc: linus.walleij@linaro.org, stefan@agner.ch, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 02, 2015 at 12:55:01PM +0530, Sanjeev Sharma wrote:
> Make of_device_id array const.
> 
> Signed-off-by: Sanjeev Sharma <Sanjeev_Sharma@mentor.com>

Acked-by: Shawn Guo <shawn.guo@linaro.org>

> ---
>  drivers/pinctrl/freescale/pinctrl-vf610.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c b/drivers/pinctrl/freescale/pinctrl-vf610.c
> index fc86276..37a0375 100644
> --- a/drivers/pinctrl/freescale/pinctrl-vf610.c
> +++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
> @@ -302,7 +302,7 @@ static struct imx_pinctrl_soc_info vf610_pinctrl_info = {
>  	.flags = SHARE_MUX_CONF_REG,
>  };
>  
> -static struct of_device_id vf610_pinctrl_of_match[] = {
> +static const struct of_device_id vf610_pinctrl_of_match[] = {
>  	{ .compatible = "fsl,vf610-iomuxc", },
>  	{ /* sentinel */ }
>  };
> -- 
> 1.7.11.7
> 
