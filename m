From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 1/1] gpio: add driver for Mellanox BlueField GPIO controller
Date: Tue, 26 Mar 2019 09:42:29 +0100
Message-ID: <CAMpxmJWEFd6S0ogs5n6kQTJegtznLchPM1=2WnSHeC0QMVo+TQ@mail.gmail.com>
References: <cover.1553537396.git.sramani@mellanox.com> <3baa6eaf49633014279fcf451abba16304e3e8d1.1553537396.git.sramani@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3baa6eaf49633014279fcf451abba16304e3e8d1.1553537396.git.sramani@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shravan Kumar Ramani <sramani@mellanox.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pon., 25 mar 2019 o 19:30 Shravan Kumar Ramani <sramani@mellanox.com>
napisa=C5=82(a):
>
> This patch adds support for the GPIO controller used by Mellanox
> BlueField SOCs.
>
> Reviewed-by: David Woods <dwoods@mellanox.com>
> Signed-off-by: Shravan Kumar Ramani <sramani@mellanox.com>
> ---
>  drivers/gpio/Kconfig      |   7 +++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-mlxbf.c | 154 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 162 insertions(+)
>  create mode 100644 drivers/gpio/gpio-mlxbf.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 3f50526..0d9ddff 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1316,6 +1316,13 @@ config GPIO_MERRIFIELD
>         help
>           Say Y here to support Intel Merrifield GPIO.
>
> +config GPIO_MLXBF
> +       tristate "Mellanox BlueField SoC GPIO"
> +       depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || COMPILE_TEST
> +       select GPIO_GENERIC
> +       help
> +         Say Y here if you want GPIO support on Mellanox BlueField SoC.
> +
>  config GPIO_ML_IOH
>         tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
>         depends on X86 || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 54d5527..db8d854 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_GPIO_MENZ127)    +=3D gpio-menz127.o
>  obj-$(CONFIG_GPIO_MERRIFIELD)  +=3D gpio-merrifield.o
>  obj-$(CONFIG_GPIO_MC33880)     +=3D gpio-mc33880.o
>  obj-$(CONFIG_GPIO_MC9S08DZ60)  +=3D gpio-mc9s08dz60.o
> +obj-$(CONFIG_GPIO_MLXBF)       +=3D gpio-mlxbf.o
>  obj-$(CONFIG_GPIO_ML_IOH)      +=3D gpio-ml-ioh.o
>  obj-$(CONFIG_GPIO_MM_LANTIQ)   +=3D gpio-mm-lantiq.o
>  obj-$(CONFIG_GPIO_MOCKUP)      +=3D gpio-mockup.o
> diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
> new file mode 100644
> index 0000000..42087c6
> --- /dev/null
> +++ b/drivers/gpio/gpio-mlxbf.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/acpi.h>
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/resource.h>
> +#include <linux/types.h>
> +#include <linux/version.h>
> +
> +/* Number of pins on BlueField */
> +#define MLXBF_GPIO_NR 54
> +
> +/* Pad Electrical Controls. */
> +#define MLXBF_GPIO_PAD_CONTROL_FIRST_WORD 0x0700
> +#define MLXBF_GPIO_PAD_CONTROL_1_FIRST_WORD 0x0708
> +#define MLXBF_GPIO_PAD_CONTROL_2_FIRST_WORD 0x0710
> +#define MLXBF_GPIO_PAD_CONTROL_3_FIRST_WORD 0x0718
> +
> +#define MLXBF_GPIO_PIN_DIR_I 0x1040
> +#define MLXBF_GPIO_PIN_DIR_O 0x1048
> +#define MLXBF_GPIO_PIN_STATE 0x1000
> +#define MLXBF_GPIO_SCRATCHPAD 0x20
> +
> +#ifdef CONFIG_PM
> +struct mlxbf_gpio_context_save_regs {
> +       u64 scratchpad;
> +       u64 pad_control[MLXBF_GPIO_NR];
> +       u64 pin_dir_i;
> +       u64 pin_dir_o;
> +};
> +#endif
> +
> +/* Device state structure. */
> +struct mlxbf_gpio_state {
> +       struct gpio_chip gc;
> +
> +       /* Memory Address */
> +       void __iomem *base;
> +
> +#ifdef CONFIG_PM
> +       struct mlxbf_gpio_context_save_regs csave_regs;
> +#endif
> +};
> +
> +static int mlxbf_gpio_probe(struct platform_device *pdev)
> +{
> +       struct mlxbf_gpio_state *gs;
> +       struct device *dev =3D &pdev->dev;
> +       struct gpio_chip *gc;
> +       struct resource *res;
> +       int ret;
> +
> +       gs =3D devm_kzalloc(&pdev->dev, sizeof(*gs), GFP_KERNEL);
> +       if (!gs)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       gs->base =3D devm_ioremap_resource(&pdev->dev, res);

As of v5.1-rc1 we have devm_platform_ioremap_resource(). Please use it here=
.

> +       if (IS_ERR(gs->base))
> +               return PTR_ERR(gs->base);
> +
> +       gc =3D &gs->gc;
> +       ret =3D bgpio_init(gc, dev, 8,
> +                        gs->base + MLXBF_GPIO_PIN_STATE,
> +                        NULL,
> +                        NULL,
> +                        gs->base + MLXBF_GPIO_PIN_DIR_O,
> +                        gs->base + MLXBF_GPIO_PIN_DIR_I,
> +                        0);
> +       if (ret)
> +               return -ENODEV;

Add a new line after the return.

> +       gc->owner =3D THIS_MODULE;
> +       gc->ngpio =3D MLXBF_GPIO_NR;
> +
> +       ret =3D devm_gpiochip_add_data(dev, &gs->gc, gs);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed adding memory mapped gpiochip=
\n");
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, gs);
> +       dev_info(&pdev->dev, "registered Mellanox BlueField GPIO");
> +       return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int mlxbf_gpio_suspend(struct platform_device *pdev, pm_message_t=
 state)
