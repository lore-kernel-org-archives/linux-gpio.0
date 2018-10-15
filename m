From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: fix SNPS_CREG kconfig dependency warning
Date: Mon, 15 Oct 2018 16:24:31 +0200
Message-ID: <CACRpkdYMfvPAsfvJ2UyXXt-M9goyUfXumF=0suzGHqVZO=k2Kg@mail.gmail.com>
References: <8bfd2cd6-702a-878c-ac41-b61698835f1a@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8bfd2cd6-702a-878c-ac41-b61698835f1a@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Eugeniy.Paltsev@synopsys.com
List-Id: linux-gpio@vger.kernel.org

On Sat, Oct 13, 2018 at 5:46 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix kconfig warning for GPIO_SNPS_CREG:
>
> WARNING: unmet direct dependencies detected for OF_GPIO
>   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - GPIO_SNPS_CREG [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC || COMPILE_TEST [=y])
>
> Drivers in drivers/gpio/Kconfig depend on OF_GPIO, not select it.
> This prevents attempting to build when OF is not enabled.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
> Found in mmotm but comes from/applies to linux-next.

Patch applied, thanks!

Yours,
Linus Walleij
