From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] pinctrl: various fixes for Meson8 and Meson8b SoCs
Date: Fri, 21 Dec 2018 11:01:35 +0100
Message-ID: <CACRpkdZ+vUwEcEyMj0Snsy_F8AmELSMt1wGbhMsQi7A=_tY3RQ@mail.gmail.com>
References: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Dec 9, 2018 at 8:51 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> While debugging an USB issue on my Odroid-C1 I found a few issues with
> the pinctrl driver for the Meson8 and Meson8b SoCs:
> - GPIOAO pins cannot be specified as GPIO group in device-tree
> - (not a bugfix bug an improvement) make the gpio_periphs group naming
>   consistent with drivers for newer SoCs
> - add missing GPIO_GROUP definitions for the pins in the BOOT and CARD
>   banks
>
> I added the correct "Fixes" tag to all commits where applicable. These
> fixes don't affect any existing boards or functionality. Thus I suggest
> to apply them for next (v4.21) instead of sending them to mainline.

All patches applied for v4.21!

Sorry for taking some time to process.

Yours,
Linus Walleij
