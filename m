From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/9] drivers/gpio: make gpio-mc9s08dz60.c explicitly non-modular
Date: Thu, 31 Mar 2016 15:02:40 +0200
Message-ID: <CACRpkdZ2Vi9jQ9Q5uYUNRsAq6VPmp_qJbZKppKKaG6F08Mh0+A@mail.gmail.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
	<1459093489-18314-4-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459093489-18314-4-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Wu Guoxing <b39297@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Mar 27, 2016 at 5:44 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_MC9S08DZ60
> drivers/gpio/Kconfig:   bool "MX35 3DS BOARD MC9S08DZ60 GPIO functions"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_i2c_driver() uses the same init level priority as
> builtin_i2c_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Wu Guoxing <b39297@freescale.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
