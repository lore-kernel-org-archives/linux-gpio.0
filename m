From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] pinctrl: mvebu: add suspend/resume support to Armada XP
 pinctrl driver
Date: Fri, 27 Mar 2015 14:52:41 +0100
Message-ID: <20150327145241.688935d3@free-electrons.com>
References: <1426761047-3103-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<CACRpkdZ_2FJLJJaDuqw=9cxxJwacz06KssfSK_HVg2jZ6E-6eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:42711 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750931AbbC0Nwv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2015 09:52:51 -0400
In-Reply-To: <CACRpkdZ_2FJLJJaDuqw=9cxxJwacz06KssfSK_HVg2jZ6E-6eQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Linus,

On Fri, 27 Mar 2015 09:37:19 +0100, Linus Walleij wrote:

> Patch applied, but:
> 
> >  static void __iomem *mpp_base;
> > +static u32 *mpp_saved_regs;
> 
> I didn't notice this singleton design pattern in this driver before :(
> I see the legacy Dove driver have a few more.
> 
> Can we have a mvebu refactoring patch bringing these things into a state
> container? Like a per-subdriver kmalloc:ed struct foo_state {}?

Yes, I agree this isn't nice. I'll try to nice what I can come up with
and propose a patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
