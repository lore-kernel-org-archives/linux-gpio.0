From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: BUG: gpio: pca953x: 24 bit expanders broken since v5.2-rc1
Date: Fri, 31 May 2019 19:06:03 +0200
Message-ID: <F29452FD-AFA4-422B-992C-D348FEEAE0E2@goldelico.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Nandor Han <nandor.han@vaisala.com>, Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

We discovered that the ti,tca6424 and the nxp,pcal6524 used on the
omap5uevm resp. pyra-handheld are broken starting with
v5.2-rc1.

The symptom is:

> [    7.524125] pca953x 4-0022: failed writing register
> [    7.529444] pca953x: probe of 4-0022 failed with error -22    

Tony also noticed this to happen with some BeagleBone Black cape.

Some analysis shows that it happens in device_pca95xx_init()
when trying to write the invert register (PCA953X_INVERT).

The PCA953X_INVERT 0x02 is translated into 0x88. Because
since

	b32cecb46bdc8 gpio: pca953x: Extract the register address mangling to single function

a 24 bit expander always gets the autoincrement flag REG_ADDR_AI
(0x80) set. I don't know if that happened before.

Now, this was not a (visible) problem until patch

	8b9f9d4dc511 regmap: verify if register is writeable before writing operations

enforces to check the register number before invoking the
callback pca953x_writeable_register(). pca953x_writeable_register()
seems to know about REG_ADDR_AI (through reg & REG_ADDR_MASK) and
accepts 0x88 as a valid register number.

After the regmap patch the register is checked against
pca953x_i2c_regmap.max_register before applying REG_ADDR_MASK
and 0x88 is obviously beyond, explaining the symptom.

A test shows that reverting 8b9f9d4dc511 makes the driver work again.

But IMHO this is the wrong fix, because I think the combined use of
regmap and REG_ADDR_AI in the pca953x driver seems to be fundamentally
broken and not the new regmap address test. Unless we expect that regmap can
pass the REG_ADDR_AI address bit to i2c but ignores it during cache
lookup. Then, I think the pca953x_i2c_regmap.reg_bits should also be
7 and not 8.

So the real solution should IMHO be to eliminate using the autoincrement
mode of these chips. But this may break the PCA9575 which seems
to need AI for multi-byte writes according to some comment.

BR and thanks,
Nikolaus
