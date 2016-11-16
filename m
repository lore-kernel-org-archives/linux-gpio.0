From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] pinctrl: sunxi: Deal with configless pins
Date: Wed, 16 Nov 2016 15:31:24 +0300
Message-ID: <20161116123123.GA31631@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:27139 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752417AbcKPMbi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2016 07:31:38 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: maxime.ripard@free-electrons.com
Cc: linux-gpio@vger.kernel.org

Hello Maxime Ripard,

The patch e11dee2e98f8: "pinctrl: sunxi: Deal with configless pins"
from Oct 20, 2016, leads to the following static checker warning:

	drivers/pinctrl/sunxi/pinctrl-sunxi.c:397 sunxi_pctrl_dt_node_to_map()
	warn: variable dereferenced before check 'map' (see line 323)

drivers/pinctrl/sunxi/pinctrl-sunxi.c
   394          *num_maps = i;
   395  
   396          /*
   397           * We know have the number of maps we need, we can resize our
   398           * map array
   399           */
   400          *map = krealloc(*map, i * sizeof(struct pinctrl_map), GFP_KERNEL);
   401          if (!map)

This should obviously be "if (*map) " here.

   402                  return -ENOMEM;
   403  
   404          return 0;
   405  
   406  err_free_map:
   407          kfree(map);

I would send a patch, but I wasn't sure about this.  Should this be
kfree(*map);?  I don't have my cross function DB built for ARM so I
don't know how this is called...  Maybe set *map to NULL as well before
returning?

   408          return ret;
   409  }

regards,
dan carpenter
