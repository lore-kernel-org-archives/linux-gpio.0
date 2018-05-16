From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: nand: meson-gxbb: fix missing data pins
Date: Wed, 16 May 2018 16:23:39 +0200
Message-ID: <CACRpkdZeUxNOxHSC1AYoR6TG0DUsXt3p9m-SWDaQDyAooNYUyQ@mail.gmail.com>
References: <20180509220827.22286-1-yixun.lan@amlogic.com> <20180509220827.22286-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509220827.22286-2-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 10, 2018 at 12:08 AM, Yixun Lan <yixun.lan@amlogic.com> wrote:

> The data pin 0-7 of the NAND controller are actually missing from
> the nand pinctrl group, so we fix it here.
>
> Fixes: cd1e3b01c7d3 ("pinctrl: amlogic: gxbb: add nand pins")
> Reported-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Patch applied.

Yours,
Linus Walleij
