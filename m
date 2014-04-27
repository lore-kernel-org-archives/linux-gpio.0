From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 0/4] use BIT() macro instead manually shifting bits
Date: Sun, 27 Apr 2014 19:16:52 +0900
Message-ID: <CAAVeFu+-XiOGu4Bpm_Naa+GDd4t8xiMwKGQxzpgCKCdmtjOMyA@mail.gmail.com>
References: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:56301 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753181AbaD0KRN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Apr 2014 06:17:13 -0400
In-Reply-To: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, inux-omap@vger.kernel.org

On Sun, Apr 27, 2014 at 9:00 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hello Linus and Alexandre,
>
> While learning coccinelle towards doing the big gpio_chip/gpio_chip_ops
> split refactoring I wrote this trivial semantic patch that replaces a
> manual bit shift by using the BIT macro from <linux/bitops.h>
>
>     @hasbitops@
>     @@
>
>     #include <linux/bitops.h>
>
>     @depends on hasbitops@
>     expression E;
>     @@
>
>     - 1 << E
>     + BIT(E)
>
>     @depends on hasbitops@
>     expression E;
>     @@
>
>     - BIT((E))
>     + BIT(E)
>
> When applying to the drivers/gpio subdirectory I got
> the following clean up patches for some GPIO drivers.

I personally find "1 << n" easier to read than a macro, but you are
right that the macro is less error-prone. Nice use of Coccinelle btw,
I should really spend the time to learn it.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
