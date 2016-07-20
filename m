From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] Revert "pinctrl: amd: make it explicitly non-modular"
Date: Wed, 20 Jul 2016 23:13:10 +0200
Message-ID: <20160720231310.28c6e0a2@endymion>
References: <20160719003030.26420-1-paul.gortmaker@windriver.com>
	<20160719104629.656ef179@endymion>
	<20160719134439.GJ21225@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33207 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753941AbcGTVNQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 20 Jul 2016 17:13:16 -0400
In-Reply-To: <20160719134439.GJ21225@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hi Paul,

On Tue, 19 Jul 2016 09:44:40 -0400, Paul Gortmaker wrote:
> [Re: [PATCH] Revert "pinctrl: amd: make it explicitly non-modular"] On 19/07/2016 (Tue 10:46) Jean Delvare wrote:
> > On Mon, 18 Jul 2016 20:30:30 -0400, Paul Gortmaker wrote:
> > > This reverts commit b8c2b10a9bc0272a20e096852f8fbbf361749dda.
> > > 
> > > This patch was in my queue at the same time that a conversion of
> > > the same driver from bool --> tristate was pending and merged.
> > > 
> > > That is commit 337ea0fb1535 ("pinctrl: Turn AMD support to tristate")
> > 
> > I can't find this commit anywhere, but I would certainly prefer this to
> > making the driver non-modular. So I vote in favor of this revert.
> 
> It is a mainline commit, so I guess you need to pull in the last couple
> months of commits...

Oops, my bad, I was expecting something a lot more recent.

> 
>    paul@builder-02:~/git/linux-head$ git describe --contains 337ea0fb1535
>    v4.6-rc1~149^2~35
>    paul@builder-02:~/git/linux-head$ git show v4.6-rc1~149
>    commit 5ca5446ec5ba5e79a6f271cd026bb153d6850fcc
>    Merge: 710d60cbf1b3 3c177a166253
>    Author: Linus Torvalds <torvalds@linux-foundation.org>
>    Date:   Tue Mar 15 20:23:13 2016 -0700
>    
>        Merge tag 'pinctrl-v4.6-1' of
>    git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
>    
>        Pull pin control updates from Linus Walleij:

Ah ah, now I see the commit is from me. How is it possible to have such
bad memory :*D

> I didn't bother marking it for 4.6 stable since it used to be builtin
> only and even with the crossed patches, it still would have been builtin;
> it just wouldn't respect the newly available tristate option if chosen.

I agree, it's no stable material. I'm happy it's finally sorted out,
thanks.

-- 
Jean Delvare
SUSE L3 Support
