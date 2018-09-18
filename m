From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 09/22] pinctrl: mediatek: add advanced pull related
 support to pinctrl-mtk-common-v2.c
Date: Tue, 18 Sep 2018 12:49:37 -0700
Message-ID: <CACRpkdaAWZYeQiSBuZQLwhQMoKryGB1aktQ4dpcarN7TNnZh1Q@mail.gmail.com>
References: <cover.1536404280.git.sean.wang@mediatek.com> <aa213c9af6f9261f2ba91055785f0058d615bc4d.1536404280.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aa213c9af6f9261f2ba91055785f0058d615bc4d.1536404280.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 8, 2018 at 4:07 AM <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> There are some specific pins (i.e. MMC/SD) need specific registers to
> turn on/off the 10K & 50k(75K) resistors when pull up/down.
>
> Therefore, this patch adds the custom prarmeters so that the user could
> control it through device tree.
>
> Signed-off-by: Ryder.Lee <ryder.lee@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
