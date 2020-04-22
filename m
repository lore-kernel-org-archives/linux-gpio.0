Return-Path: <SRS0=CISC=6G=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9772C55185
	for <linux-gpio@archiver.kernel.org>; Wed, 22 Apr 2020 21:08:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8E7521569
	for <linux-gpio@archiver.kernel.org>; Wed, 22 Apr 2020 21:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgDVVIt (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 22 Apr 2020 17:08:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:24084 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbgDVVIt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 17:08:49 -0400
IronPort-SDR: cSkAKulplLEtMzhqI6RGvrYOY1YUT5tDHuVqKOMNDcI8BHLUBrQHlEdhr3AIneDCsbYh0Iw9mz
 wsJTcxWSXyLg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 14:08:48 -0700
IronPort-SDR: OR9zGtfyQpMcV4afdZVH3NnBLr3lk7xcncQE4cUHbgMbM+idqrkVVLGwx7GuDbpx41mMXv0KmV
 j65tepvaTZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; 
   d="scan'208";a="457280305"
Received: from jpilli-mobl.amr.corp.intel.com (HELO [10.254.51.39]) ([10.254.51.39])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2020 14:08:45 -0700
Subject: Re: [RFC PATCH 12/16] clk: hifiberry-dacpro: add ACPI support
To:     Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org
Cc:     Matthias Reichl <hias@horus.com>, tiwai@suse.de,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        linux-clk@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        broonie@kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com>
 <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
 <60402718-f36c-cab3-2766-9ae180dd7504@linux.intel.com>
 <158758876497.163502.13202465070681172627@swboyd.mtv.corp.google.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8054d4a1-8889-5ccf-a685-59fa16502822@linux.intel.com>
Date:   Wed, 22 Apr 2020 16:08:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158758876497.163502.13202465070681172627@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/22/20 3:52 PM, Stephen Boyd wrote:
> Quoting Pierre-Louis Bossart (2020-04-22 02:54:38)
>>
>>
>> On 4/22/20 4:32 AM, Stephen Boyd wrote:
>>> Quoting Pierre-Louis Bossart (2020-04-09 12:58:37)
>>>> On ACPI platforms the of_ functions are irrelevant, conditionally
>>>> compile them out and add devm_clk_hw_register_clkdev() call instead.
>>>>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>>    drivers/clk/clk-hifiberry-dacpro.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
>>>> index bf0616c959da..d01a90fed51b 100644
>>>> --- a/drivers/clk/clk-hifiberry-dacpro.c
>>>> +++ b/drivers/clk/clk-hifiberry-dacpro.c
>>>> @@ -114,15 +114,22 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
>>>>                   return ret;
>>>>           }
>>>>    
>>>> +#ifndef CONFIG_ACPI
>>>
>>> Use if (!IS_ENABLED(CONFIG_ACPI)) instead?
>>
>> git grep CONFIG_ACPI shows most of the kernel code uses #if(n)def
>> CONFIG_ACPI. It's equivalent, it's a boolean.
> 
> It's not equivalent. It is a pre-processor directive vs. an if statement
> that evaluates to 0 or 1 and lets the compiler see both sides of the
> code to check types.

Ah, yes I misunderstood your point.
