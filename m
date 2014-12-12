From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] bulk GPIO changes for v3.19
Date: Fri, 12 Dec 2014 11:19:59 +0100
Message-ID: <CACRpkdYCRYr5AjjZOQbnHV0-dz9hxVfNNAQ6OSs8Uztyd2zKeA@mail.gmail.com>
References: <CACRpkda1EPMPTzW56GcCsMnBvn=s1gnp-pHu4cHP-+P-J2q52w@mail.gmail.com>
	<CA+55aFx2yi6sxaWt+DZh1QYaqs550Zw1PWOKn0P=0D8fRsqrKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFx2yi6sxaWt+DZh1QYaqs550Zw1PWOKn0P=0D8fRsqrKA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 11, 2014 at 8:34 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Dec 9, 2014 at 1:09 AM, Linus Walleij <linus.walleij@linaro.o=
rg> wrote:
>>
>> here is the bulk of GPIO changes for the v3.19 kernel series.
>> The major external change is the new API to driver several GPIOs
>> simultaneously, and the major internal change is that we're getting
>> rid of a static array of GPIO descriptors and again moving away,
>> slowly, from the global GPIO numberspace.
>
> This does not build for me.
>
> The gpio-mcp23s08.c driver now has a "chip.of_node" access outside of
> #ifdef CONFIG_OF, resulting in
>
>   drivers/gpio/gpio-mcp23s08.c: In function =E2=80=98mcp23s08_probe_o=
ne=E2=80=99:
>   drivers/gpio/gpio-mcp23s08.c:658:57: error: =E2=80=98struct gpio_ch=
ip=E2=80=99 has
> no member named =E2=80=98of_node=E2=80=99
>      mcp->irq_active_high =3D of_property_read_bool(mcp->chip.of_node=
,

Grr how could I miss this. I'll fix up stuff.

> Should it be using "mcp->chip.dev->of_node" instead? Or should the
> driver just depend on OF?

The former I think, the driver has only optional DT support.

I will fix up and send a new pull request when finished.

Maybe I should not have the of_node inside #ifdef CONFIG_OF in
the gpio_chip and just keep it around like we do in struct device,
that makes for less #ifdef clutter.

Yours,
Linus Walleij
