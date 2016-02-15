From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] GPIO/ACPI: DesignWare: Add GPIO-signaled ACPI events
 support for power button
Date: Mon, 15 Feb 2016 19:25:23 +0100
Message-ID: <CACRpkdZNCt_TtA6SR86dVCR7vq5cpVmbzxeTguc7go6vVRkuTg@mail.gmail.com>
References: <1454653542-122055-1-git-send-email-qiujiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1454653542-122055-1-git-send-email-qiujiang@huawei.com>
Sender: linux-acpi-owner@vger.kernel.org
To: qiujiang <qiujiang@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linuxarm@huawei.com, haifeng.wei@huawei.com, charles.chenxin@huawei.com
List-Id: linux-gpio@vger.kernel.org

Mika can you help out looking at this patch. Tell me if you need a copy
of the whole patch, I'm not smart with ACPI.

On Fri, Feb 5, 2016 at 7:25 AM, qiujiang <qiujiang@huawei.com> wrote:

> This patch modifies the DesignWare GPIO controller driver to
> support the GPIO-signaled ACPI Events. This is used for power
> button function on ARM server.
>
> To make it work, the _AEI and _EVT object must be defined in
> the corresponding GPIO driver's dsdt table in UEFI. At the same
> time, ACPI daemon component is also necessary.
>
> Signed-off-by: qiujiang <qiujiang@huawei.com>

(...)
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -23,6 +23,11 @@
>  #include <linux/spinlock.h>
>  #include <linux/platform_data/gpio-dwapb.h>
>  #include <linux/slab.h>
> +#include <linux/acpi.h>
> +#include <linux/gpio.h>

You should only need <linux/driver.h>

> +#include "gpiolib.h"

I guess this is for some acpi_gpiochip* functions that ACPI GPIO
drivers need like this:

> +       /* Add GPIO-signaled ACPI event support */
> +       if (pp->irq)
> +               acpi_gpiochip_request_interrupts(&(port->bgc.gc));

Hm, maybe these should be in "gpiolib-acpi.h" or so.

Overall the patch looks sane to me, but I need some ACPI
person to tell.

Yours,
Linus Walleij
