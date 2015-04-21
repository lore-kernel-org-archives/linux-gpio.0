From: Zhi Li <lznuaa@gmail.com>
Subject: Re: [PATCH v5 09/11] ARM: imx: add imx7d clk tree support
Date: Tue, 21 Apr 2015 15:39:38 -0500
Message-ID: <CAHrpEqTNNn1=g6X9-iYDmWdLp58SOYWMerccy-BR++E7TU4M-Q@mail.gmail.com>
References: <1429628007-8892-1-git-send-email-Frank.Li@freescale.com>
	<1429628007-8892-10-git-send-email-Frank.Li@freescale.com>
	<CAL_Jsq+V+q78e1QqtZJK2inCDv+rRjWnzcUgRKXComnJ2O3myg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:34392 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756374AbbDUUjl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2015 16:39:41 -0400
In-Reply-To: <CAL_Jsq+V+q78e1QqtZJK2inCDv+rRjWnzcUgRKXComnJ2O3myg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "Frank.Li@freescale.com" <Frank.Li@freescale.com>, Shawn Guo <shawn.guo@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anson Huang <b20788@freescale.com>, Adrian Alonso <aalonso@freescale.com>

On Tue, Apr 21, 2015 at 3:30 PM, Rob Herring <robherring2@gmail.com> wrote:
> On Tue, Apr 21, 2015 at 9:53 AM,  <Frank.Li@freescale.com> wrote:
>> From: Frank Li <Frank.Li@freescale.com>
>>
>> Add i.MX7D clk tree support.
>>
>> Enable all clock to bring up imx7.
>> Clock framework need be modified a little since imx7d
>> change clock design. otherwise system will halt and block the
>> other part upstream.
>>
>> All clock refine need wait for Dong Aisheng's patch
>> clk: support clocks which requires parent clock on during operation
>> Or other solution ready.
>>
>> Signed-off-by: Anson Huang <b20788@freescale.com>
>> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
>> Signed-off-by: Frank Li <Frank.Li@freescale.com>
>> ---
>>  arch/arm/mach-imx/clk-imx7d.c | 887 ++++++++++++++++++++++++++++++++++++++++++
>>  arch/arm/mach-imx/clk-pllv3.c |  16 +-
>>  arch/arm/mach-imx/clk.h       |   9 +
>>  3 files changed, 911 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/mach-imx/clk-imx7d.c
>
> Why is i.MX clock code not moved to drivers/clk?

Guo Shawn:
        what's plan clock code move to driver/clk?

Rob:
       It is not related i.mx7 bring up.
       There are many upstream work depend on this.
       we can work on code movement after that.
       Are you okay?

>
> Rob
