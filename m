From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] pinctrl: sunxi: Consider pin_base when calculating
 regulator array index
Date: Mon, 14 Jan 2019 16:16:50 +0100
Message-ID: <CACRpkdbJRV2hL2gZ84izY_30XCdWvXZ7T5pzxNHJTqLPk2BWzw@mail.gmail.com>
References: <20190113095723.25295-1-wens@csie.org> <20190113095723.25295-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190113095723.25295-2-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jan 13, 2019 at 10:57 AM Chen-Yu Tsai <wens@csie.org> wrote:

> On most newer Allwinner SoCs, there are two pinctrl devices, the PIO and
> R_PIO. PIO covers pin-banks PA to PI (PJ and PK have not been seen),
> while R_PIO covers PL to PN. The regulator array only has space for 12
> entries, which was designed to cover PA to PL. On the A80, the pin banks
> go up to PN, which would be the 14th entry in the regulator array.
> However since the driver only needs to track regulators for its own pin
> banks, the array only needs to have 9 entries, and also take in to
> account the value of pin_base, such that the regulator for the first
> pin-bank of the pinctrl device, be it "PA" or "PL" uses the first entry
> of the array.
>
> Base the regulator array index on pin_base, such that "PA" for PIO and
> "PL" for R_PIO both take the first element within their respective
> device's regulator array.
>
> Also decrease the size of the regulator array to 9, just enough to cover
> "PA" to "PI".
>
> Fixes: 9a2a566adb00 ("pinctrl: sunxi: Deal with per-bank regulators")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v1:
>
>   - Take in to account pin_base when handling regulator array index
>     instead of enlarging the array to encompass PA - PN.

Patch applied.

Yours,
Linus Walleij
