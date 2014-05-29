From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Thu, 29 May 2014 17:22:05 +0200
Message-ID: <CACRpkdZk9hFUZCoWci15EGFsJ7gOWNyFH13gJjHB9EcQT4ONRQ@mail.gmail.com>
References: <1400810423-14067-1-git-send-email-lejun.zhu@linux.intel.com>
	<CAAVeFu+F=nHDCpL6Vfmq26QNr74mfRD5p9at_osB3R97v7xBSA@mail.gmail.com>
	<538459E8.6010701@ti.com>
	<20140527084615.GC1801@lahna.fi.intel.com>
	<53847F39.2010503@ti.com>
	<CACRpkdbe1=Yt3UDm9f4ZmZ+K2ZB9nVL+RNr7eU_TbnK-CmNY+A@mail.gmail.com>
	<20140529150058.GB6263@lahna.fi.intel.com>
	<53875A4B.2060604@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:53463 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757417AbaE2PWG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 May 2014 11:22:06 -0400
Received: by mail-ob0-f173.google.com with SMTP id wm4so471256obc.4
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2014 08:22:05 -0700 (PDT)
In-Reply-To: <53875A4B.2060604@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "Zhu, Lejun" <lejun.zhu@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jacob.jun.pan@linux.intel.com, bin.yang@intel.com

On Thu, May 29, 2014 at 6:03 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Also, I'd like to note that GPIO IRQs can be accessible not only
> when GPIO chips is added, but also when IRQ domain is registered
> (at least it's valid for DT cases). In these cases gpiod_to_irq()
> might be not used at all.

Yes. We concluded some time back that gpio_chip:s and
irq_chip:s are orthogonal abstractions: you should be able
to use one of them without paying any respect to the other.

We only added the ability to flag GPIO lines as used for
IRQs so they would not be set to output by mistake...
(Straightening up the semantics.)

The only real semantic dependence that really makes sense
is .to_irq() which leads to this semantic registration ordering.

Yours,
Linus Walleij
