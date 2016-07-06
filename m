From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pinctrl: imx21: include linux/module.h
Date: Wed, 06 Jul 2016 15:20:04 +0200
Message-ID: <3638123.Y5hU8jV7GH@wuerfel>
References: <20160706125254.1663066-1-arnd@arndb.de> <CAOMZO5APrVUAi+QbnLVJ61T_oJRQQDF_eLi8_HeqK=L+aVBzwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:58888 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753516AbcGFNRF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 09:17:05 -0400
In-Reply-To: <CAOMZO5APrVUAi+QbnLVJ61T_oJRQQDF_eLi8_HeqK=L+aVBzwQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Wednesday, July 6, 2016 10:15:41 AM CEST Fabio Estevam wrote:
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

Fine with me too.

	Arnd

