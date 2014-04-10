From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio / ACPI: Prevent potential wrap of GPIO value on
 OpRegion read
Date: Thu, 10 Apr 2014 18:24:18 +0200
Message-ID: <CACRpkdYfWsBqZenG8y7jYo1QzKpBdaFRe=ne4-1Lr2RgoDpNGg@mail.gmail.com>
References: <1396346580-4857-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396346580-4857-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 1, 2014 at 12:03 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Dan Carpenter's static code checker reports:
>
>  The patch 473ed7be0da0: "gpio / ACPI: Add support for ACPI GPIO
>  operation regions" from Mar 14, 2014, leads to the following static
>  checker warning:
>
>   drivers/gpio/gpiolib-acpi.c:454 acpi_gpio_adr_space_handler()
>   warn: should 'gpiod_get_raw_value(desc) << i' be a 64 bit type?
>
> This is due the fact that *value is of type u64 and gpiod_get_raw_value()
> returns int. Since i can be larger than 31, it is possible that the value
> returned gets wrapped.
>
> Fix this by casting the return of gpiod_get_raw_value() to u64 first before
> shift.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
