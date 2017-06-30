From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] pinctrl: add ZTE ZX pinctrl driver support
Date: Fri, 30 Jun 2017 10:53:57 +0300
Message-ID: <20170630075357.vl34jcvkdxy2kvxm@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:51561 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751817AbdF3HyL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2017 03:54:11 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shawn.guo@linaro.org
Cc: linux-gpio@vger.kernel.org

Hello Shawn Guo,

This is a semi-automatic email about new static checker warnings.

The patch cbff0c4d27f4: "pinctrl: add ZTE ZX pinctrl driver support" 
from Apr 24, 2017, leads to the following Smatch complaint:

drivers/pinctrl/zte/pinctrl-zx.c:76 zx_set_mux()
	 warn: variable dereferenced before check 'data' (see line 67)

drivers/pinctrl/zte/pinctrl-zx.c
    66		struct zx_pin_data *data = pindesc->drv_data;
    67		struct zx_mux_desc *mux = data->muxes;
                                          ^^^^^^^^^^^
Dereference.

    68		u32 mask = (1 << data->width) - 1;
    69		u32 offset = data->offset;
    70		u32 bitpos = data->bitpos;
    71		struct function_desc *func;
    72		unsigned long flags;
    73		u32 val, mval;
    74	
    75		/* Skip reserved pin */
    76		if (!data)
                    ^^^^^
Too late.

    77			return -EINVAL;
    78	

regards,
dan carpenter
