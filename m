From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] gpio-mmio: Use the new .get_multiple() callback
Date: Mon, 15 Jan 2018 20:28:35 +0100
Message-ID: <20180115192835.GA9292@wunner.de>
References: <20171020151030.25094-1-linus.walleij@linaro.org>
 <20180115184728.GA7999@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bmailout2.hostsharing.net ([83.223.90.240]:53417 "EHLO
        bmailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751113AbeAOT2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jan 2018 14:28:37 -0500
Content-Disposition: inline
In-Reply-To: <20180115184728.GA7999@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Anton Vorontsov <anton@enomsg.org>, Clemens Gruber <clemens.gruber@pqgruber.com>, Bartosz Golaszewski <brgl@bgdev.pl>

On Mon, Jan 15, 2018 at 07:47:28PM +0100, Lukas Wunner wrote:
> On Fri, Oct 20, 2017 at 05:10:30PM +0200, Linus Walleij wrote:
> Third, I think we need to initialize *bits = 0 in case it contains
> garbage.

Scratch that, it's the other way 'round, I remember now that in
max3191x_get_multiple() I deliberately only touched the bits in
*bits that are also set in *mask.

However there's another bug then:

bgpio_get_multiple() touches bits in *bits not set in *mask because
it outright assigns a value to *bits.  This should be something like:

        *bits &= ~*mask;
	*bits |= gc->read_reg(gc->reg_dat) & *mask;

And bgpio_get_set_multiple() only ORs bits to *bits but never clears it.
That's wrong, you need to AND with the inverse of *mask first, see above.
bgpio_get_multiple_be() has the same problem.

Thanks,

Lukas
