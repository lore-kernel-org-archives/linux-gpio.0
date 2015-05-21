From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RESEND PATCH 0/2] pinctrl: zynq: fix two bugs of zynq pinmux function
Date: Thu, 21 May 2015 23:31:54 +0900
Message-ID: <CAK7LNARutQyESi90faNUC0LvCQ3woS8wUvHLDw5emcBOza9eng@mail.gmail.com>
References: <1432111351-21336-1-git-send-email-yamada.masahiro@socionext.com>
	<20150520142358.GS31550@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg002.nifty.com ([202.248.44.40]:51135 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755501AbbEUOcH convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 21 May 2015 10:32:07 -0400
In-Reply-To: <20150520142358.GS31550@xsjsorenbubuntu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi S=C3=B6ren,


2015-05-20 23:23 GMT+09:00 S=C3=B6ren Brinkmann <soren.brinkmann@xilinx=
=2Ecom>:
> Hi Masahiro,
>
> On Wed, 2015-05-20 at 05:42PM +0900, Masahiro Yamada wrote:
>>
>> I sent the previous one to linux-serial by mistake.
>> I am resending to linux-gpio, dropping linux-serial.
>> Sorry for noise.
>>
>>
>>
>> Masahiro Yamada (2):
>>   pinctrl: zynq: fix DEFINE_ZYNQ_PINMUX_FUNCTION_MUX macro
>>   pinctrl: zynq: fix offset address for {SD0,SD1}_WP_CD_SEL
>
> For the series:
> Reviewed-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>
> I'm not sure how severe the impact of these bugs is. It looks like th=
e
> the current driver could corrupt the register for MIO pin0, am I righ=
t?

Right.
DEFINE_ZYNQ_PINMUX_FUNCTION_MUX() is missing the .mux
so it is always set to zero, i.e. MIO pin0 register is corrupted.


> It may be a good ides to add
>   Fixes: add958cee967 "pinctrl: Add driver for Zynq"
> (I suspect that bug is there from the beginning) and ask Linus to
> consider this for stable.

Yes, looks like these two bugs have been there
since the introduction of this driver.

=46or the series,
=46ixes: add958cee967 (pinctrl: Add driver for Zynq)

Linus,
Could you consider this series for stable and linux-4.1, please?


--=20
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
