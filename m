From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: Re: [bug report] pinctrl: berlin: Don't leak memory if krealloc()
 fails
Date: Tue, 18 Oct 2016 16:12:29 +0200
Message-ID: <20161018141228.54j7hbmfsyvzyduy@linux-x5ow.site>
References: <20161012081422.GA27222@mwanda>
 <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
 <20161012084526.GG5630@mwanda>
 <20161012094436.3k7abjx64wlyjnyc@linux-x5ow.site>
 <20161012111924.GJ5630@mwanda>
 <20161012123616.ff7kiwbsyrnvhwff@linux-x5ow.site>
 <20161012125846.GK5630@mwanda>
 <20161013130933.pl2stxjcawgcufbx@linux-x5ow.site>
 <CACRpkdZEbzeibDP2D3uA2HL9L10fiQcV6rr-kp+ORmnpRkBozw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50659 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759934AbcJROMd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Oct 2016 10:12:33 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZEbzeibDP2D3uA2HL9L10fiQcV6rr-kp+ORmnpRkBozw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 18, 2016 at 02:34:23PM +0200, Linus Walleij wrote:
> On Thu, Oct 13, 2016 at 3:09 PM, Johannes Thumshirn <jthumshirn@suse.de> wrote:
> 
> > @Linus are you ok with dropping these patches from your queue or shall I send
> > you reverts?
> 
> Dropping them, rebasing my for-next test branch on v4.9-rc1 anyway.

Thanks,
	Johannes

-- 
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
