Return-Path: <SRS0=1XHY=56=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30682C352BE
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Apr 2020 18:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 180EB2078A
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Apr 2020 18:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503752AbgDNSRT (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:17:19 -0400
Received: from mga17.intel.com ([192.55.52.151]:37771 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503741AbgDNSRL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 14:17:11 -0400
IronPort-SDR: 16qFBveKeKa3jbg4+fA6HAFCWRnM/jjVV7cMxrGSWnO4nifg8puS9cxuaMuQUSppVGYDIbKHL5
 xOK1xwWbX52Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 11:17:10 -0700
IronPort-SDR: uPqKRcefbvc94/62dOljXtXTMc0Y58mmAdW6Vaerzb18DgsEhoTWXhjtc3bmuyN7uJgfQxZ9OP
 8UJzIYsP7Evw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="253272959"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:17:05 -0700
Subject: Re: [RFC PATCH 07/16] clk: hifiberry-dacpro: initial import
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org, tiwai@suse.de,
        DigitalDreamtime <clive.messer@digitaldreamtime.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Hui Wang <hui.wang@canonical.com>,
        Matthias Reichl <hias@horus.com>, broonie@kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-8-pierre-louis.bossart@linux.intel.com>
 <20200414173110.GG34613@smile.fi.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1483c322-66b9-d68e-c8e9-81f826b01108@linux.intel.com>
Date:   Tue, 14 Apr 2020 13:09:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414173110.GG34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/14/20 12:31 PM, Andy Shevchenko wrote:
> On Thu, Apr 09, 2020 at 02:58:32PM -0500, Pierre-Louis Bossart wrote:
>> From: Daniel Matuschek <daniel@hifiberry.com>
>>
>> This patch imports the clock code from the Raspberry v5.5-y tree. The
>> ASoC machine driver initially present in this patch was dropped. The
>> comments are also dropped but all sign-offs are kept below. The patch
>> authorship was modified with explicit permission from Daniel Matuschek
>> to make sure it matches the Signed-off tag.
>>
>> This patch generates a lot of checkpatch.pl warnings that are
>> corrected in follow-up patches.
> 
> I guess it will be waste of time to review this part without squashing it first.

I wasn't sure if squashing was desired, so kept all my changes separate. 
There are some changes from the legacy clk to the clk_hw parts plus 
introduction of ACPI support that are easier to review if kept separate. 
Maybe I should have squashed the cosmetic parts in patch8, and kept the 
functional changes as separate patches.
