From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: Re: [bug report] pinctrl: berlin: Don't leak memory if krealloc()
 fails
Date: Wed, 12 Oct 2016 10:30:02 +0200
Message-ID: <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
References: <20161012081422.GA27222@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55952 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932421AbcJLIaI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Oct 2016 04:30:08 -0400
Content-Disposition: inline
In-Reply-To: <20161012081422.GA27222@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org

On Wed, Oct 12, 2016 at 11:14:22AM +0300, Dan Carpenter wrote:
> Hello Johannes Thumshirn,
> 
> The patch e1547af8c059: "pinctrl: berlin: Don't leak memory if
> krealloc() fails" from Sep 30, 2016, leads to the following static
> checker warning:
> 
> 	drivers/pinctrl/berlin/berlin.c:244 berlin_pinctrl_build_state()
> 	warn: passing devm_ allocated variable to kfree. 'pctrl->functions'
> 
> drivers/pinctrl/berlin/berlin.c
>    221  
>    222          /* we will reallocate later */
>    223          pctrl->functions = devm_kzalloc(&pdev->dev,
>    224                                          max_functions * sizeof(*pctrl->functions),
>    225                                          GFP_KERNEL);
>    226          if (!pctrl->functions)
>    227                  return -ENOMEM;
>    228  
>    229          /* register all functions */
>    230          for (i = 0; i < pctrl->desc->ngroups; i++) {
>    231                  desc_group = pctrl->desc->groups + i;
>    232                  desc_function = desc_group->functions;
>    233  
>    234                  while (desc_function->name) {
>    235                          berlin_pinctrl_add_function(pctrl, desc_function->name);
>    236                          desc_function++;
>    237                  }
>    238          }
>    239  
>    240          functions = krealloc(pctrl->functions,
>    241                               pctrl->nfunctions * sizeof(*pctrl->functions),
>    242                               GFP_KERNEL);
>    243          if (!functions) {
>    244                  kfree(pctrl->functions);
> 
> This will lead to a double free.
> 
>    245                  return -ENOMEM;
>    246          }
>    247          pctrl->functions = functions;
> 
> I'm really concerned about this generally.  It's like we can't tell if
> pctrl->functions is a managed allocation or not, and I can't immediately
> see where it is freed when it's unmanaged.
> 
>    248  
> 
> regards,
> dan carpenter

Oh I see. Damn, missed the devm_kzalloc(). But shouldn't we avoid krealloc()
on devm_kzalloc() in general? krealloc() calls kfree() if the reallocation
succeeded and this will break the devres tracking, wouldn't it?

Byte,
	Johannes

-- 
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
