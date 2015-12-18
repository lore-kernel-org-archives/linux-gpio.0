From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] pinctrl: at91-pio4: use %pr format string for resource
Date: Fri, 18 Dec 2015 16:29:16 +0100
Message-ID: <2376227.VpCVZMP4nr@wuerfel>
References: <5199877.GVYeflqET9@wuerfel> <CACRpkdZ4F8Loyoh6niCvkM=S8KcekTs8EvXRmB-0WxcRFw_8+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:60294 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753250AbbLRP3q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Dec 2015 10:29:46 -0500
In-Reply-To: <CACRpkdZ4F8Loyoh6niCvkM=S8KcekTs8EvXRmB-0WxcRFw_8+g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday 30 November 2015 09:47:03 Linus Walleij wrote:
> On Wed, Nov 18, 2015 at 4:21 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > resource_size_t may be defined as 32 or 64 bit depending on configuration,
> > so it cannot be printed using the normal format strings, as gcc correctly
> > warns:
> >
> > pinctrl-at91-pio4.c: In function 'atmel_pinctrl_probe':
> > pinctrl-at91-pio4.c:1003:41: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]
> >    dev_dbg(dev, "bank %i: hwirq=%u\n", i, res->start);
> >
> > This changes the format string to use the special "%pr" format
> > string that prints a resource, and changes the arguments so we
> > the resource structure directly.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > v2: don't break ordering of arguments, that part was correct already, unlike
> > what I said in v1.
> 
> Patch applied with Ludovic's review tag.

I don't see this in linux-next, did the commit get lost accidentally?

	Arnd
