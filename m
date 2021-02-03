Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878A2C43333
	for <linux-gpio@archiver.kernel.org>; Wed,  3 Feb 2021 11:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 465F764F99
	for <linux-gpio@archiver.kernel.org>; Wed,  3 Feb 2021 11:57:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbhBCL5T (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:57:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:4129 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233972AbhBCL5S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Feb 2021 06:57:18 -0500
IronPort-SDR: 9mDBfjbpN4hHX8yCzSjTgrlox1hK75R3nDOS/vl46poyv4I0xYbtMa2JghixilrasC6CwzEp+y
 p9FtbFe7tUeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="242539248"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="242539248"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:55:32 -0800
IronPort-SDR: J4LiDpMiqBngvDYi7kzzJwAShA/sl0y7VMFXFHMiq8AQjvqN9+M5xr4xGJxZ5IAhObF0zI5IE0
 T6L5zfwTFJUA==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="372354870"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:55:31 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l7Gkq-001cmd-8g; Wed, 03 Feb 2021 13:55:28 +0200
Date:   Wed, 3 Feb 2021 13:55:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1] gpio: msic: Drop driver from Makefile
Message-ID: <YBqPMMIHadSrwZce@smile.fi.intel.com>
References: <20210203112922.48629-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203112922.48629-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 03, 2021 at 01:29:22PM +0200, Andy Shevchenko wrote:
> Driver is gone, no need to keep a Makefile entry for it. Remove.

To be precise, this is coupled with my two PRs, one for removal of bunch of the
drivers (there is an immutable tag, I can apply it there and send a new PR,
though) and one with Intel GPIO drivers, however it's included in the latter.

TL;DR: it's harmless not to apply this one and basically sent to Hans as he
reported this.

-- 
With Best Regards,
Andy Shevchenko


