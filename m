From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 7/7] gpio: dwapb: use d->mask instead od BIT(bit)
Date: Tue, 25 Mar 2014 11:17:40 +0900
Message-ID: <CAAVeFu+WQCpo=LEZqdAhpMcO1PLqUzfcVKTafnwe=BiLGLjFZQ@mail.gmail.com>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de> <1395505004-22650-8-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f175.google.com ([209.85.128.175]:65184 "EHLO
	mail-ve0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751261AbaCYCSB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 22:18:01 -0400
In-Reply-To: <1395505004-22650-8-git-send-email-bigeasy@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: atull@altera.com, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dinguyen@altera.com, delicious.quinoa@gmail.com

On Sun, Mar 23, 2014 at 1:16 AM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> d->mask contains exact the same information as BIT(bit) so we could save
> a few cycles here.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/gpio/gpio-dwapb.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 3c9cdda..ebfcf5c 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -113,7 +113,7 @@ static void dwapb_irq_enable(struct irq_data *d)
>
>         irq_gc_lock(igc);
>         val = readl(gpio->regs + GPIO_INTEN);
> -       val |= BIT(d->hwirq);
> +       val |= d->mask;
>         writel(val, gpio->regs + GPIO_INTEN);
>         irq_gc_unlock(igc);
>  }
> @@ -126,7 +126,7 @@ static void dwapb_irq_disable(struct irq_data *d)
>
>         irq_gc_lock(igc);
>         val = readl(gpio->regs + GPIO_INTEN);
> -       val &= ~BIT(d->hwirq);
> +       val &= d->mask;

Shouldn't that be ~d->mask here?
