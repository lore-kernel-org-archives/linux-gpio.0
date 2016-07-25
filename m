From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6] gpio: add Intel WhiskeyCove PMIC GPIO driver
Date: Mon, 25 Jul 2016 16:31:31 +0300
Message-ID: <CAHp75Ve_6P6AorPkBYgcRdJkKAHpBmO870du28o9fevxO8B83w@mail.gmail.com>
References: <20160719184508.GB111962@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160719184508.GB111962@worksta>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2016 at 9:45 PM, Bin Gao <bin.gao@linux.intel.com> wrote:
> This patch introduces a separate GPIO driver for Intel WhiskeyCove PMIC.
> This driver is based on gpio-crystalcove.c.
>
> Signed-off-by: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
> Signed-off-by: Bin Gao <bin.gao@intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

There are still (minor) issues, since the patch most likely will not
make v4.8-rc1, my comments below.

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 536112f..0f33982 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -806,6 +806,19 @@ config GPIO_CRYSTAL_COVE
>           This driver can also be built as a module. If so, the module will be
>           called gpio-crystalcove.
>
> +config GPIO_WHISKEY_COVE

I think it should follow alphabetical order.

> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_GPIO_BT8XX)      += gpio-bt8xx.o
>  obj-$(CONFIG_GPIO_CLPS711X)    += gpio-clps711x.o
>  obj-$(CONFIG_GPIO_CS5535)      += gpio-cs5535.o
>  obj-$(CONFIG_GPIO_CRYSTAL_COVE)        += gpio-crystalcove.o
> +obj-$(CONFIG_GPIO_WHISKEY_COVE)        += gpio-wcove.o

Ditto.

> +++ b/drivers/gpio/gpio-wcove.c
> @@ -0,0 +1,439 @@
> +/*
> + * gpio-wcove.c - Intel Whiskey Cove GPIO Driver

No file name.

> + */
> +
> +#include <linux/seq_file.h>
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/intel_soc_pmic.h>

Perhaps alphabetical order.

> +/* GPIO output control registers(one per pin): 0x4e44 - 0x4e50 */

Space before (.

> +#define GPIO_OUT_CTRL_BASE     0x4e44
> +/* GPIO input control registers(one per pin): 0x4e51 - 0x4e5d */

Ditto.

Needs to be changed in a whole file.

> +#define CTLI_INTCNT_DIS                (0)

It seems I commented this.
Please, use
(0 << 1)

> +#define CTLI_INTCNT_NE         (1 << 1)
> +#define CTLI_INTCNT_PE         (2 << 1)
> +#define CTLI_INTCNT_BE         (3 << 1)
> +
> +#define CTLO_DIR_IN            (0)

(0 << 5)

> +#define CTLO_DIR_OUT           (1 << 5)
> +

> +#define CTLO_DRV_MASK          (1 << 4)

I'm not sure it makes sense for 1 bit, perhaps you may use _SHIFT macro instead.

> +#define CTLO_DRV_OD            (0)

(0 << 4)

> +#define CTLO_DRV_CMOS          CTLO_DRV_MASK

Perhaps
(1 << 4)

> +
> +#define CTLO_DRV_REN           (1 << 3)
> +
> +#define CTLO_RVAL_2KDW         (0)

(0 << 1)

> +#define CTLO_RVAL_2KUP         (1 << 1)
> +#define CTLO_RVAL_50KDW                (2 << 1)

Usually DN is used as opposite abbreviation to UP, until else is
mentioned in datasheet.

> +#define CTLO_RVAL_50KUP                (3 << 1)
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

Useless comment, use above kernel doc lines.

> +       struct gpio_chip chip;
> +       struct regmap *regmaop;
> +       struct regmap_irq_chip_data *regmap_irq_chip;
> +       int update;
> +       int intcnt_value;

Does value suffix has a value?

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

Internal parens are redundant.

> +               bank = 1;
> +       else
> +               bank = 2;
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
> +       unsigned int reg, mask;
> +       int group;
> +
> +       group = gpio < GROUP0_NR_IRQS ? 0 : 1;

Entire line is useless.

> +       reg = IRQ_MASK_BASE + group;
> +       mask = (group == 0) ? BIT(gpio % GROUP0_NR_IRQS) :
> +               BIT((gpio - GROUP0_NR_IRQS) % GROUP1_NR_IRQS);

#define IRQ_MASK_BASE(x)   (... + (x))
#define IRQ_MASK_BASE0   ...
#define IRQ_MASK_BASE1   ...

if (gpio < ...) {
 reg = IRQ_MASK_BASE0;
 mask = BIT(...);
} else {
 reg = IRQ_MASK_BASE1;
 mask = BIT(...);
}

Above will be more readable.

> +
> +       if (wg->set_irq_mask)
> +               regmap_update_bits(wg->regmap, reg, mask, mask);
> +       else
> +               regmap_update_bits(wg->regmap, reg, mask, 0);
> +}

