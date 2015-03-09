From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Adjust mt8173 pinctrl kconfig
Date: Mon, 9 Mar 2015 16:26:24 +0800
Message-ID: <1425889584.4871.12.camel@mtksdaap41>
References: <1425623091-30478-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1425623091-30478-2-git-send-email-yingjoe.chen@mediatek.com>
	 <1425639954.24292.274.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:32784 "EHLO
	mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751276AbbCII0c (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 04:26:32 -0400
In-Reply-To: <1425639954.24292.274.camel@x220>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Arnd Bergmann <arnd@arndb.de>, srv_heupstream@mediatek.com, Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org

On Fri, 2015-03-06 at 12:05 +0100, Paul Bolle wrote:
> On Fri, 2015-03-06 at 14:24 +0800, Yingjoe Chen wrote:
> > --- a/drivers/pinctrl/mediatek/Kconfig
> > +++ b/drivers/pinctrl/mediatek/Kconfig
> 
> > @@ -8,11 +8,13 @@ config PINCTRL_MTK_COMMON
> >  	select OF_GPIO
> >  
> >  config PINCTRL_MT8135
> > -	def_bool MACH_MT8135
> > +	def_bool MACH_MT8135 || COMPILE_TEST
> >  	select PINCTRL_MTK_COMMON
> >  
> >  config PINCTRL_MT8173
> > -	def_bool MACH_MT8173
> > +	bool "Mediatek MT8173 pin control"
> > +	def_bool y
> 
> The kconfig tools will do what you mean here, but I think it's cleaner
> to make this just:
> 	bool "Mediatek MT8173 pin control"
> 	default y
> 

Hi Paul,

Just sent a new version with this change.
Thanks for your suggestion.

Joe.C



