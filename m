From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v5 1/7] irq/irq_sim: add irq_set_type() callback
Date: Tue, 19 Feb 2019 12:25:24 +0000
Message-ID: <20190219122524.2e2b01db@why.wild-wind.fr.eu.org>
References: <20190218164138.24921-1-brgl@bgdev.pl>
        <20190218164138.24921-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218164138.24921-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, 18 Feb 2019 17:41:32 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Implement the irq_set_type() callback and call irqd_set_trigger_type()
> internally so that users interested in the configured trigger type can
> later retrieve it using irqd_get_trigger_type().
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  kernel/irq/irq_sim.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
> index 98a20e1594ce..83ecc65d8be2 100644
> --- a/kernel/irq/irq_sim.c
> +++ b/kernel/irq/irq_sim.c
> @@ -25,10 +25,18 @@ static void irq_sim_irqunmask(struct irq_data *data)
>  	irq_ctx->enabled = true;
>  }
>  
> +static int irq_sim_set_type(struct irq_data *data, unsigned int type)
> +{
> +	irqd_set_trigger_type(data, type);
> +
> +	return 0;

You keep ignoring the requirement for sanitization of the trigger type.
Frankly, I'm getting tired of fighting over 3 lines of incorrect code.

I guess that despite all the noise, you don't really want this code in
after all.

	M.
-- 
Without deviation from the norm, progress is not possible.
