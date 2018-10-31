From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] pinctrl: meson: fix pull bits
Date: Wed, 31 Oct 2018 15:05:16 +0100
Message-ID: <CACRpkdYJW34oRmm0ZBivwsa7mMXhrj8hxz+ovXNwnOETs3xrog@mail.gmail.com>
References: <20181029151340.9087-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029151340.9087-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 29, 2018 at 4:13 PM Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset fixes the inversion between pull (up/down) and pull enable
> bits on the GPIO AO bank of all amlogic when have, except the axg family.
>
> The problem has been found while testing bias setting on the libretech
> aml-s905x-cc on GPIO_AO 5. Unfortunately the bias register of this bank is
> not described in the public datasheet of the s905x, but it is in the
> one of the A113D, which gave a clue.
>
> This was tested on gxl libretech aml-s905x-cc. Since all Amlogic we have
> got so far derive from each other, there is no reason for things to be
> any different on the meson8(b).
>
> I would have preferred to make a single patch to fix this but the commit
> introducing the mistake the is different for each SoC, so a single patch
> could be more difficult/annoying to backport.

All patches applied for fixes.
Thanks for drilling into this!

Yours,
Linus Walleij
