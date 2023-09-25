Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7335CE7A81
	for <linux-gpio@archiver.kernel.org>; Mon, 25 Sep 2023 07:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjIYHbA (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 25 Sep 2023 03:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjIYHa7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2023 03:30:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC9FC2;
        Mon, 25 Sep 2023 00:30:53 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412119813"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="412119813"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 00:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="697891983"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="697891983"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 00:30:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qkg3I-00000000HOB-1tpD;
        Mon, 25 Sep 2023 10:30:44 +0300
Date:   Mon, 25 Sep 2023 10:30:44 +0300
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
Subject: Re: [PATCH RFC 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
Message-ID: <ZRE3JNVNqFN0knHl@smile.fi.intel.com>
References: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr>
 <20230924-pxa-gpio-v1-1-2805b87d8894@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230924-pxa-gpio-v1-1-2805b87d8894@skole.hr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 24, 2023 at 06:42:54PM +0200, Duje Mihanović wrote:
> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> a GPIO pin related to the USB host controller.
> 
> Convert this function to use the new GPIO descriptor interface.

...

> +	pxa_ohci->usb_host = gpiod_get(&pdev->dev, "usb-host", GPIOD_OUT_LOW);
> +	if (IS_ERR(pxa_ohci->usb_host)) {
> +		dev_warn(&pdev->dev, "failed to get USB host GPIO with %d\n",
> +				(int) pxa_ohci->usb_host);

Casting is no go in 99.9% cases in printf(), so use proper specifier.
Hint: Nice looking message can be obtained by using %pe.

> +		pxa_ohci->usb_host = NULL;

Instead, call for _optional() API.

> +	}

...

> +	if (pxa_ohci->usb_host)
> +		gpiod_put(pxa_ohci->usb_host);

Linus, Bart, do we have misdesigned _optinal() GPIO APIs?

In GPIOLIB=n, the above requires that redundant check. Shouldn't we replace
gpiod_put() stub to be simply no-op?

-- 
With Best Regards,
Andy Shevchenko


