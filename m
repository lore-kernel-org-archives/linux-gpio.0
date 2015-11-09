From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2 2/2] gpio: zynq: Implement irq_pm_(get|put)
Date: Mon, 9 Nov 2015 17:00:04 +0200
Message-ID: <5640B4F4.6080008@ti.com>
References: <1446668160-17522-1-git-send-email-soren.brinkmann@xilinx.com>
 <1446668160-17522-3-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446668160-17522-3-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>, Lars-Peter Clausen <lars@metafoo.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Linn <linnj@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

Hi Soren,

On 11/04/2015 10:16 PM, Soren Brinkmann wrote:
> The driver uses runtime PM to leverage low power techniques. For
> use-cases using GPIO as interrupt the device needs to be in an
> appropriate state.
> 
> Reported-by: John Linn <linnj@xilinx.com>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

I've one question here. As I know, there is one code path when 
GPIO HW can be accessed before request_irq() during OF boot:

irq_create_of_mapping()
- irq_create_fwspec_mapping()
  - irq_set_irq_type()

How do you handle this situation? :(

> ---
> v2:
>   - declare callbacks static
> ---
>   drivers/gpio/gpio-zynq.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 8abeacac5885..98197f778694 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -471,6 +471,22 @@ static int zynq_gpio_set_wake(struct irq_data *data, unsigned int on)
>   	return 0;
>   }
>   
> +static int zynq_gpio_irq_pm_get(struct irq_data *data)
> +{
> +	struct zynq_gpio *gpio = irq_data_get_irq_chip_data(data);
> +	struct device *dev = gpio->chip.dev;
> +
> +	return pm_runtime_get_sync(dev);
> +}
> +
> +static void zynq_gpio_irq_pm_put(struct irq_data *data)
> +{
> +	struct zynq_gpio *gpio = irq_data_get_irq_chip_data(data);
> +	struct device *dev = gpio->chip.dev;
> +
> +	pm_runtime_put(dev);
> +}
> +
>   /* irq chip descriptor */
>   static struct irq_chip zynq_gpio_level_irqchip = {
>   	.name		= DRIVER_NAME,
> @@ -480,6 +496,8 @@ static struct irq_chip zynq_gpio_level_irqchip = {
>   	.irq_unmask	= zynq_gpio_irq_unmask,
>   	.irq_set_type	= zynq_gpio_set_irq_type,
>   	.irq_set_wake	= zynq_gpio_set_wake,
> +	.irq_pm_get	= zynq_gpio_irq_pm_get,
> +	.irq_pm_put	= zynq_gpio_irq_pm_put,
>   	.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED |
>   			  IRQCHIP_MASK_ON_SUSPEND,
>   };
> @@ -492,6 +510,8 @@ static struct irq_chip zynq_gpio_edge_irqchip = {
>   	.irq_unmask	= zynq_gpio_irq_unmask,
>   	.irq_set_type	= zynq_gpio_set_irq_type,
>   	.irq_set_wake	= zynq_gpio_set_wake,
> +	.irq_pm_get	= zynq_gpio_irq_pm_get,
> +	.irq_pm_put	= zynq_gpio_irq_pm_put,
>   	.flags		= IRQCHIP_MASK_ON_SUSPEND,
>   };
>   
> 


-- 
regards,
-grygorii
