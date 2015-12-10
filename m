From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: 74x164: Use a single SPI transfer instead of
 multiple transfers
Date: Thu, 10 Dec 2015 17:20:58 +0100
Message-ID: <CACRpkdbRYj7pYYtWcW=+XHH=FrNncYVJQ5mNoXNbfv2WjDUjkQ@mail.gmail.com>
References: <1448894126-9309-1-git-send-email-geert+renesas@glider.be>
	<1448894126-9309-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:36433 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491AbbLJQU7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 11:20:59 -0500
Received: by obcse5 with SMTP id se5so62939840obc.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 08:20:59 -0800 (PST)
In-Reply-To: <1448894126-9309-3-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>

On Mon, Nov 30, 2015 at 3:35 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently the 74x164 driver assembles an SPI message from an array of
> one-byte SPI transfers, one for each daisy-chained shift register, as
> the first byte sent will end up in the last register.
> This array is allocated and deallocated on each GPIO write access.
>
> By storing the data in the internal buffer in reverse order, we can
> use a single SPI transfer with the internal buffer directly, simplifying
> the code a lot, and avoiding memory (de)allocations.
>
> This also avoids transient values on the GPIO outputs when using an SPI
> master that cannot keep the hardware chip select asserted in between
> multiple transfers (and would need cs-gpios for proper operation).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Mark Brown <broonie@kernel.org>

Patch rebased and applied. (Accounting for .dev -> .parent refactoring.)

Yours,
Linus Walleij
