From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4] gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Thu, 29 May 2014 18:00:58 +0300
Message-ID: <20140529150058.GB6263@lahna.fi.intel.com>
References: <1400810423-14067-1-git-send-email-lejun.zhu@linux.intel.com>
 <CAAVeFu+F=nHDCpL6Vfmq26QNr74mfRD5p9at_osB3R97v7xBSA@mail.gmail.com>
 <538459E8.6010701@ti.com>
 <20140527084615.GC1801@lahna.fi.intel.com>
 <53847F39.2010503@ti.com>
 <CACRpkdbe1=Yt3UDm9f4ZmZ+K2ZB9nVL+RNr7eU_TbnK-CmNY+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:37257 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756055AbaE2PBH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 29 May 2014 11:01:07 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbe1=Yt3UDm9f4ZmZ+K2ZB9nVL+RNr7eU_TbnK-CmNY+A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "Zhu, Lejun" <lejun.zhu@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jacob.jun.pan@linux.intel.com, bin.yang@intel.com

On Thu, May 29, 2014 at 03:37:37PM +0200, Linus Walleij wrote:
> My idea is that you should call gpiochip_add() *first* and then
> add the IRQs to the chip. In succession.
> 
> Rationale: with dynamic GPIO numbers, gpio_to_irq()
> cannot reasonably be working before the gpiochip is added,
> so it should be added first, then the irqchip. Since irq_to_gpio()
> is *NOT* to be used (rather obliterated), this is the sequence
> we mandate.

Thanks for the explanation. Makes sense.

I was wrong again, oh well it happens ;-)
