Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47905C433B4
	for <linux-gpio@archiver.kernel.org>; Thu, 20 May 2021 09:08:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23ED46100C
	for <linux-gpio@archiver.kernel.org>; Thu, 20 May 2021 09:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhETJJc (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 20 May 2021 05:09:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:64087 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231530AbhETJIn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 05:08:43 -0400
IronPort-SDR: /UgclSOAa38RgBfazjQVb5SZIEcAO5CSgMpFiu6mBBI+CdTk/o/GrJcYIiyNBy8pJLlByePh0S
 fQTk8sTKGUAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="198095667"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="198095667"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 02:07:22 -0700
IronPort-SDR: m0YAqiEEPxt+d5GLGRaCsBMkzyGMJCHrAHH4k7ZyMQdsF7fknL1mx0y+aWOZ+2FL63Al/OASMe
 88maRW6Xxc8w==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="475106838"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 02:07:20 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1ljeeD-00DRU2-Qp; Thu, 20 May 2021 12:07:17 +0300
Date:   Thu, 20 May 2021 12:07:17 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpiolib: Introduce for_each_gpio_desc_if() macro
Message-ID: <YKYmxTSgHor0N7+y@smile.fi.intel.com>
References: <20210518083339.23416-1-andriy.shevchenko@linux.intel.com>
 <YKYYp6Z4HAYHLaFz@hovoldconsulting.com>
 <CAHp75Vf_tQxPcRa_ObYngUFQqzFrx2RyUcqemyeHFDOD1XEnbQ@mail.gmail.com>
 <YKYe4rgGTDRfq+va@hovoldconsulting.com>
 <YKYl7kt5aGMAHUP9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKYl7kt5aGMAHUP9@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 12:03:42PM +0300, Andy Shevchenko wrote:
> On Thu, May 20, 2021 at 10:33:38AM +0200, Johan Hovold wrote:
> > On Thu, May 20, 2021 at 11:15:31AM +0300, Andy Shevchenko wrote:
> 
> > FWIW, NAK due to the non-descriptive for_each_desc_if() name.
> 
> I'm fine without this change, thanks for review!

That said, maybe in the future I will reconsider.

And feel free to amend by yourself, you can keep or drop my SoB,
I'm fine either way.

-- 
With Best Regards,
Andy Shevchenko


