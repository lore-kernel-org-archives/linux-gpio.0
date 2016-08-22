From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] MIPS: TXx9: tx39xx: Move GPIO setup from .mem_setup()
 to .arch_init()
Date: Mon, 22 Aug 2016 14:12:47 +0200
Message-ID: <CACRpkdbJrGOMqV7HBLOj3fOFJT-u-ywCCK7cf_HCraSrz1YQDg@mail.gmail.com>
References: <1471525068-1525-1-git-send-email-geert@linux-m68k.org> <1471525068-1525-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36237 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751032AbcHVMMu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2016 08:12:50 -0400
Received: by mail-lf0-f49.google.com with SMTP id g62so76037963lfe.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2016 05:12:49 -0700 (PDT)
In-Reply-To: <1471525068-1525-2-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Aug 18, 2016 at 2:57 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> txx9_gpio_init() calls gpiochip_add_data(), which fails with -ENOMEM as
> it is called too early in the boot process. This causes all subsequent
> GPIO operations to fail silently.
>
> Postpone all GPIO setup to .arch_init() time to fix this.
>
> Suggested-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess this will go through the MIPS tree.

Yours,
Linus Walleij
