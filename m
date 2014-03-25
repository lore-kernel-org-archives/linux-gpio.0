From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 7/7 v2] gpio: dwapb: use d->mask instead od BIT(bit)
Date: Tue, 25 Mar 2014 14:25:16 -0700
Message-ID: <1395782716.3010.31.camel@joe-AO722>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
	 <1395505004-22650-8-git-send-email-bigeasy@linutronix.de>
	 <CAAVeFu+WQCpo=LEZqdAhpMcO1PLqUzfcVKTafnwe=BiLGLjFZQ@mail.gmail.com>
	 <20140325211841.GA31253@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtprelay0115.hostedemail.com ([216.40.44.115]:59596 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751702AbaCYVZV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 25 Mar 2014 17:25:21 -0400
In-Reply-To: <20140325211841.GA31253@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, atull@altera.com, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dinguyen@altera.com, delicious.quinoa@gmail.com

On Tue, 2014-03-25 at 22:18 +0100, Sebastian Andrzej Siewior wrote:
> d->mask contains exact the same information as BIT(bit) so we could save
> a few cycles here.

I think you actually lose a few cycles here as
the pointer has to be dereferenced for each use.

> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
[]
> @@ -171,24 +170,24 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  
>  	switch (type) {
>  	case IRQ_TYPE_EDGE_BOTH:
> -		level |= BIT(bit);
> -		dwapb_toggle_trigger(gpio, bit);
> +		level |= d->mask;
> +		dwapb_toggle_trigger(gpio, d->hwirq);
>  		break;
>  	case IRQ_TYPE_EDGE_RISING:
> -		level |= BIT(bit);
> -		polarity |= BIT(bit);
> +		level |= d->mask;
> +		polarity |= d->mask;
>  		break;
>  	case IRQ_TYPE_EDGE_FALLING:
> -		level |= BIT(bit);
> -		polarity &= ~BIT(bit);
> +		level |= d->mask;
> +		polarity &= ~d->mask;
>  		break;
>  	case IRQ_TYPE_LEVEL_HIGH:
> -		level &= ~BIT(bit);
> -		polarity |= BIT(bit);
> +		level &= ~d->mask;
> +		polarity |= d->mask;
>  		break;
>  	case IRQ_TYPE_LEVEL_LOW:
> -		level &= ~BIT(bit);
> -		polarity &= ~BIT(bit);
> +		level &= ~d->mask;
> +		polarity &= ~d->mask;
>  		break;
>  	}
>  



