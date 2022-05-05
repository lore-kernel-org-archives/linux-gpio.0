Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503B3C433EF
	for <linux-gpio@archiver.kernel.org>; Thu,  5 May 2022 11:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347088AbiEELP4 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 5 May 2022 07:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232536AbiEELP4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 07:15:56 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5CB49F81
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651749136; x=1683285136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PelIxqYt8Qt0TqIos5LUYS6jcYjMB6QK7bDTKDaQrN8=;
  b=gtgnSw63QqHhccSGMw/kQdOzcOdlqUnhdSVTiiYDeM7KkvVtUGUZ8RRU
   nY2xa1f72+fQFPrgLjfo5FQ84uckrtBirFHVir9tIhO/1Kze444HJIZyg
   GOab0xVR2SA+GR4Lh15tloibBf8rhm6y1nk5Euhbf6OhZCbb0zALFOba2
   +BiU7BEAvemRjZZEU4hTx4HkgKMt3RpdkI2wjy8JD7gmHAk1qr+J2HaVM
   RBE6jZ9gu+zEI0KMcUhYa6oFeQhQN+exem1iKiPRho2wtdU1LMbMHOMxq
   NDXKHVcUX0InU+AZtRq+vkZ/kQ6D+I3wPSV5GxghNbq6zVvJX+EYVfK5J
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="248612612"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="248612612"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 04:12:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="549306828"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 04:12:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nmZP0-00CFpv-9r;
        Thu, 05 May 2022 14:12:10 +0300
Date:   Thu, 5 May 2022 14:12:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [GIT PULL] intel-gpio for 5.19-1
Message-ID: <YnOxCeKibrULL/69@smile.fi.intel.com>
References: <YmwuK60FMGR2Kn0R@smile.fi.intel.com>
 <CACRpkdYB3NSNuzh9JTBjWQDHoTn=v9WBBS-rfrOMH8RPL8NRLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYB3NSNuzh9JTBjWQDHoTn=v9WBBS-rfrOMH8RPL8NRLA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 04, 2022 at 11:17:08PM +0200, Linus Walleij wrote:
> On Fri, Apr 29, 2022 at 8:28 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Supposed to be an immutable tag to be included in GPIO and pin control subsystems.
> > Have been in Linux Next for a while w.o. any issues reported. Please, pull.
> 
> Pulled into pinctrl as well, resolved the conflict by selecting your
> version of the code in the stm32 driver. Please check the result!

Seems you need to add some pieces of code (one as far as I found, but I might
miss more). I think the resolution Stephen Rothwell made is correct, but not
yours.

-- 
With Best Regards,
Andy Shevchenko


