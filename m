From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Letux-kernel] BUG: drivers/pinctrl/core: races in pinctrl_groups and deferred probing
Date: Tue, 19 Jun 2018 06:51:31 +0200
Message-ID: <631A1D2F-093A-498F-8923-FC9CD20E11A8@goldelico.com>
References: <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com> <CAHp75Vf7-xcsoSJ--9nJYbxpwSfDv201UwnxJHoFbwtD187SPw@mail.gmail.com> <20180618091433.GP112168@atomide.com> <BB5DB278-9827-4351-99DF-54C875B1879F@goldelico.com> <20180618095428.GQ112168@atomide.com> <CA+Ot1OxNj30KgHWJHXgWbnXYkNXTNvd_t-b6+uG3u=z8+pZf2Q@mail.gmail.com> <20180618115122.GT26255@atomide.com> <CDD8B994-59E9-42DC-A77D-AF4F35EBF101@goldelico.com> <20180618181744.GS112168@atomide.com> <404C63D9-169E-4051-88E0-2856F3602A72@goldelico.com> <20180619043408.GT112168@atomide.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619043408.GT112168@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Christ van Willegen <cvwillegen@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel@pyra-handheld.com, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: linux-gpio@vger.kernel.org

Hi Tony,

> Am 19.06.2018 um 06:34 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [180618 18:33]:
>>>> So code just needs group cleanup on failed probing and fixing the =
mutex around pinctrl_generic_add_group().
>>>>=20
>>>> I think we need the mutex because a race still can happen when =
create_pinctrl() is calling pcs_dt_node_to_map()
>>>> and pinctrl_generic_add_group() w/o being locked on =
pinctrl_maps_mutex.
>>>>=20
>>>> The race I suspect is that two drivers are trying to insert the =
same name and may come
>>>> both to the conclusion that it does not yet exist. And both insert =
into the radix tree.
>>>>=20
>>>> The window of risk is small though... It is in =
pinctrl_generic_add_group() between calling
>>>> pinctrl_generic_group_name_to_selector() and radix_tree_insert() so =
we probably won't
>>>> see it in real hardware tests.
>>>=20
>>> Hmm but that race should be already fixed with mutex held
>>> by the pin controller drivers with these fixes? Or am I
>>> missing something still?
>>=20
>> Hm. Maybe we refer to a different mutex?
>=20
> Yes I think that's the case, you're talking about a different
> mutex here :)
>=20
>> I had seen the call sequence
>>=20
>> create_pinctrl()-> pinctrl_dt_to_map() -> pcs_dt_node_to_map() -> =
pinctrl_generic_add_group()
>>=20
>> w/o any lock inside.
>>=20
>> There is a mutex_lock(&pinctrl_maps_mutex); in create_pinctrl(), but =
locked after that.
>>=20
>> Or is there a lock outside of create_pinctrl()?
>>=20
>> If I look into the stack dumps, call nesting is
>>=20
>> driver_probe_device() -> pinctrl_bind_pins() -> devm_pinctrl_get() -> =
create_pinctrl()
>>=20
>> They all do no locking.
>>=20
>> Maybe I am missing something.
>=20
> Can you please post a patch for that as you already have it
> debugged? That's easier to understand than reading a verbal
> patch :)

I have no patch for it and all tests were without, but I can suggest a =
change which IMHO
could solve it:

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index eb2b217f5e1e..7d125f9a7804 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1037,15 +1037,16 @@ static struct pinctrl *create_pinctrl(struct =
device *dev,
        INIT_LIST_HEAD(&p->states);
        INIT_LIST_HEAD(&p->dt_maps);
=20
+       mutex_lock(&pinctrl_maps_mutex);
        ret =3D pinctrl_dt_to_map(p, pctldev);
        if (ret < 0) {
                kfree(p);
+               mutex_unlock(&pinctrl_maps_mutex);
                return ERR_PTR(ret);
        }
=20
        devname =3D dev_name(dev);
=20
-       mutex_lock(&pinctrl_maps_mutex);
        /* Iterate over the pin control maps to locate the right ones */
        for_each_maps(maps_node, i, map) {
                /* Map must be for this device */

Description: we should also protect pinctrl_dt_to_map(), which calls =
pinctrl_generic_add_group()
and the calls inside pinctrl_generic_add_group() to =
pinctrl_generic_group_name_to_selector()
and radix_tree_insert() with a mutex.

But I haven't tested this case (because it is unlikely to happen and be =
testable).

BR,
Nikolaus
