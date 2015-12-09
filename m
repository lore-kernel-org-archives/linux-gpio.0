From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: mvebu: complain about missing group after
 checking variant
Date: Wed, 9 Dec 2015 16:15:52 +0100
Message-ID: <CACRpkdYWzyeJNFJ8DzmsZ1rZ8w=ptkm4wGE4MgdGS=EcBzg1Rw@mail.gmail.com>
References: <1448705645-13881-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1448706409-16912-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448706409-16912-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Simon Guinot <simon.guinot@sequanux.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 28, 2015 at 11:26 AM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

> Common MVEBU pinctrl driver core gets an array of controls to modify
> a specific set of registers and an array of modes for each pingroup
> from each of the different SoC families of MVEBU.
>
> Some SoC families comprise different variants that differ in available
> pingroups and also controls, but to ease driver development, we can
> pass a variant mask to disable specific pingroups for some variants.
> However, controls are limited to the true number of pinctrl groups
> avaiable on a variant.
>
> Now, when pinctrl core driver parses over above arrays, it tries to
> match modes with available controls and complains about missing
> controls for modes that are passed to the core but actually are not
> avaiable on a variant with:
>
> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 36
>
> This warning is a false-positive and annoying, so move the warning
> after we checked the variant mask for each mode setting. Also, if
> there is no supported setting for this variant, do not complain at
> all.
>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changelog:
> v1->v2:
> - modify settings loop to allow to check for !num_settings

Patch applied!

Yours,
Linus Walleij
