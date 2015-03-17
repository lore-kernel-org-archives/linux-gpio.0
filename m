From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] gpio: mmp: add GPIO driver for Marvell MMP series
Date: Tue, 17 Mar 2015 08:05:53 -0500
Message-ID: <CAL_Jsq+quKkqs-g5hB1O_bSJPEAX0c60wpUteDD9+xbuNmOiDw@mail.gmail.com>
References: <1425607483-8614-1-git-send-email-chao.xie@marvell.com> <CACRpkdaLGotNhCdgz6fZ8ksmVPudn8PFUaL2WcTBgey1U=32CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:36528 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752520AbbCQNGQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 09:06:16 -0400
In-Reply-To: <CACRpkdaLGotNhCdgz6fZ8ksmVPudn8PFUaL2WcTBgey1U=32CA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chao Xie <chao.xie@marvell.com>, Andrew Ruder <andy@aeruder.net>, Eric Miao <eric.y.miao@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chao Xie <xiechao_mail@163.com>, Haojian Zhuang <haojian.zhuang@gmail.com>

On Tue, Mar 17, 2015 at 5:25 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Mar 6, 2015 at 3:04 AM, Chao Xie <chao.xie@marvell.com> wrote:
>
>> From: Chao Xie <chao.xie@marvell.com>
>>
>> For some old PXA series, they used PXA GPIO driver.
>> The IP of GPIO changes since PXA988 which is Marvell MMP
>> series.

FWIW, What I have has support for PXA1928, PXA1986, PXA988, PXA1088.
There's not a clear distinction between MMP and PXA that AFAICT.

>> It will use new way to control the GPIO level, direction
>> and edge status.
>>
>> Signed-off-by: Chao Xie <chao.xie@marvell.com>
>
> First can some of the MMP people comment on this driver please?
> (Eric/Haojian)
>
> So this driver duplicates drivers/gpio/gpio-pxa.c in some sense but
> is nicer and cleaner and thus an incentive for me to merge it.
> At the same time I don't want two drivers for essentially the same
> hardware and in that way I would prefer to clean up the PXA driver.

There's a few other changes to the driver, but the only h/w change is
PXA1986 which has different edge detect registers. You can find the
tree here [1].

Rob

[1] https://git-ara-mdk.linaro.org/kernel/pxa1928.git/shortlog/refs/heads/projectara-spiral2-5.0.0-v3

