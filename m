From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: Correct number of IRQ banks on H6 main
 pin controller
Date: Mon, 21 Jan 2019 14:41:31 +0100
Message-ID: <CACRpkdYkmsf00=Bws=Kf9_8zYo5k4_fyEHoGamvDA5PN-1PmyQ@mail.gmail.com>
References: <20190115024543.12928-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190115024543.12928-1-wens@csie.org>
Sender: stable-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 15, 2019 at 3:45 AM Chen-Yu Tsai <wens@csie.org> wrote:

> The H6 main pin controller has four banks of interrupt-triggering pins.
> The driver as originally submitted only specified three, but had pin
> descriptions referencing a fourth bank. This results in a out-of-bounds
> access into .irq_array of struct sunxi_pinctrl. This however did not
> result in a crash until v4.20, with commit a66d972465d1 ("devres: Align
> data[] to ARCH_KMALLOC_MINALIGN"), which changed the alignment of memory
> region returned by devm_kcalloc(). The increase likely moved the
> out-of-bounds access into the next, unmapped page.

Nice work rootcausing this!

Patch applied for fixes with the tested-by and ACK.

Yours,
Linus Walleij
