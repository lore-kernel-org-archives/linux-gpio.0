Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2B3C4321E
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Nov 2022 13:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbiK2Nqk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 29 Nov 2022 08:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbiK2Nqi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 08:46:38 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A26729817;
        Tue, 29 Nov 2022 05:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669729597; x=1701265597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5zhqiG3Iey4Oa2iXxBIdMM0zcIErrnYKrqHVVGJDPzQ=;
  b=QerTa4/AuFVWCeeWkiFhaIoIdiegXha2qxg6Lm/nKr2mXKG2lZ/rdJHi
   t2BQqtrLmGLcjapaU3JLW0GhBkt8l8HucToCs3NCxiWZqpMzLSDZPho6I
   D1unBuBftxQEcj0EctkkzFY/wrep1uXjnIyklHFFKXrMGUjN/DpiLS13W
   P0mJAWchURPeumFHjK4YGA6S+fAgWYLeRniXyeJ4qbuRw9s/pQsyzE3mD
   ahR7qqKIY10YAKhbMqXg/r+9/fLhMPd07PJbtGykFpLc72V2wmTCsj0Ew
   2GRJj07mkNNZFPYWPDOVHZEPoZs5mo9OWJOrFb6M7gZ0WVaUmtXrG761Q
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="401400958"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="401400958"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 05:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="786043235"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="786043235"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2022 05:46:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p00wU-001iwO-0p;
        Tue, 29 Nov 2022 15:46:34 +0200
Date:   Tue, 29 Nov 2022 15:46:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpiolib: Provide to_gpio_device() helper
Message-ID: <Y4YNOd0pBUfqxvmC@smile.fi.intel.com>
References: <20221128190055.6350-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mcfy7HjA0DvFgkgJUZ8LVF4Nnrq39jDr82UUVQ6xsmH8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mcfy7HjA0DvFgkgJUZ8LVF4Nnrq39jDr82UUVQ6xsmH8w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 01:50:51PM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 28, 2022 at 8:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > While at it, make sure it becomes no-op at compilation time.

^^^

> > -       int                     id;
> 
> Sorry I didn't notice it before but why the churn? This is not needed
> for container_of to work.

> > +       int                     id;

I hope this explains and can be accepted.

> >  };

-- 
With Best Regards,
Andy Shevchenko


