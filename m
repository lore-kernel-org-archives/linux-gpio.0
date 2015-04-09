From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: dwapb: enable for ARC
Date: Thu, 09 Apr 2015 12:31:37 +0200
Message-ID: <8837317.PEV34r0lLR@wuerfel>
References: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com> <1428565685.2536.4.camel@synopsys.com> <CACRpkdZCb+5AP7n8LuG2p6XMd9ctKVH8nRu8gavBV4EA5LcqBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:61210 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933283AbbDIKby (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Apr 2015 06:31:54 -0400
In-Reply-To: <CACRpkdZCb+5AP7n8LuG2p6XMd9ctKVH8nRu8gavBV4EA5LcqBQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thursday 09 April 2015 10:29:59 Linus Walleij wrote:
> >
> > make.cross ARCH=blackfin
> > drivers/gpio/gpio-dwapb.c: In function 'dwapb_irq_handler':
> > drivers/gpio/gpio-dwapb.c:91:2: error: implicit declaration of function
> > 'readl_relaxed' [-Werror=implicit-function-declaration]
> > drivers/gpio/gpio-dwapb.c: In function 'dwapb_configure_irqs':
> > drivers/gpio/gpio-dwapb.c:212:32: error: 'struct gpio_chip' has no
> > member named 'of_node'
> > drivers/gpio/gpio-dwapb.c:221:16: error: 'struct gpio_chip' has no
> > member named 'of_node'
> > drivers/gpio/gpio-dwapb.c: In function 'dwapb_gpio_add_port':
> > drivers/gpio/gpio-dwapb.c:331:14: error: 'struct gpio_chip' has no
> > member named 'of_node'
> > cc1: some warnings being treated as errors
> > --->8---
> >
> > Probably better fix is to make dwgpio depend on !BLACKFIN because we
> > know it won't be built for it. If there're other arches that don't
> > define [readl|writel]_relaxed() we may add them as well.
> 
> This restrictions should be gone after commit
> 9439eb3ab9d1ece6e4ad7baaa4a7f534f9b9dab0
> "asm-generic: io: implement relaxed accessor macros as conditional wrappers"
> 
> I will make a patch removing the dependencies and see what happens.

Yes, makes sense. I think we don't need anything other than

	depends on OF_GPIO || X86_INTEL_QUARK

	Arnd
