From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 08/18] gpio: add driver for Atheros AR5312 SoC GPIO controller
Date: Mon, 29 Sep 2014 11:03:20 +0200
Message-ID: <CACRpkda2nNqb9iARw+ze=vsdmXVePGu+Fb5PMGo75FSCGJ+tDA@mail.gmail.com>
References: <1410723213-22440-1-git-send-email-ryazanov.s.a@gmail.com>
	<1410723213-22440-9-git-send-email-ryazanov.s.a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:46441 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752457AbaI2JDU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Sep 2014 05:03:20 -0400
Received: by mail-ie0-f182.google.com with SMTP id tp5so13986161ieb.27
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2014 02:03:20 -0700 (PDT)
In-Reply-To: <1410723213-22440-9-git-send-email-ryazanov.s.a@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Sep 14, 2014 at 9:33 PM, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:

> Atheros AR5312 SoC have a builtin GPIO controller, which could be accessed
> via memory mapped registers. This patch adds new driver for them.
>
> Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
(...)

> diff --git a/arch/mips/ar231x/Kconfig b/arch/mips/ar231x/Kconfig
> diff --git a/arch/mips/ar231x/ar5312.c b/arch/mips/ar231x/ar5312.c
> diff --git a/arch/mips/include/asm/mach-ar231x/ar5312_regs.h b/arch/mips/include/asm/mach-ar231x/ar5312_regs.h

Please put these MIPS-related changes into a separate patch
to be handled through the MIPS git tree.

This driver seems surplus, it's just MMIO. Use
drivers/gpio/gpio-generic.c instead.

Yours,
Linus Walleij
