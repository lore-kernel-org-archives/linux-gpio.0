From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/8] gpio: wcove: fix implicit assumption module.h is present
Date: Thu, 15 Sep 2016 14:04:04 +0200
Message-ID: <CACRpkdYcUzL6yCAaYAy=sweTrNa8-j-m=FcAo_+yV=c9qv-GVw@mail.gmail.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com> <20160912221631.15812-8-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912221631.15812-8-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Bin Gao <bin.gao@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2016 at 12:16 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig for this file is:
>
> drivers/gpio/Kconfig:config GPIO_WHISKEY_COVE
> drivers/gpio/Kconfig:   tristate "GPIO support for Whiskey Cove PMIC"
>
> ...but however it does not include module.h -- it in turn gets it from
> another header (gpio/driver.h) and we'd like to replace that with a
> forward delcaration of "struct module;" but if we do, this file will
> fail to compile.
>
> So we fix this first to avoid putting build failures into the bisect
> commit history.
>
> Cc: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
> Cc: Bin Gao <bin.gao@intel.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
