From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: add gpio_add_lookup_tables() to add several
 tables at once
Date: Wed, 23 Aug 2017 09:17:45 +0200
Message-ID: <CACRpkdbYFyHHV949aYTGaCn8a+7_7+jbCScCtv2RoKM47O86dA@mail.gmail.com>
References: <20170815045955.GA40297@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170815045955.GA40297@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 15, 2017 at 6:59 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> When converting legacy board to use gpiod API() there might be several
> lookup tables in board file, let's provide a way to register them all at
> once.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> V2:
> - added the !CONFIG_GPIOLIB stub (Andy)
> - changed size from unsigned int to size_t at Mika's suggestion
> - added Reviewed-bys.

Patch applied!

Usually I don't like adding APIs with no users, but you have
a good track record so I believe you are going to put this to
good use in coming merge windows.

Yours,
Linus Walleij
