From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: BUG: gpio: pca953x: 24 bit expanders broken since v5.2-rc1
Date: Sat, 1 Jun 2019 23:57:46 +0200
Message-ID: <CACRpkdajVu2H-9zX4gAEnHHR8gd=4jseabLGsHB=0CF1BKH-JA@mail.gmail.com>
References: <F29452FD-AFA4-422B-992C-D348FEEAE0E2@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <F29452FD-AFA4-422B-992C-D348FEEAE0E2@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Nandor Han <nandor.han@vaisala.com>, Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Tony Lindgren <tony@atomide.com>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 31, 2019 at 7:06 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> Now, this was not a (visible) problem until patch
>
>         8b9f9d4dc511 regmap: verify if register is writeable before writing operations
>
> enforces to check the register number before invoking the
> callback pca953x_writeable_register(). pca953x_writeable_register()
> seems to know about REG_ADDR_AI (through reg & REG_ADDR_MASK) and
> accepts 0x88 as a valid register number.
>
> After the regmap patch the register is checked against
> pca953x_i2c_regmap.max_register before applying REG_ADDR_MASK
> and 0x88 is obviously beyond, explaining the symptom.

Can we simply bump the .max_register in
pca953x_i2c_regmap to 0xff for a quick fix with a comment
FIXME to figure it out the right way?

Yours,
Linus Walleij
