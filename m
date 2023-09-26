Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F7DE7E64A
	for <linux-gpio@archiver.kernel.org>; Tue, 26 Sep 2023 16:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbjIZQPx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 26 Sep 2023 12:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235152AbjIZQPw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 12:15:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0EFAF;
        Tue, 26 Sep 2023 09:15:45 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384385545"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="384385545"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 09:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819081097"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="819081097"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 09:15:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qlAio-00000000eyB-14fX;
        Tue, 26 Sep 2023 19:15:38 +0300
Date:   Tue, 26 Sep 2023 19:15:37 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/6] ARM: pxa: Convert Spitz CF power control to
 GPIO descriptors
Message-ID: <ZRMDqVCtrUyhcqaw@smile.fi.intel.com>
References: <20230926-pxa-gpio-v2-0-984464d165dd@skole.hr>
 <20230926-pxa-gpio-v2-3-984464d165dd@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926-pxa-gpio-v2-3-984464d165dd@skole.hr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2023 at 05:46:24PM +0200, Duje Mihanović wrote:
> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> the power supply to its CF and SD card slots.
> 
> Convert it to use the GPIO descriptor interface.

...

> +	cf_power = gpiod_get(&pxa_device_mci.dev, "cf_power", GPIOD_ASIS);
> +	if (IS_ERR(cf_power)) {
> +		dev_err(&pxa_device_mci.dev,
> +				"failed to get power control GPIO with %ld\n",
> +				PTR_ERR(cf_power));
> +		return;
> +	}

> +	gpiod_put(cf_power);

Don't you want to use guarded gpiod_get()?
Okay, it seems not yet in the pending list, but we can survive without that.

-- 
With Best Regards,
Andy Shevchenko


