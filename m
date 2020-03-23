Return-Path: <SRS0=YfHD=5I=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D01DC4332E
	for <linux-gpio@archiver.kernel.org>; Mon, 23 Mar 2020 19:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFD3E2073E
	for <linux-gpio@archiver.kernel.org>; Mon, 23 Mar 2020 19:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgCWToR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 23 Mar 2020 15:44:17 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38130 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgCWToR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 15:44:17 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 7B83B80307CA;
        Mon, 23 Mar 2020 19:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5iivDdJnPruE; Mon, 23 Mar 2020 22:44:15 +0300 (MSK)
Date:   Mon, 23 Mar 2020 22:43:56 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add Segey Semin to maintainers of DW
 APB GPIO driver
Message-ID: <20200323194356.eoggflbyqabi5gcd@ubsrv2.baikal.int>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323180632.14119-7-Sergey.Semin@baikalelectronics.ru>
 <20200323184102.GW1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200323184102.GW1922688@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2020 at 08:41:02PM +0200, Andy Shevchenko wrote:
> Drop unneeded Cc's.
> 
> On Mon, Mar 23, 2020 at 09:06:32PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > Add myself as a co-maintainer of the Synopsis DesignWare APB GPIO driver.
> 
> By the way, if you are really wanting to maintain the driver, I may give you
> (for free) Intel Galileo board where this IP is being used.
> 
> Send me private mail where we can discuss how to deliver.
> 

You can communicate with me via this email: fancer.lancer (at) gmail.com

-Sergey

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
