From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 6/6] pinctrl: st: Display pin's function when printing
 pinctrl debug information
Date: Wed, 25 Mar 2015 16:39:50 +0100
Message-ID: <CACRpkdazRxXZCwqfy-fSNCiDBt5pU+9G1f_J_s+16Mg16e+LGg@mail.gmail.com>
References: <1426699279-9258-1-git-send-email-lee.jones@linaro.org>
	<1426699279-9258-7-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36064 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753441AbbCYPjv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2015 11:39:51 -0400
Received: by obdfc2 with SMTP id fc2so22434784obd.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2015 08:39:50 -0700 (PDT)
In-Reply-To: <1426699279-9258-7-git-send-email-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel@stlinux.com

On Wed, Mar 18, 2015 at 6:21 PM, Lee Jones <lee.jones@linaro.org> wrote:

> Great for easily determining which mode a pin is operating in.
> This patch was particularly helpful when debugging a recent GPIO/
> Pinctrl disparity issue.
>
> Before:
>     $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
>       pin 33 (PIO4[1]):[OE:0,PU:0,OD:0]
>              [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:0]
>
> After [GPIO]:
>     $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
>       pin 33 (PIO4[1]):[OE:0,PU:0,OD:0] GPIO
>              [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:0]
>
> After [Alt]:
>     $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
>       pin 33 (PIO4[1]):[OE:0,PU:0,OD:0] Alt Fn 2
>              [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:0]
>
> Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied.

Yours,
Linus Walleij
