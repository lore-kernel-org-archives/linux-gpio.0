From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: Fix the correct routing config for the gmac-m1 pins of rmii and rgmii
Date: Sat, 07 Oct 2017 20:50:37 +0200
Message-ID: <1879535.2f3c0LOipO@phil>
References: <1506773601-27315-1-git-send-email-david.wu@rock-chips.com> <1908269.6t3djq65xf@phil> <CACRpkdYOuf_8_EWg1GtV-75YvmnLkpadKrGMfQZ2v2RRqbYvRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:53696 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751305AbdJGSuv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 7 Oct 2017 14:50:51 -0400
In-Reply-To: <CACRpkdYOuf_8_EWg1GtV-75YvmnLkpadKrGMfQZ2v2RRqbYvRw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Wu <david.wu@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

Am Samstag, 7. Oktober 2017, 12:32:51 CEST schrieb Linus Walleij:
> On Sat, Sep 30, 2017 at 5:07 PM, Heiko Stuebner <heiko@sntech.de> wrote:
> > Am Samstag, 30. September 2017, 20:13:21 CEST schrieb David Wu:
> >> If the gmac-m1 optimization(bit10) is selected, the gpio function
> >> of gmac pins is not valid. We may use the rmii mode for gmac interface,
> >> the pins such as rx_d2, rx_d3, which the rgmii mode used, but rmii not
> >> used could be taken as gpio function. So gmac_rxd0m1 selects the bit2,
> >> and gmac_rxd0m3 select bit10 is more correct.
> >>
> >> Signed-off-by: David Wu <david.wu@rock-chips.com>
> >
> > the patch subject should mention the the rk3328 whose routing gets fixed
> > (like adding a simple "on rk3328" to it), otherwise
> >
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> I added rk3328 to it, also assumed this Reviewed-by covers patch 1/2
> as well and applied both with your tag.

while I did mean to cross-check patch 1/2 separately with the soc manual,
I got sidetracked with my current vacation :-) . Anyway, it did look ok on
first glance then and I also cannot find issues with it now. So all is good.


Heiko
