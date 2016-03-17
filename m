From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/2] irqdomain: Export irq_domain_free_irqs_common
Date: Thu, 17 Mar 2016 10:48:52 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1603171048360.3978@nanos>
References: <1458187231.27037.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458187231.27037.1.camel@ingics.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Y Vo <yvo@apm.com>, Alexandre Courbot <gnurou@gmail.com>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 17 Mar 2016, Axel Lin wrote:

> Export irq_domain_free_irqs_common so it can be used by modules.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  kernel/irq/irqdomain.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 3a519a0..245a485 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -1099,6 +1099,7 @@ void irq_domain_free_irqs_common(struct irq_domain *domain, unsigned int virq,
>  	}
>  	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
>  }
> +EXPORT_SYMBOL_GPL(irq_domain_free_irqs_common);

Acked-by: Thomas Gleixner <tglx@linutronix.de>
