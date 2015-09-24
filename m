From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sort dt_params array in the same order as pin_config_param
Date: Thu, 24 Sep 2015 09:40:05 -0700
Message-ID: <CACRpkdYZ1sR-XiOdniK=gwJWP2kWh+JH0of_xaxJqcb2UJPkrg@mail.gmail.com>
References: <1442766419-3983-1-git-send-email-yamada.masahiro@socionext.com>
	<20150923043910.GB24668@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34422 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753169AbbIXQkG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 12:40:06 -0400
Received: by oiev17 with SMTP id v17so44391625oie.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2015 09:40:05 -0700 (PDT)
In-Reply-To: <20150923043910.GB24668@usrtlx11787.corpusers.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 22, 2015 at 9:39 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> On Sun 20 Sep 09:26 PDT 2015, Masahiro Yamada wrote:

>> +     { "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
>>       { "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
>>       { "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
>>       { "output-low", PIN_CONFIG_OUTPUT, 0, },
>>       { "output-high", PIN_CONFIG_OUTPUT, 1, },
>> -     { "slew-rate", PIN_CONFIG_SLEW_RATE, 0},
>
> I would like to see these alphabetically sorted instead and looking at
> most of the entries that's already the case.
>
> The order of the lists in this file the order doesn't matter, so that's
> easy. There's some potential implications of renumbering the enum, but I
> think it's worth keeping them sorted as well.

I agree. Dropping this for a better fix, patches accepted :)

Yours,
Linus Walleij
