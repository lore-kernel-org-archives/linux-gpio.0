From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: fix gpio request disabling other modes
Date: Wed, 28 Dec 2016 13:41:12 +0100
Message-ID: <CACRpkda=LtBe_Msmy4V5dBSkQ698A2DyaDmPqHGnEMdGHvXXEg@mail.gmail.com>
References: <20161206140817.11708-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161206140817.11708-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Beniamino Galvani <b.galvani@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 6, 2016 at 3:08 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> The pinctrl_gpio_request is called with the "full" gpio number, already
> containing the base, then meson_pmx_request_gpio is then called with the
> final pin number.
> Remove the base addition when calling meson_pmx_disable_other_groups.
>
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> CC: Beniamino Galvani <b.galvani@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied for fixes. Sorry for the delay, merge window appeared inbetween.

Yours,
Linus Walleij
