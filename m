From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] [RFC] gpio: pcf857x: Switch to use gpiolib irqchip helpers
Date: Wed, 4 Mar 2015 13:49:44 +0100
Message-ID: <CACRpkdZ6T5bj3ftuMxFKYJxuAVnLofAO9W6q6qf94S-trB49Eg@mail.gmail.com>
References: <1423151349-10579-1-git-send-email-geert+renesas@glider.be>
	<1423151349-10579-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:39695 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757595AbbCDMto (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Mar 2015 07:49:44 -0500
Received: by obcva2 with SMTP id va2so6517677obc.6
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2015 04:49:44 -0800 (PST)
In-Reply-To: <1423151349-10579-2-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, George Cherian <george.cherian@ti.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Feb 5, 2015 at 4:49 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Switch the PCF857x GPIO driver to use the gpiolib irqchip helpers.
> This driver uses a nested threaded interrupt, hence handle_nested_irq()
> and gpiochip_set_chained_irqchip() must be used.
>
> Note that this removes the checks added in commit 21fd3cd1874a2ac8
> ("gpio: pcf857x: call the gpio user handler iff gpio_to_irq is done"),
> as the interrupt mappings are no longer created on-demand by the driver,
> but by gpiochip_irqchip_add() during initialization.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
