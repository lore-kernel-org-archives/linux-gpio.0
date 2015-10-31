From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: ath79: Move to the generic GPIO driver
Date: Sat, 31 Oct 2015 22:02:53 +0100
Message-ID: <CACRpkdY3Xjir7pHLhpT9nv1w-KA5E3a767vqZoQronyAWZ1F1w@mail.gmail.com>
References: <1446201391-22553-1-git-send-email-albeu@free.fr>
	<1446201391-22553-2-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36838 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750964AbbJaVCy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Oct 2015 17:02:54 -0400
Received: by oiao187 with SMTP id o187so77121078oia.3
        for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2015 14:02:54 -0700 (PDT)
In-Reply-To: <1446201391-22553-2-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Oct 30, 2015 at 11:36 AM, Alban Bedel <albeu@free.fr> wrote:

> Turn the ath79 driver into a true driver supporting multiple
> instances while dropping most of the code in favor of the generic
> MMIO GPIO driver.
>
> As the driver now depend on CONFIG_GPIO_GENERIC also add a Kconfig
> entry to make the driver optional.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>

This patch looks nice but sadly does not apply to my "devel" branch in
the GPIO tree:
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel

Please rebase it on this branch or wait until after the merge window.

> +config GPIO_ATH79
> +       tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
> +       default y if ATH79
> +       depends on ATH79 || COMPILE_TEST

I think the build robot is complaining because of COMPILE_TEST. This
driver doesn't really compile on anything else than ATH79 does it?
Noone else has asm/mach-ath79/ar71xx_regs.h

So I suggest dropping the compile test until this is fixed (e.g. by moving
the GPIO register offsets into the driver, what do I know).

> +       select GPIO_GENERIC

This is very very nice.

And works out nice, as we can see.

Yours,
Linus Walleij
