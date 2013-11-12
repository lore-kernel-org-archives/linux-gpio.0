From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: davinci: Fix a check for unbanked gpio
Date: Tue, 12 Nov 2013 11:48:19 +0530
Message-ID: <5281C82B.9090402@ti.com>
References: <1383893156-28010-1-git-send-email-prabhakar.csengg@gmail.com>
	<1383893156-28010-2-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1383893156-28010-2-git-send-email-prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Friday 08 November 2013 12:15 PM, Prabhakar Lad wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch fixes a check for offset in gpio_to_irq_unbanked()
> and also assigns gpio_irq, gpio_unbanked of chips[0] to
> appropriate values which is used in gpio_to_irq_unbanked()
> function.
> 
> Reported-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

You should note explicitly that this patch fixes broken unbanked IRQ
support. You mostly just described what you are doing.

I will fixup while committing.

Thanks,
Sekhar

> ---
>  drivers/gpio/gpio-davinci.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 8847adf..84be701 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -327,7 +327,7 @@ static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
>  	 * NOTE:  we assume for now that only irqs in the first gpio_chip
>  	 * can provide direct-mapped IRQs to AINTC (up to 32 GPIOs).
>  	 */
> -	if (offset < d->irq_base)
> +	if (offset < d->gpio_unbanked)
>  		return d->gpio_irq + offset;
>  	else
>  		return -ENODEV;
> @@ -419,6 +419,8 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>  
>  		/* pass "bank 0" GPIO IRQs to AINTC */
>  		chips[0].chip.to_irq = gpio_to_irq_unbanked;
> +		chips[0].gpio_irq = bank_irq;
> +		chips[0].gpio_unbanked = pdata->gpio_unbanked;
>  		binten = BIT(0);
>  
>  		/* AINTC handles mask/unmask; GPIO handles triggering */
> 
