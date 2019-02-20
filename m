From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] gpio: AMD G-Series PCH gpio driver
Date: Wed, 20 Feb 2019 10:45:45 +0100
Message-ID: <CACRpkdYM6An1gEvw=Kw52WfAEr176oHoUBKquXtjaSvwrMbWrQ@mail.gmail.com>
References: <1550091448-28578-1-git-send-email-info@metux.net>
 <1550181897-2596-1-git-send-email-info@metux.net> <1550181897-2596-2-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550181897-2596-2-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 14, 2019 at 11:05 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> GPIO platform driver for the AMD G-series PCH (eg. on GX-412TC)
>
> This driver doesn't registers itself automatically, as it needs to
> be provided with platform specific configuration, provided by some
> board driver setup code.
>
> Didn't implement oftree probing yet, as it's rarely found on x86.
>
> Cc: linux-gpio@vger.kernel.org
> Cc: linus.walleij@linaro.org
> Cc: bgolaszewski@baylibre.com
> Cc: dvhart@infradead.org
> Cc: andy@infradead.org
> Cc: platform-driver-x86@vger.kernel.org
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

(...)
> +config GPIO_AMD_FCH
> +       tristate "GPIO support for AMD Fusion Controller Hub (G-series SOCs)"
> +       select GPIO_GENERIC

Now I see that you do this

> +       spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
(...)
> +       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);

Only to get that spinlock.

That's not what GPIO_GENERIC is for, just put a spinlock in your
local state container struct amd_fch_gpio_priv instead.

Yours,
Linus Walleij
