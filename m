From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson-axg: adjust spicc pin naming
Date: Wed, 13 Dec 2017 00:53:24 +0100
Message-ID: <CACRpkdYnQDsy7T+Tdj_ALic=x3pUReAEyCYDE7f+trkSABDzBw@mail.gmail.com>
References: <20171208152909.15632-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171208152909.15632-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-gpio@vger.kernel.org, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 8, 2017 at 4:29 PM, Yixun Lan <yixun.lan@amlogic.com> wrote:
> According to datasheet, we should use numbers for the pin naming
> instead of letters. The patch here try to fix this to keep
> the consistency.
>
> This patch should not bring any functional change.
>
> Fixes: 83c566806a68 ("pinctrl: meson-axg: Add new pinctrl driver for Meson AXG SoC")
> Suggested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Patch applied.

Yours,
Linus Walleij
