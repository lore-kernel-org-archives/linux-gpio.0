From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] pinctrl: berlin: Don't leak memory if krealloc() fails
Date: Wed, 12 Oct 2016 11:14:22 +0300
Message-ID: <20161012081422.GA27222@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:51703 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753966AbcJLIPs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2016 04:15:48 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: jthumshirn@suse.de
Cc: linux-gpio@vger.kernel.org

Hello Johannes Thumshirn,

The patch e1547af8c059: "pinctrl: berlin: Don't leak memory if
krealloc() fails" from Sep 30, 2016, leads to the following static
checker warning:

	drivers/pinctrl/berlin/berlin.c:244 berlin_pinctrl_build_state()
	warn: passing devm_ allocated variable to kfree. 'pctrl->functions'

drivers/pinctrl/berlin/berlin.c
   221  
   222          /* we will reallocate later */
   223          pctrl->functions = devm_kzalloc(&pdev->dev,
   224                                          max_functions * sizeof(*pctrl->functions),
   225                                          GFP_KERNEL);
   226          if (!pctrl->functions)
   227                  return -ENOMEM;
   228  
   229          /* register all functions */
   230          for (i = 0; i < pctrl->desc->ngroups; i++) {
   231                  desc_group = pctrl->desc->groups + i;
   232                  desc_function = desc_group->functions;
   233  
   234                  while (desc_function->name) {
   235                          berlin_pinctrl_add_function(pctrl, desc_function->name);
   236                          desc_function++;
   237                  }
   238          }
   239  
   240          functions = krealloc(pctrl->functions,
   241                               pctrl->nfunctions * sizeof(*pctrl->functions),
   242                               GFP_KERNEL);
   243          if (!functions) {
   244                  kfree(pctrl->functions);

This will lead to a double free.

   245                  return -ENOMEM;
   246          }
   247          pctrl->functions = functions;

I'm really concerned about this generally.  It's like we can't tell if
pctrl->functions is a managed allocation or not, and I can't immediately
see where it is freed when it's unmanaged.

   248  

regards,
dan carpenter
