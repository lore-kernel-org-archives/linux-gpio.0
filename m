From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH] pinctrl: update document for
 pinconf_generic_parse_dt_config
Date: Tue, 1 Dec 2015 11:26:03 +0100
Message-ID: <20151201102603.GC29282@odux.rfo.atmel.com>
References: <1448453603-38980-1-git-send-email-yingjoe.chen@mediatek.com>
 <CACRpkdZ_9EOA2PVcPQgoM2UHor5jdtsGBSzomYEn0hOJEF=g1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:12013 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751183AbbLAK0D (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 05:26:03 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZ_9EOA2PVcPQgoM2UHor5jdtsGBSzomYEn0hOJEF=g1w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ludovic Desroches <ludovic.desroches@atmel.com>

On Tue, Dec 01, 2015 at 11:12:16AM +0100, Linus Walleij wrote:
> On Wed, Nov 25, 2015 at 1:13 PM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> 
> > The returned configs from pinconf_generic_parse_dt_config() is
> > duplicated from original. Make it clear it must be freed when no
> > longer necessary.
> >
> > Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> 
> Patch applied.
> 
> > It seems memleak in pinctrl-mtk-common.c[1] is not alone. After a quick
> > glance I notice similar issues in drivers/pinctrl/pinctrl-at91-pio4.c and
> > drivers/pinctrl/nomadik/pinctrl-abx500.c.
> 
> Patches fixing them are coming? ;)

Yes, it's planned.

Regards

Ludovic
