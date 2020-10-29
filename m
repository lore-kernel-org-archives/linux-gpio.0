Return-Path: <SRS0=Je6w=EE=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B11C2D0A3
	for <linux-gpio@archiver.kernel.org>; Thu, 29 Oct 2020 13:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 842A12075E
	for <linux-gpio@archiver.kernel.org>; Thu, 29 Oct 2020 13:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgJ2NO6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 29 Oct 2020 09:14:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:47336 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgJ2NO6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 09:14:58 -0400
IronPort-SDR: Q3Lxpy1F7SQp/PE730JATaUhvSxex6dEU9JdQF2+p4mztulT6QabDYKbuF3d+txgTqaz8++Uny
 BPuEnmkK+4QA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168528038"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="168528038"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 06:14:50 -0700
IronPort-SDR: SoBrt2GNeG4Vl07TXdhHIST+6z9v3ULt7XGZ3dcLmYgn/XVbWP6gnlYrBvCrJCSGRFFXfA/73R
 7SFiAM92KvXQ==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="536666532"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 06:14:48 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 29 Oct 2020 15:14:45 +0200
Date:   Thu, 29 Oct 2020 15:14:45 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Add blank line before endif in Kconfig
Message-ID: <20201029131445.GW2495@lahna.fi.intel.com>
References: <20201029111728.70196-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029111728.70196-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 01:17:28PM +0200, Andy Shevchenko wrote:
> Add a blank line before endif directive in Kconfig for better readability.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
