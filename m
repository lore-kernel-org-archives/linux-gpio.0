From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] gpio: remove broken irq_to_gpio() interface
Date: Mon, 15 Feb 2016 21:16:30 +0100
Message-ID: <4277616.myYDBWrFcU@wuerfel>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com> <1455551208-2825510-2-git-send-email-arnd@arndb.de> <56C1F645.1070405@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:53837 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529AbcBOURE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 15:17:04 -0500
In-Reply-To: <56C1F645.1070405@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org

On Monday 15 February 2016 17:01:09 Lars-Peter Clausen wrote:
> On 02/15/2016 04:46 PM, Arnd Bergmann wrote:
> > +static inline __deprecated int irq_to_gpio(unsigned int irq)
> > +{
> > +     /* this has clearly not worked for a long time */
> > +     return -EINVAL;
> > +}
> > +
> >  #define IRQ_TO_BIT(irq) BIT(irq_to_gpio(irq) & 0x1f)
> 
> The issue seems to be a fallout from commit 832f5dacfa0b ("MIPS: Remove all
> the uses of custom gpio.h").
> 
> The irq_to_gpio() should be replaced with "(irq - JZ4740_IRQ_GPIO(0))".
> 
> 

Ah, that explain it, so it has not been broken for that long.

	Arnd
