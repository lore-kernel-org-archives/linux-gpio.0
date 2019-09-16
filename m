Return-Path: <SRS0=Xyda=XL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D4EC4CECD
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Sep 2019 16:05:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E176F21881
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Sep 2019 16:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389557AbfIPQFX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 16 Sep 2019 12:05:23 -0400
Received: from mga12.intel.com ([192.55.52.136]:38885 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728709AbfIPQFW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Sep 2019 12:05:22 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 09:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; 
   d="scan'208";a="201621679"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 16 Sep 2019 09:05:19 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 16 Sep 2019 19:05:18 +0300
Date:   Mon, 16 Sep 2019 19:05:18 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Federico Ricchiuto <fed.ricchiuto@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Allocate IRQ chip dynamic
Message-ID: <20190916160518.GE28281@lahna.fi.intel.com>
References: <20190916154749.GD28281@lahna.fi.intel.com>
 <660ECFA3-BF3C-4AC2-AF76-7AA7200CD96D@getmailspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <660ECFA3-BF3C-4AC2-AF76-7AA7200CD96D@getmailspring.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 16, 2019 at 05:56:55PM +0200, Federico Ricchiuto wrote:
>    Okay.. I've just checked the repository, even on "fixes" branch but I
>    see that the last change was 7 days ago, am I looking in the wrong
>    place?

I mean I will apply the patch there once you have verified that it fixes
the issue :)

If you want to try the patch out, one way is to save it to a file using
your mail client and then run "git am" against the resulting file. Then
rebuild, intall, reboot and see if the warning still persists.
