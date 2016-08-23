From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] gpio: vf610: drop unused MODULE_ tags from
 non-modular code
Date: Tue, 23 Aug 2016 11:25:12 +0200
Message-ID: <CACRpkda=0HgC11pZw_gQnkY5RfY0Ac=-DGjQTvWiN5HAn0k9bQ@mail.gmail.com>
References: <20160822164833.3633-1-paul.gortmaker@windriver.com> <20160822164833.3633-5-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160822164833.3633-5-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Stefan Agner <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 22, 2016 at 6:48 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_VF610
> drivers/gpio/Kconfig:   def_bool y
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We delete the MODULE_LICENSE tag etc. since all that information
> is now contained at the top of the file in the comments.
>
> We don't replace module.h with init.h since the file already has that.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
