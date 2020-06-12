Return-Path: <SRS0=HMxX=7Z=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC302C433DF
	for <linux-gpio@archiver.kernel.org>; Fri, 12 Jun 2020 14:33:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A62C920835
	for <linux-gpio@archiver.kernel.org>; Fri, 12 Jun 2020 14:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgFLOdd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:33:33 -0400
Received: from mga14.intel.com ([192.55.52.115]:21300 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgFLOdd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:33:33 -0400
IronPort-SDR: e/42Ag8meYRYRaNACRRjFbfTPlQN1APOxdNyNEg1Of3yveQjP43SHgwCyVe/pe/Y+HEy5YnKo/
 ToXQUiB4QD5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:33:32 -0700
IronPort-SDR: n9JifMj9w2rN/H4cViNhicQDb52YQzv2rvj9ixl69gJOxu4E2L7RO+a3SeCmViVpUNixplq2gz
 zt6vrg9n6o6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="419480422"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 12 Jun 2020 07:33:31 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jjkkQ-00CdC2-A6; Fri, 12 Jun 2020 17:33:34 +0300
Date:   Fri, 12 Jun 2020 17:33:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 01/10] pinctrl: intel: Disable input and output buffer
 when switching to GPIO
Message-ID: <20200612143334.GI2428291@smile.fi.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 10, 2020 at 09:35:34PM +0300, Andy Shevchenko wrote:
> It's possible scenario that pin has been in different mode, while
> the respective GPIO register has a leftover output buffer enabled.
> In such case when we request GPIO it will switch to GPIO mode, and
> thus to output with unknown value, followed by switching to input
> mode. This can produce a glitch on the pin.
> 
> Disable input and output buffer when switching to GPIO to avoid
> potential glitches.

I'll send v2 soon with additional patches.

Also I move patch "Split intel_config_get() to three functions" closer to the
end where is seems more logical (continuation of which is IO protection).

-- 
With Best Regards,
Andy Shevchenko