> +{
> +       struct mlxbf_gpio_state *gs =3D platform_get_drvdata(pdev);
> +
> +       gs->csave_regs.scratchpad =3D readq(gs->base + MLXBF_GPIO_SCRATCH=
PAD);
> +       gs->csave_regs.pad_control[0] =3D
> +               readq(gs->base + MLXBF_GPIO_PAD_CONTROL_FIRST_WORD);
> +       gs->csave_regs.pad_control[1] =3D
> +               readq(gs->base + MLXBF_GPIO_PAD_CONTROL_1_FIRST_WORD);
> +       gs->csave_regs.pad_control[2] =3D
> +               readq(gs->base + MLXBF_GPIO_PAD_CONTROL_2_FIRST_WORD);
> +       gs->csave_regs.pad_control[3] =3D
> +               readq(gs->base + MLXBF_GPIO_PAD_CONTROL_3_FIRST_WORD);
> +       gs->csave_regs.pin_dir_i =3D readq(gs->base + MLXBF_GPIO_PIN_DIR_=
I);
> +       gs->csave_regs.pin_dir_o =3D readq(gs->base + MLXBF_GPIO_PIN_DIR_=
O);
> +
> +       return 0;
> +}
> +
> +static int mlxbf_gpio_resume(struct platform_device *pdev)
> +{
> +       struct mlxbf_gpio_state *gs =3D platform_get_drvdata(pdev);
> +
> +       writeq(gs->csave_regs.scratchpad, gs->base + MLXBF_GPIO_SCRATCHPA=
D);
> +       writeq(gs->csave_regs.pad_control[0],
> +              gs->base + MLXBF_GPIO_PAD_CONTROL_FIRST_WORD);
> +       writeq(gs->csave_regs.pad_control[1],
> +              gs->base + MLXBF_GPIO_PAD_CONTROL_1_FIRST_WORD);
> +       writeq(gs->csave_regs.pad_control[2],
> +              gs->base + MLXBF_GPIO_PAD_CONTROL_2_FIRST_WORD);
> +       writeq(gs->csave_regs.pad_control[3],
> +              gs->base + MLXBF_GPIO_PAD_CONTROL_3_FIRST_WORD);
> +       writeq(gs->csave_regs.pin_dir_i, gs->base + MLXBF_GPIO_PIN_DIR_I)=
;
> +       writeq(gs->csave_regs.pin_dir_o, gs->base + MLXBF_GPIO_PIN_DIR_O)=
;
> +
> +       return 0;
> +}
> +#endif
> +
> +static const struct acpi_device_id mlxbf_gpio_acpi_match[] =3D {
> +       { "MLNXBF02", 0 },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(acpi, mlxbf_gpio_acpi_match);
> +
> +static struct platform_driver mlxbf_gpio_driver =3D {
> +       .driver =3D {
> +               .name =3D "mlxbf_gpio",
> +               .acpi_match_table =3D ACPI_PTR(mlxbf_gpio_acpi_match),
> +       },
> +       .probe    =3D mlxbf_gpio_probe,
> +#ifdef CONFIG_PM
> +       .suspend  =3D mlxbf_gpio_suspend,
> +       .resume   =3D mlxbf_gpio_resume,
> +#endif
> +};
> +
> +module_platform_driver(mlxbf_gpio_driver);
> +
> +MODULE_DESCRIPTION("Mellanox BlueField GPIO Driver");
> +MODULE_AUTHOR("Mellanox Technologies");
> +MODULE_LICENSE("GPL");
> --
> 2.1.2
>

Other than that, looks good to me. I like how this driver shrank since v1.

Bart
