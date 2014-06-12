From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-pxa: gpio0 and gpio1 support on dt
Date: Thu, 12 Jun 2014 10:43:11 +0200
Message-ID: <CACRpkdZ3xfOXrMZK-Z7TteOsdnVP8uOY4+DLe7pv_9ydBCRRWQ@mail.gmail.com>
References: <1401995603-25997-1-git-send-email-andrew.ruder@elecsyscorp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:35016 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932729AbaFLInM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jun 2014 04:43:12 -0400
Received: by mail-oa0-f50.google.com with SMTP id n16so1006313oag.23
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2014 01:43:11 -0700 (PDT)
In-Reply-To: <1401995603-25997-1-git-send-email-andrew.ruder@elecsyscorp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Ruder <andrew.ruder@elecsyscorp.com>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>, Eric Miao <eric.y.miao@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Thu, Jun 5, 2014 at 9:13 PM, Andrew Ruder
<andrew.ruder@elecsyscorp.com> wrote:

> pxa_gpio_probe() has some issues supporting the gpio0 and gpio1
> interrupts under device-tree - it never actually sets up the chain
> handler to get interrupts on edge detect for GPIO0 and GPIO1.
>
> Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>

Makes perfect sense. Can I have an ACK from some PXA
maintainer on this?

The PXA GPIO driver with it's messy irqchip registration looks
like a good candidate for switching to the gpiolib irqchip helpers
and rid some code. Just saying.

Yours,
Linus Walleij
