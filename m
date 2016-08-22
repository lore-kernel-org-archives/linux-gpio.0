From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] MIPS: TXx9: tx49xx: Move GPIO setup from .mem_setup()
 to .arch_init()
Date: Mon, 22 Aug 2016 14:13:29 +0200
Message-ID: <CACRpkdaWzHvUzF6xiu9w2oAn+UDCYn0s5-bX06K_jGLwadY7nQ@mail.gmail.com>
References: <1471525068-1525-1-git-send-email-geert@linux-m68k.org> <1471525068-1525-3-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35530 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751032AbcHVMNc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2016 08:13:32 -0400
Received: by mail-lf0-f46.google.com with SMTP id f93so76164346lfi.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2016 05:13:31 -0700 (PDT)
In-Reply-To: <1471525068-1525-3-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Aug 18, 2016 at 2:57 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> txx9_gpio_init() calls gpiochip_add_data(), which fails with -ENOMEM as
> it is called too early in the boot process. This causes all subsequent
> GPIO operations to fail silently (before commit 54d77198fdfbc4f0 ("gpio:
> bail out silently on NULL descriptors") it printed the error message
> "gpiod_direction_output_raw: invalid GPIO" on RBTX49[23]7).
>
> Postpone all GPIO setup to .arch_init() time to fix this.
>
> Suggested-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
