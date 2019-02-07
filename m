From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] x86: pcengines apuv2 gpio/leds/keys platform driver
Date: Thu, 7 Feb 2019 20:24:31 +0200
Message-ID: <CAHp75Vc35zXh2fM94TfEjgunPKFqQqvBACjd4gHHQTe0r3AVtQ@mail.gmail.com>
References: <1549559639-9447-1-git-send-email-info@metux.net> <1549559639-9447-2-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549559639-9447-2-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 7, 2019 at 7:14 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

Thanks for the patch, my comments below.

> Driver for PCengines APUv2 board that supports GPIOs via AMD PCH
> and attached LEDs and keys.

You should put here why ACPI can't be used for providing a necessary
information.
For example, 'The driver is targeting old platforms that do not have a
proper entry in ACPI tables for these devices. In new version of BIOS
this going to be fixed."

Besides same comments as per other patch in the series, can you tell
why it's not an MFD driver?

> +       depends on KEYBOARD_GPIO
> +       depends on KEYBOARD_GPIO_POLLED
> +       depends on LEDS_GPIO

Why?
Is any of this fatal to have driver not registered?


> +/* TODO
> +   * support apu1 board (different fch, different register layouts
> +   * add spinlocks
> +*/

Either remove this, or fix it properly. TODO is not going to be upstream.

> +#define FCH_ACPI_MMIO_BASE     0xFED80000
> +#define FCH_GPIO_OFFSET                0x1500
> +#define FCH_GPIO_SIZE          0x300

0x0300

> +#define GPIO_BASE              100
> +
> +#define GPIO_LED1              (GPIO_BASE+0)
> +#define GPIO_LED2              (GPIO_BASE+1)
> +#define GPIO_LED3              (GPIO_BASE+2)
> +#define GPIO_MODESW            (GPIO_BASE+3)
> +#define GPIO_SIMSWAP           (GPIO_BASE+4)

Have namespace issues.

> +static struct amd_fch_gpio_reg apu2_gpio_regs[] = {
> +       { 0x44 }, // GPIO_57 -- LED1
> +       { 0x45 }, // GPIO_58 -- LED2
> +       { 0x46 }, // GPIO_59 -- LED3
> +       { 0x59 }, // GPIO_32 -- LED4 -- GE32 -- #modesw
> +       { 0x5A }, // GPIO_33 -- LED5 -- GE33 -- simswap
> +       { 0x42 }, // GPIO_51 -- LED6
> +       { 0x43 }, // GPIO_55 -- LED7
> +       { 0x47 }, // GPIO_64 -- LED8
> +       { 0x48 }, // GPIO_68 -- LED9
> +       { 0x4C }, // GPIO_70 -- LED10

Keep it sorted and consider to use 'gpio-names' property.

> +};

> +static struct platform_device *apu_gpio_pdev = NULL;
> +static struct platform_device *apu_leds_pdev = NULL;
> +static struct platform_device *apu_keys_pdev = NULL;

Redundant assignments.

> +static int __init apu_gpio_init(void)
> +{
> +       int rc;

> +       const struct dmi_system_id *dmi = dmi_first_match(apu_gpio_dmi_table);

Split it to three lines.

const struct ... *id;

id = dmi_first_match(...);
if (!id)

> +       if (!dmi) {
> +               pr_err(KBUILD_MODNAME ": failed to detect apu board via dmi\n");
> +               return -ENODEV;
> +       }

> +                       -1,                                     /* id */

PLATFORM_DEVID_NONE ?

> +fail:
> +       if (!IS_ERR(apu_keys_pdev))
> +               platform_device_unregister(apu_keys_pdev);
> +       if (!IS_ERR(apu_leds_pdev))
> +               platform_device_unregister(apu_leds_pdev);
> +       if (!IS_ERR(apu_gpio_pdev))
> +               platform_device_unregister(apu_gpio_pdev);

So, why the failure of the registration of any of these devices is fatal?

> +}

> +static void __exit apu_gpio_exit(void)
> +{

> +       if (!IS_ERR(apu_keys_pdev))

Redundant.
See commit 99fef587ff98 ("driver core: platform: Respect return code
of platform_device_register_full()") for the details.

> +               platform_device_unregister(apu_keys_pdev);
> +       if (!IS_ERR(apu_leds_pdev))
> +               platform_device_unregister(apu_leds_pdev);
> +       if (!IS_ERR(apu_gpio_pdev))
> +               platform_device_unregister(apu_gpio_pdev);
> +}

> +MODULE_LICENSE("GPL");

License mismatch.

-- 
With Best Regards,
Andy Shevchenko
