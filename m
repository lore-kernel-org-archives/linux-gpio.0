Return-Path: <SRS0=lu8F=YD=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DCAECE58E
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Oct 2019 07:39:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CE6721920
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Oct 2019 07:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732947AbfJJHiI (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 10 Oct 2019 03:38:08 -0400
Received: from mga12.intel.com ([192.55.52.136]:50540 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726864AbfJJH0Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Oct 2019 03:26:25 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Oct 2019 00:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,279,1566889200"; 
   d="scan'208";a="207133796"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2019 00:26:23 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iISq6-0001xd-Cl; Thu, 10 Oct 2019 10:26:22 +0300
Date:   Thu, 10 Oct 2019 10:26:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 2/5] gpiolib: Initialize the hardware with a callback
Message-ID: <20191010072622.GM32742@smile.fi.intel.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
 <20191009165056.76580-3-andriy.shevchenko@linux.intel.com>
 <44c7e540-5390-78df-26db-7251866ac6ad@redhat.com>
 <20191010072304.GL32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010072304.GL32742@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 10, 2019 at 10:23:04AM +0300, Andy Shevchenko wrote:
> On Wed, Oct 09, 2019 at 09:44:31PM +0200, Hans de Goede wrote:
> > On 09-10-2019 18:50, Andy Shevchenko wrote:
> > > After changing the drivers to use GPIO core to add an IRQ chip
> > > it appears that some of them requires a hardware initialization
> > > before adding the IRQ chip.
> > > 
> > > Add an optional callback ->init_hw() to allow that drivers
> > > to initialize hardware if needed.
> > > 
> > > This change is a part of the fix NULL pointer dereference
> > > brought to the several drivers recently.
> > > 
> > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Hmm, IIRC Linus Walleij already added a callback for initializing the
> > mask before the irchip gets initialized which is basically intended for
> > what you want this callback for I think ?
> 
> This is not about the mask, it's about hardware to be prepared before enabling.
> Also init_valid_mask() will allocate memory which won't be needed.

If you think this is not a proper approach, we have to revert all three patches
now (*) and think about better solution.

*) They broke the boot on all affected machines.

-- 
With Best Regards,
Andy Shevchenko


