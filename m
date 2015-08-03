From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: etraxfs: add interrupt support
Date: Mon, 3 Aug 2015 10:58:39 +0200
Message-ID: <CACRpkdYUMHbcG610xnUpVor66E+Q4rJtPAbGHRC-qRMh+nJjzw@mail.gmail.com>
References: <1438346937-9020-1-git-send-email-rabin@rab.in>
	<1438346937-9020-2-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438346937-9020-2-git-send-email-rabin@rab.in>
Sender: linux-kernel-owner@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jul 31, 2015 at 2:48 PM, Rabin Vincent <rabin@rab.in> wrote:

> On ETRAX FS, all pins on the first port (and only the first port) have
> interrupt support.
>
> On ARTPEC-3, all pins on all ports have interrupt support.  However,
> there are only eight interrupts.  Each of the interrupts is associated
> with a group of pins and for each interrupt the one pin from the group
> which will trigger it can be selected.
>
> Signed-off-by: Rabin Vincent <rabin@rab.in>

Patch applied, kudos for using the IRQ helpers!

> +static int etraxfs_gpio_irq_request_resources(struct irq_data *d)
> +{
> +       struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +       struct etraxfs_gpio_block *block = chip->block;
> +       unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
> +       int ret = -EBUSY;
> +
> +       spin_lock(&block->lock);
> +       if (block->group[grpirq])
> +               goto out;
> +
> +       ret = gpiochip_lock_as_irq(&chip->bgc.gc, d->hwirq);
> +       if (ret)
> +               goto out;

Some duplicate code for locking the irqs, so I'll see if I can
refactor something.

Yours,
Linus Walleij
