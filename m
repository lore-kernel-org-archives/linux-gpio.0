From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] gpio: add Intel WhiskeyCove GPIO driver
Date: Tue, 21 Jun 2016 02:19:57 +0300
Message-ID: <CAHp75VfGpfeBXJG_SN_nyu22Ex8WbABve1qZ+b6pOQimz5N2rA@mail.gmail.com>
References: <20160620180214.GA38668@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33927 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753073AbcFUBGd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2016 21:06:33 -0400
In-Reply-To: <20160620180214.GA38668@worksta>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>

On Mon, Jun 20, 2016 at 9:02 PM, Bin Gao <bin.gao@linux.intel.com> wrote:
> This patch introduces a separate GPIO driver for Intel WhiskeyCove PMIC.
> This driver is based on gpio-crystalcove.c.

My comments below.

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index cebcb40..ac74299 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -806,6 +806,19 @@ config GPIO_CRYSTAL_COVE
>           This driver can also be built as a module. If so, the module will be
>           called gpio-crystalcove.
>
> +config GPIO_WHISKEY_COVE
> +       tristate "GPIO support for Whiskey Cove PMIC"
> +       depends on INTEL_SOC_PMIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Support for GPIO pins on Whiskey Cove PMIC.
> +
> +         Say Yes if you have a Intel SoC based tablet with Whiskey Cove PMIC

What if I have not a tablet with WC PMIC inside?

> +         inside.
> +
> +         This driver can also be built as a module. If so, the module will be
> +         called gpio-wcove.

> +#include <linux/seq_file.h>
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/intel_soc_pmic.h>

Alphabetical order?

> +
> +/*
> + * Whiskey Cove PMIC has 13 physical GPIO pins divided into 3 banks:
> + * Bank 0: Pin 0 - 6
> + * Bank 1: Pin 7 - 10
> + * Bank 2: Pin 11 -12
> + * Each pin has one output control register and one input control register.
> + */
> +#define BANK0_NR_PINS          7
> +#define BANK1_NR_PINS          4
> +#define BANK2_NR_PINS          2
> +#define WCOVE_GPIO_NUM         (BANK0_NR_PINS + BANK1_NR_PINS + BANK2_NR_PINS)
> +#define WCOVE_VGPIO_NUM                94
> +/* GPIO output control registers(one per pin): 0x4e44 - 0x4e50 */
> +#define GPIO_OUT_CTRL_BASE     0x4e44
> +/* GPIO input control registers(one per pin): 0x4e51 - 0x4e5d */
> +#define GPIO_IN_CTRL_BASE      0x4e51
> +
> +/*
> + * GPIO interrupts are organized in two groups:
> + * Group 0: Bank 0 pins (Pin 0 - 6)
> + * Group 1: Bank 1 and Bank 2 pins (Pin 7 - 12)
> + * Each group has two registers(one bit per pin): status and mask.
> + */
> +#define GROUP0_NR_IRQS         7
> +#define GROUP1_NR_IRQS         6
> +#define IRQ_MASK_BASE          0x4e19
> +#define IRQ_STATUS_BASE                0x4e0b

Can you define all your bases as a) offsets by value, and b) with
_OFFSET suffix instead of _BASE, though second one is up to you.

> +#define UPDATE_IRQ_TYPE                BIT(0)
> +#define UPDATE_IRQ_MASK                BIT(1)
> +
> +#define CTLI_INTCNT_DIS                (0)

(0 << 1) or...

> +#define CTLI_INTCNT_NE         (1 << 1)
> +#define CTLI_INTCNT_PE         (2 << 1)
> +#define CTLI_INTCNT_BE         (3 << 1)

...INTCNT(x)  ((x) << 1)
...DIS 0
...NE 1

and so on.

Same for all similar blocks of constants.

> +
> +#define CTLO_DIR_IN            (0)
> +#define CTLO_DIR_OUT           (1 << 5)
> +
> +#define CTLO_DRV_MASK          (1 << 4)
> +#define CTLO_DRV_OD            (0)
> +#define CTLO_DRV_CMOS          CTLO_DRV_MASK
> +
> +#define CTLO_DRV_REN           (1 << 3)
> +
> +#define CTLO_RVAL_2KDW         (0)
> +#define CTLO_RVAL_2KUP         (1 << 1)
> +#define CTLO_RVAL_50KDW                (2 << 1)
> +#define CTLO_RVAL_50KUP                (3 << 1)

