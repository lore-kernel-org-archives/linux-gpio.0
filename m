From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: xgene: mark PM functions as __maybe_unused
Date: Thu, 23 Feb 2017 15:43:15 +0100
Message-ID: <CACRpkdZCJKLRYhYCXQL9J7hsWosVZCGjPy6P8KTQUXF70ZcQAA@mail.gmail.com>
References: <20170217151400.2539149-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170217151400.2539149-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Duc Dang <dhdang@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 17, 2017 at 4:13 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> When CONFIG_PM_SLEEP is disabled, we get a warning about unused functions:
>
> drivers/gpio/gpio-xgene.c:155:12: warning: 'xgene_gpio_resume' defined but not used [-Wunused-function]
>  static int xgene_gpio_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~
> drivers/gpio/gpio-xgene.c:142:12: warning: 'xgene_gpio_suspend' defined but not used [-Wunused-function]
>  static int xgene_gpio_suspend(struct device *dev)
>
> The warnings are harmless and can be avoided by simplifying the code and marking
> the functions as __maybe_unused.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: remove #ifdef around set_dr_val as well, to avoid build regression

Patch applied for fixes.

Yours,
Linus Walleij
