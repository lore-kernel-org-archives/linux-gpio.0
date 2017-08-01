From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: Add FT232H CBUS GPIO driver
Date: Tue, 1 Aug 2017 08:49:02 +0200
Message-ID: <CACRpkdb7jOtNscyJPJYXL+VmvwBtHmBH1hhwZ75rBquWpSUVMQ@mail.gmail.com>
References: <1499374158-12388-1-git-send-email-agust@denx.de> <1499374158-12388-3-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499374158-12388-3-git-send-email-agust@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: Lee Jones <lee.jones@linaro.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-fpga@vger.kernel.org, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 6, 2017 at 10:49 PM, Anatolij Gustschin <agust@denx.de> wrote:

> Add driver for CBUS pins on FT232H. The driver supports setting
> GPIO direction and getting/setting CBUS 0-3 pin value. The CBUS
> pins have to be enabled by configuring I/O mode in the FTDI EEPROM.
>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
(...)

> +       select GPIO_GENERIC

You do not seem to be using this.

> +#include <linux/gpio.h>

This include should not be needed. If it is, something is wrong.

> +#include <linux/gpio/driver.h>

Drivers should only include this.

> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/usb.h>

Why is this needed if the device is abstracted behind an MFD interface?

> +#include <linux/mfd/ftdi/ftdi.h>

I.e. this?

Apart from these small things it looks like a solid and nice driver,
do you plan to merge this into MFD or should I merge it? Since it depends
on the Kconfig symbol I guess I can merge it orthogonally if I am sure
Lee will pick the MFD part.

Yours,
Linus Walleij
