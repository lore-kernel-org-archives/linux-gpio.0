From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: tighten up ACPI legacy gpio lookups
Date: Tue, 17 Nov 2015 14:43:14 +0100
Message-ID: <CACRpkdbXaXzQ38sy9JJGEhx+ix3WzheAsKJqsXum2T9n00YEvA@mail.gmail.com>
References: <20151111194530.GA26559@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151111194530.GA26559@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Johan Hovold <johan@kernel.org>, "Tirdea, Irina" <irina.tirdea@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2015 at 8:45 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> We should not fall back to the legacy unnamed gpio lookup style if the
> driver requests gpios with different names, because we'll give out the same
> gpio twice. Let's keep track of the names that were used for the device and
> only do the fallback for the first name used.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> v1: incorporated changes suggested by Mika Westerberg in response to the
> draft patch I posted in Goodix thread.
>
> v2: moved acpi_can_fallback_to_crs body to drivers/gpio/gpiolib-acpi.c
> and provided stub for !CONFIG_ACPI case to fix build error if ACPI is
> disabled.

Patch applied with Mika's ACK.

Had to fuzz a bit to make it apply, hope nothing breaks.

Yours,
Linus Walleij
