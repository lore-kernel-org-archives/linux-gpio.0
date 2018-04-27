From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson-axg: fix the range of aobus bank
Date: Fri, 27 Apr 2018 15:33:32 +0200
Message-ID: <CACRpkdaRvKs=ekpxxW_NuxP=d5ijUafOHbpSk8igMUckbDWwyw@mail.gmail.com>
References: <20180417170824.18670-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417170824.18670-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Xingyu Chen <xingyu.chen@amlogic.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 17, 2018 at 7:08 PM, Yixun Lan <yixun.lan@amlogic.com> wrote:

> The GPIOAO bank is range from GPIOAO_0 to GPIOAO_13.
>
> Fixes: 83c566806a68 ("pinctrl: meson-axg: Add new pinctrl driver for Meson AXG SoC")
> Reported-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Patch applied with Kevin's ACK.

Yours,
Linus Walleij
