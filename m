Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A674EC2D0A3
	for <linux-gpio@archiver.kernel.org>; Thu, 12 Nov 2020 08:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2025F221FB
	for <linux-gpio@archiver.kernel.org>; Thu, 12 Nov 2020 08:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgKLIA6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 12 Nov 2020 03:00:58 -0500
Received: from mga07.intel.com ([134.134.136.100]:21655 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725983AbgKLIA4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 03:00:56 -0500
IronPort-SDR: BrGybaby+9YAaITAkBEmzRr77gdnsSTRpIS6XN8QZBiHkxywaw/ViEb1MAeMoWtEivQbaw6bvs
 jAzaXZA9XbzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="234437474"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="234437474"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:00:56 -0800
IronPort-SDR: +tYIpFga7sZcPhAzkJ7JJL7n4FvBr+kz9RgPpc9tY4cD18CqhkCJaBRUTYPO+z7fk1eCfMsI0x
 HubprlTE9tHQ==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="542162386"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:00:54 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 12 Nov 2020 10:00:51 +0200
Date:   Thu, 12 Nov 2020 10:00:51 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/2] pinctrl: lynxpoint: Enable pin configuration
 setting for GPIO chip
Message-ID: <20201112080051.GS2495@lahna.fi.intel.com>
References: <20201111113432.35641-1-andriy.shevchenko@linux.intel.com>
 <20201111113432.35641-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111113432.35641-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 01:34:32PM +0200, Andy Shevchenko wrote:
> It appears that pin configuration for GPIO chip hasn't been enabled yet
> due to absence of ->set_config() callback.
> 
> Enable it here for Intel Lynxpoint PCH.
> 
> Depends-on: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
