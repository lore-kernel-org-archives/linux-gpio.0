From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: bcm-kona: fix bcm_kona_gpio_reset() warnings
Date: Wed, 8 Jun 2016 14:04:33 +0200
Message-ID: <CACRpkdZ-s7CzSrp7VNq8KGJbbxSDcJ5aYEmwSARQ3iKPrb++ZA@mail.gmail.com>
References: <1465316537-8403-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:34385 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933099AbcFHMEe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 08:04:34 -0400
Received: by mail-oi0-f42.google.com with SMTP id e72so8787489oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 05:04:34 -0700 (PDT)
In-Reply-To: <1465316537-8403-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, Markus Mayer <mmayer@broadcom.com>, Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Jun 7, 2016 at 6:22 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> The bcm_kona_gpio_reset() calls bcm_kona_gpio_write_lock_regs()
> with what looks like the wrong parameter. The write_lock_regs
> function takes a pointer to the registers, not the bcm_kona_gpio
> structure.
>
> Fix the warning, and probably bug by changing the function to
> pass reg_base instead of kona_gpio, fixing the following warning:
>
> drivers/gpio/gpio-bcm-kona.c:550:47: warning: incorrect type in argument 1 (different address spaces)
> drivers/gpio/gpio-bcm-kona.c:550:47:    expected void [noderef] <asn:2>*reg_base
> drivers/gpio/gpio-bcm-kona.c:550:47:    got struct bcm_kona_gpio *kona_gpio
> drivers/gpio/gpio-bcm-kona.c:554:47: warning: incorrect type in argument 1 (different address spaces)
> drivers/gpio/gpio-bcm-kona.c:554:47:    expected void [noderef] <asn:2>*reg_base
> drivers/gpio/gpio-bcm-kona.c:554:47:    got struct bcm_kona_gpio *kona_gpio
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Patch applied with the ACKs and tagged for stable.

Yours,
Linus Walleij
