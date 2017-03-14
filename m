From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/12] gpio: pxa: use devm_irq_alloc_descs()
Date: Tue, 14 Mar 2017 16:12:56 +0100
Message-ID: <CACRpkdZAVrp9B01HbE9XKxHqkz2xhJNup=BXpMfxnCcSnyQZjQ@mail.gmail.com>
References: <1488644620-11488-1-git-send-email-bgolaszewski@baylibre.com> <1488644620-11488-8-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:34515 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbdCNPM6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 11:12:58 -0400
Received: by mail-io0-f172.google.com with SMTP id b140so1365420iof.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 08:12:57 -0700 (PDT)
In-Reply-To: <1488644620-11488-8-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>

On Sat, Mar 4, 2017 at 5:23 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> This driver never frees the interrupt descriptors it allocates. Fix
> it by using the resource managed version of irq_alloc_descs().
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied with Robert's ACK.

Yours,
Linus Walleij
