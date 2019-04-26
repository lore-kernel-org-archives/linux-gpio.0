From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFC PATCH 2/3] irqchip/exiu: implement ACPI gpiolib/irqchip
 support
Date: Fri, 26 Apr 2019 09:44:30 +0100
Message-ID: <eedc61f7-5c71-46eb-0f06-18daa9c5b5df@arm.com>
References: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
 <20190425102020.21533-3-ard.biesheuvel@linaro.org>
 <1fbbfc30-7389-5618-a046-ab8872882494@arm.com>
 <CAKv+Gu99JXhNnUPpfN274qN7+TJXvFTAatn_31yDDAcrU7LpaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAKv+Gu99JXhNnUPpfN274qN7+TJXvFTAatn_31yDDAcrU7LpaQ@mail.gmail.com>
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
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Graeme Gregory <graeme.gregory@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Masahisa Kojima <masahisa.kojima@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 26/04/2019 09:24, Ard Biesheuvel wrote:
> On Thu, 25 Apr 2019 at 17:33, Marc Zyngier <marc.zyngier@arm.com> wrote:
>>
>> Hi Ard,
>>
>> On 25/04/2019 11:20, Ard Biesheuvel wrote:
>>> Expose the existing EXIU hierarchical irqchip domain code to permit
>>> the interrupt controller to be used as the irqchip component of a
>>> GPIO controller on ACPI systems.
>>>
>>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>> ---
>>>  drivers/irqchip/irq-sni-exiu.c | 82 +++++++++++++++++---
>>>  1 file changed, 73 insertions(+), 9 deletions(-)
>>>
>>
>> [...]
>>
>>> +int exiu_acpi_init(struct platform_device *pdev, struct gpio_chip *gc)
>>> +{
>>> +     struct irq_domain *parent_domain = NULL, *domain;
>>> +     struct resource *res;
>>> +     int irq;
>>> +
>>> +     irq = platform_get_irq(pdev, 0);
>>> +     if (irq > 0)
>>> +             parent_domain = irq_get_irq_data(irq)->domain;
>>> +
>>> +     if (!parent_domain) {
>>> +             dev_err(&pdev->dev, "unable to obtain parent domain\n");
>>> +             return -ENODEV;
>>> +     }
>>> +
>>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>> +     if (!res) {
>>> +             dev_err(&pdev->dev, "failed to parse memory resource\n");
>>> +             return -ENXIO;
>>> +     }
>>> +
>>> +     domain = exiu_init(parent_domain, dev_fwnode(&pdev->dev), res);
>>> +     if (IS_ERR(domain)) {
>>> +             dev_err(&pdev->dev, "failed to create IRQ domain (%ld)\n",
>>> +                     PTR_ERR(domain));
>>> +             return PTR_ERR(domain);
>>> +     }
>>> +
>>> +     gc->irq.domain = domain;
>>> +     gc->to_irq = exiu_acpi_gpio_to_irq;
>>> +
>>> +     dev_info(&pdev->dev, "%d interrupts forwarded\n", NUM_IRQS);
>>> +
>>> +     return 0;
>>> +}
>>> +EXPORT_SYMBOL(exiu_acpi_init);
>>> +#endif
>>>
>>
>> I must say I'm not overly keen on this function. Why can't this be
>> probed as an ACPI device, creating the corresponding domain, and leaving
>> to the GPIO driver the task of doing the GPIO stuff?
>>
> 
> Because ACPI only permits 'system' interrupts or GPIO interrupts, it
> does not allow arbitrary device objects in the ACPI namespace to be
> targeted as interrupt controllers.

Hmmm. We already have at least one driver (irq-mbigen.c) that does
exactly that. It uses interrupts from the GIC (it is notionally behind
the ITS), and offers a bunch of interrupt lines itself. Why is it different?

> 
>> I appreciate there is a dependency between the two, but that's something
>> we should be able to solve (probe deferral?).
>>
> 
> Perhaps it would be better to just clone the irqchip part into the
> GPIO driver? Everything else needs to be modified anyway, including
> the domain alloc/translate methods.
> 
> That still leaves the question how to deal with the first four signal
> lines, which are not shared between the EXIU and the GPIO controller.
> but personally, I'm happy to just categorize that as "don't do that"
> territory, and just ignore it for the time being.
> 

Maybe. But I'd really like to understand why the above doesn't work in
your case (as you can tell, my ACPI-foo is pretty basic...).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
