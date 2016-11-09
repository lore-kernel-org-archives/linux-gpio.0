From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ACPI / gpio: avoid warning for gpio hogging code
Date: Wed, 9 Nov 2016 09:44:41 +0100
Message-ID: <CACRpkdZ2LKpCT0mWN_-Chi-R3wY6DgiX4EWoKvwxfHFEGE2cfg@mail.gmail.com>
References: <20161108134035.1764500-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161108134035.1764500-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, Christophe Ricard <christophe.ricard@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 8, 2016 at 2:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The newly added acpi_gpiochip_scan_gpios function produces a few harmless
> warnings:
>
> drivers/gpio/gpiolib-acpi.c: In function =E2=80=98acpi_gpiochip_add=E2=80=
=99:
> drivers/gpio/gpiolib-acpi.c:925:7: error: =E2=80=98dflags=E2=80=99 may be=
 used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> drivers/gpio/gpiolib-acpi.c:925:9: error: =E2=80=98lflags=E2=80=99 may be=
 used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>
> The problem is that he compiler cannot know that a negative return value
> from fwnode_property_read_u32_array() or acpi_gpiochip_pin_to_gpio_offset=
()
> implies that the IS_ERR(gpio_desc) is true, as the value could in theory
> be below -MAX_ERRNO.
>
> The function already initializes its output values to zero, and moving
> that intialization a little higher up ensures that we can never have
> uninitialized data in the caller.
>
> Fixes: c80f1ba75df2 ("ACPI / gpio: Add hogging support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
