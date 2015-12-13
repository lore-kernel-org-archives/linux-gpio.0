From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 143/182] powerpc: mpc52xx_gpt: use gpiochip data pointer
Date: Sun, 13 Dec 2015 22:02:20 +0100
Message-ID: <CACRpkdYSRfD9jKdrysfY40hwHszKhsZmxZ4fncS+D5uciOj0rw@mail.gmail.com>
References: <1449668466-4882-1-git-send-email-linus.walleij@linaro.org>
	<20151209232746.GC28304@deathstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34126 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752512AbbLMVCV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2015 16:02:21 -0500
Received: by oihr132 with SMTP id r132so29692820oih.1
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2015 13:02:20 -0800 (PST)
In-Reply-To: <20151209232746.GC28304@deathstar>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>

On Thu, Dec 10, 2015 at 12:27 AM, Michael Welling <mwelling@ieee.org> wrote:
> On Wed, Dec 09, 2015 at 02:41:06PM +0100, Linus Walleij wrote:
>> @@ -354,7 +349,7 @@ mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
>>       clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_MS_MASK,
>>                       MPC52xx_GPT_MODE_MS_GPIO);
>>
>> -     rc = gpiochip_add(&gpt->gc);
>> +     rc = gpiochip_add_data(&gpt->gc, gpt);
>>       if (rc)
>
> Another place that dev_err references gpiochip_add instead of gpiochip_add_data.
>
>>               dev_err(gpt->dev, "gpiochip_add() failed; rc=%i\n", rc);

OK fixed it.

Yours,
Linus Walleij
