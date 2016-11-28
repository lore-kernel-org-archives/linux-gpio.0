From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3] RFC: pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP
Date: Mon, 28 Nov 2016 12:18:05 -0800
Message-ID: <87zikjz7cy.fsf@eliezer.anholt.net>
References: <1479145925-3578-1-git-send-email-linus.walleij@linaro.org> <CACRpkdZ39UbUzKebVzRuAg8hxgLiGNzzUMebMVT+mcAOnHRW+w@mail.gmail.com> <2017856859.25225.e58aee3b-9fc2-4b39-a030-c2409c5b92fc.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:38290 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751307AbcK1USI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Nov 2016 15:18:08 -0500
In-Reply-To: <2017856859.25225.e58aee3b-9fc2-4b39-a030-c2409c5b92fc.open-xchange@email.1und1.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Hi Linus,
>
>> Linus Walleij <linus.walleij@linaro.org> hat am 24. November 2016 um 16:=
16
>> geschrieben:
>>=20
>>=20
>> On Mon, Nov 14, 2016 at 6:52 PM, Linus Walleij <linus.walleij@linaro.org>
>> wrote:
>>=20
>> > It should be possible to use the GPIOLIB_IRQCHIP helper
>> > library with the BCM2835 driver since it is a pretty straight
>> > forward cascaded irqchip.
>> >
>> > The only difference from other drivers is that the BCM2835
>> > has several banks for a single gpiochip, and each bank has
>> > a separate IRQ line. Instead of creating one gpiochip per
>> > bank, a single gpiochip covers all banks GPIO lines. This
>> > makes it necessary to resolve the bank ID in the IRQ
>> > handler.
>> >
>> > The GPIOLIB_IRQCHIP allows several IRQs to be cascaded off
>> > the same gpiochip by calling gpiochip_set_chained_irqchip()
>> > repeatedly, but we have been a bit short on examples
>> > for how this should be handled in practice, so this is intended
>> > as an example of how this can be achieved.
>> >
>> > The old code did not model the chip as a chained interrupt
>> > handler, but this patch also rectifies that situation.
>> >
>> > Cc: Stephen Warren <swarren@wwwdotorg.org>
>> > Cc: Stefan Wahren <stefan.wahren@i2se.com>
>> > Cc: Eric Anholt <eric@anholt.net>
>> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> > ---
>> > ChangeLog v2->v3:
>> > - Rebase on top of the two new patches from the vendor tree.
>> > ChangeLog v1->v2:
>> > - Forgot to convert the driver to chained IRQ handler. Now fixed.
>> >
>> > Rpi folks: I have no clue if this works or not, but would be happy
>> > if you could test it to see if IRQs fire as expected and provide
>> > some feedback.
>>=20
>> Any testers?
>>=20
>> I'm getting tempted to just apply it to get test coverage, at the
>> cost of having to revert it if it just explodes...
>
> i made a simple boot + reboot test on my RPI 1 Model B without any issues.
> Unfortunately i don't have any additional hardware with a GPIO interrupt.
>
> In the case this is sufficient you can have my:
>
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

Given that this is mostly about changing how IRQs are handled, it would
be really nice to actually test that.  I've forwarded the patch on to
Phil in the hopes he can test it.  Alternatively, we could make HDMI use
the GPIO line as an interrupt and turn off HPD polling and see if that
works before and after.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlg8kP0ACgkQtdYpNtH8
nui2CRAArCehYzX/MGk8Zk+K3mA7g0+tXI0dUxA/4p1HWnGXijKKnUtlVnKQwOnm
77ALCTLXVx9QbT20HuzYBcWs2jIq7ecNEw80iikqSaImfhRaebnpb6b0NKl2KQMF
JuQh7HgWOKdMZhC6ypbT6Azd8vNdajOQ+/xUcxSWDojfu7HFdQn5yoy/ZN8K0PVr
MNnPQa4ka222LlM2MNuGYUDGuBW1SQlQG02ekmuEQOFu3m+FeoUQQpCL7kX5Getc
+46DbjyPDyVOcQhTO+3Uk+wKidx76qbjXW/JHiDqdESfkMsnK/Yv5+JUhsPv15+/
0//A/pCdJ2o68seQEMhTLsvtbatFESfovgP2IyNSKlmkGbO/EroyZZxdUUpHi7i+
vMTZDlkTDyycNvHnr1RgR5SUyT9/PM6H75PvV4k8aDBB29I6SI6zBFJ+I33qsx2e
yRE4J9RXJfLB5SNg6W6J9w9qmGSqMhWLtFVk0M1LmqDpB5cBI6et8Tx4fDedz09q
e5Ev948t7Z7Ts2yn0Ue0NAQc/u/1UJk2Hml8NARj3o5b09SopJIEMsbx45hukvTf
JubzThChUpWnvj8/maKh9cnh180yaa+iifxwz5FOuzH86Rv42vqdT9iGgciQXska
syoKPf3JAS7Cuaut71/FcrqZh8CqO1ULCcsRbwPlqFEcbVBvSpw=
=Ag9m
-----END PGP SIGNATURE-----
--=-=-=--
