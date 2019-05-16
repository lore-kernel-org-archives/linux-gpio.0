From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/2] pinctrl: mediatek: mt8183: Add support for wake sources
Date: Thu, 16 May 2019 13:55:46 +0200
Message-ID: <CACRpkdZb73vNyepcfjzEGAopc7BBxde_N1wxn7PSJ3aGC0=Gig@mail.gmail.com>
References: <20190508073331.27475-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508073331.27475-1-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, Evan Green <evgreen@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 8, 2019 at 9:33 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> This adds support for wake sources in pinctrl-mtk-common-v2, and
> pinctrl-mt8183. Without this patch, all interrupts that are left
> enabled on suspend act as wake sources (and wake sources without
> interrupt enabled do not).
>
> Changes since v1:
>  - Move changes from mtk-common-v2 to mtk-pinctrl-paris, as
>    recommended by Sean, to keep better separation between eint
>    and pinctrl-common features.
>
> Nicolas Boichat (2):
>   pinctrl: mediatek: Add pm_ops to pinctrl-paris
>   pinctrl: mediatek: mt8183: Add mtk_pinctrl_paris_pm_ops

All seems to look fair to me, but I need some official ACK from
Sean on these.

I see there is some discussion on a related patch set which
also has two patches so I am a but confused how mature the
two patch sets are? Are they at all related?

Yours,
Linus Walleij
