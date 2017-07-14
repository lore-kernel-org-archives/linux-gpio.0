From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] gpio: fix deferred probe detection for legacy API
Date: Fri, 14 Jul 2017 14:34:18 +0300
Message-ID: <20170714113418.njnsukrnplc4xbh2@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:31552 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753519AbdGNLe2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jul 2017 07:34:28 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: acourbot@nvidia.com
Cc: linux-gpio@vger.kernel.org

[ This one is quite old, and hasn't caused a problem so probably the
  NULL check is not required?  -dan ]

Hello Alexandre Courbot,

This is a semi-automatic email about new static checker warnings.

The patch 0e9a5edf5d01: "gpio: fix deferred probe detection for
legacy API" from Dec 2, 2014, leads to the following Smatch complaint:

    drivers/gpio/gpiolib-legacy.c:36 gpio_request_one()
    error: we previously assumed 'desc' could be null (see line 28)

drivers/gpio/gpiolib-legacy.c
    27		/* Compatibility: assume unavailable "valid" GPIOs will appear later */
    28		if (!desc && gpio_is_valid(gpio))
                    ^^^^^
Patch adds a new check.

    29			return -EPROBE_DEFER;
    30	
    31		err = gpiod_request(desc, label);
    32		if (err)
    33			return err;
    34	
    35		if (flags & GPIOF_OPEN_DRAIN)
    36			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
                                                  ^^^^^^^^^^^
But these dereferences aren't checked.

    37	
    38		if (flags & GPIOF_OPEN_SOURCE)

regards,
dan carpenter
