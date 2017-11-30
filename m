From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: uniphier: fix mismatch between license text and MODULE_LICENSE
Date: Thu, 30 Nov 2017 15:38:06 +0100
Message-ID: <CACRpkdYQZDyFKmg1Ber1fNR+XCN05v1UNZdEYyWc3wUgC3J22w@mail.gmail.com>
References: <1511431310-9892-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:38030 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751903AbdK3OiH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 09:38:07 -0500
Received: by mail-it0-f67.google.com with SMTP id r6so8650270itr.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 06:38:07 -0800 (PST)
In-Reply-To: <1511431310-9892-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Nov 23, 2017 at 11:01 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The comment block of this file indicates GPL-2.0 "only", while the
> MODULE_LICENSE is GPL-2.0 "or later", as include/linux/module.h
> describes as follows:
>
>   "GPL"                           [GNU Public License v2 or later]
>   "GPL v2"                        [GNU Public License v2]
>
> I am the author of this driver, and my intention is GPL-2.0 "only".
>
> Fixes: dbe776c2ca54 ("gpio: uniphier: add UniPhier GPIO controller driver")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
