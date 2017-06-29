From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Avoid warning from __irq_do_set_handler
Date: Thu, 29 Jun 2017 11:05:33 +0200
Message-ID: <CACRpkdapvL7NLP-mXyrb0W5t08rQRqqiZj7tqRF3zhbEM0L0JA@mail.gmail.com>
References: <1498069204-28154-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:38543 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752117AbdF2JFe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 05:05:34 -0400
Received: by mail-it0-f41.google.com with SMTP id k192so3506080ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 02:05:34 -0700 (PDT)
In-Reply-To: <1498069204-28154-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Eric Anholt <eric@anholt.net>, Phil Elwell <phil@raspberrypi.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Jun 21, 2017 at 8:20 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> We get a warning during boot with enabled EARLY_PRINTK that
> we try to set a irq_chip without data. This is caused by ignoring
> the return value of irq_of_parse_and_map(). So avoid calling
> gpiochip_set_chained_irqchip() in error case.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Fixes: 85ae9e512f43 ("pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP")

Patch applied.

Yours,
Linus Walleij
