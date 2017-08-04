From: icenowy@aosc.io
Subject: Re: [linux-sunxi] [PATCH] pinctrl: sunxi: fix V3s pinctrl driver IRQ
 bank base
Date: Fri, 04 Aug 2017 11:48:25 +0800
Message-ID: <ee6eccabe2e9279278430013c943bbd9@aosc.io>
References: <20170801145416.61854-1-icenowy@aosc.io>
 <CAGb2v64BBJrr+yo-7n1DkZjYvdB2ws+0OHD_Dwt_MCS85-U19Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:60397 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751921AbdHDDs1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Aug 2017 23:48:27 -0400
In-Reply-To: <CAGb2v64BBJrr+yo-7n1DkZjYvdB2ws+0OHD_Dwt_MCS85-U19Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, linux-gpio@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

在 2017-08-04 10:23，Chen-Yu Tsai 写道：
> On Tue, Aug 1, 2017 at 10:54 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
>> The V3s pin controller doesn't have the bank 0 (starts at address
>> 0x200), which is like A33. However, this is not workarounded when
> 
>                                            was not worked around
> 
> "Work around" is a verb phrase. "Workaround" is a noun.
> 
>> developing the driver, which makes IRQ not working.
> 
>                                broke the IRQs.
> 
>> 
>> Fix the IRQ bank base.
>> 
>> Fixes: 56d9e4a76039 ("pinctrl: sunxi: add driver for V3s SoC")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> 
> Confirmed this is the same thing we saw on A33.
> The fix is the same.
> 
> Apart from the typo / grammar errors above,
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Should I send a v2 now to fix the language errors?

> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
