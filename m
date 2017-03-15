From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH] gpio: xgene: mark PM functions as __maybe_unused
Date: Wed, 15 Mar 2017 14:47:36 +0100
Message-ID: <CACRpkdaDX2ZqUxOHivyv98TuYjTjYSs3D7f43jd7T6jPvTQQKQ@mail.gmail.com>
References: <20170314125748.734574-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170314125748.734574-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Axel Lin <axel.lin@ingics.com>, Duc Dang <dhdang@apm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 14, 2017 at 1:57 PM, Arnd Bergmann <arnd@arndb.de> wrote:

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
> Originally submitted on Feb 17, but it ended up not getting merged into v4.11-rc2
> and is still needed there for randconfig builds

Yeah I have it queued but just too much to do. I hope to be able to
send a pull request for this & more soon.

Yours,
Linus Walleij
