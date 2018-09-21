From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: mediatek: add no eint function for pin define
Date: Fri, 21 Sep 2018 09:12:34 -0700
Message-ID: <CACRpkdZoH5zTF2Vt9TbCiB68e0npgOCDVE00fNgFNgUwZ6Bi3Q@mail.gmail.com>
References: <ab85fbee4d8286cbedbcc7317f89dc0d2dd83965.1537502494.git.sean.wang@mediatek.com>
 <554196e837f622eea62d11602b7c88721d6a776d.1537502494.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <554196e837f622eea62d11602b7c88721d6a776d.1537502494.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, mars.cheng@mediatek.com
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 20, 2018 at 9:07 PM <sean.wang@mediatek.com> wrote:

> From: Mars Cheng <mars.cheng@mediatek.com>
>
> Add NO_EINT_SUPPORT back to pinctrl-mtk-common-v2.h as the alias of
> EINT_NA to indicate that some pin not capable of being controlled as eint
> and that is required by pinctrl-paris based driver as old
> pinctrl-mtk-common.h already had.
>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
