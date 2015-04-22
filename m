From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Subject: Re: [PATCH 2/2] gpio: max732x: Fix irq-events handler
Date: Wed, 22 Apr 2015 10:42:37 +0300
Message-ID: <553750ED.70209@linaro.org>
References: <1429637318-11089-1-git-send-email-semen.protsenko@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429637318-11089-1-git-send-email-semen.protsenko@globallogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Semen Protsenko <semen.protsenko@globallogic.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 04/21/2015 08:28 PM, Semen Protsenko wrote:
> MAX732X doesn't support edge type interrupt. So replace
> handle_edge_irq() with handle_level_irq(), which uses
> irq_mask/irq_unmask callbacks instead of irq_ack().
> 
> This wrong handler may lead to NULL pointer dereference in some cases.
> E.g. this was observed on hibernation process:
> 
>    Unable to handle kernel NULL pointer dereference at virtual address 0
>    Backtrace:
>    (handle_edge_irq) from (resend_irqs)
>    (resend_irqs) from (tasklet_action)
>    (tasklet_action) from (__do_softirq)
>    (__do_softirq) from (run_ksoftirqd)
>    (run_ksoftirqd) from (smpboot_thread_fn)
>    (smpboot_thread_fn) from (kthread)
>    (kthread) from (ret_from_fork)
> 
> Signed-off-by: Semen Protsenko <semen.protsenko@globallogic.com>
> ---
>   drivers/gpio/gpio-max732x.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index 1885e5c..edade14 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -530,7 +530,7 @@ static int max732x_irq_setup(struct max732x_chip *chip,
>   		ret =  gpiochip_irqchip_add(&chip->gpio_chip,
>   					    &max732x_irq_chip,
>   					    irq_base,
> -					    handle_edge_irq,
> +					    handle_level_irq,

Wouldn't handle_simple_irq() be a better choice here?

>   					    IRQ_TYPE_NONE);
>   		if (ret) {
>   			dev_err(&client->dev,
> 

-- 
regards,
-grygorii
