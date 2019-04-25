From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFC PATCH 2/3] irqchip/exiu: implement ACPI gpiolib/irqchip
 support
Date: Thu, 25 Apr 2019 16:33:40 +0100
Message-ID: <1fbbfc30-7389-5618-a046-ab8872882494@arm.com>
References: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
 <20190425102020.21533-3-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190425102020.21533-3-ard.biesheuvel@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Graeme Gregory <graeme.gregory@linaro.org>, Masahisa Kojima <masahisa.kojima@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Ard,

On 25/04/2019 11:20, Ard Biesheuvel wrote:
> Expose the existing EXIU hierarchical irqchip domain code to permit
> the interrupt controller to be used as the irqchip component of a
> GPIO controller on ACPI systems.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  drivers/irqchip/irq-sni-exiu.c | 82 +++++++++++++++++---
>  1 file changed, 73 insertions(+), 9 deletions(-)
> 

[...]

> +int exiu_acpi_init(struct platform_device *pdev, struct gpio_chip *gc)
> +{
> +	struct irq_domain *parent_domain = NULL, *domain;
> +	struct resource *res;
> +	int irq;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq > 0)
> +		parent_domain = irq_get_irq_data(irq)->domain;
> +
> +	if (!parent_domain) {
> +		dev_err(&pdev->dev, "unable to obtain parent domain\n");
> +		return -ENODEV;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res) {
> +		dev_err(&pdev->dev, "failed to parse memory resource\n");
> +		return -ENXIO;
> +	}
> +
> +	domain = exiu_init(parent_domain, dev_fwnode(&pdev->dev), res);
> +	if (IS_ERR(domain)) {
> +		dev_err(&pdev->dev, "failed to create IRQ domain (%ld)\n",
> +			PTR_ERR(domain));
> +		return PTR_ERR(domain);
> +	}
> +
> +	gc->irq.domain = domain;
> +	gc->to_irq = exiu_acpi_gpio_to_irq;
> +
> +	dev_info(&pdev->dev, "%d interrupts forwarded\n", NUM_IRQS);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(exiu_acpi_init);
> +#endif
> 

I must say I'm not overly keen on this function. Why can't this be
probed as an ACPI device, creating the corresponding domain, and leaving
to the GPIO driver the task of doing the GPIO stuff?

I appreciate there is a dependency between the two, but that's something
we should be able to solve (probe deferral?).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
