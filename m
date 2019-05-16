From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v2 0/2] pinctrl: mediatek: mt8183: Add support for wake sources
Date: Thu, 16 May 2019 20:47:32 +0800
Message-ID: <CANMq1KAOeuDCZEvV2A18nUts3WP2MbhUpY7gQ+vk0oTOz8TRQA@mail.gmail.com>
References: <20190508073331.27475-1-drinkcat@chromium.org> <CACRpkdZb73vNyepcfjzEGAopc7BBxde_N1wxn7PSJ3aGC0=Gig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZb73vNyepcfjzEGAopc7BBxde_N1wxn7PSJ3aGC0=Gig@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, Evan Green <evgreen@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 16, 2019 at 7:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, May 8, 2019 at 9:33 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> > This adds support for wake sources in pinctrl-mtk-common-v2, and
> > pinctrl-mt8183. Without this patch, all interrupts that are left
> > enabled on suspend act as wake sources (and wake sources without
> > interrupt enabled do not).
> >
> > Changes since v1:
> >  - Move changes from mtk-common-v2 to mtk-pinctrl-paris, as
> >    recommended by Sean, to keep better separation between eint
> >    and pinctrl-common features.
> >
> > Nicolas Boichat (2):
> >   pinctrl: mediatek: Add pm_ops to pinctrl-paris
> >   pinctrl: mediatek: mt8183: Add mtk_pinctrl_paris_pm_ops
>
> All seems to look fair to me, but I need some official ACK from
> Sean on these.
>
> I see there is some discussion on a related patch set which
> also has two patches so I am a but confused how mature the
> two patch sets are? Are they at all related?

They are somewhat related, but I don't think this depends on the other series.

This series adds support for wake on mt8183, and makes it similar to,
say, mt8173.

The other patch series fixes issues that affect all mtk pinctrl
variants (i.e. I think mt8173 pinctrl on current mainline has similar
issues). It's not impossible that the answer to the other series is
that we need to refactor code, but in that case, if we merge this
first, we'd just have to clean up one more pinctrl variant.

Thanks,

> Yours,
> Linus Walleij
