From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pinctrl: zynq: change error code for pinctrl_register failure
Date: Tue, 26 May 2015 10:12:13 +0200
Message-ID: <4437293.G26yCXqFQH@wuerfel>
References: <1432613909-13457-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:58655 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751438AbbEZIMU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2015 04:12:20 -0400
In-Reply-To: <1432613909-13457-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>

On Tuesday 26 May 2015 13:18:29 Masahiro Yamada wrote:
> diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
> index 04748a4..0ff653c 100644
> --- a/drivers/pinctrl/pinctrl-zynq.c
> +++ b/drivers/pinctrl/pinctrl-zynq.c
> @@ -1141,7 +1141,7 @@ static int zynq_pinctrl_probe(struct platform_device *pdev)
>  
>         pctrl->pctrl = pinctrl_register(&zynq_desc, &pdev->dev, pctrl);
>         if (!pctrl->pctrl)
> -               return -ENOMEM;
> +               return -EINVAL;
>  
>         platform_set_drvdata(pdev, pctrl);
>  
> 

One choice seems as bad as the other to me ;-)

Could we add a pinctrl_register_reason() variant that returns a meaningful
error code as ERR_PTR?

	Arnd
