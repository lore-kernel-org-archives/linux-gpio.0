From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: fix debugfs entry for mcp23s18 =?iso-8859-1?Q?device?=
Date: Thu, 27 Sep 2018 12:54:26 +0200
Message-ID: <3cc5ba12-5296-4c80-8e54-eab13f43823a@cesnet.cz>
References: <20180925145616.12610-1-m.felsch@pengutronix.de>
 <20180925145616.12610-2-m.felsch@pengutronix.de>
 <02d7e7b6-6dd4-1f3d-eeaa-07e38b427428@electromag.com.au>
 <20180926094225.xpm4mkxlmkjg2d5x@pengutronix.de>
 <252ce4f2-ccd2-2983-0a28-103801eeb21c@electromag.com.au>
 <20180927085511.uarkv4kkou4crr3e@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180927085511.uarkv4kkou4crr3e@pengutronix.de>
Sender: stable-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Phil Reid <preid@electromag.com.au>, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On =C4=8Dtvrtek 27. z=C3=A1=C5=99=C3=AD 2018 10:55:11 CEST, Marco Felsch wrot=
e:
> Hi Phil,
>
> On 18-09-27 09:45, Phil Reid wrote:
>> On 26/09/2018 5:42 PM, Marco Felsch wrote:
>>> On 18-09-26 07:55, Phil Reid wrote: ...
>> G'day Marco,
>>=20
>> Sorry I still don't follow.
>> I've got a mcp23s18 in one of my systems and debugfs seems to work fine.
>>=20
>> one_regmap_config is only used for the S08/S17 to fiddle with=20
>> the name / label
>
> I know, but if I read the code correctly it shouldn't work, because in
> your case one_regmap_config is never modified, as you told. But it is
> initialized to NULL. This confuses me a bit.
>
> This tested should not be made for the MCP_TYPE_S18 case.

Ah, right. This means that the stable tree(s) need this follow-up patch=20
from February, too:

  https://patchwork.ozlabs.org/patch/875045/

Thanks for catching this.

With kind regards,
Jan
