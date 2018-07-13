From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ocelot: fix gpio4 twi function
Date: Fri, 13 Jul 2018 09:41:45 +0200
Message-ID: <CACRpkdbZZ4g4H0RNfo7PvDdnva4S+BHeZhc3Kip_X0KGOftg2A@mail.gmail.com>
References: <20180711130126.4090-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711130126.4090-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 11, 2018 at 3:01 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> the TWI function on GPIO4 is actually a multiplexed SCL, not an original
> TWI SDA or SCL. Fix it.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Patch applied.

Yours,
Linus Walleij
