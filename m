From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2] gpio: mmio: Also read bits that are zero
Date: Tue, 16 Jan 2018 12:20:25 +0100
Message-ID: <20180116112025.GA19826@wunner.de>
References: <20180116110031.20533-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bmailout2.hostsharing.net ([83.223.90.240]:40441 "EHLO
        bmailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751828AbeAPLU1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 06:20:27 -0500
Content-Disposition: inline
In-Reply-To: <20180116110031.20533-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Clemens Gruber <clemens.gruber@pqgruber.com>, Bartosz Golaszewski <brgl@bgdev.pl>

On Tue, Jan 16, 2018 at 12:00:31PM +0100, Linus Walleij wrote:
> +	bit = -1;
> +	while ((bit = find_next_bit(mask, gc->ngpio, bit + 1)) < gc->ngpio)
>  		readmask |= bgpio_line2mask(gc, bit);

Amend include/linux/bitrev.h with a bitrev64() macro.

Further amend it with a bitrevul() macro which calls bitrev32() or
bitrev(64) depending on the arch's unsigned long size.

Then use bitrevul() on mask and the rest is just OR/AND operations
(instead of the while loop).

Thanks,

Lukas
