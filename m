Return-Path: <SRS0=01Zh=7A=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55860C433E0
	for <linux-gpio@archiver.kernel.org>; Mon, 18 May 2020 18:10:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4035A20671
	for <linux-gpio@archiver.kernel.org>; Mon, 18 May 2020 18:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732910AbgERSKr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 18 May 2020 14:10:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:24163 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732933AbgERSKr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 14:10:47 -0400
IronPort-SDR: IgNVX2cO94RRW3a+z6srI0VuZpO26Q/BFhlBIFbdJ9LhaPUOHoU1QVBcCEFCgsk3pxsr4TXQTT
 DxUuewcvV23Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 11:10:45 -0700
IronPort-SDR: AYODz6xl/G0TH+eLwV0cv3rSSAV/EJ2Q6Jg3gsp6WaU/ERSe1td6IV1PWCrwVJfHJSrarnNgDx
 Kjwzxgvjqmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="288664579"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 18 May 2020 11:10:43 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jakDv-007U8O-3u; Mon, 18 May 2020 21:10:47 +0300
Date:   Mon, 18 May 2020 21:10:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: dwapb: Don't use 0 as valid Linux interrupt
 number
Message-ID: <20200518181047.GR1634618@smile.fi.intel.com>
References: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
 <20200518174138.19367-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518174138.19367-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 18, 2020 at 08:41:37PM +0300, Andy Shevchenko wrote:
> 0 is not valid IRQ number in Linux interrupt number space.
> Refactor the code with this kept in mind.

>  		if (pp->irq[j] >= 0)

Oops, missed this one to drop >= 0.
I'll wait for your and Lee's comments / tags for the rest and then send v3.

>  			pp->has_irq = true;

-- 
With Best Regards,
Andy Shevchenko