Wait, are you sure that's is pure gpio and not a full pinctrl (pinconf) + gpio?

> +
> +#define CTLO_INPUT_SET (CTLO_DRV_CMOS | CTLO_DRV_REN | CTLO_RVAL_2KUP)
> +#define CTLO_OUTPUT_SET        (CTLO_DIR_OUT | CTLO_INPUT_SET)
> +
> +enum ctrl_register {
> +       CTRL_IN,
> +       CTRL_OUT,
> +};
> +
> +/*
> + * struct wcove_gpio - Whiskey Cove GPIO controller
> + * @buslock: for bus lock/sync and unlock.
> + * @chip: the abstract gpio_chip structure.
> + * @regmap: the regmap from the parent device.
> + * @regmap_irq_chip: the regmap of the gpio irq chip.
> + * @update: pending IRQ setting update, to be written to the chip upon unlock.
> + * @intcnt_value: the Interrupt Detect value to be written.
> + * @set_irq_mask: true if the IRQ mask needs to be set, false to clear.
> + */
> +struct wcove_gpio {
> +       struct mutex buslock; /* irq_bus_lock */
> +       struct gpio_chip chip;
> +       struct regmap *regmap;
> +       struct regmap_irq_chip_data *regmap_irq_chip;
> +       int update;
> +       int intcnt_value;
> +       bool set_irq_mask;
> +};
> +
> +static inline unsigned int to_reg(int gpio, enum ctrl_register reg_type)
> +{
> +       unsigned int reg;
> +       int bank;
> +
> +       if (gpio < BANK0_NR_PINS)
> +               bank = 0;
> +       else if (gpio < (BANK0_NR_PINS + BANK1_NR_PINS))
> +               bank = 1;
> +       else
> +               bank = 2;

It might be better to use a constant struct to iterate through:

struct gpio_banks {
 ... bankno;
 ... start;
 ... len;
};

Though I have no strong opinion here since it will have only 3 records.

> +
> +       if (reg_type == CTRL_IN)
> +               reg = GPIO_IN_CTRL_BASE + bank;
> +       else
> +               reg = GPIO_OUT_CTRL_BASE + bank;
> +
> +       return reg;
> +}
> +
> +static void wcove_update_irq_mask(struct wcove_gpio *wg, int gpio)
> +{
> +       int group;
> +       unsigned int reg, bit;
> +
> +       group = gpio < GROUP0_NR_IRQS ? 0 : 1;
> +       reg = IRQ_MASK_BASE + group;
> +       bit = (group == 0) ? BIT(gpio % GROUP0_NR_IRQS) :
> +               BIT((gpio - GROUP0_NR_IRQS) % GROUP1_NR_IRQS);
> +
> +       if (wg->set_irq_mask)
> +               regmap_update_bits(wg->regmap, reg, bit, 1);
> +       else
> +               regmap_update_bits(wg->regmap, reg, bit, 0);
> +}
> +
> +static void wcove_update_irq_ctrl(struct wcove_gpio *wg, int gpio)
> +{
> +       unsigned int reg = to_reg(gpio, CTRL_IN);
> +
> +       regmap_update_bits(wg->regmap, reg, CTLI_INTCNT_BE, wg->intcnt_value);
> +}
> +
> +static int wcove_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +
> +       return regmap_write(wg->regmap, to_reg(gpio, CTRL_OUT),
> +                           CTLO_INPUT_SET);
> +}
> +
> +static int wcove_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
> +                                   int value)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +
> +       return regmap_write(wg->regmap, to_reg(gpio, CTRL_OUT),
> +                           CTLO_OUTPUT_SET | value);
> +}
> +
> +static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +       int ret;
> +       unsigned int val;

Reverse xmas tree, please.

> +       ret = regmap_read(wg->regmap, to_reg(gpio, CTRL_IN), &val);
> +       if (ret)
> +               return ret;
> +
> +       return val & 0x1;
> +}
> +
> +static void wcove_gpio_set(struct gpio_chip *chip,
> +                                unsigned int gpio, int value)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +
> +       if (value)
> +               regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT), 1, 1);
> +       else
> +               regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT), 1, 0);
> +}
> +
> +static int wcove_gpio_set_single_ended(struct gpio_chip *chip,
> +                                       unsigned int gpio,
> +                                       enum single_ended_mode mode)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +
> +       switch (mode) {
> +       case LINE_MODE_OPEN_DRAIN:
> +               return regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT),
> +                                               CTLO_DRV_MASK, CTLO_DRV_OD);
> +       case LINE_MODE_PUSH_PULL:
> +               return regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT),
> +                                               CTLO_DRV_MASK, CTLO_DRV_CMOS);
> +       default:
> +               break;
> +       }
> +
> +       return -ENOTSUPP;


