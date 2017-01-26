From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] pinctrl: rockchip: Add rk3328 pinctrl support
Date: Thu, 26 Jan 2017 16:07:46 +0100
Message-ID: <24353895.ALOnc7lYnh@diego>
References: <1485074286-7863-1-git-send-email-david.wu@rock-chips.com> <CACRpkdaJEEGFnfX0_eBtwLMqYtSTShB5u6WCaA-YZG53OMnk+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38776 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752281AbdAZPIB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 10:08:01 -0500
In-Reply-To: <CACRpkdaJEEGFnfX0_eBtwLMqYtSTShB5u6WCaA-YZG53OMnk+w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Wu <david.wu@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Am Donnerstag, 26. Januar 2017, 14:29:17 CET schrieb Linus Walleij:
> On Sun, Jan 22, 2017 at 9:38 AM, David Wu <david.wu@rock-chips.com> wrote:
> > From: "david.wu" <david.wu@rock-chips.com>
> > 
> > This patch supports 3bit width iomux type.
> > Note, the iomux of following pins are special, need to
> > be handled specially.
> > 
> >  - gpio2_b0 ~ gpio2_b6
> >  - gpio2_b7
> >  - gpio2_c7
> >  - gpio3_b0
> >  - gpio3_b1 ~ gpio3_b7
> > 
> > And therefore add IOMUX_RECALCED_FLAG to indicate which
> > iomux source of the bank need to be recalced. If the mux
> > recalced callback and IOMUX_RECALCED_FLAG were set, recalc
> > the related pins' iomux.
> > 
> > Signed-off-by: david.wu <david.wu@rock-chips.com>
> 
> Heiko, could you review this?

it's on my todo list, I just didn't have the time this week so far.


Heiko
