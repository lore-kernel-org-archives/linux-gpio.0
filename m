Return-Path: <SRS0=VJ0G=3Y=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C25C35247
	for <linux-gpio@archiver.kernel.org>; Tue,  4 Feb 2020 17:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4ED021582
	for <linux-gpio@archiver.kernel.org>; Tue,  4 Feb 2020 17:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbgBDRSj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 4 Feb 2020 12:18:39 -0500
Received: from mga05.intel.com ([192.55.52.43]:17008 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727423AbgBDRSj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Feb 2020 12:18:39 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 09:18:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208";a="311107131"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2020 09:18:36 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1iz1qQ-0007tr-GL; Tue, 04 Feb 2020 19:18:38 +0200
Date:   Tue, 4 Feb 2020 19:18:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Avoid kernel.h inclusion
Message-ID: <20200204171838.GJ10400@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

I started cleaning up kernel.h mess and noticed that GPIO subsystem headers are
highly utilize kernel.h. Can we get rid of kernel.h inclusion in this cycle?

$ git grep -n -w '#include <linux/kernel.h>' -- include/ | grep gpio
include/asm-generic/gpio.h:5:#include <linux/kernel.h>
include/linux/gpio.h:102:#include <linux/kernel.h>
include/linux/gpio/consumer.h:7:#include <linux/kernel.h>
include/linux/of_gpio.h:14:#include <linux/kernel.h>

Currently, for example, I commented out log2.h and bitops.h in kernel.h (for testing purposes) and immediately got

include/linux/gpio/consumer.h:38:34: error: implicit declaration of function ‘BIT’ [-Werror=implicit-function-declaration]
   38 | #define GPIOD_FLAGS_BIT_DIR_SET  BIT(0)
      |                                  ^~~
...
include/linux/gpio/consumer.h:55:2: error: enumerator value for ‘GPIOD_OUT_HIGH_OPEN_DRAIN’ is not an integer constant
   55 |  GPIOD_OUT_HIGH_OPEN_DRAIN = GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_OPEN_DRAIN,
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~

Obviously consumer.h is user of bits.h.

-- 
With Best Regards,
Andy Shevchenko


