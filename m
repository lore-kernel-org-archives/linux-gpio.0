From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 2/2] pinctrl: rockchip: only enable gpio clock when it setting
Date: Thu, 13 Aug 2015 14:37:36 +0200
Message-ID: <2167165.ooWgarx4Ov@diego>
References: <1439287924-6988-1-git-send-email-hl@rock-chips.com> <1439287924-6988-2-git-send-email-hl@rock-chips.com> <CACRpkda0FXz1dpdS-wLRNmkt1KBESMyCWKMMa0ArH9Z-L=i_sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:52279 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752265AbbHMMht (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 13 Aug 2015 08:37:49 -0400
In-Reply-To: <CACRpkda0FXz1dpdS-wLRNmkt1KBESMyCWKMMa0ArH9Z-L=i_sw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lin Huang <hl@rock-chips.com>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

Am Donnerstag, 13. August 2015, 14:24:28 schrieb Linus Walleij:
> On Tue, Aug 11, 2015 at 12:12 PM, Lin Huang <hl@rock-chips.com> wrote:
> > gpio can keep state even the clock disable, for save power
> > consumption, only enable gpio clock when it setting
> > 
> > Signed-off-by: Lin Huang <hl@rock-chips.com>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > Changes in v5:
> > -rebase patch
> 
> Patch applied with Doug's test tags etc.

did you  also take the first patch?

Aka bot should probably stay together (hence Stephen's Ack for the clock 
change), as the dynamically controlling the gpio clocks exposes the 
pclk_pd_pmu.


Heiko
