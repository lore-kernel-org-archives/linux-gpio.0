From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5] pinctrl: mediatek: add EINT support to virtual GPIOs
Date: Fri, 11 Jan 2019 13:15:54 +0100
Message-ID: <CACRpkdaF+PFv-oUkLiWT7M2hYESsAYxaPN5OM2=XraeAx9zP4Q@mail.gmail.com>
References: <1546486635-16829-1-git-send-email-chuanjia.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546486635-16829-1-git-send-email-chuanjia.liu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: chuanjia.liu@mediatek.com
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, youlin.pei@mediatek.com, huang eddie <eddie.huang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, hailong.fan@mediatek.com
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 3, 2019 at 4:38 AM <chuanjia.liu@mediatek.com> wrote:

> From: "chuanjia.liu" <Chuanjia.Liu@mediatek.com>
>
> Virtual gpio only used inside SOC and not being exported to outside SOC.
> Some modules use virtual gpio as eint and doesn't need SMT.
> So this patch add EINT support to virtual GPIOs.
>
> Signed-off-by: chuanjia.liu <Chuanjia.Liu@mediatek.com>
> ---
> change note:
> v5: This patch is the same as v4,re-upload due to
>       mail permissions issues

Patch applied with Sean's ACK.

Yours,
Linus Walleij
