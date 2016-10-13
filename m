From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: Re: [bug report] pinctrl: berlin: Don't leak memory if krealloc()
 fails
Date: Thu, 13 Oct 2016 15:09:33 +0200
Message-ID: <20161013130933.pl2stxjcawgcufbx@linux-x5ow.site>
References: <20161012081422.GA27222@mwanda>
 <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
 <20161012084526.GG5630@mwanda>
 <20161012094436.3k7abjx64wlyjnyc@linux-x5ow.site>
 <20161012111924.GJ5630@mwanda>
 <20161012123616.ff7kiwbsyrnvhwff@linux-x5ow.site>
 <20161012125846.GK5630@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39377 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754692AbcJMNKF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Oct 2016 09:10:05 -0400
Content-Disposition: inline
In-Reply-To: <20161012125846.GK5630@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Oct 12, 2016 at 08:06:40PM +0300, Dan Carpenter wrote:
> On Wed, Oct 12, 2016 at 02:36:16PM +0200, Johannes Thumshirn wrote:
> 
> > +void berlin_pinctrl_free_funcgroups(struct berlin_pinctrl *pctrl)
> > +{
> > +	struct berlin_desc_group const *desc_group;
> > +	struct berlin_desc_function const *desc_function;
> > +	int i;
> > +
> > +	for (i = 0; i < pctrl->desc->ngroups; i++) {
> > +		desc_group = pctrl->desc->groups + i;
> > +		desc_function = desc_group->functions;
> > +
> > +		while (desc_function->name) {
> > +			struct berlin_pinctrl_function
> > +				*function = pctrl->functions;
> > +
> > +			kfree(function->groups);
> 
> It looks like, we're just freeing pctrl->functions->groups over and
> over.
> 
> Not taking advantage of managed allocations has made this stuff so much
> more complicated.  I'd be tempted almost to just delete the krealloc()
> and waste a little RAM...  (I have no idea how much RAM I'm talking
> about here so maybe this is a bad idea).

Hmm yes. But I think it's best to just drop the patch from
linux-pinctrl/for-next (and the sunxi one as well as it's suffering from the
same pain). Let's get it back to the less broken state it has been in.

@Linus are you ok with dropping these patches from your queue or shall I send
you reverts?

Byte,
	Johannes

-- 
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
