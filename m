From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] gpio: add Intel WhiskeyCove GPIO driver
Date: Fri, 1 Jul 2016 23:21:20 +0300
Message-ID: <CAHp75Vea1WN-24f+MFaBJ=1W09ir40q8R16ayEOfJBnNwmo=Mw@mail.gmail.com>
References: <20160627235616.GA9303@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160627235616.GA9303@worksta>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2016 at 2:56 AM, Bin Gao <bin.gao@linux.intel.com> wrote:
> This patch introduces a separate GPIO driver for Intel WhiskeyCove PMIC.
> This driver is based on gpio-crystalcove.c.

There are still minors, though they would be fixed later.
FWIW:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Signed-off-by: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
> Signed-off-by: Bin Gao <bin.gao@intel.com>
> ---
> Changes in v4:
>  - Converted CTLI_INTCNT_XX macros to less verbose ones INT_DETECT_XX.
>  - Add comments about why there is no .pm for the driver.
>  - Header files re-ordered.
>  - Various coding style change to address Andy's comments.
> Changes in v3:
>  - Fixed the year in copyright line(2015-->2016).
>  - Removed DRV_NAME macro.
>  - Added kernel-doc for regmap_irq_chip of the wcove_gpio structure.
>  - Line length fix.
> Changes in v2:
>  - Typo fix (Whsikey --> Whiskey).
>  - Included linux/gpio/driver.h instead of linux/gpio.h
>  - Implemented .set_single_ended().
>  - Added GPIO register description.
>  - Replaced container_of() with gpiochip_get_data().
>  - Removed unnecessary "if (gpio > WCOVE_VGPIO_NUM" check.
>  - Removed the device id table and added MODULE_ALIAS().
>  drivers/gpio/Kconfig      |  13 ++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-wcove.c | 433 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 447 insertions(+)
>  create mode 100644 drivers/gpio/gpio-wcove.c
>
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
> +         inside.
> +
> +         This driver can also be built as a module. If so, the module will be
> +         called gpio-wcove.
> +
>  config GPIO_CS5535
>         tristate "AMD CS5535/CS5536 GPIO support"
>         depends on MFD_CS5535
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 991598e..fff6914 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_GPIO_BT8XX)      += gpio-bt8xx.o
>  obj-$(CONFIG_GPIO_CLPS711X)    += gpio-clps711x.o
>  obj-$(CONFIG_GPIO_CS5535)      += gpio-cs5535.o
>  obj-$(CONFIG_GPIO_CRYSTAL_COVE)        += gpio-crystalcove.o
> +obj-$(CONFIG_GPIO_WHISKEY_COVE)        += gpio-wcove.o
>  obj-$(CONFIG_GPIO_DA9052)      += gpio-da9052.o
>  obj-$(CONFIG_GPIO_DA9055)      += gpio-da9055.o
>  obj-$(CONFIG_GPIO_DAVINCI)     += gpio-davinci.o
> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> new file mode 100644
> index 0000000..9f1b25a
> --- /dev/null
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -0,0 +1,433 @@
> +/*
> + * gpio-wcove.c - Intel Whiskey Cove GPIO Driver
> + *
> + * This driver is written based on gpio-crystalcove.c
> + *
> + * Copyright (C) 2016 Intel Corporation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version
> + * 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/intel_soc_pmic.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/seq_file.h>
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
> +#define OUT_CTRL_OFFSET                0x4e44
> +/* GPIO input control registers(one per pin): 0x4e51 - 0x4e5d */
> +#define IN_CTRL_OFFSET         0x4e51
> +
> +/*
> + * GPIO interrupts are organized in two groups:
> + * Group 0: Bank 0 pins (Pin 0 - 6)
> + * Group 1: Bank 1 and Bank 2 pins (Pin 7 - 12)
> + * Each group has two registers(one bit per pin): status and mask.
> + */
> +#define GROUP0_NR_IRQS         7
> +#define GROUP1_NR_IRQS         6
> +#define IRQ_MASK_OFFSET                0x4e19
> +#define IRQ_STATUS_OFFSET      0x4e0b
> +#define UPDATE_IRQ_TYPE                BIT(0)
> +#define UPDATE_IRQ_MASK                BIT(1)
> +
> +#define LSHIFT_ONE(x)          ((x) << 1)
> +
> +/* GPIO Input Pin Interrupt Dectection */
> +#define INT_DETECT_DISABLE     LSHIFT_ONE(0) /* Disable interrupt input */
> +#define INT_DETECT_FALLING     LSHIFT_ONE(1) /* Detect falling edge */
> +#define INT_DETECT_RISING      LSHIFT_ONE(2) /* Detect rising edge */
> +#define INT_DETECT_BOTH                LSHIFT_ONE(3) /* Detect both edges */
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
> +#define CTLO_RVAL_2KDW         LSHIFT_ONE(0)
> +#define CTLO_RVAL_2KUP         LSHIFT_ONE(1)
> +#define CTLO_RVAL_50KDW                LSHIFT_ONE(2)
> +#define CTLO_RVAL_50KUP                LSHIFT_ONE(3)
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
> +
> +       if (reg_type == CTRL_IN)
> +               reg = IN_CTRL_OFFSET + bank;
> +       else
> +               reg = OUT_CTRL_OFFSET + bank;
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
> +       reg = IRQ_MASK_OFFSET + group;
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
> +       regmap_update_bits(wg->regmap, reg, INT_DETECT_BOTH, wg->intcnt_value);
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
> +       int ret;
> +       unsigned int val;
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +
> +       ret = regmap_read(wg->regmap, to_reg(gpio, CTRL_IN), &val);
> +       if (ret)
> +               return ret;
> +
> +       return val & 0x1;
> +}
> +
> +static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
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
> +               wg->intcnt_value = INT_DETECT_DISABLE;
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               wg->intcnt_value = INT_DETECT_BOTH;
> +               break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               wg->intcnt_value = INT_DETECT_RISING;
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               wg->intcnt_value = INT_DETECT_FALLING;
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
> +}
> +
> +static void wcove_bus_sync_unlock(struct irq_data *data)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(
> +               irq_data_get_irq_chip_data(data));
> +       int gpio = data->hwirq;
> +
> +       if (wg->update & UPDATE_IRQ_TYPE)
> +               wcove_update_irq_ctrl(wg, gpio);
> +       if (wg->update & UPDATE_IRQ_MASK)
> +               wcove_update_irq_mask(wg, gpio);
> +
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
> +};
> +
> +static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
> +{
> +       int pending;
> +       unsigned int p0, p1, virq, gpio;
> +       struct wcove_gpio *wg = data;
> +
> +       if (regmap_read(wg->regmap, IRQ_STATUS_OFFSET + 0, &p0) ||
> +           regmap_read(wg->regmap, IRQ_STATUS_OFFSET + 1, &p1)) {
> +               dev_err(wg->chip.parent, "%s(): regmap_read() failed.\n",
> +                                                               __func__);
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
> +       regmap_write(wg->regmap, IRQ_STATUS_OFFSET + 0, p0);
> +       regmap_write(wg->regmap, IRQ_STATUS_OFFSET + 1, p1);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void wcove_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +       int gpio, offset, group;
> +       unsigned int ctlo, ctli, irq_mask, irq_status;
> +
> +       for (gpio = 0; gpio < WCOVE_GPIO_NUM; gpio++) {
> +               group = gpio < GROUP0_NR_IRQS ? 0 : 1;
> +               regmap_read(wg->regmap, to_reg(gpio, CTRL_OUT), &ctlo);
> +               regmap_read(wg->regmap, to_reg(gpio, CTRL_IN), &ctli);
> +               regmap_read(wg->regmap, IRQ_MASK_OFFSET + group, &irq_mask);
> +               regmap_read(wg->regmap, IRQ_STATUS_OFFSET + group, &irq_status);
> +
> +               offset = gpio % 8;
> +               seq_printf(s, " gpio-%-2d %s %s %s %s ctlo=%2x,%s %s\n",
> +                          gpio, ctlo & CTLO_DIR_OUT ? "out" : "in ",
> +                          ctli & 0x1 ? "hi" : "lo",
> +                          ctli & INT_DETECT_FALLING ? "falling" : "    ",
> +                          ctli & INT_DETECT_RISING ? "rising" : "    ",
> +                          ctlo,
> +                          irq_mask & BIT(offset) ? "mask  " : "unmask",
> +                          irq_status & BIT(offset) ? "pending" : "       ");
> +       }
> +}
> +
> +static int wcove_gpio_probe(struct platform_device *pdev)
> +{
> +       int virq, retval, irq;
> +       struct wcove_gpio *wg;
> +       struct device *dev = pdev->dev.parent;
> +       struct intel_soc_pmic *pmic = dev_get_drvdata(dev);
> +
> +       irq = platform_get_irq(pdev, 0);
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
> +               dev_err(&pdev->dev, "add gpio chip error: %d\n", retval);
> +               return retval;
> +       }
> +
> +       gpiochip_irqchip_add(&wg->chip, &wcove_irqchip, 0,
> +                            handle_simple_irq, IRQ_TYPE_NONE);
> +
> +       virq = regmap_irq_get_virq(wg->regmap_irq_chip, irq);
> +       if (virq < 0) {
> +               dev_err(&pdev->dev, "failed to get virq %d\n", irq);
> +               retval = virq;
> +               goto out_remove_gpio;
> +       }
> +
> +       retval = devm_request_threaded_irq(&pdev->dev, virq,
> +                               NULL, wcove_gpio_irq_handler,
> +                               IRQF_ONESHOT, pdev->name, wg);
> +
> +       if (retval) {
> +               dev_warn(&pdev->dev, "request irq failed: %d, virq: %d\n",
> +                                                       retval, virq);
> +               goto out_remove_gpio;
> +       }
> +
> +       return 0;
> +
> +out_remove_gpio:
> +       devm_gpiochip_remove(&pdev->dev, &wg->chip);
> +       return retval;
> +}
> +
> +static int wcove_gpio_remove(struct platform_device *pdev)
> +{
> +       struct wcove_gpio *wg = platform_get_drvdata(pdev);
> +
> +       devm_gpiochip_remove(&pdev->dev, &wg->chip);
> +       return 0;
> +}
> +
> +/*
> + * Whiskey Cove PMIC itself is a analog device(but with digital control
> + * interface) providing power management support for other devices in
> + * the accompanied SoC, so we have no .pm for Whiskey Cove GPIO driver.
> + */
> +static struct platform_driver wcove_gpio_driver = {
> +       .driver = {
> +               .name = "bxt_wcove_gpio",
> +       },
> +       .probe = wcove_gpio_probe,
> +       .remove = wcove_gpio_remove,
> +};
> +
> +module_platform_driver(wcove_gpio_driver);
> +
> +MODULE_AUTHOR("Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>");
> +MODULE_AUTHOR("Bin Gao <bin.gao@intel.com>");
> +MODULE_DESCRIPTION("Intel Whiskey Cove GPIO Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:bxt_wcove_gpio");
> --
> 1.9.1
>



-- 
With Best Regards,
Andy Shevchenko
