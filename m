From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: xlp: GPIO controller for Netlogic XLP SoCs
Date: Tue, 2 Jun 2015 13:23:21 +0200
Message-ID: <CACRpkdZ9eKBKaa78J56Sth5y0hOV478odxrfLyZ7M-k1-o3-xg@mail.gmail.com>
References: <1430232045-5114-1-git-send-email-kamlakant.patel@broadcom.com>
	<1430232045-5114-3-git-send-email-kamlakant.patel@broadcom.com>
	<CACRpkdbB=xg+wc+HfsPmdGxPHM3Vcck2T0h4xCTvVwepd8dP5g@mail.gmail.com>
	<55673937.83c2420a.767d.55fcSMTPIN_ADDED_BROKEN@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33178 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752476AbbFBLXW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 07:23:22 -0400
Received: by obbnx5 with SMTP id nx5so124764078obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2015 04:23:22 -0700 (PDT)
In-Reply-To: <55673937.83c2420a.767d.55fcSMTPIN_ADDED_BROKEN@mx.google.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, May 28, 2015 at 5:51 PM, Kamlakant Patel
<kamlakant.patel@broadcom.com> wrote:
> [Me]
>> Any place where the GPIO IRQ line is connected to a higher-order
>> IRQ controller this should be done like so...
>>
> We are not able to use gpiochip_set_chained_irqchip() because the current
> implementation of parent irq_chip(arch/mips/netlogic/common/irq.c) uses
> handler_data instead of chip_data.

That sounds like a bug.

> I am testing a patch which changes parent irq_chip to use chip_data instead
> of handler_data. I will send out a this pacth once tested and a patch
> for gpio driver with gpiochip_set_chained_irqchip implementation.

Awesome, thanks Kamlakant, that sounds like the right fix.

After that you should be able to use GPIOLIB_IRQCHIP.

Yours,
Linus Walleij
