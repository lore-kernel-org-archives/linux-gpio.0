From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pinctrl: imx21: include linux/module.h
Date: Wed, 06 Jul 2016 15:45:31 +0200
Message-ID: <6230401.JFgrqYCo0I@wuerfel>
References: <20160706125254.1663066-1-arnd@arndb.de> <CAOMZO5APrVUAi+QbnLVJ61T_oJRQQDF_eLi8_HeqK=L+aVBzwQ@mail.gmail.com> <20160706132139.GE26134@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:49882 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754414AbcGFNm3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 09:42:29 -0400
In-Reply-To: <20160706132139.GE26134@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Wednesday, July 6, 2016 9:21:39 AM CEST Paul Gortmaker wrote:
> > --- a/drivers/pinctrl/freescale/pinctrl-imx21.c
> > +++ b/drivers/pinctrl/freescale/pinctrl-imx21.c
> > @@ -325,7 +325,6 @@ static const struct of_device_id imx21_pinctrl_of_match[] =
> >         { .compatible = "fsl,imx21-iomuxc", },
> >         { }
> >  };
> > -MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);
> > 
> >  static struct platform_driver imx21_pinctrl_driver = {
> >         .driver = {
> > 
> > 
> > If you agree I can send a formal patch.
> 
> Yes, deleting the MODULE_DEVICE_TABLE is the right fix.  I'm curious why
> that never showed up in all the build coverage I did...

I needed several hundred randconfig builds before hitting it, I think
it's just rare because the driver is not enabled most of the time, and
it's possible that the header sometimes gets included implicitly.

	Arnd
