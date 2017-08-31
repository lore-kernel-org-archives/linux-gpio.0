From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/4] gpio: Introduce ->get_multiple callback
Date: Thu, 31 Aug 2017 17:46:21 +0200
Message-ID: <20170831154621.GA21777@wunner.de>
References: <cover.1503319573.git.lukas@wunner.de>
 <46dea76d0adfe25f30b564d9dc5b3f2b4de099c9.1503319573.git.lukas@wunner.de>
 <CACRpkdYfHGHNGKKMs+Yqhfeyhs=L0G4K_6OYneDG1RkNpxLXkA@mail.gmail.com>
 <20170827173459.GB13399@wunner.de>
 <CACRpkdZo5EzJJUwF8uYqchDC1JC3uZnp9LCpR0DxOdy2K4J_wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:54833 "EHLO
        mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752492AbdHaPqX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 11:46:23 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZo5EzJJUwF8uYqchDC1JC3uZnp9LCpR0DxOdy2K4J_wg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Aug 31, 2017 at 03:48:15PM +0200, Linus Walleij wrote:
> On Sun, Aug 27, 2017 at 7:34 PM, Lukas Wunner <lukas@wunner.de> wrote:
> > At least with SPI-attached GPIO controllers, the transmission is never
> > guaranteed to succeed, so errors can occur both for input and output
> > GPIOs.  The MAX3191x is input-only and does pass SPI errors back to
> > the caller.  Output drivers such as gpio-74x164.c silently ignore
> > SPI errors, which is arguably a problem.
> 
> This has historical reasons.

Would you generally be open for allowing errors to be returned from
the set functions as well?  The Revolution Pi uses SPI-attached
digital outputs and knowing if access to them fails would be useful.

For consumers, switching the return value from void to int shouldn't
cause any fallout.  They just don't check the return value initially.
However the ->set and ->set_multiple callbacks in all the GPIO drivers
would need to be changed, that's where the real work is.

Thanks,

Lukas
