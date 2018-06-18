From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Letux-kernel] BUG: drivers/pinctrl/core: races in pinctrl_groups and deferred probing
Date: Mon, 18 Jun 2018 11:29:30 +0200
Message-ID: <BB5DB278-9827-4351-99DF-54C875B1879F@goldelico.com>
References: <F20BD6B3-D4D7-4D5D-B464-64402650BDE5@goldelico.com> <20180614120157.GE112168@atomide.com> <FC373DE9-6D6B-40C5-ACED-C07B1B524469@goldelico.com> <20180615065810.GI112168@atomide.com> <20180615111318.GJ112168@atomide.com> <029F115C-480E-485A-B547-9D5873925CEF@goldelico.com> <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com> <CAHp75Vf7-xcsoSJ--9nJYbxpwSfDv201UwnxJHoFbwtD187SPw@mail.gmail.com> <20180618091433.GP112168@atomide.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618091433.GP112168@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@pyra-handheld.com, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: linux-gpio@vger.kernel.org


> Am 18.06.2018 um 11:14 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Andy Shevchenko <andy.shevchenko@gmail.com> [180618 08:25]:
>> On Sat, Jun 16, 2018 at 2:08 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>> But it looks as if we still have duplicate assignments by deferred =
probing, i.e. some cleanup is
>>> missing (or is this intended behaviour?).
>>=20
>>> But I think the fundamental problem is that the same driver assigns =
multiple slots if
>>> probing is deferred.
>>=20
>> Indeed.
>>=20
>> I think there is a simple way to clean up pinctrl stuff on failed =
probe. See
>> =
https://elixir.bootlin.com/linux/v4.18-rc1/source/drivers/base/dd.c#L416
>>=20
>> We only bind pins, and do not perform any actions when failure =
happens later on.
>=20
> Yup seems like a good approach. I'll take a look if we can just
> check if the function or group name already exists and return
> the existing selector in that case.

Ok, that would also solve the duplication issue.

On the other hand we still have a stale entry if the probing process
finally fails after several attempts.

This may happen if a driver with a valid DT entry is blacklisted in
/etc/modprobe.d/blacklist.conf. Then, the kernel will try to modprobe
it several times through udev until it gives up. The reason seems to
be that the deferred probing thread does not know why the driver did
not probe successfully.

BR and thanks,
Nikolaus

>=20
> Regards,
>=20
> Tony
