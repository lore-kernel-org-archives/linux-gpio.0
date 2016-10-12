From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] pinctrl: berlin: Don't leak memory if krealloc()
 fails
Date: Wed, 12 Oct 2016 14:19:24 +0300
Message-ID: <20161012111924.GJ5630@mwanda>
References: <20161012081422.GA27222@mwanda>
 <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
 <20161012084526.GG5630@mwanda>
 <20161012094436.3k7abjx64wlyjnyc@linux-x5ow.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:50497 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753104AbcJLLTq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2016 07:19:46 -0400
Content-Disposition: inline
In-Reply-To: <20161012094436.3k7abjx64wlyjnyc@linux-x5ow.site>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Oct 12, 2016 at 11:44:36AM +0200, Johannes Thumshirn wrote:
> On Wed, Oct 12, 2016 at 11:45:27AM +0300, Dan Carpenter wrote:
> > On Wed, Oct 12, 2016 at 10:30:02AM +0200, Johannes Thumshirn wrote:
> > > Oh I see. Damn, missed the devm_kzalloc(). But shouldn't we avoid krealloc()
> > > on devm_kzalloc() in general? krealloc() calls kfree() if the reallocation
> > > succeeded and this will break the devres tracking, wouldn't it?
> > 
> > Good point.  I will update my test to check for that.
> 
> Well the initial problem still stands, how do we fix the possible double
> free? I think I could "just" change the devm_kzalloc() to kzalloc() (and
> introduce cleanups) but I'm not sure this is a good solution. The whoule point
> of these devm stuff is to apply a safety net, isn't it?

No.  It's just a convenience because we allocate so much stuff on probe.
A few people use it like that, where they try to manage their own memory
and use devm_ at the same time and it annoys me.

Just use kzalloc().  But make sure there is a free somewhere.

regards,
dan carpenter