> +static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
> +{
> +       unsigned int pending, virq, gpio, mask, offset;
> +       struct wcove_gpio *wg = data;
> +       u8 p[2];
> +
> +       if (regmap_bulk_read(wg->regmap, IRQ_STATUS_BASE, p, 2)) {
> +               pr_err("Failed to read irq status register\n");

dev_err() ?

> +               return IRQ_NONE;
> +       }
> +
> +       pending = p[0] | (p[1] << 8);
> +       if (!pending)
> +               return IRQ_NONE;
> +
> +       /* Iterate until no interrupt is pending */
> +       while (pending) {
> +               /* One iteration is for all pending bits */

> +               for (gpio = 0; gpio < GROUP0_NR_IRQS; gpio++) {
> +                       if (!(pending & BIT(gpio)))
> +                               continue;

for_each_bit() ?


> +                       offset = (gpio > GROUP0_NR_IRQS) ? 1 : 0;
> +                       mask = (offset == 1) ? BIT(gpio - GROUP0_NR_IRQS) :
> +                                                               BIT(gpio);
> +                       virq = irq_find_mapping(wg->chip.irqdomain, gpio);
> +                       handle_nested_irq(virq);
> +                       regmap_update_bits(wg->regmap, IRQ_STATUS_BASE + offset,
> +                                                               mask, mask);
> +               }
> +               /* Next iteration */
> +               if (regmap_bulk_read(wg->regmap, IRQ_STATUS_BASE, p, 2)) {
> +                       pr_err("Failed to read irq status register\n");

Ditto.

> +                       break;
> +               }
> +               pending = p[0] | (p[1] << 8);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void wcove_gpio_dbg_show(struct seq_file *s,
> +                                     struct gpio_chip *chip)
> +{
> +       unsigned int ctlo, ctli, irq_mask, irq_status;
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +       int gpio, offset, group, ret = 0;
> +
> +       for (gpio = 0; gpio < WCOVE_GPIO_NUM; gpio++) {
> +               group = gpio < GROUP0_NR_IRQS ? 0 : 1;
> +               ret += regmap_read(wg->regmap, to_reg(gpio, CTRL_OUT), &ctlo);
> +               ret += regmap_read(wg->regmap, to_reg(gpio, CTRL_IN), &ctli);
> +               ret += regmap_read(wg->regmap, IRQ_MASK_BASE + group,
> +                                                       &irq_mask);
> +               ret += regmap_read(wg->regmap, IRQ_STATUS_BASE + group,
> +                                                       &irq_status);
> +               if (ret) {
> +                       pr_err("Failed to read registers: ctrl out/in or irq status/mask\n");

dev_err() ?

> +                       break;
> +               }
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
> +       struct intel_soc_pmic *pmic;
> +       struct wcove_gpio *wg;
> +       int virq, retval, irq;
> +       struct device *dev;
> +
> +       pmic = dev_get_drvdata(pdev->dev.parent);

I think this line needs a comment to answer to the question "why parent?"

> +       if (!pmic)
> +               return -ENODEV;
> +
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
> +       dev = &pdev->dev;
> +
> +       wg = devm_kzalloc(dev, sizeof(*wg), GFP_KERNEL);
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
> +       wg->chip.parent = pdev->dev.parent;
> +       wg->chip.dbg_show = wcove_gpio_dbg_show;
> +       wg->regmap = pmic->regmap;
> +
> +       retval = devm_gpiochip_add_data(dev, &wg->chip, wg);
> +       if (retval) {
> +               dev_warn(dev, "add gpio chip error: %d\n", retval);
> +               return retval;
> +       }
> +
> +       gpiochip_irqchip_add(&wg->chip, &wcove_irqchip, 0,
> +                            handle_simple_irq, IRQ_TYPE_NONE);
> +
> +       virq = regmap_irq_get_virq(wg->regmap_irq_chip, irq);
> +       if (virq < 0) {
> +               dev_err(dev, "failed to get virtual irq by irq %d\n", irq);
> +               retval = virq;
> +               goto out_remove_gpio;
> +       }
> +
> +       retval = devm_request_threaded_irq(dev, virq, NULL,
> +               wcove_gpio_irq_handler, IRQF_ONESHOT, pdev->name, wg);
> +
> +       if (retval) {
> +               dev_warn(dev, "request irq(%d) failed: %d\n", retval, virq);

It's not a warning as I can see.
Also question if it's useful at all to print anything here?

> +               goto out_remove_gpio;
> +       }
> +
> +       return 0;
> +

> +out_remove_gpio:
> +       devm_gpiochip_remove(dev, &wg->chip);
> +       return retval;

Useless lines.

-- 
With Best Regards,
Andy Shevchenko
