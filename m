From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/9] gpio: vf610: Extend with wakeup support
Date: Wed, 24 Sep 2014 11:19:20 +0200
Message-ID: <CACRpkdYCiKzyVpg9u-YXn-QMd7PSKR72siXQQWALe0OqTNr-rw@mail.gmail.com>
References: <cover.1411404079.git.stefan@agner.ch>
	<704b6bb97147b3d0ee1557b43d85ab9376c28666.1411404079.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:37351 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752464AbaIXJTV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Sep 2014 05:19:21 -0400
Received: by mail-ie0-f171.google.com with SMTP id rd18so6402627iec.30
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2014 02:19:20 -0700 (PDT)
In-Reply-To: <704b6bb97147b3d0ee1557b43d85ab9376c28666.1411404079.git.stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, jingchang.lu@freescale.com, Huang Yongcai-B20788 <b20788@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Sep 22, 2014 at 7:09 PM, Stefan Agner <stefan@agner.ch> wrote:

> Support Vybrid GPIO's as wakeup source by requesting the parent
> IRQ as wakeup IRQ.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpio/gpio-vf610.c | 16 ++++++++++++++++

This driver is not yet upstream. Make wakeup support part
of the initial driver submission instead, it doesn't hurt.

Yours,
Linus Walleij
