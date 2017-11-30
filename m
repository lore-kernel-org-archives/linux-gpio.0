From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] gpio: Timestamp events in hardirq handler
Date: Thu, 30 Nov 2017 11:32:58 +0200
Message-ID: <87po80w1px.fsf@linux.intel.com>
References: <20171130092655.25965-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:12902 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750898AbdK3Jde (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Nov 2017 04:33:34 -0500
In-Reply-To: <20171130092655.25965-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Linus Walleij <linus.walleij@linaro.org> writes:
> Add a hardirq handler to the GPIO userspace event loop, making
> sure to pick up the timestamp there, as close as possible in time
> relative to the actual event causing the interrupt.
>
> Tested with a simple pushbutton GPIO on ux500 and seems to work
> fine.
>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> Reported-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index aad84a6306c4..6e006e6df95a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -587,6 +587,9 @@ static int linehandle_create(struct gpio_device *gdev=
, void __user *ip)
>   * @events: KFIFO for the GPIO events
>   * @read_lock: mutex lock to protect reads from colliding with adding
>   * new events to the FIFO
> + * @timestamp: cache for the timestamp storing it between hardirq
> + * and IRQ thread, used to bring the timestamp close to the actual
> + * event
>   */
>  struct lineevent_state {
>  	struct gpio_device *gdev;
> @@ -597,6 +600,7 @@ struct lineevent_state {
>  	wait_queue_head_t wait;
>  	DECLARE_KFIFO(events, struct gpioevent_data, 16);
>  	struct mutex read_lock;
> +	s64 timestamp;
>  };
>=20=20
>  #define GPIOEVENT_REQUEST_VALID_FLAGS \
> @@ -731,7 +735,7 @@ static irqreturn_t lineevent_irq_thread(int irq, void=
 *p)
>  	struct gpioevent_data ge;
>  	int ret, level;
>=20=20
> -	ge.timestamp =3D ktime_get_real_ns();
> +	ge.timestamp =3D le->timestamp;
>  	level =3D gpiod_get_value_cansleep(le->desc);
>=20=20
>  	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
> @@ -759,6 +763,19 @@ static irqreturn_t lineevent_irq_thread(int irq, voi=
d *p)
>  	return IRQ_HANDLED;
>  }
>=20=20
> +static irqreturn_t lineevent_irq_handler(int irq, void *p)
> +{
> +	struct lineevent_state *le =3D p;
> +
> +	/*
> +	 * Just store the timestamp in hardirq context so we get it as
> +	 * close in time as possible to the actual event.
> +	 */
> +	le->timestamp =3D ktime_get_real_ns();
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
>  static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>  {
>  	struct gpioevent_request eventreq;
> @@ -851,7 +868,7 @@ static int lineevent_create(struct gpio_device *gdev,=
 void __user *ip)
>=20=20
>  	/* Request a thread to read the events */
>  	ret =3D request_threaded_irq(le->irq,
> -			NULL,
> +			lineevent_irq_handler,

now that you have a hardirq handler, do you even need IRQF_ONESHOT? How
about using the hardirq handler to mask $this gpio's IRQ, then run
thread without IRQF_ONESHOT? This would help a in cases where the IRQ
line is shared.

Perhaps that should be done in a separate patch, though?

FWIW:

Reviewed-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlof0EwACgkQzL64meEa
mQYTPxAAwlfRk3BrDbZBxMdBSPEcHFWcsD2Vyqd5Nmd4dXuWFMxOfH3L6aoXDJkm
W8qFm8Bm2wSCYuHsUHj5soNq8EUWLh7VeJV8wD4LB2HS799fUsJmzgFhoyhWzUe4
XoxRnw0TB5orzVB6IXq9WCbEeguipXApFRSAoHXNCl93a9Sua5lggLLkxkUbVOkf
l9VrM/aVHPSZiQYkRW1q2Czb0uUrCvNm1Bv0Kxk4eDgeLNy0jU6rxeVG0Axd31ud
aJReXc/DFOKyyRFvH7IQfCXG+MnhttdGKCrSWnqvoovDWy6jAhDS9hkG/RxVgvoQ
wdPzJVaEXXZ+1j0FN0AmsUIZofByFu4LG01Yew7hQno73c/PEBqgnxeMY+CHnFWh
3ppIzUOPbEnm1C+u/TL6V9uy9eDbuSKJRBKM7EGCPR0+frYcUiKnO9rlZRxFcvu0
5Ose5oYUGpS4P5Y1ro62Jvr/IoAHXlVK0ZexWNvsH59JCSJgpwUZk/Ct7zrfC2jF
QkuHIJ2QCZXCsXG/l2pBatwRLhxmVhHZ3kmbeIJAYfAyDih06FKC5HNCoNVKCOHI
wSEbvc62AAS87FakZC0MJL2TXAmBCQL9l2mCLCIDSYn81wgaWxj48UaBxCm++csm
aVMGYWxUaD0x1s9IlBrJjdHfBmt71alQAGwlOAQrS8zlkCG5wbg=
=NC8q
-----END PGP SIGNATURE-----
--=-=-=--
