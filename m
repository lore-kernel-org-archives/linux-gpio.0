From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] pinctrl: meson-g12a: add pinctrl driver support
Date: Wed, 29 Aug 2018 10:33:22 +0200
Message-ID: <CACRpkdZtzNhdY0OsT3M3YmMfHFkk5frrnf+dn=d5KfvXahRo6w@mail.gmail.com>
References: <20180807020634.18182-1-yixun.lan@amlogic.com> <20180807020634.18182-3-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807020634.18182-3-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 7, 2018 at 4:07 AM Yixun Lan <yixun.lan@amlogic.com> wrote:

> Add the pinctrl driver for Meson-G12A SoC which share the similar IP as
> the previous Meson-AXG SoC, both use same pinmux ops (register layout).
> A new driver is needed here due to the differences in the pins.
>
> Starting from Meson-AXG SoC, the pinctrl controller block use 4
> continues register bits to specific the pin mux function, while comparing
> to old generation SoC which using variable length register bits for
> the pin mux definition. The new design greatly simplify the software model.
>
> For the detail example, one 32bit register can be divided into 8 parts,
> each has 4 bits whose value start from 0 - 7, each can describe one pin,
> the value 0 is always devoted to GPIO function, while 1 - 7 devoted to
> the mux pin function.
>
> Please note, the GPIOE is actually located at AO (always on) bank.
>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Patch applied for v4.20.

Yours,
Linus Walleij
