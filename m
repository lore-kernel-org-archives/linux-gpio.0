Return-Path: <SRS0=yQjr=75=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7191EC433E0
	for <linux-gpio@archiver.kernel.org>; Tue, 16 Jun 2020 20:43:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 500C72080D
	for <linux-gpio@archiver.kernel.org>; Tue, 16 Jun 2020 20:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgFPUnt (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 16 Jun 2020 16:43:49 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:42624 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbgFPUns (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 16:43:48 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1jlIQq-000rpF-55; Tue, 16 Jun 2020 22:43:44 +0200
Date:   Tue, 16 Jun 2020 22:43:44 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [PATCH v1 2/5] ARM/orion/gpio: Make use of
 for_each_requested_gpio()
Message-ID: <20200616204344.GA205574@lunn.ch>
References: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
 <20200615150545.87964-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615150545.87964-3-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 06:05:42PM +0300, Andy Shevchenko wrote:
> Make use of for_each_requested_gpio() instead of home grown analogue.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
