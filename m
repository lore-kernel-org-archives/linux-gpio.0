Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A11BC4167B
	for <linux-gpio@archiver.kernel.org>; Tue, 20 Dec 2022 13:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbiLTNur (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 20 Dec 2022 08:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233589AbiLTNuq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Dec 2022 08:50:46 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D85F1;
        Tue, 20 Dec 2022 05:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671544244; x=1703080244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wjib8ns/iqIEa8ewCextKVFKt3nfpBnPjDdh5aIKA+U=;
  b=Zn2c36J8WzedY4fbBf1a4bamPRrUtWUSHZdxHJTLV6J2U2zWv+zolpb6
   ehm/B8Pvayf+IQJ5xFzQJPP76xkeO015olNmYPxazHj6laES7/9ORTmjy
   W36wiqx3HK3VHZ1ZCPp8vbq0ZZUUf7MSbZYzBemONkmueMooxhbINwNlr
   kjTFvUSwudOsmKkNBQVAIlQJdyak9MmdSJn+BU6UI5578CoB6MlyFp96Q
   xQ08Zx0ToX9TWlvQWNnlSsyyTlkoWWgaP1QXhQKvO1HkbP3QYhFbLACtu
   zVq5wpsvV+qrMbhK8h3X1jnjQOytBq+DXl309wwMLPr0Mp3NNJOGgEY3j
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="299957163"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="299957163"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 05:50:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="714437743"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="714437743"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 20 Dec 2022 05:50:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7d0z-00CtKF-0p;
        Tue, 20 Dec 2022 15:50:41 +0200
Date:   Tue, 20 Dec 2022 15:50:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] gpiolib: of: stop exporting of_gpio_named_count()
Message-ID: <Y6G9sOYhThlE3dGu@smile.fi.intel.com>
References: <20221219192016.1396950-1-dmitry.torokhov@gmail.com>
 <20221219192016.1396950-2-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219192016.1396950-2-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 19, 2022 at 11:20:13AM -0800, Dmitry Torokhov wrote:
> The only user of this function is gpiolib-of.c so move it there.

It's one liner used a single file, can we kill it completely?

-- 
With Best Regards,
Andy Shevchenko


