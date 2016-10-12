From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: Re: [bug report] pinctrl: berlin: Don't leak memory if krealloc()
 fails
Date: Wed, 12 Oct 2016 11:44:36 +0200
Message-ID: <20161012094436.3k7abjx64wlyjnyc@linux-x5ow.site>
References: <20161012081422.GA27222@mwanda>
 <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
 <20161012084526.GG5630@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39272 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932284AbcJLJoi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Oct 2016 05:44:38 -0400
Content-Disposition: inline
In-Reply-To: <20161012084526.GG5630@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

On Wed, Oct 12, 2016 at 11:45:27AM +0300, Dan Carpenter wrote:
> On Wed, Oct 12, 2016 at 10:30:02AM +0200, Johannes Thumshirn wrote:
> > Oh I see. Damn, missed the devm_kzalloc(). But shouldn't we avoid krealloc()
> > on devm_kzalloc() in general? krealloc() calls kfree() if the reallocation
> > succeeded and this will break the devres tracking, wouldn't it?
> 
> Good point.  I will update my test to check for that.

Well the initial problem still stands, how do we fix the possible double
free? I think I could "just" change the devm_kzalloc() to kzalloc() (and
introduce cleanups) but I'm not sure this is a good solution. The whoule point
of these devm stuff is to apply a safety net, isn't it?

Linus how shall we proceed? Reverting the patch keeps the double-free (IMHO
but I'm not 100% sure how this devres tracking works if we do a realloc on the
pointer) and reintroduces the memory leak.

Byte,
	Johannes

-- 
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
