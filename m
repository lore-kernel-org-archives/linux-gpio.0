From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] pinctrl: single: support GPIO for bits pinctrl
Date: Tue, 16 Jun 2015 04:28:23 -0700
Message-ID: <20150616112822.GH2712@atomide.com>
References: <1434097185-16464-1-git-send-email-jun.nie@linaro.org>
 <CACRpkdZGqXc1+b0L==Oen54zX9SgD4kZfYC3LmdJEn_imDx3Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:58062 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752919AbbFPL20 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 16 Jun 2015 07:28:26 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZGqXc1+b0L==Oen54zX9SgD4kZfYC3LmdJEn_imDx3Bg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jun Nie <jun.nie@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, wan.zhijun@zte.com.cn, jason.liu@linaro.org

* Linus Walleij <linus.walleij@linaro.org> [150616 02:19]:
> On Fri, Jun 12, 2015 at 10:19 AM, Jun Nie <jun.nie@linaro.org> wrote:
> 
> > Support GPIO for one register control multiple pins case
> > with calculating register offset first, then bit offset.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> 
> You need to send this patch to Tony Lindgren for review.

Yes please repost, and also add Cc Haojian Zhuang
<haojian.zhuang@linaro.org> as he added the GPIO support
to the driver.

Regards,

Tony
