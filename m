From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] pinctrl: berlin: Don't leak memory if krealloc()
 fails
Date: Wed, 12 Oct 2016 20:06:40 +0300
Message-ID: <20161012125846.GK5630@mwanda>
References: <20161012081422.GA27222@mwanda>
 <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
 <20161012084526.GG5630@mwanda>
 <20161012094436.3k7abjx64wlyjnyc@linux-x5ow.site>
 <20161012111924.GJ5630@mwanda>
 <20161012123616.ff7kiwbsyrnvhwff@linux-x5ow.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1050.oracle.com ([141.146.126.70]:48265 "EHLO
        aserp1050.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755134AbcJLRLk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2016 13:11:40 -0400
Received: from aserp1040.oracle.com (aserp1040.oracle.com [141.146.126.69])
        by aserp1050.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id u9CH834f026225
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2016 17:08:03 GMT
Content-Disposition: inline
In-Reply-To: <20161012123616.ff7kiwbsyrnvhwff@linux-x5ow.site>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Oct 12, 2016 at 02:36:16PM +0200, Johannes Thumshirn wrote:

> +void berlin_pinctrl_free_funcgroups(struct berlin_pinctrl *pctrl)
> +{
> +	struct berlin_desc_group const *desc_group;
> +	struct berlin_desc_function const *desc_function;
> +	int i;
> +
> +	for (i = 0; i < pctrl->desc->ngroups; i++) {
> +		desc_group = pctrl->desc->groups + i;
> +		desc_function = desc_group->functions;
> +
> +		while (desc_function->name) {
> +			struct berlin_pinctrl_function
> +				*function = pctrl->functions;
> +
> +			kfree(function->groups);

It looks like, we're just freeing pctrl->functions->groups over and
over.

Not taking advantage of managed allocations has made this stuff so much
more complicated.  I'd be tempted almost to just delete the krealloc()
and waste a little RAM...  (I have no idea how much RAM I'm talking
about here so maybe this is a bad idea).

> +			desc_function++;
> +		}
> +	}
> +}
> 
