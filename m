From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Tue, 3 Jun 2014 10:10:13 +0200
Message-ID: <CACRpkdar8jUuQHg7q5rPmGQ2tdomBgXcPA5OUT-n3iLh5Ca11w@mail.gmail.com>
References: <1400810423-14067-1-git-send-email-lejun.zhu@linux.intel.com>
	<CAAVeFu+F=nHDCpL6Vfmq26QNr74mfRD5p9at_osB3R97v7xBSA@mail.gmail.com>
	<538459E8.6010701@ti.com>
	<20140527084615.GC1801@lahna.fi.intel.com>
	<53847F39.2010503@ti.com>
	<CACRpkdbe1=Yt3UDm9f4ZmZ+K2ZB9nVL+RNr7eU_TbnK-CmNY+A@mail.gmail.com>
	<20140529150058.GB6263@lahna.fi.intel.com>
	<53875A4B.2060604@ti.com>
	<CACRpkdZk9hFUZCoWci15EGFsJ7gOWNyFH13gJjHB9EcQT4ONRQ@mail.gmail.com>
	<20140530082503.GA1645@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:43550 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753557AbaFCIKO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jun 2014 04:10:14 -0400
Received: by mail-ob0-f175.google.com with SMTP id wo20so5692284obc.34
        for <linux-gpio@vger.kernel.org>; Tue, 03 Jun 2014 01:10:13 -0700 (PDT)
In-Reply-To: <20140530082503.GA1645@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "Zhu, Lejun" <lejun.zhu@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jacob.jun.pan@linux.intel.com, bin.yang@intel.com

On Fri, May 30, 2014 at 10:25 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> I'm thinking that could we solve this so that we call
> acpi_gpiochip_request_interrupts() at the end of gpiochip_irqchip_add()
> and convert both pinctrl-baytrail and gpio-lynxpoint to use
> gpiochip_irqchip_add()?

Yes that seems like a great way to solve it actually.

Is someone able to do this refactoring?

I don't know if you have a case of an ACPI-based GPIO controller
that is *not* supplying interrupts? Because in that case this
would even be required for the thing to work, right?

Yours,
Linus Walleij
