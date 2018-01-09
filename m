From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5] gpio: winbond: add driver
Date: Tue, 9 Jan 2018 14:53:16 +0100
Message-ID: <CACRpkdb-mvduoo_Ah0ou6mCjuB+LWZQSrwiOWAY=FbP8Z1_vdw@mail.gmail.com>
References: <ce716371-cc0a-6983-69c5-1a1203a48bc8@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ce716371-cc0a-6983-69c5-1a1203a48bc8@maciej.szmigiero.name>
Sender: linux-kernel-owner@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, Jan 6, 2018 at 12:46 AM, Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:

> This commit adds GPIO driver for Winbond Super I/Os.
>
> Currently, only W83627UHG model (also known as Nuvoton NCT6627UD) is
> supported but in the future a support for other Winbond models, too, can
> be added to the driver.
>
> A module parameter "gpios" sets a bitmask of GPIO ports to enable (bit 0 is
> GPIO1, bit 1 is GPIO2, etc.).
> One should be careful which ports one tinkers with since some might be
> managed by the firmware (for functions like powering on and off, sleeping,
> BIOS recovery, etc.) and some of GPIO port pins are physically shared with
> other devices included in the Super I/O chip.
>
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>

> Changes from v4:

This v5 version applied, I also added Andy's review tag.

Good work!

Yours,
Linus Walleij
