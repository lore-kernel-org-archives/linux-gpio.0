From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mcp23s08: improve I2C Kconfig dependency
Date: Wed, 31 May 2017 01:59:25 +0200
Message-ID: <CACRpkdbw3QFCMyfU54XB8WoQeaf05wnwA62oQoyHCJad0gow9w@mail.gmail.com>
References: <20170530091314.891224-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170530091314.891224-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sebastian Reichel <sre@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 30, 2017 at 11:11 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> With "SPI_MASTER=y && I2C=m", we can build mcp23s08 as a built-in driver,
> which then results in a link failure:
>
> drivers/pinctrl/built-in.o: In function `mcp23s08_probe_one.isra.0':
> :(.text+0x7910): undefined reference to `__devm_regmap_init_i2c'
> drivers/pinctrl/built-in.o: In function `mcp23s08_init':
> :(.init.text+0x110): undefined reference to `i2c_register_driver'
> drivers/pinctrl/built-in.o: In function `mcp23s08_exit':
> :(.exit.text+0x3c): undefined reference to `i2c_del_driver'
>
> To avoid the problem, this adds another dependency on I2C that enforces
> mcp23s08 to be a loadable module whenever the I2C core is a module.
>
> Fixes: 64ac43e6fa28 ("gpio: mcp23s08: move to pinctrl")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij
