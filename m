From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: at91: Add set_multiple GPIO chip feature
Date: Fri, 27 Mar 2015 10:07:29 +0100
Message-ID: <CACRpkdapp8vGFHJA+WrZzRk503zoAzrz3HaVGYXH+CHRDaLaDg@mail.gmail.com>
References: <1426878721-2618-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35589 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752655AbbC0JHa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2015 05:07:30 -0400
Received: by oiag65 with SMTP id g65so70862646oia.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2015 02:07:29 -0700 (PDT)
In-Reply-To: <1426878721-2618-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Mar 20, 2015 at 8:12 PM, Alexander Stein <alexanders83@web.de> wrote:

> This adds the callback for set_multiple.
> As this controller has a separate set and clear register, we can't write
> directly to PIO_ODSR as this would required a cached variable and would
> race with at91_gpio_set.
> So build masks for the PIO_SODR and PIO_CODR registers and write them
> together.
>
> Signed-off-by: Alexander Stein <alexanders83@web.de>
> ---
> This was tested by using an own test driver which uses
> gpiod_set_array_cansleep to set multiple GPIOs at once.

I remember J-C brought this up ages ago, so I hope he will be delighted
to see we can now, FINALLY, do this!

J-C can I have your review on this?

Yours,
Linus Walleij
