Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44AFC4338F
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Aug 2021 15:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E99960F38
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Aug 2021 15:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239486AbhHDPtl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 4 Aug 2021 11:49:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:23458 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239495AbhHDPtj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Aug 2021 11:49:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="210834593"
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="210834593"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 08:49:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="668130482"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 08:49:20 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mBJ8s-0059pd-8o; Wed, 04 Aug 2021 18:49:14 +0300
Date:   Wed, 4 Aug 2021 18:49:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Riccardo Mori <patacca@autistici.org>,
        Lovesh <lovesh.bond@gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: tigerlake: Fix GPIO mapping for newer
 version of software
Message-ID: <YQq2+ggL+vagZdFr@smile.fi.intel.com>
References: <20210804140246.64856-1-andriy.shevchenko@linux.intel.com>
 <YQq1rzsupUSLYsEw@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQq1rzsupUSLYsEw@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 04, 2021 at 06:43:43PM +0300, Mika Westerberg wrote:
> On Wed, Aug 04, 2021 at 05:02:46PM +0300, Andy Shevchenko wrote:
> > The software mapping for GPIO, which initially comes from Microsoft,
> > is subject to change by respective Windows and firmware developers.
> > Due to above the driver had been written and published way ahead of
> > the schedule, and thus the numbering schema used in it is outdated.
> > 
> > Fix the numbering schema in accordance with the real products on market.
> > 
> > Fixes: 653d96455e1e ("pinctrl: tigerlake: Add support for Tiger Lake-H")
> > Reported-and-tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > Reported-by: Riccardo Mori <patacca@autistici.org>
> > Reported-and-tested-by: Lovesh <lovesh.bond@gmail.com>
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213463
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213579
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213857
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks Andy for taking care of this!
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


