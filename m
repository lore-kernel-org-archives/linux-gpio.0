Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D3BC83F2C
	for <linux-gpio@archiver.kernel.org>; Mon,  4 Sep 2023 09:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237873AbjIDJ1h (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 4 Sep 2023 05:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjIDJ1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Sep 2023 05:27:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A374CC;
        Mon,  4 Sep 2023 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693819654; x=1725355654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A2Mk9hIdKWuH6bu7hrDUpQdb7I2+RIdr2oM7KHbmz2s=;
  b=YGzun/YVFGUfEbs+SA4UPulC/Qgv2srKu7QaxqkelyLeN0XQsLsi6DkE
   lu2X8dBsfVx8ngpiVyclQa5DSqzRBZzPZ8qB1q3QF4TyBqBAZyOw8Mvin
   0DlGgYsy23F2MgmRQEjaiR9qCnNYy0eoHw130My9iF7tFujwv24drxFw0
   mTSS3nvKXXeaPlsFFEolJGJheiyQsfmwCsmPweAWgtZ4YW2gSRFUTEbYr
   VZ+bSulwym5pytQhL39Oit0f3O5sqMfeRlP6OqvyYYafAayQzhHwMhFXB
   YrPHpDEYU73R2xmB8ci1B/gNTvNBI5qKMvK58YZAbPg7SdXAwbxORu2Yn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442956234"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="442956234"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="690523503"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="690523503"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:27:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qd5rl-006Nyy-2T;
        Mon, 04 Sep 2023 12:27:29 +0300
Date:   Mon, 4 Sep 2023 12:27:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpiolib: rename gpio_chip_hwgpio() for consistency
Message-ID: <ZPWjAUzqeAwF1wro@smile.fi.intel.com>
References: <20230904073410.5880-1-brgl@bgdev.pl>
 <20230904073410.5880-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904073410.5880-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 04, 2023 at 09:34:10AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> All other functions that manipulate a struct gpio_desc use the gpiod_
> prefix. Follow this convention and rename gpio_chip_hwgpio() to
> gpiod_get_hwgpio().

Same comment. Also, I don't think it's good idea as it steps on the exported
API's toes. I.o.w. I won't mix those two.

-- 
With Best Regards,
Andy Shevchenko


