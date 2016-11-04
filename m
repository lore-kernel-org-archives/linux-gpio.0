From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: htc-egpio: Make it explicitly non-modular
Date: Fri, 4 Nov 2016 23:03:43 +0100
Message-ID: <CACRpkdZVdruvncMgq_wYuh6nLP3gSyRBzODLYkVOppMPmrXe8w@mail.gmail.com>
References: <20161031182707.14034-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161031182707.14034-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Kevin O'Connor <kevin@koconnor.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 31, 2016 at 7:27 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config HTC_EGPIO
> drivers/gpio/Kconfig:   bool "HTC EGPIO support"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
>
> Since module_init was not in use by this code, the init ordering
> remains unchanged with this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Kevin O'Connor <kevin@koconnor.net>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>
> [we had all these fixed for gpio, but then this file recently moved from
>  the mfd subsystem over here to gpio....]

Sorry about the fuzz!

Patch applied.

Yours,
Linus Walleij
