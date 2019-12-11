Return-Path: <SRS0=UY75=2B=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D54C43603
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Dec 2019 13:19:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D54F821556
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Dec 2019 13:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729438AbfLKNTq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Dec 2019 08:19:46 -0500
Received: from mga06.intel.com ([134.134.136.31]:51574 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729428AbfLKNTq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Dec 2019 08:19:46 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 05:19:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="220456848"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 11 Dec 2019 05:19:43 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Dec 2019 15:19:42 +0200
Date:   Wed, 11 Dec 2019 15:19:42 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 00/24] pinctrl: intel: Move Lynxpoint to pin control
 umbrella
Message-ID: <20191211131942.GR2110480@lahna.fi.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 09, 2019 at 03:09:02PM +0200, Andy Shevchenko wrote:
> Andy Shevchenko (24):
>   pinctrl: lynxpoint: Move GPIO driver to pin controller folder
>   pinctrl: lynxpoint: Use raw_spinlock for locking
>   pinctrl: lynxpoint: Correct amount of pins
>   pinctrl: lynxpoint: Drop useless assignment
>   pinctrl: lynxpoint: Use %pR to print IO resource
>   pinctrl: lynxpoint: Use standard pattern for memory allocation
>   pinctrl: lynxpoint: Assume 2 bits for mode selector
>   pinctrl: lynxpoint: Relax GPIO request rules
>   pinctrl: lynxpoint: Keep pointer to struct device instead of its
>     container
>   pinctrl: lynxpoint: Switch to memory mapped IO accessors
>   pinctrl: lynxpoint: Convert unsigned to unsigned int
>   pinctrl: lynxpoint: Extract lp_gpio_acpi_use() for future use
>   pinctrl: lynxpoint: Move ->remove closer to ->probe()
>   pinctrl: lynxpoint: Move lp_irq_type() closer to IRQ related routines
>   pinctrl: lynxpoint: Move ownership check to IRQ chip
>   pinctrl: lynxpoint: Implement ->irq_ack() callback
>   pinctrl: lynxpoint: Implement intel_gpio_get_direction callback
>   pinctrl: lynxpoint: Add pin control data structures
>   pinctrl: lynxpoint: Reuse struct intel_pinctrl in the driver
>   pinctrl: lynxpoint: Add pin control operations
>   pinctrl: lynxpoint: Implement ->pin_dbg_show()
>   pinctrl: lynxpoint: Add GPIO <-> pin mapping ranges via callback
>   pinctrl: lynxpoint: Switch to pin control API
>   pinctrl: lynxpoint: Update summary in the driver

Looks great to me! For the whole series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
