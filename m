From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/8] gpio: palmas: fix implicit assumption module.h is present
Date: Thu, 15 Sep 2016 13:58:09 +0200
Message-ID: <CACRpkdYyD4i=7owfzcTxNJsqP8KW12f=L57wKGoZ-8Pzz8KFKQ@mail.gmail.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com> <20160912221631.15812-2-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912221631.15812-2-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2016 at 12:16 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> This file is currently getting module.h from a global gpio header
> and it will fail to build once we remove module.h from that.
>
> However, the driver is controlled with the following Kconfig:
>
> drivers/gpio/Kconfig:config GPIO_PALMAS
> drivers/gpio/Kconfig:   bool "TI PALMAS series PMICs GPIO"
>
> and hence the line of MODULE_DEVICE_TABLE is a no-op that can simply
> be deleted.  In fact it should have been removed in an earlier commit
> that did demodularization, however the unseen include prevented my
> build testing from detecting it.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
