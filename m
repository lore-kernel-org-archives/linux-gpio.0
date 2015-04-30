From: Zhi Li <lznuaa@gmail.com>
Subject: Re: [PATCH V7 04/10] ARM: dts: add imx7d soc dtsi file
Date: Thu, 30 Apr 2015 13:25:05 -0500
Message-ID: <CAHrpEqRn-KWVzBaY1OtcLHivPVp-17Vw7qZaCzGts52_rv1eug@mail.gmail.com>
References: <1430317210-18333-1-git-send-email-Frank.Li@freescale.com>
	<1430317210-18333-5-git-send-email-Frank.Li@freescale.com>
	<CAOMZO5C2ye2GHi_CxFd_AKuK1k3okBBVgNoXN_31hjeCuzdXpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34229 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072AbbD3SZG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Apr 2015 14:25:06 -0400
In-Reply-To: <CAOMZO5C2ye2GHi_CxFd_AKuK1k3okBBVgNoXN_31hjeCuzdXpA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@freescale.com>, Shawn Guo <shawn.guo@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anson Huang <b20788@freescale.com>

On Thu, Apr 30, 2015 at 1:07 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Frank,
>
> On Wed, Apr 29, 2015 at 11:20 AM,  <Frank.Li@freescale.com> wrote:
>
>> +       cpus {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               cpu0: cpu@0 {
>> +                       compatible = "arm,cortex-a7";
>> +                       device_type = "cpu";
>> +                       reg = <0>;
>> +                       operating-points = <
>> +                               /* KHz  uV */
>> +                               996000  1075000
>> +                               792000  975000
>> +                       >;
>> +                       clock-latency = <61036>; /* two CLK32 periods */
>> +                       clocks = <&clks IMX7D_ARM_A7_ROOT_CLK>, <&clks IMX7D_ARM_A7_ROOT_SRC>,
>> +                                <&clks IMX7D_PLL_ARM_MAIN_CLK>, <&clks IMX7D_PLL_SYS_MAIN_CLK>;
>> +                       clock-names = "arm", "arm_root_src", "pll_arm", "pll_sys_main";
>> +               };
>> +       };
>
> That's a dual core, so you also need to pass cpu1 ;-)

SMP is not enabled yet.
cpu1 will be added when enable SMP.
I am working on that.

best regards
Frank Li
