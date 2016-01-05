From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-4.4-rc8/drivers/gpio/gpio-generic.c: 2 * possible int/long
 mixup ?
Date: Tue, 5 Jan 2016 10:43:21 +0100
Message-ID: <CACRpkda5H3A37XXwgV4aWTObWhxrkP8PgTud3B_Yssm91wg=7A@mail.gmail.com>
References: <DUB128-W5686644DDCB66C9E75ECBB9CF20@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:34749 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606AbcAEJnW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 04:43:22 -0500
Received: by mail-oi0-f52.google.com with SMTP id o124so270973592oia.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 01:43:21 -0800 (PST)
In-Reply-To: <DUB128-W5686644DDCB66C9E75ECBB9CF20@phx.gbl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Binderman <dcb314@hotmail.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jan 4, 2016 at 10:12 AM, David Binderman <dcb314@hotmail.com> wrote:

> [linux-4.4-rc8/drivers/gpio/gpio-generic.c:129]: (style) int result is returned as long value. If the return value is long to avoid loss of information, then you have loss of information.

Where does this come from? Sparse? Coverity? Polyspace?

> Source code is
>
> static unsigned long bgpio_pin2mask(struct bgpio_chip *bgc, unsigned int pin)
> {
>     return 1 << pin;
> }
>
> I don't know if pin can be>= 32. Suggest new code
>
> static unsigned long bgpio_pin2mask(struct bgpio_chip *bgc, unsigned int pin)
> {
>     return 1UL << pin;
> }

I suggest:

#include <linux/bitops.h>

return BIT(pin);

Do you wanna patch it? Or should I do it?

Yours,
Linus Walleij