> +}
> +
> +static int wcove_irq_type(struct irq_data *data, unsigned int type)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(
> +               irq_data_get_irq_chip_data(data));
> +
> +       switch (type) {
> +       case IRQ_TYPE_NONE:
> +               wg->intcnt_value = CTLI_INTCNT_DIS;
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               wg->intcnt_value = CTLI_INTCNT_BE;
> +               break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               wg->intcnt_value = CTLI_INTCNT_PE;
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               wg->intcnt_value = CTLI_INTCNT_NE;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       wg->update |= UPDATE_IRQ_TYPE;
> +
> +       return 0;
> +}
> +
> +static void wcove_bus_lock(struct irq_data *data)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(
> +               irq_data_get_irq_chip_data(data));
> +
> +       mutex_lock(&wg->buslock);

I suppose you have to add a hint to static analyzer here and below.

> +}
> +
> +static void wcove_bus_sync_unlock(struct irq_data *data)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(
> +               irq_data_get_irq_chip_data(data));

One line

> +       int gpio = data->hwirq;
> +
> +       if (wg->update & UPDATE_IRQ_TYPE)
> +               wcove_update_irq_ctrl(wg, gpio);
> +       if (wg->update & UPDATE_IRQ_MASK)
> +               wcove_update_irq_mask(wg, gpio);
> +       wg->update = 0;
> +
> +       mutex_unlock(&wg->buslock);
> +}
> +
> +static void wcove_irq_unmask(struct irq_data *data)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(
> +               irq_data_get_irq_chip_data(data));
> +
> +       wg->set_irq_mask = false;
> +       wg->update |= UPDATE_IRQ_MASK;
> +}
> +
> +static void wcove_irq_mask(struct irq_data *data)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(
> +               irq_data_get_irq_chip_data(data));
> +
> +       wg->set_irq_mask = true;
> +       wg->update |= UPDATE_IRQ_MASK;
> +}
> +
> +static struct irq_chip wcove_irqchip = {
> +       .name                   = "Whiskey Cove",
> +       .irq_mask               = wcove_irq_mask,
> +       .irq_unmask             = wcove_irq_unmask,
> +       .irq_set_type           = wcove_irq_type,
> +       .irq_bus_lock           = wcove_bus_lock,
> +       .irq_bus_sync_unlock    = wcove_bus_sync_unlock,

Is it my mail client or they are not aligned?

> +};
> +
> +static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
> +{
> +       struct wcove_gpio *wg = data;
> +       unsigned int p0, p1, virq;
> +       int pending, gpio;

unsigned int gpio;

> +
> +       if (regmap_read(wg->regmap, IRQ_STATUS_BASE, &p0) ||

Better to use + 0 here.

> +           regmap_read(wg->regmap, IRQ_STATUS_BASE + 1, &p1)) {
> +               pr_err("%s(): regmap_read() failed.\n", __func__);

dev_err();

> +               return IRQ_NONE;
> +       }
> +
> +       pending = p0 | (p1 << 8);
> +
> +       for (gpio = 0; gpio < WCOVE_GPIO_NUM; gpio++) {
> +               if (pending & BIT(gpio)) {
> +                       virq = irq_find_mapping(wg->chip.irqdomain, gpio);
> +                       handle_nested_irq(virq);
> +               }
> +       }
> +
> +       regmap_write(wg->regmap, IRQ_STATUS_BASE, p0);

Ditto.

> +       regmap_write(wg->regmap, IRQ_STATUS_BASE + 1, p1);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void wcove_gpio_dbg_show(struct seq_file *s,
> +                                     struct gpio_chip *chip)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +       int gpio, offset, group;
> +       unsigned int ctlo, ctli, irq_mask, irq_status;
> +
> +       for (gpio = 0; gpio < WCOVE_GPIO_NUM; gpio++) {
> +               group = gpio < GROUP0_NR_IRQS ? 0 : 1;
> +               regmap_read(wg->regmap, to_reg(gpio, CTRL_OUT), &ctlo);
> +               regmap_read(wg->regmap, to_reg(gpio, CTRL_IN), &ctli);
> +               regmap_read(wg->regmap, IRQ_MASK_BASE + group, &irq_mask);
> +               regmap_read(wg->regmap, IRQ_STATUS_BASE + group, &irq_status);
> +
> +               offset = gpio % 8;
> +               seq_printf(s, " gpio-%-2d %s %s %s %s ctlo=%2x,%s %s\n",
> +                          gpio, ctlo & CTLO_DIR_OUT ? "out" : "in ",
> +                          ctli & 0x1 ? "hi" : "lo",
> +                          ctli & CTLI_INTCNT_NE ? "fall" : "    ",
> +                          ctli & CTLI_INTCNT_PE ? "rise" : "    ",
> +                          ctlo,
> +                          irq_mask & BIT(offset) ? "mask  " : "unmask",
> +                          irq_status & BIT(offset) ? "pending" : "       ");
> +       }
> +}
> +
> +static int wcove_gpio_probe(struct platform_device *pdev)
> +{
> +       int virq, retval, irq = platform_get_irq(pdev, 0);
> +       struct wcove_gpio *wg;
> +       struct device *dev = pdev->dev.parent;
> +       struct intel_soc_pmic *pmic = dev_get_drvdata(dev);

> +

Put irq assignment here.

> +       if (irq < 0)
> +               return irq;
> +
> +       wg = devm_kzalloc(&pdev->dev, sizeof(*wg), GFP_KERNEL);
> +       if (!wg)
> +               return -ENOMEM;
> +
> +       wg->regmap_irq_chip = pmic->irq_chip_data_level2;
> +

> +       platform_set_drvdata(pdev, wg);


> +
> +       mutex_init(&wg->buslock);
> +       wg->chip.label = KBUILD_MODNAME;
> +       wg->chip.direction_input = wcove_gpio_dir_in;
> +       wg->chip.direction_output = wcove_gpio_dir_out;
> +       wg->chip.get = wcove_gpio_get;
> +       wg->chip.set = wcove_gpio_set;
> +       wg->chip.set_single_ended = wcove_gpio_set_single_ended,
> +       wg->chip.base = -1;
> +       wg->chip.ngpio = WCOVE_VGPIO_NUM;
> +       wg->chip.can_sleep = true;
> +       wg->chip.parent = dev;
> +       wg->chip.dbg_show = wcove_gpio_dbg_show;
> +       wg->regmap = pmic->regmap;
> +
> +       retval = devm_gpiochip_add_data(&pdev->dev, &wg->chip, wg);
> +       if (retval) {
> +               dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
> +               return retval;
> +       }
> +
> +       gpiochip_irqchip_add(&wg->chip, &wcove_irqchip, 0,
> +                            handle_simple_irq, IRQ_TYPE_NONE);
> +
> +       virq = regmap_irq_get_virq(wg->regmap_irq_chip, irq);
> +       if (virq < 0) {
> +               dev_err(&pdev->dev,
> +                               "failed to get virtual interrupt=%d\n", irq);
> +               retval = virq;
> +               goto out_remove_gpio;
> +       }
> +
> +       retval = devm_request_threaded_irq(&pdev->dev, virq,
> +                       NULL, wcove_gpio_irq_handler,
> +                       IRQF_ONESHOT, pdev->name, wg);
> +
> +       if (retval) {
> +               dev_warn(&pdev->dev, "request irq failed: %d, virq: %d\n",
> +                                                       retval, virq);

Non fatal? Needs an explanation in the comment.

> +               goto out_remove_gpio;
> +       }
> +
> +       return 0;
> +

> +out_remove_gpio:
> +       gpiochip_remove(&wg->chip);
> +       return retval;

BLUNDER! You are using devm_*() API.

> +}
> +
> +static int wcove_gpio_remove(struct platform_device *pdev)
> +{
> +       struct wcove_gpio *wg = platform_get_drvdata(pdev);
> +
> +       gpiochip_remove(&wg->chip);

Ditto.

> +       return 0;
> +}
> +
> +static struct platform_driver wcove_gpio_driver = {
> +       .driver = {
> +               .name = "bxt_wcove_gpio",

No PM?

> +       },
> +       .probe = wcove_gpio_probe,
> +       .remove = wcove_gpio_remove,
> +};

-- 
With Best Regards,
Andy Shevchenko
