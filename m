Return-Path: <SRS0=1XHY=56=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FF4C352BE
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Apr 2020 18:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACEDB20774
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Apr 2020 18:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503747AbgDNSRH (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:17:07 -0400
Received: from mga11.intel.com ([192.55.52.93]:39813 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503741AbgDNSRF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 14:17:05 -0400
IronPort-SDR: 6ceffJvKuuEqWJwBNiFHtJbi8lxdxraQCMEwCeBpaRfdMJTpu2v+IXTb3+ufX+J3H4r+6AEdCj
 YmQb7VrOi16w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 11:17:04 -0700
IronPort-SDR: 425xsj/me+Mu6KoRt4fmVvOx1tDcYvRrrY3jMhJI3+ahp/vk1Nz3R6YgMJAcUuVTc1v1tVNijn
 4HDs1NURcHXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="253272934"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:16:58 -0700
Subject: Re: [RFC PATCH 05/16] ASoC: Intel: sof-pcm512x: reconfigure sclk in
 hw_params if needed
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-6-pierre-louis.bossart@linux.intel.com>
 <20200414172459.GE34613@smile.fi.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d7817bad-eae5-a2e9-ef3b-240419e5f285@linux.intel.com>
Date:   Tue, 14 Apr 2020 13:06:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414172459.GE34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


>> +	err = snd_interval_ratnum(hw_param_interval(params,
>> +						    SNDRV_PCM_HW_PARAM_RATE),
>> +				  1, &rats_no_pll, &num, &den);
> 
>> +	if (err >= 0 && den) {
> 
> Perhaps usual pattern, i.e.
> 
> 	if (err < 0 || !den)
> 		return 0;
> (so, above seems optional configuration)
> 
> 	params...;
> 	return 0;

ok

> 
>> +	if (ctx->is_dac_pro) {
> 
> 	if (!...)
> 		return 0;
> 
> ...and drop the redundant ret assignment above.

yes, this was suggested by Guennadi today as well.


>> +		ret = aif1_update_rate_den(substream, params);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to update rate denominator: %d\n", ret);
>> +			return ret;
>> +		}
> 
> Do you still need below steps when current_rate == sclk_rate?

Good question. I assume the values are properly stored by the regmap 
cache, but if these channel and width do change (something we don't 
support for now) then yes we should move this out of the if case.

I'll give it a try, thanks for flagging this.

>> +		ret = snd_soc_dai_set_bclk_ratio(rtd->codec_dai,
>> +						 channels * width);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to set bclk ratio : %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
> 
