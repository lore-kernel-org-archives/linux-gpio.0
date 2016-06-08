From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: lpc18xx: convert GPIO_LPC18XX from bool to tristate
Date: Wed, 8 Jun 2016 11:04:25 +0200
Message-ID: <CACRpkdbXmX+eqAFnmjZFG3Xv_gbt-8MtJnpvyWQ5RX-tThez_g@mail.gmail.com>
References: <1465151023-23340-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465151023-23340-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joachim Eastwood <manabian@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jun 5, 2016 at 8:23 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
>  config GPIO_LPC18XX
>        bool "NXP LPC18XX/43XX GPIO support"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> When targeting orphaned modular code in non-modular drivers, this
> came up.  Joachim indicated that the driver was actually meant to
> be tristate but ended up bool by accident.  So here we make it
> tristate instead of removing the modular code that was essentially
> orphaned.
>
> Cc: Joachim Eastwood <manabian@gmail.com>
> Acked-by: Joachim Eastwood <manabian@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
