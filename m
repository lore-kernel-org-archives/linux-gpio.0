Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68A0C388F9
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 15:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E2CB206A1
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 15:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgKKPfp (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Nov 2020 10:35:45 -0500
Received: from mga14.intel.com ([192.55.52.115]:2299 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726136AbgKKPfp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:35:45 -0500
IronPort-SDR: SbTgUhncepkMKff9PAtfKWNfcQwLU95e1skXxBTV7eoxCX8x9MmWuErq1qkOdzUSFx5jY5Nd4K
 4h24Jr4cweYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169378876"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="169378876"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:35:23 -0800
IronPort-SDR: GNgav+ndGjE1Qk02+roDA1kBj9fpCBBICpDuzRJQw8HSrcTsvawmj9W62+Q/UYj44aO0ibE9zr
 M4IlYjVdONcw==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="356686531"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:35:21 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:35:19 +0200
Date:   Wed, 11 Nov 2020 17:35:19 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 07/17] gpiolib: Extract
 gpio_set_config_with_argument_optional() helper
Message-ID: <20201111153519.GD2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-8-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:22PM +0200, Andy Shevchenko wrote:
> This function is useful for internal use in GPIO library.
> There will be new user coming, prepare a helper for the new comer
> and the existing ones.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
