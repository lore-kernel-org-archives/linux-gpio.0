From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2] gpio: MT7621: use a per instance irq_chip structure
Date: Fri, 8 Feb 2019 12:30:59 +0100
Message-ID: <CACRpkdYf4BfTwmAVxAi8CcKkT7A1SwW-KeSPNyBPJs870Ci7nw@mail.gmail.com>
References: <20190130161048.9852-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190130161048.9852-1-opensource@vdorst.com>
Sender: stable-owner@vger.kernel.org
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, gerg@kernel.org, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 30, 2019 at 5:21 PM Ren=C3=A9 van Dorst <opensource@vdorst.com>=
 wrote:

> This fixes the kernel complains:
> gpio gpiochip1: (1e000600.gpio-bank1): detected irqchip that is shared
>             with multiple gpiochips: please fix the driver.
> gpio gpiochip2: (1e000600.gpio-bank2): detected irqchip that is shared
>             with multiple gpiochips: please fix the driver.
>
> Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> Signed-off-by: Ren=C3=A9 van Dorst <opensource@vdorst.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: gerg@kernel.org
> Cc: stable@vger.kernel.org

Patch applied for fixes with Greg's ACK.

Yours,
Linus Walleij
