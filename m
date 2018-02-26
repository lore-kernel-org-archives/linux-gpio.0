From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "gpio: winbond: fix ISA_BUS_API dependency"
Date: Mon, 26 Feb 2018 11:28:32 +0100
Message-ID: <CACRpkdbZ30G1wBOpLR7JxLjBKU1ozd8d8upVbymfiEb0q-ibqA@mail.gmail.com>
References: <9a55e8b3-bf34-d8a4-f5a6-01e86374f42f@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9a55e8b3-bf34-d8a4-f5a6-01e86374f42f@maciej.szmigiero.name>
Sender: linux-kernel-owner@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Guenter Roeck <linux@roeck-us.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 23, 2018 at 3:55 PM, Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:

> This reverts commit 92a8046c9d952a2a7d21dfcd3afadc72a0bc0f72.
>
> Now that the patch series changing ISA_BUS_API dependency to selection
> was merged this reversion will do the same for gpio-winbond driver to
> make it consistent with other ISA bus gpio drivers.
>
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>

Patch applied.

Yours,
Linus Walleij