>
> But I don't know how close the PXA and MMP drivers really are.
>
> Will it also cover MMP2 that is currently using by the PXA driver?
>
> Is it really complicated to migrate gpio-pxa to GPIOLIB_IRQCHIP?
>
> I guess you should also delete the compatible string and
> compatibility code in drivers/gpio/gpio-pxa.c (as a separate patch
> in this series) and merge this along with some defconfig
> changes that activates this by default for the MMP machines?
>
>> +config GPIO_MMP
>> +       bool "MMP GPIO support"
>> +       depends on ARCH_MMP
>> +       select GPIOLIB_IRQCHIP
>
> NICE!
>
>> +struct mmp_gpio_bank {
>> +       void __iomem *reg_bank;
>> +       u32 irq_mask;
>> +       u32 irq_rising_edge;
>> +       u32 irq_falling_edge;
>
> I can't see why you're keeping all these settings of the edges and mask
> in these variables. Why can't you just keep the state in the hardware
> registers?
>
>> +};
>> +
>> +struct mmp_gpio_chip {
>> +       struct gpio_chip chip;
>> +       void __iomem *reg_base;
>> +       int irq;
>
> Do you need to keep irq around if you use devm_* to request the
> IRQ?
>
>> +       unsigned int ngpio;
>
> This is already stored in struct gpio_chip, why
> store it a second time in this struct?
>
>> +       unsigned int nbank;
>> +       struct mmp_gpio_bank *banks;
>
> To repeat an eternal story: why do you have to register several
> banks under the same gpio_chip? I guess it's because they share
> a single IRQ line, but wanna make sure....
>
>> +};
>> +
>> +static int mmp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       struct mmp_gpio_chip *mmp_chip =
>> +                       container_of(chip, struct mmp_gpio_chip, chip);
>> +       struct mmp_gpio_bank *bank =
>> +                       &mmp_chip->banks[mmp_gpio_to_bank_idx(offset)];
>
> Rewrite this:
>
>> +       u32 bit = (1 << mmp_gpio_to_bank_offset(offset));
>> +
>> +       writel(bit, bank->reg_bank + GCDR);
>
> Like this:
>
> #include <linux/bitops.h>
>
> writel(BIT(mmp_gpio_to_bank_offset(offset)), bank->reg_bank + GCDR);
>
>
>> +static int mmp_gpio_direction_output(struct gpio_chip *chip,
>> +                                    unsigned offset, int value)
>> +{
>> +       struct mmp_gpio_chip *mmp_chip =
>> +                       container_of(chip, struct mmp_gpio_chip, chip);
>> +       struct mmp_gpio_bank *bank =
>> +                       &mmp_chip->banks[mmp_gpio_to_bank_idx(offset)];
>> +       u32 bit = (1 << mmp_gpio_to_bank_offset(offset));
>> +
>> +       /* Set value first. */
>> +       writel(bit, bank->reg_bank + (value ? GPSR : GPCR));
>> +
>> +       writel(bit, bank->reg_bank + GSDR);
>
> Use the same pattern with BIT() as described above.
>
>> +static int mmp_gpio_get(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       struct mmp_gpio_chip *mmp_chip =
>> +                       container_of(chip, struct mmp_gpio_chip, chip);
>> +       struct mmp_gpio_bank *bank =
>> +                       &mmp_chip->banks[mmp_gpio_to_bank_idx(offset)];
>> +       u32 bit = (1 << mmp_gpio_to_bank_offset(offset));
>> +       u32 gplr;
>> +
>> +       gplr  = readl(bank->reg_bank + GPLR);
>> +
>> +       return !!(gplr & bit);
>
> Use the same pattern with BIT() as described above.
>
> return !!(readl(bank->reg_bank + GPLR) & BIT(mmp_gpio_to_bank_offset(offset)));
>
>> +static void mmp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>> +{
>> +       struct mmp_gpio_chip *mmp_chip =
>> +                       container_of(chip, struct mmp_gpio_chip, chip);
>> +       struct mmp_gpio_bank *bank =
>> +                       &mmp_chip->banks[mmp_gpio_to_bank_idx(offset)];
>> +       u32 bit = (1 << mmp_gpio_to_bank_offset(offset));
>> +       u32 gpdr;
>> +
>> +       gpdr = readl(bank->reg_bank + GPDR);
>> +       /* Is it configured as output? */
>> +       if (gpdr & bit)
>> +               writel(bit, bank->reg_bank + (value ? GPSR : GPCR));
>
> Use the same pattern with BIT() as described above.
>
>> +static int mmp_gpio_irq_type(struct irq_data *d, unsigned int type)
>> +{
>> +       struct mmp_gpio_chip *mmp_chip = irq_data_get_irq_chip_data(d);
>> +       int gpio = irqd_to_hwirq(d);
>> +       struct mmp_gpio_bank *bank =
>> +                       &mmp_chip->banks[mmp_gpio_to_bank_idx(gpio)];
>> +       u32 bit = (1 << mmp_gpio_to_bank_offset(gpio));
>> +
>> +       if (type & IRQ_TYPE_EDGE_RISING) {
>> +               bank->irq_rising_edge |= bit;
>> +               writel(bit, bank->reg_bank + GSRER);
>> +       } else {
>> +               bank->irq_rising_edge &= ~bit;
>> +               writel(bit, bank->reg_bank + GCRER);
>> +       }
>> +
>> +       if (type & IRQ_TYPE_EDGE_FALLING) {
>> +               bank->irq_falling_edge |= bit;
>> +               writel(bit, bank->reg_bank + GSFER);
>> +       } else {
>> +               bank->irq_falling_edge &= ~bit;
>> +               writel(bit, bank->reg_bank + GCFER);
>> +       }
>
> Use the same pattern with BIT() as described above.
>
>> +static void mmp_gpio_demux_handler(unsigned int irq, struct irq_desc *desc)
>
> Why call it a demux handler ... just call it irq_handler().
>
>> +{
>> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>> +       struct mmp_gpio_chip *mmp_chip = irq_get_handler_data(irq);
>> +       struct mmp_gpio_bank *bank;
>> +       int i, n;
>> +       u32 gedr;
>> +       unsigned long pending = 0;
>> +
>> +       chained_irq_enter(chip, desc);
>> +
>> +       for (i = 0; i < mmp_chip->nbank; i++) {
>> +               bank = &mmp_chip->banks[i];
>> +
>> +               gedr = readl(bank->reg_bank + GEDR);
>> +               writel(gedr, bank->reg_bank + GEDR);
>> +               gedr = gedr & bank->irq_mask;
>> +
>> +               if (!gedr)
>> +                       continue;
>> +               pending = gedr;
>> +               for_each_set_bit(n, &pending, BANK_GPIO_NUMBER)
>> +                       generic_handle_irq(irq_find_mapping(
>> +                                               mmp_chip->chip.irqdomain,
>> +                                               mmp_bank_to_gpio(i, n)));
>> +       }
>> +
>> +       chained_irq_exit(chip, desc);
>> +}
>
> This function looks really nice, given that the same IRQ line goes to
> all banks... which seems to be the case :( (unfortunate HW design).
>
>> +static void mmp_mask_muxed_gpio(struct irq_data *d)
>> +{
>> +       struct mmp_gpio_chip *mmp_chip = irq_data_get_irq_chip_data(d);
>> +       int gpio = irqd_to_hwirq(d);
>> +       struct mmp_gpio_bank *bank =
>> +                       &mmp_chip->banks[mmp_gpio_to_bank_idx(gpio)];
>> +       u32 bit = (1 << mmp_gpio_to_bank_offset(gpio));
>> +
>> +       bank->irq_mask &= ~bit;
>> +
>> +       /* Clear the bit of rising and falling edge detection. */
>> +       writel(bit, bank->reg_bank + GCRER);
>> +       writel(bit, bank->reg_bank + GCFER);
>> +}
>
> Use BIT() macro.
>
>> +static void mmp_unmask_muxed_gpio(struct irq_data *d)
>> +{
>> +       struct mmp_gpio_chip *mmp_chip = irq_data_get_irq_chip_data(d);
>> +       int gpio = irqd_to_hwirq(d);
>> +       struct mmp_gpio_bank *bank =
>> +                       &mmp_chip->banks[mmp_gpio_to_bank_idx(gpio)];
>> +       u32 bit = (1 << mmp_gpio_to_bank_offset(gpio));
>> +
>> +       bank->irq_mask |= bit;
>> +
>> +       /* Set the bit of rising and falling edge detection if the gpio has. */
>> +       writel(bit & bank->irq_rising_edge, bank->reg_bank + GSRER);
>> +       writel(bit & bank->irq_falling_edge, bank->reg_bank + GSFER);
>> +}
>
> Use BIT() macro.
>
>> +
>> +static struct irq_chip mmp_muxed_gpio_chip = {
>> +       .name           = "mmp-gpio-irqchip",
>> +       .irq_mask       = mmp_mask_muxed_gpio,
>> +       .irq_unmask     = mmp_unmask_muxed_gpio,
>> +       .irq_set_type   = mmp_gpio_irq_type,
>> +       .flags          = IRQCHIP_SKIP_SET_WAKE,
>> +};
>> +
>> +static struct of_device_id mmp_gpio_dt_ids[] = {
>> +       { .compatible = "marvell,mmp-gpio"},
>> +       {}
>> +};
>
> So the same functionality in the other compatible driver should
> be deleted as a separate patch.
>
>> +static int mmp_gpio_probe_dt(struct platform_device *pdev,
>> +                               struct mmp_gpio_chip *mmp_chip)
>> +{
>> +       struct device_node *np = pdev->dev.of_node;
>> +       struct device_node *child;
>> +       u32 offset;
>> +       int i, nbank, ret;
>> +
>> +       if (!np)
>> +               return -EINVAL;
>> +
>> +       nbank = of_get_child_count(np);
>> +       if (nbank == 0)
>> +               return -EINVAL;
>> +
>> +       mmp_chip->banks = devm_kzalloc(&pdev->dev,
>> +                               sizeof(*mmp_chip->banks) * nbank,
>> +                               GFP_KERNEL);
>> +       if (!mmp_chip->banks)
>> +               return -ENOMEM;
>> +
>> +       i = 0;
>> +       for_each_child_of_node(np, child) {
>> +               ret = of_property_read_u32(child, "reg-offset", &offset);
>> +               if (ret)
>> +                       return ret;
>> +               mmp_chip->banks[i].reg_bank = mmp_chip->reg_base + offset;
>> +               i++;
>> +       }
>> +
>> +       mmp_chip->nbank = nbank;
>> +       mmp_chip->ngpio = mmp_chip->nbank * BANK_GPIO_NUMBER;
>> +
>> +       return 0;
>> +}
>
> Soon we havce so many drivers like this that we should abstract out a
> routine like this into gpiolib-of.c
>
>> +static int mmp_gpio_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct mmp_gpio_platform_data *pdata;
>> +       struct device_node *np;
>> +       struct mmp_gpio_chip *mmp_chip;
>> +       struct mmp_gpio_bank *bank;
>> +       struct resource *res;
>> +       struct clk *clk;
>> +       int irq, i, ret;
>> +       void __iomem *base;
>> +
>> +       pdata = dev_get_platdata(dev);
>> +       np = pdev->dev.of_node;
>> +       if (!np && !pdata)
>> +               return -EINVAL;
>> +
>> +       mmp_chip = devm_kzalloc(dev, sizeof(*mmp_chip), GFP_KERNEL);
>> +       if (!mmp_chip)
>> +               return -ENOMEM;
>> +
>> +       irq = platform_get_irq(pdev, 0);
>> +       if (irq < 0)
>> +               return irq;
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       if (!res)
>> +               return -EINVAL;
>> +       base = devm_ioremap_resource(dev, res);
>> +       if (!base)
>> +               return -EINVAL;
>> +
>> +       mmp_chip->irq = irq;
>
> Why keep this around?
>
> And why are you not calling devm_request_irq()???
>
>> +       mmp_chip->reg_base = base;
>> +
>> +       ret = mmp_gpio_probe_dt(pdev, mmp_chip);
>> +       if (ret) {
>> +               dev_err(dev, "Fail to initialize gpio unit, error %d.\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       clk = devm_clk_get(dev, NULL);
>> +       if (IS_ERR(clk)) {
>> +               dev_err(dev, "Fail to get gpio clock, error %ld.\n",
>> +                       PTR_ERR(clk));
>> +               return PTR_ERR(clk);
>> +       }
>> +       ret = clk_prepare_enable(clk);
>> +       if (ret) {
>> +               dev_err(dev, "Fail to enable gpio clock, error %d.\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       /* Initialize the gpio chip */
>> +       mmp_chip->chip.label = dev_name(dev);
>> +       mmp_chip->chip.ngpio = mmp_chip->ngpio;
>> +       mmp_chip->chip.dev = dev;
>> +       mmp_chip->chip.base = 0;
>> +
>> +       mmp_chip->chip.direction_input  = mmp_gpio_direction_input;
>> +       mmp_chip->chip.direction_output = mmp_gpio_direction_output;
>> +       mmp_chip->chip.get = mmp_gpio_get;
>> +       mmp_chip->chip.set = mmp_gpio_set;
>> +
>> +       gpiochip_add(&mmp_chip->chip);
>> +
>> +       /* clear all GPIO edge detects */
>> +       for (i = 0; i < mmp_chip->nbank; i++) {
>> +               bank = &mmp_chip->banks[i];
>> +               writel(0xffffffff, bank->reg_bank + GCFER);
>> +               writel(0xffffffff, bank->reg_bank + GCRER);
>> +               /* Unmask edge detection to AP. */
>> +               writel(0xffffffff, bank->reg_bank + GAPMASK);
>> +       }
>> +
>> +       ret = gpiochip_irqchip_add(&mmp_chip->chip, &mmp_muxed_gpio_chip, 0,
>> +                                  handle_simple_irq, IRQ_TYPE_NONE);
>> +       if (ret) {
>> +               dev_err(dev, "failed to add irqchip\n");
>> +               clk_disable_unprepare(clk);
>> +               gpiochip_remove(&mmp_chip->chip);
>> +               return ret;
>> +       }
>> +
>> +       gpiochip_set_chained_irqchip(&mmp_chip->chip, &mmp_muxed_gpio_chip,
>> +                                    mmp_chip->irq, mmp_gpio_demux_handler);
>
> mmp_chip->irq has not been requested AFAICT!
>
>> +
>> +       return 0;
>> +}
>> +
>> +static struct platform_driver mmp_gpio_driver = {
>> +       .probe          = mmp_gpio_probe,
>> +       .driver         = {
>> +               .name   = "mmp-gpio",
>> +               .of_match_table = mmp_gpio_dt_ids,
>> +       },
>> +};
>> +
>> +/*
>> + * gpio driver register needs to be done before
>> + * machine_init functions access gpio APIs.
>> + * Hence register the driver in postcore initcall.
>> + */
>> +static int __init mmp_gpio_init(void)
>> +{
>> +       return platform_driver_register(&mmp_gpio_driver);
>> +}
>> +postcore_initcall(mmp_gpio_init);
>
> Why do you have to have this so early?
>
> I *strongly* prefer module_* initcalls at device_initcall()
> level maybe using deferred probe if need be. It is better
> if the init order is not relied upon to synchronize drivers.
>
> Yours,
> Linus Walleij
