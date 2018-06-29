From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/7] pinctrl: mt7622: fix initialization sequence between
 eint and gpiochip
Date: Fri, 29 Jun 2018 14:18:32 +0200
Message-ID: <CACRpkdaa2eBF40T9VcBJUiKm5cBe-iG2T3iKAOo=o7=FviRBvQ@mail.gmail.com>
References: <f222c9f488490bd86d35346e725491e1de306ace.1529639050.git.sean.wang@mediatek.com>
 <989f31608d4a85594d3805f966006e1f607ccde3.1529639050.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <989f31608d4a85594d3805f966006e1f607ccde3.1529639050.git.sean.wang@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 22, 2018 at 5:49 AM <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> Because gpichip applied in the driver must depend on mtk eint to implement
> the input data debouncing and the translation between gpio and irq, it's
> better to keep logic consistent with mtk eint being built prior to gpiochip
> being added.
>
> Cc: stable@vger.kernel.org
> Fixes: e6dabd38d8e7 ("pinctrl: mediatek: add EINT support to MT7622 SoC")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied for fixes.

Yours,
Linus Walleij
