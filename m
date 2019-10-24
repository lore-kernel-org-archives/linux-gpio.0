Return-Path: <SRS0=SOgY=YR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2543DCA9EAF
	for <linux-gpio@archiver.kernel.org>; Thu, 24 Oct 2019 08:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE2DA20684
	for <linux-gpio@archiver.kernel.org>; Thu, 24 Oct 2019 08:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438009AbfJXIHR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 24 Oct 2019 04:07:17 -0400
Received: from mga01.intel.com ([192.55.52.88]:2177 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfJXIHR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Oct 2019 04:07:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 01:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="210101915"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 24 Oct 2019 01:07:14 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 24 Oct 2019 11:07:13 +0300
Date:   Thu, 24 Oct 2019 11:07:13 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: cherryview: Fix spelling mistake in the
 comment
Message-ID: <20191024080713.GO2819@lahna.fi.intel.com>
References: <20191023133203.61681-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023133203.61681-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 23, 2019 at 04:32:03PM +0300, Andy Shevchenko wrote:
> One spelling mistake is being fixed: benerate -> generate.
> It is a complimentary fix to the commit 505485a83c55 ("pinctrl:
> cherryview fixed typo in comment").
> 
> Fixes: 47c950d10202 ("pinctrl: cherryview: Do not add all southwest and north GPIOs to IRQ domain")

I don't think fixes tag is needed for trivial typo fixes like this.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
