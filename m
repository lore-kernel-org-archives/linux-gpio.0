From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH V4 1/2] pinctrl: intel: fix bug of register offset
 calculation
Date: Wed, 9 Dec 2015 15:07:24 +0200
Message-ID: <20151209130724.GT1766@lahna.fi.intel.com>
References: <1448882416-40845-1-git-send-email-qipeng.zha@intel.com>
 <CACRpkdYP6gP9EqF8VHE2RMRY4Kczyitb2tKD0v9Rcwdjr3Ht_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:57631 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752867AbbLINJg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 08:09:36 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdYP6gP9EqF8VHE2RMRY4Kczyitb2tKD0v9Rcwdjr3Ht_A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Qipeng Zha <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Qi Zheng <qi.zheng@intel.com>

On Tue, Dec 01, 2015 at 03:10:40PM +0100, Linus Walleij wrote:
> On Mon, Nov 30, 2015 at 12:20 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:
> 
> > The group size for registers PADCFGLOCK, HOSTSW_OWN, GPI_IS,
> > GPI_IE, are not 24 for Broxton, Add a parameter to allow
> > different platform to set correct value.
> >
> > Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> >
> > ---
> > change in v4:
> >  no code change, re-send because the other patch set is update.
> 
> I've already applied the v3 version so no action :)

Can you also take patch 2/2 of this series? It fixes the other bug
Qipeng found.

Thanks.
