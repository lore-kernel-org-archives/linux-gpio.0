From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: msic: drop unused MODULE_ tags from non-modular code
Date: Tue, 23 Aug 2016 11:22:02 +0200
Message-ID: <CACRpkdZY2nDbsBgutnbfQVnDpKFY9xKd+km8u=-oJqODbp5XFQ@mail.gmail.com>
References: <20160822164833.3633-1-paul.gortmaker@windriver.com> <20160822164833.3633-2-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160822164833.3633-2-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 22, 2016 at 6:48 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_MSIC
> drivers/gpio/Kconfig:   bool "Intel MSIC mixed signal gpio support"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> We don't replace module.h with init.h since the file already has that.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
