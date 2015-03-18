From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: bcm63xx gpio issue on 3.19
Date: Wed, 18 Mar 2015 11:02:48 +0100
Message-ID: <CACRpkdYqkZAyV1kXVHWYP8TCSqRF9X7fLOcsKNu8wL7t0MX2Mg@mail.gmail.com>
References: <54FDDE00.7030100@freebox.fr>
	<54FFD15E.3040202@nvidia.com>
	<5500803A.7080409@freebox.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34474 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755166AbbCRKCt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 06:02:49 -0400
Received: by oier21 with SMTP id r21so31905088oie.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2015 03:02:48 -0700 (PDT)
In-Reply-To: <5500803A.7080409@freebox.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linux MIPS <linux-mips@linux-mips.org>, Maxime Bizon <mbizon@freebox.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 11, 2015 at 6:49 PM, Nicolas Schichan <nschichan@freebox.fr> wrote:

> Moving the bcm63xx_gpio_init() call from board_prom_init() to
> bcm63xx_register_devices() (an arch_initcall) is enough to get called when
> kmalloc is working. If code poking GPIOs is invoked earlier by a board code,
> it will have to move in the board_register_devices() function though there
> doesn't seem to any problems with the mainline bcm63xx board code in that regard.
>
> I can produce a patch for that if it is an accepted solution. It has the
> advantage of not requiring changes to the gpiolib code.

It would be *awesome* if you can come up with a patch like this.
Because it makes our life so much more simple.

(Maybe there is already such a patch in my INBOX somewhere...)

Yours,
Linus Walleij
