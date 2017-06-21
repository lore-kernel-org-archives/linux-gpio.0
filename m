From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: bcm2835_pinctrl_probe: WARNING: CPU: 0 PID: 1 at kernel/irq/chip.c:850
Date: Wed, 21 Jun 2017 18:40:02 +0200
Message-ID: <CACRpkdb8CnNncK3jARiJ-DqT1TZXVqeJ9bkC4hOiza+ZstTGmQ@mail.gmail.com>
References: <2049796110.190734.1497905942101@email.1und1.de>
 <CACRpkdbBPVG3eP-Vt+uHALZkpPzV+0YVE6zBO0B7qnQi3qNKyA@mail.gmail.com> <975495226.218463.1497977490704@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:32832 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751674AbdFUQkF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jun 2017 12:40:05 -0400
Received: by mail-it0-f43.google.com with SMTP id x12so782688itb.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2017 09:40:05 -0700 (PDT)
In-Reply-To: <975495226.218463.1497977490704@email.1und1.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Eric Anholt <eric@anholt.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>

On Tue, Jun 20, 2017 at 6:51 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> thanks, but it seems more trivial. The return value of irq_of_parse_and_map() wasn't check before calling gpiochip_set_chained_irqchip().
>
> So this change (similar to a downstream patch) avoid this warning:
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 1eb7a1a..2a29128 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -1048,6 +1048,10 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
>         for (i = 0; i < BCM2835_NUM_IRQS; i++) {
>                 pc->irq[i] = irq_of_parse_and_map(np, i);
>                 pc->irq_group[i] = i;
> +
> +               if (pc->irq[i] == 0)
> +                       continue;
> +

Oh that looks right.

Please submit a patch to me so I can apply it!

Yours,
Linus Walleij
