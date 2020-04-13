Return-Path: <SRS0=v07L=55=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354A1C2BA19
	for <linux-gpio@archiver.kernel.org>; Mon, 13 Apr 2020 10:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17082206E9
	for <linux-gpio@archiver.kernel.org>; Mon, 13 Apr 2020 10:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgDMKqj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 13 Apr 2020 06:46:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:22691 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727776AbgDMKqj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 06:46:39 -0400
IronPort-SDR: +nfLfA6ksikTYPC9YFvyTdC1nvR3NHjPLp5Rjl/0dJsmG2ijEpKL2gbt6n+sz8L74+PYPz8Mul
 lW79+9axSo5A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 03:46:39 -0700
IronPort-SDR: 5nEXkMer0wITMCihWi8CY0yBdHsMVDKTkUrx7i0u7UtHfjXOfHzuY6EY/IqCV4m5M2lPoFHchJ
 Y2b7yjcN8dIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="271035498"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 13 Apr 2020 03:46:37 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jNwbw-000Gvl-Kg; Mon, 13 Apr 2020 13:46:40 +0300
Date:   Mon, 13 Apr 2020 13:46:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: sunrisepoint: Fix PAD lock register offset
 for SPT-H
Message-ID: <20200413104640.GC34613@smile.fi.intel.com>
References: <20200401085553.8770-1-andriy.shevchenko@linux.intel.com>
 <20200401095002.GR2564@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401095002.GR2564@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 01, 2020 at 12:50:02PM +0300, Mika Westerberg wrote:
> On Wed, Apr 01, 2020 at 11:55:53AM +0300, Andy Shevchenko wrote:
> > It appears that SPT-H variant has different offset for PAD locking registers.
> > Fix it here.
> > 
> > Fixes: 551fa5801ef1 ("pinctrl: intel: sunrisepoint: Add Intel Sunrisepoint-H support")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to fixes, thanks!

-- 
With Best Regards,
Andy Shevchenko


