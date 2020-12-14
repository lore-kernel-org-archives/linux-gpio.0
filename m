Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206F1C4361B
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Dec 2020 16:58:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF55321973
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Dec 2020 16:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440306AbgLNQ6B (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Dec 2020 11:58:01 -0500
Received: from mga14.intel.com ([192.55.52.115]:14965 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440300AbgLNQ55 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 11:57:57 -0500
IronPort-SDR: x2UQEb7M+ZP4lbp/4DHaH/nei9JezjfQqaFQt6ryMqQSeASSdFU+Pgt+GQbt3BtEHFyOcoLO22
 TqQ8iKBIxy6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="173967774"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="173967774"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 08:57:12 -0800
IronPort-SDR: 6dXxWlnifv+3eZkexCj3YWDnPbVEyZG8PGkI0NnKgPtyKCBObLkaoMXRGQ/PCgDubE1FalARvB
 FSKNYJM2tDHQ==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="449085959"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 08:57:10 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1korAq-00EJQn-N2; Mon, 14 Dec 2020 18:58:12 +0200
Date:   Mon, 14 Dec 2020 18:58:12 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Luo Jiaxing <luojiaxing@huawei.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Garry <john.garry@huawei.com>,
        Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH v2 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
Message-ID: <20201214165812.GL4077@smile.fi.intel.com>
References: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com>
 <1607934255-52544-2-git-send-email-luojiaxing@huawei.com>
 <CACRpkdZSQSCO3dWcjUZtUMDK+Jjdnc9ORxpR9qiopgMk-o=Ryg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZSQSCO3dWcjUZtUMDK+Jjdnc9ORxpR9qiopgMk-o=Ryg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 10:11:23AM +0100, Linus Walleij wrote:
> On Mon, Dec 14, 2020 at 9:24 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:
> 
> > This GPIO driver is for HiSilicon's ARM SoC.
> 
> Patch applied, any further issues can certainly be fixed in-tree.

I just sent two :-)

-- 
With Best Regards,
Andy Shevchenko


