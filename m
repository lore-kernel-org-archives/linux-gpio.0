From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson-gxl: remove invalid GPIOX tsin_a pins
Date: Thu, 15 Nov 2018 10:28:49 +0100
Message-ID: <CACRpkdYpk1Mts9SxQq5nAdBBcWyZJouYgwR6uQaKMOe8o6u=OA@mail.gmail.com>
References: <1541587358-17654-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541587358-17654-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 7, 2018 at 11:42 AM Neil Armstrong <narmstrong@baylibre.com> wrote:

> The GPIOX tsin_a pins wrongly uses the SDCard pinctrl bits, this
> patch completely removes these pins entries until we find out what
> are the correct bits and registers to be used instead.
>
> Fixes: 5a6ae9b80139 ("pinctrl: meson-gxl: add tsin_a pins")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied.
It doesn't look like a regression so I only applied it for
next (v4.21).

Yours,
Linus Walleij
