From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] pinctrl: meson: Add support for TEST_N gpio
Date: Fri, 3 Aug 2018 19:10:22 +0200
Message-ID: <CACRpkdbSE0ThGpEo2YnVQ7wW85QbAeOwmFpLczHwL3Q2W3ZF6Q@mail.gmail.com>
References: <1533117623-27856-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533117623-27856-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 1, 2018 at 12:00 PM Neil Armstrong <narmstrong@baylibre.com> wrote:

> The Amlogic Meson GX and AXG SoCs needs to do a Secure Monitor call to
> set the TEST_N pin direction.
> This patchset :
> - adds the Secure Monitor call
> - adds support int the pinctrl-meson common code
> - adds support for GXBB, GXL and AGX SoCs

A lot of trouble to access a single GPIO pin (I guess _N means "active low"?)

Is this line used for something especially important? Would be nice to
include in some commit message like patch 1/5 why we invest so much
energy to accessing this pin.

Just curious. If you're just aiming for feature completion, that is a good
reason as well :D

Yours,
Linus Walleij
