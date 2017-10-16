From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [gpio:devel 12/12]
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27: error: 'struct
 gpio_chip' has no member named 'irq_base'; did you mean 'base'?
Date: Mon, 16 Oct 2017 14:46:56 +0200
Message-ID: <20171016124656.GA6539@ulmo>
References: <201710150916.Se4u1t6V%fengguang.wu@intel.com>
 <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
 <20171016080502.GB17369@ulmo>
 <20171016080821.GC17369@ulmo>
 <CACRpkdYuJeKQA+yyU1B0fvU2WoaFRNBHn3XVrGs1jgWXUOOmqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:53335 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751358AbdJPMq7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 08:46:59 -0400
Received: by mail-qt0-f195.google.com with SMTP id n61so31250387qte.10
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 05:46:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdYuJeKQA+yyU1B0fvU2WoaFRNBHn3XVrGs1jgWXUOOmqg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild test robot <fengguang.wu@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 01:50:08PM +0200, Linus Walleij wrote:
> On Mon, Oct 16, 2017 at 10:08 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
>=20
> > Nevermind, I see there is now yet another conflict that would require
> > yet another rebase of that series.
>=20
> Sorry about this :(
>=20
> It sucks with moving targets, there was some fallout from Grygorii's patch
> to map IRQs dynamically and remove irq_base so we need to clean that
> up first.
>=20
> This particular bug from the autobuilder seems to be constrained to the
> armada driver though.

Well, the problem here is that Grygorii's patch removes the field but
with there still being one user left. So we'd have to make sure that the
real last user goes away before that patch is applied.

Looking at the code it seems a little phony. d->hwirq - chip->irq_base
seems like a very risky thing to do because you never really know what
irq_base will end up being (in the general case where it's dynamically
allocated). But the driver passes 0 to gpiochip_irqchip_add() as the
first_irq parameter, therefore the operation becomes a noop and so it
should be completely safe to remove that line.

Something like the below should do. Cc +=3D Gregory.

Thierry

--- >8 ---
=46rom fcd87329cf4edf6a6f5d491a1893af401be7dedf Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Mon, 16 Oct 2017 14:40:23 +0200
Subject: [PATCH] pinctrl: armada-37xx: Stop using struct gpio_chip.irq_base

The Armada 37xx driver always initializes the IRQ base to 0, hence the
subtraction is a no-op. Remove the subtraction and thereby the last user
of struct gpio_chip's .irq_base field.

Note that this was also actually a bug and only worked because of the
above assumption. If the IRQ base had been dynamically allocated, the
subtraction would've caused the wrong mask to be generated since the
struct irq_data.hwirq field is an index local to the IRQ domain. As a
result, it should now be safe to also allocate this chip's IRQ base
dynamically, unless there are consumers left that refer to the IRQs by
their global number.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/=
mvebu/pinctrl-armada-37xx.c
index 71b944748304..ac299a6cdfd6 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -627,14 +627,14 @@ static void armada_37xx_irq_handler(struct irq_desc *=
desc)
 static unsigned int armada_37xx_irq_startup(struct irq_data *d)
 {
 	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(d);
-	int irq =3D d->hwirq - chip->irq_base;
+
 	/*
 	 * The mask field is a "precomputed bitmask for accessing the
 	 * chip registers" which was introduced for the generic
 	 * irqchip framework. As we don't use this framework, we can
 	 * reuse this field for our own usage.
 	 */
-	d->mask =3D BIT(irq % GPIO_PER_REG);
+	d->mask =3D BIT(d->hwirq % GPIO_PER_REG);
=20
 	armada_37xx_irq_unmask(d);
=20
--=20
2.14.1


--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnkqjsACgkQ3SOs138+
s6HE5Q/+L2udpZspyhr4/X3q52HLj0gVRAzbOrjJmhmrH3TXNf5SJzq/9SrqH1AO
wXaAUvfl9/Oia5MGpUOT95wNQVTSvJ5Yg7jKTjgmNUr7oDNqBnNYNgyb6XG1hFzi
+Xl2xC4HPuxmd/1NthXynpoa18mX3BpLtj4Y/iZCeyi+OiqUcxw/jpXozbfGZWFc
DdbPr32brNRpmP4zAtV+0s4lach9C9EyVpmUMglRIQR1qHauN+fpf60mdAsQKExu
o6qN0cbqymFfaB2V48Lyp7L8T9APYvKcUFte/ZSv/xjO3plYsH85BArmARA78SN9
h4/OO7b5W2i7OvXohrvXxlqF/avyqxOCfTwaMIFvcbJNJ+d2xSJNuh4W9Mc2jtf+
UqLxK9pqIyAsegPa4GfcqX4a4LDIv5hpGwRWtYLlxpd7KhS5c/tbc5wer0JDKeAI
JYG38+prNAbr2ve/iW44vUMUm/vCLP6q4gZHAM8RAhzadl2Vs7UhpH7+cHcmwAKF
6w7Whxx8X0ULl5P9NDu50BjzWQxUbWqtzWR0RXxpi67xtgBSOFEIcZpjUq5DXNrl
i1mpmbqIqyx4gZ+ooiGBRrSf0K5HHP+JnO9/VmSKJfgZUX/6jxdhNORiAM59pP5o
QIUY4i7piI0RxyhVYWv9q8SwDJGRRbquWcArytlLlMsiK2FDV7g=
=bZBA
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
