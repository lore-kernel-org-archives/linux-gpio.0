From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 143/182] powerpc: mpc52xx_gpt: use gpiochip data pointer
Date: Sun, 13 Dec 2015 17:01:56 -0600
Message-ID: <20151213230156.GA12944@qwerty.qwertyembedded>
References: <1449668466-4882-1-git-send-email-linus.walleij@linaro.org>
 <20151209232746.GC28304@deathstar>
 <CACRpkdYSRfD9jKdrysfY40hwHszKhsZmxZ4fncS+D5uciOj0rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:33476 "EHLO
	mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750998AbbLMXCU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2015 18:02:20 -0500
Received: by iow186 with SMTP id 186so8517210iow.0
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2015 15:02:19 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdYSRfD9jKdrysfY40hwHszKhsZmxZ4fncS+D5uciOj0rw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>

On Sun, Dec 13, 2015 at 10:02:20PM +0100, Linus Walleij wrote:
> On Thu, Dec 10, 2015 at 12:27 AM, Michael Welling <mwelling@ieee.org> wrote:
> > On Wed, Dec 09, 2015 at 02:41:06PM +0100, Linus Walleij wrote:
> >> @@ -354,7 +349,7 @@ mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
> >>       clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_MS_MASK,
> >>                       MPC52xx_GPT_MODE_MS_GPIO);
> >>
> >> -     rc = gpiochip_add(&gpt->gc);
> >> +     rc = gpiochip_add_data(&gpt->gc, gpt);
> >>       if (rc)
> >
> > Another place that dev_err references gpiochip_add instead of gpiochip_add_data.
> >
> >>               dev_err(gpt->dev, "gpiochip_add() failed; rc=%i\n", rc);
> 
> OK fixed it.

Sorry for nit picking.

The series otherwises looks good.

Reviewed-by: Michael Welling <mwelling@ieee.org>

> 
> Yours,
> Linus Walleij
