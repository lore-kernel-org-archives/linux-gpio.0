Return-Path: <SRS0=9k7y=DP=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0827BC04EBE
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 13:41:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B95CA20754
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 13:41:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbgJHNle (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Oct 2020 09:41:34 -0400
Received: from mga04.intel.com ([192.55.52.120]:24323 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbgJHNle (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Oct 2020 09:41:34 -0400
IronPort-SDR: /9nzkRbPkDmRtVKbnUHiKEKXdKTKX1jZWlBGHLdtUfGuJklSxI5Tvdet/L9kwoVZ2AFKyR02VC
 beqE98W6SGUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="162697016"
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="162697016"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 06:41:34 -0700
IronPort-SDR: 0t66SQN1qdTKXrvZJ3SS+3Zhd0qbsmEfLwnPqhitSR8iXxCmxgzo7DsbxizPMYOfZDxVM/UUai
 EReIzn5ZX2Zg==
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="316685507"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 06:41:32 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kQWBn-001poj-Mn; Thu, 08 Oct 2020 16:42:35 +0300
Date:   Thu, 8 Oct 2020 16:42:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v1] gpiolib: Switch to use
 compat_need_64bit_alignment_fixup() helper
Message-ID: <20201008134235.GN4077@smile.fi.intel.com>
References: <20201008132217.45037-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008132217.45037-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 08, 2020 at 04:22:17PM +0300, Andy Shevchenko wrote:
> The new compat_need_64bit_alignment_fixup() helper allows to avoid
> ugly ifdefferu in IOCTL compatible code. Use it in GPIO cdev code.

There is v2 coming, don't consider this, thanks!

-- 
With Best Regards,
Andy Shevchenko


