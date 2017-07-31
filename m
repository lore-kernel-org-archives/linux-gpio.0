From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: rename R_PIO i2c pin function name
Date: Mon, 31 Jul 2017 16:13:10 +0200
Message-ID: <CACRpkdb6woruLQPOfb2AGwraux5CienovZnJMox7VCh16JMXrA@mail.gmail.com>
References: <20170730053618.44781-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170730053618.44781-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jul 30, 2017 at 7:36 AM, Icenowy Zheng <icenowy@aosc.io> wrote:

> The I2C pin functions in R_PIO used to be named "s_twi".
>
> As we usually use the name "i2c" instead of "twi" in the mainline
> kernel, change these names to "s_i2c" for consistency.
>
> The "s_twi" functions are not yet referenced by any device trees in
> mainline kernel so I think it's safe to change the name.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Patch applied with Chen-Yu's review tag.

Yours,
Linus Walleij
