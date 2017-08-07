From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] [BUGFIX] gpio: reject invalid gpio before getting gpio_desc
Date: Mon, 7 Aug 2017 14:00:55 +0200
Message-ID: <CACRpkdb+ZP8ne2-Wkd4F3sovsRN3GtKFnYA9VbHZcCf2sQqvkw@mail.gmail.com>
References: <150164925133.3914.939655218385978578.stgit@devbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <150164925133.3914.939655218385978578.stgit@devbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2017 at 6:47 AM, Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Check user-given gpio number and reject it before
> calling gpio_to_desc() because gpio_to_desc() is
> for kernel driver and it expects given gpio number
> is valid (means 0 to 511).
> If given number is invalid, gpio_to_desc() calls
> WARN() and dump registers and stack for debug.
> This means user can easily kick WARN() just by
> writing invalid gpio number (e.g. 512) to
> /sys/class/gpio/export.
>
> Fixes: 0e9a5edf5d01 ("gpio: fix deferred probe detection for legacy API")
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>   Changes in v3:
>    - Remove unneeded empty lines.

Patch applied for fixes.

Yours,
Linus Walleij
