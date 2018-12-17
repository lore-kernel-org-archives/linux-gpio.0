From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mvebu: only fail on missing clk if pwm is actually
 to be used
Date: Mon, 17 Dec 2018 15:25:56 +0100
Message-ID: <CACRpkdY_fxCWgJ0b435DxzGjeK9q0NrLc+FVPR0LSNEwcUXfrQ@mail.gmail.com>
References: <20181217084313.15379-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181217084313.15379-1-u.kleine-koenig@pengutronix.de>
Sender: stable-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Ralph Sennhauser <ralph.sennhauser@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Thierry Reding <thierry.reding@gmail.com>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 17, 2018 at 9:43 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The gpio IP on Armada 370 at offset 0x18180 has neither a clk nor pwm
> registers. So there is no need for a clk as the pwm isn't used anyhow.
> So only check for the clk in the presence of the pwm registers. This fixe=
s
> a failure to probe the gpio driver for the above mentioned gpio device.
>
> Fixes: 757642f9a584 ("gpio: mvebu: Add limited PWM support")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied for fixes with Gregory's review tag!

Will try to get this upstream with some other GPIO
fixes ASAP.

Yours,
Linus Walleij
