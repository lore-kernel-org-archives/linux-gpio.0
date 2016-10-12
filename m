From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mockup: add sysfs dependency
Date: Wed, 12 Oct 2016 10:47:33 +0200
Message-ID: <CACRpkdbQ1QXVbxL7T+7pX7MSN2TJAcL3ow+gUSy6tN_QjFXaTQ@mail.gmail.com>
References: <20161010124259.1556137-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161010124259.1556137-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Kamlakant Patel <kamlakant.patel@broadcom.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 10, 2016 at 2:42 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> Building the gpio-mockup driver without SYSFS results in a harmless Kconfig
> warning:
>
> warning: (GPIO_MOCKUP) selects GPIO_SYSFS which has unmet direct dependencies (GPIOLIB && SYSFS)
>
> We can easily avoid that warning by adding a dependency on SYSFS.
>
> Fixes: 0f98dd1b27d2 ("gpio/mockup: add virtual gpio device")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
