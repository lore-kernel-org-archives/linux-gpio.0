From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: aspeed: fix compile testing warning
Date: Fri, 13 Jul 2018 09:05:48 +0200
Message-ID: <CACRpkdaMdcAnA9GWx2vJtfGtDEUzpE64g6v+tJM8NVtY=Bc_Mg@mail.gmail.com>
References: <20180709145612.4166409-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709145612.4166409-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thierry Reding <treding@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 9, 2018 at 4:56 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Gcc cannot always see that BUG_ON(1) is guaranteed to not
> return, so we get a warning message in some configurations:
>
> drivers/gpio/gpio-aspeed.c: In function 'bank_reg':
> drivers/gpio/gpio-aspeed.c:244:1: error: control reaches end of non-void function [-Werror=return-type]
>
> Using a plain BUG() is easier here and avoids the problem.
>
> Fixes: 44ddf559d579 ("gpio: aspeed: Rework register type accessors")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied with Benjamin's ACK.

Yours,
Linus Walleij
