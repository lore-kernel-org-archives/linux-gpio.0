From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 00/22] Unify MediaTek pinctrl in preparation for
 MT8183 and MT6765
Date: Tue, 18 Sep 2018 21:37:22 -0700
Message-ID: <20180919043722.GA14181@Mani-XPS-13-9360>
References: <cover.1536404280.git.sean.wang@mediatek.com>
 <CACRpkdZtVBjYGs5C7-HWEyX7f7pnCqvnRYBH=fFmLKhN4FGymA@mail.gmail.com>
 <1537325650.572.9.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537325650.572.9.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 19, 2018 at 10:54:10AM +0800, Sean Wang wrote:
> On Tue, 2018-09-18 at 15:07 -0700, Linus Walleij wrote:
> > On Sat, Sep 8, 2018 at 4:07 AM <sean.wang@mediatek.com> wrote:
> > 
> > > v2 and changes since v1:
> > 
> > I had trouble applying the last patches in the series so I applied
> > all on an immutable branch (ib-mtk) then merged that into devel
> > and added a patch on top to fix up some GPIO includes (just sent).
> > 
> > Please check the result!
> > 
> 
> Sure, I'll take a look and and test on the devel branch.
> 
> On the top, I'll add a fix for the issue recently reported by kbuild
> test robot about implicit declaration and a new MT6765 driver based
> on the series.
>

Hi Sean,

Do you have any plans to add support for MT6797?

Thanks,
Mani

> > Yours,
> > Linus Walleij
> 
> 
