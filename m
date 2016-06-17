From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: sch: Fix Oops on module load on Asus Eee PC 1201
Date: Fri, 17 Jun 2016 11:10:34 +0300
Message-ID: <20160617081034.GF1739@lahna.fi.intel.com>
References: <20160506214917.GA1691@pitrat4.localdomain>
 <20160509070245.GJ15974@lahna.fi.intel.com>
 <20160509192652.GA1320@pitrat4.localdomain>
 <CABy3NjSJTygdP3POxQQqxDA6=Jx4DeQ47KONASfm46kei7wBDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:51844 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752303AbcFQIKj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 17 Jun 2016 04:10:39 -0400
Content-Disposition: inline
In-Reply-To: <CABy3NjSJTygdP3POxQQqxDA6=Jx4DeQ47KONASfm46kei7wBDQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin Pitrat <colin.pitrat@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, rebecca.swee.fun.chang@intel.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 16, 2016 at 08:20:15PM +0100, Colin Pitrat wrote:
>    Hello,
>    do you have news on this issue ?
>    Is there any way I can help ?

Yeah, rework the patch according:

https://lkml.org/lkml/2016/5/9/61

:-)
