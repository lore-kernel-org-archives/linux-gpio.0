From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max77620: Remove unused fields from struct max77620_gpio
Date: Thu, 6 Oct 2016 10:15:05 +0200
Message-ID: <CACRpkdaET6YHPXif3WEghEOF9N92hm7UrAxVTS0+Ceg6-EA97A@mail.gmail.com>
References: <1474807444-6841-1-git-send-email-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34748 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750939AbcJFIPH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2016 04:15:07 -0400
Received: by mail-oi0-f45.google.com with SMTP id n132so13480822oih.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2016 01:15:06 -0700 (PDT)
In-Reply-To: <1474807444-6841-1-git-send-email-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Sep 25, 2016 at 2:44 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Current code does not use gpio_irq/irq_base/gpio_base fields from
> struct max77620_gpio, so remove them.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Laxman's ACK.

Yours,
Linus Walleij
