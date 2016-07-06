From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] pinctrl: imx21: include linux/module.h
Date: Wed, 6 Jul 2016 09:21:39 -0400
Message-ID: <20160706132139.GE26134@windriver.com>
References: <20160706125254.1663066-1-arnd@arndb.de>
 <CAOMZO5APrVUAi+QbnLVJ61T_oJRQQDF_eLi8_HeqK=L+aVBzwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:36573 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754174AbcGFNVv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 6 Jul 2016 09:21:51 -0400
Content-Disposition: inline
In-Reply-To: <CAOMZO5APrVUAi+QbnLVJ61T_oJRQQDF_eLi8_HeqK=L+aVBzwQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

[Re: [PATCH] pinctrl: imx21: include linux/module.h] On 06/07/2016 (Wed 10:15) Fabio Estevam wrote:

> Hi Arnd,
> 
> On Wed, Jul 6, 2016 at 9:52 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > The pinctrl driver includes a device table, but the macro used for
> > declaring it is declared in a header that is not visible here:
> >
> > drivers/pinctrl/freescale/pinctrl-imx21.c:328:1: error: data definition has no type or storage class [-Werror]
> >  MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);
> >
> > This adds the missing include.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Fixes: e2756baa4217 ("pinctrl: imx21: make it explicitly non-modular")
> 
> I think the correct fix here would be:
> 
> --- a/drivers/pinctrl/freescale/pinctrl-imx21.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx21.c
> @@ -325,7 +325,6 @@ static const struct of_device_id imx21_pinctrl_of_match[] =
>         { .compatible = "fsl,imx21-iomuxc", },
>         { }
>  };
> -MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);
> 
>  static struct platform_driver imx21_pinctrl_driver = {
>         .driver = {
> 
> 
> If you agree I can send a formal patch.

Yes, deleting the MODULE_DEVICE_TABLE is the right fix.  I'm curious why
that never showed up in all the build coverage I did...

Paul.
--
