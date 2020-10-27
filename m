Return-Path: <SRS0=684V=EC=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57138C4363A
	for <linux-gpio@archiver.kernel.org>; Tue, 27 Oct 2020 02:56:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27CD420872
	for <linux-gpio@archiver.kernel.org>; Tue, 27 Oct 2020 02:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408603AbgJ0C4H (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 26 Oct 2020 22:56:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:22507 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408598AbgJ0C4H (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Oct 2020 22:56:07 -0400
IronPort-SDR: mhoR0BKYR+6jfMmtwvkG66O91fNzwbBXlVuv1lQlDM+KFB+RJRDqmzzgV9BIjKKNnLMAG20YOB
 j2XeVdLerNaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="168118872"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; 
   d="scan'208";a="168118872"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2020 19:56:06 -0700
IronPort-SDR: TSUlX0LxhaXUnvlyhic0MIck67y+wTxq9GOExe0g6c4389gleiEianvJOIqKbajRcYtKNJI1P3
 DqvMs5iZ3GjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; 
   d="scan'208";a="424279164"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2020 19:56:06 -0700
Date:   Mon, 26 Oct 2020 19:57:50 -0700
From:   Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Add Intel Lakefield pin controller
 support
Message-ID: <20201027025750.GA7637@ranerica-svr.sc.intel.com>
References: <20201026192325.20813-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026192325.20813-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 09:23:25PM +0200, Andy Shevchenko wrote:
> This driver adds pinctrl/GPIO support for Intel Lakefield SoC. The
> GPIO controller is based on the next generation GPIO hardware but still
> compatible with the one supported by the Intel core pinctrl/GPIO driver.

Hi Andy,

Is there any tests I can run for this patch?

Thanks and BR,
Ricardo
