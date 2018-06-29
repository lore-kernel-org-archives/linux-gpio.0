From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/7] pinctrl: mt7622: fix that pinctrl_claim_hogs cannot work
Date: Fri, 29 Jun 2018 14:19:36 +0200
Message-ID: <CACRpkdaM2ZK-rF1_DKyZLnmbxCp0i-Myvke6HSVeGymayhJ4qg@mail.gmail.com>
References: <f222c9f488490bd86d35346e725491e1de306ace.1529639050.git.sean.wang@mediatek.com>
 <3b1fa378e0a83a5f39497fe8efaf4c992507ed5d.1529639050.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <3b1fa378e0a83a5f39497fe8efaf4c992507ed5d.1529639050.git.sean.wang@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 22, 2018 at 5:49 AM <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> To allow claiming hogs by pinctrl, we cannot enable pinctrl until all
> groups and functions are being added done. Also, it's necessary that
> the corresponding gpiochip is being added when the pinctrl device is
> enabled.
>
> Cc: stable@vger.kernel.org
> Fixes: d6ed93551320 ("pinctrl: mediatek: add pinctrl driver for MT7622 SoC")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied for fixes.

Yours,
Linus Walleij
