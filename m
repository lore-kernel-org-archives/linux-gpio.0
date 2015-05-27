From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: zynq: change error code for pinctrl_register failure
Date: Wed, 27 May 2015 10:18:27 +0900
Message-ID: <CAK7LNATGJRuk+VDMg0pcD7Mi79vkzXJZVU8c6zeAf2w=z2X9tQ@mail.gmail.com>
References: <1432613909-13457-1-git-send-email-yamada.masahiro@socionext.com>
	<4437293.G26yCXqFQH@wuerfel>
	<20150526183734.GA31081@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg001.nifty.com ([202.248.44.39]:32205 "EHLO
	conssluserg001-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751331AbbE0BS5 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 May 2015 21:18:57 -0400
In-Reply-To: <20150526183734.GA31081@xsjsorenbubuntu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi S=C3=B6ren,

2015-05-27 3:37 GMT+09:00 S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.=
com>:
> On Tue, 2015-05-26 at 10:12AM +0200, Arnd Bergmann wrote:
>> On Tuesday 26 May 2015 13:18:29 Masahiro Yamada wrote:
>> > diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinc=
trl-zynq.c
>> > index 04748a4..0ff653c 100644
>> > --- a/drivers/pinctrl/pinctrl-zynq.c
>> > +++ b/drivers/pinctrl/pinctrl-zynq.c
>> > @@ -1141,7 +1141,7 @@ static int zynq_pinctrl_probe(struct platfor=
m_device *pdev)
>> >
>> >         pctrl->pctrl =3D pinctrl_register(&zynq_desc, &pdev->dev, =
pctrl);
>> >         if (!pctrl->pctrl)
>> > -               return -ENOMEM;
>> > +               return -EINVAL;
>> >
>> >         platform_set_drvdata(pdev, pctrl);
>> >
>> >
>>
>> One choice seems as bad as the other to me ;-)
>>
>> Could we add a pinctrl_register_reason() variant that returns a mean=
ingful
>> error code as ERR_PTR?
>
> I agree with Arnd. As long as we don't get a precise error code we ca=
n
> just keep the current one.

OK. Let's not do this way.


I will try pinctrl_register_reason().



--=20
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
