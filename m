From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] pinctrl: berlin: Don't leak memory if krealloc()
 fails
Date: Wed, 12 Oct 2016 11:45:27 +0300
Message-ID: <20161012084526.GG5630@mwanda>
References: <20161012081422.GA27222@mwanda>
 <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:41350 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932207AbcJLIpq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2016 04:45:46 -0400
Content-Disposition: inline
In-Reply-To: <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: linux-gpio@vger.kernel.org

On Wed, Oct 12, 2016 at 10:30:02AM +0200, Johannes Thumshirn wrote:
> Oh I see. Damn, missed the devm_kzalloc(). But shouldn't we avoid krealloc()
> on devm_kzalloc() in general? krealloc() calls kfree() if the reallocation
> succeeded and this will break the devres tracking, wouldn't it?

Good point.  I will update my test to check for that.

regards,
dan carpenter

