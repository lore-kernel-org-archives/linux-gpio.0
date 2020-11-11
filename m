Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6AEC55ABD
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 15:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07F6520791
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 15:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgKKPya (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Nov 2020 10:54:30 -0500
Received: from mga04.intel.com ([192.55.52.120]:18034 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727449AbgKKPy3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:54:29 -0500
IronPort-SDR: 69AShfiS3Tz3UcEVV/nPxn92Ma9/e27vc9Jo+SHnDMfenFcFRPEOuIM7twV1KYgSuWA7sjoDtt
 s+Uuk0Vzsy/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="167581781"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="167581781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:54:28 -0800
IronPort-SDR: uefCDuKHOtVTn9EpDMuGtCqzmuG4kS6bqpteGnjJ+I0zyFwiW2UOscFStMqTh3eyHbWcAyyi+A
 WGRXEo3+P+XQ==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="356692574"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:54:26 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:52:13 +0200
Date:   Wed, 11 Nov 2020 17:52:13 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 08/17] gpiolib: Extract gpio_set_debounce_timeout()
 for internal use
Message-ID: <20201111155213.GJ2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-9-andriy.shevchenko@linux.intel.com>
 <20201111153907.GE2495@lahna.fi.intel.com>
 <CAHp75VcfS7YDC=pEraqGaN1L4YT7EQEq6JHxMkq=Cz4PQPSkbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcfS7YDC=pEraqGaN1L4YT7EQEq6JHxMkq=Cz4PQPSkbQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 05:46:55PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 11, 2020 at 5:40 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Mon, Nov 09, 2020 at 10:53:23PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > Again I think mode variable is pretty useless here and does not improve
> > readability.
> 
> You mean something like
> 
>     return gpio_set_config_with_argument_optional(desc,
>                 PIN_CONFIG_INPUT_DEBOUNCE, debounce);
> 
> is better?

Yes.
