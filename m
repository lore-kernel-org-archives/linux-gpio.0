From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/8] gpio: sx150x: fix implicit assumption module.h is present
Date: Thu, 15 Sep 2016 13:59:27 +0200
Message-ID: <CACRpkdZSXES=6zbBmavrmycv9n5fWtdqYfJ8YAcR8VFH-OcoEQ@mail.gmail.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com> <20160912221631.15812-3-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912221631.15812-3-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2016 at 12:16 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> This file is currently getting module.h from a global gpio header
> and it will faii to build once we remove module.h from that.
>
> However, the driver is controlled with the following Kconfig:
>
> drivers/gpio/Kconfig:config GPIO_SX150X
> drivers/gpio/Kconfig:   bool "Semtech SX150x I2C GPIO expander"
>
> and hence the two lines of MODULE_DEVICE_TABLE are no-ops that
> can simply be deleted.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
