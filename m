From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/9] pinctrl: at91: make it explicitly non-modular
Date: Mon, 13 Jun 2016 08:27:48 +0200
Message-ID: <CACRpkdYgJi2NuUTOujYEFbX25idePioZoY8e0d9MSeR1HKji4A@mail.gmail.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com> <1465267388-17884-4-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465267388-17884-4-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 7, 2016 at 4:43 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/Kconfig:config PINCTRL_AT91
> drivers/pinctrl/Kconfig:        bool "AT91 pinctrl driver"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_init was not being used in this driver, we don't need
> to be concerned with initcall ordering changes when removing it.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
