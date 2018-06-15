From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: BUG: drivers/pinctrl/core: races in pinctrl_groups and deferred probing
Date: Fri, 15 Jun 2018 13:18:27 +0200
Message-ID: <029F115C-480E-485A-B547-9D5873925CEF@goldelico.com>
References: <F20BD6B3-D4D7-4D5D-B464-64402650BDE5@goldelico.com> <20180614120157.GE112168@atomide.com> <FC373DE9-6D6B-40C5-ACED-C07B1B524469@goldelico.com> <20180615065810.GI112168@atomide.com> <20180615111318.GJ112168@atomide.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180615111318.GJ112168@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@pyra-handheld.com
List-Id: linux-gpio@vger.kernel.org

Hi Tony,

> Am 15.06.2018 um 13:13 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Tony Lindgren <tony@atomide.com> [180615 07:00]:
>> * H. Nikolaus Schaller <hns@goldelico.com> [180614 12:15]:
>>> Hi Tony,
>>>=20
>>>> Am 14.06.2018 um 14:01 schrieb Tony Lindgren <tony@atomide.com>:
>>>>=20
>>>> * H. Nikolaus Schaller <hns@goldelico.com> [180613 12:41]:
>>>>>=20
>>>>> Now if I look into pinctrl_generic_add_group() and =
pinctrl_generic_get_group_name(),
>>>>> pctldev->num_groups++ is not protected if =
pinctrl_generic_add_group() may be called by
>>>>> two threads in parallel for the same pctldev. Hence a second =
thread may try to insert
>>>>> a different node into the radix tree at the same selector index. =
This fails but there
>>>>> is no error check - and the second entry is completely missing =
(but probably assumed to
>>>>> be there).
>>>>=20
>>>> Sounds like pinctrl-single.c is missing mutex around calls to
>>>> pinctrl_generic_add_group()?
>>>=20
>>> Yes, that could be. I didn't research the call path, just the one of
>>> devm_pinctrl_get(). That uses a mutex in
>>=20
>> In addition to missing mutex lock around the generic pinctrl =
functions
>> we also have racy helpers pinctrl_generic_remove_last_group() and
>> pinmux_generic_remove_last_function() like you pointed out. I'll post
>> a patch for you later on today to test.
>=20
> OK I posted a series to fix these issues hopefully as thread
> "[PATCH 0/5] pinctrl fixes for generic functions and groups".

Fine, I have located them.

>=20
> Can you please test and see if that is enough to fix the issues
> you're seeing?

Yes, I'll try asap.

BR and thanks,
Nikolaus
