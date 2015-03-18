From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [STLinux Kernel] [PATCH 4/6] pinctrl: st: Supply a GPIO get_direction()
 call-back
Date: Wed, 18 Mar 2015 17:43:53 +0100
Message-ID: <5509AB49.8040806@st.com>
References: <1426675899-19882-1-git-send-email-lee.jones@linaro.org> <1426675899-19882-5-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:57281 "EHLO
	mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754099AbbCRQoZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 18 Mar 2015 12:44:25 -0400
In-Reply-To: <1426675899-19882-5-git-send-email-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: kernel@stlinux.com



On 03/18/2015 11:51 AM, Lee Jones wrote:
> ST's hardware differentiates between GPIO mode and Pinctrl alternate
> functions.  When a pin is in GPIO mode, there are dedicated registers
> to set and obtain direction status.  However, If a pin's alternate
> function is in use then the direction is set and status is derived
> from a bunch of syscon registers.  The issue is; until now there was
> a lack of parity between the two.
>
> For example:
>
> Catting the two following information sources could result in
> conflicting information (output has been snipped for simplicity):
>
>   $ cat /sys/kernel/debug/gpio
>    GPIOs 32-39, platform/961f080.pin-controller-sbc, PIO4:
>     gpio-33  (?                   ) out hi
>
>   $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
>    pin 33 (PIO4[1]):[OE:0,PU:0,OD:0]
>           [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:0]
>
> In this example GPIO-33 is a GPIO controlled LED, which is set for
> output, as you'd expect.  However, when the same information is
> drafted from Pinctrl, it clearly states that OE (Output Enable) is
> not set i.e. the pin is set for input.  This is because OE normally
> only represents alternate functions and has no bearing on how the
> pin operates when in Alt-0 (GPIO mode).
>
> This patch changes the current semantics and provides a parity link
> between the two subsystems.  The get_direction() call-back firstly
> determines which function a pin is operating in, then uses the
> appropriate helpers for that mode.
>
> Reported-by: Olivier Clergeaud <olivier.clergeaud@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-st.c | 31 ++++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
>

Acked-by: Maxime Coquelin <maxime.coquelin@st.com>

Thanks,
Maxime

