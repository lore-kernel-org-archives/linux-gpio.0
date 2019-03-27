From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [Patch v3 2/2] tracing: gpio: add Kconfig option for
 enabling/disabling trace events
Date: Wed, 27 Mar 2019 17:12:03 +0100
Message-ID: <20190327161158.GA26067@taurus.defre.kleine-koenig.org>
References: <CAFDyS3Nuq8FPx4z5GW1Ht+NBGd+8O9rjPZ+DaMU1XU1QYgA=2g@mail.gmail.com>
 <1438432079-11704-1-git-send-email-tal.shorer@gmail.com>
 <1438432079-11704-4-git-send-email-tal.shorer@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438432079-11704-4-git-send-email-tal.shorer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tal Shorer <tal.shorer@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: rostedt@goodmis.org, mingo@redhat.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 01, 2015 at 03:27:58PM +0300, Tal Shorer wrote:
> Add a new options to trace Kconfig, CONFIG_TRACING_EVENTS_GPIO, that is
> used for enabling/disabling compilation of gpio function trace events.
>=20
> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  include/trace/events/gpio.h | 4 ++++
>  kernel/trace/Kconfig        | 7 +++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/include/trace/events/gpio.h b/include/trace/events/gpio.h
> index 927a8ad..2da73b9 100644
> --- a/include/trace/events/gpio.h
> +++ b/include/trace/events/gpio.h
> @@ -1,6 +1,10 @@
>  #undef TRACE_SYSTEM
>  #define TRACE_SYSTEM gpio
> =20
> +#ifndef CONFIG_TRACING_EVENTS_GPIO
> +#define NOTRACE
> +#endif
> +
>  #if !defined(_TRACE_GPIO_H) || defined(TRACE_HEADER_MULTI_READ)
>  #define _TRACE_GPIO_H
> =20
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 3b9a48a..67a1731 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -635,6 +635,13 @@ config TRACE_ENUM_MAP_FILE
> =20
>  	If unsure, say N
> =20
> +config TRACING_EVENTS_GPIO
> +	bool "Trace gpio events"
> +	depends on GPIOLIB
> +	default y
> +	help
> +	  Enable tracing events for gpio subsystem
> +

It happened a few times to me since this patch was merged (in 4.4-rc1)
that I worked on a system with tracing enabled but
/sys/kernel/debug/tracing/events/gpio were missing because of
CONFIG_TRACING_EVENTS_GPIO=3Dn. This is annoying and I wonder what is the
motivating purpose of allowing to disable gpio events. There is no other
event type that can be disabled with kconfig symbols. Theoretically the
overhead should be so small, that having these events enabled
unconditionally should be fine, shouldn't it?

Best regards
Uwe

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAlyboMkACgkQwfwUeK3K
7AmWjgf/fn7Is0y04lkAl6ET2ZTTC4yh7aLtitivQZ7q6GrULaPfhWO8GEj7lOxR
Q7N9N3WZrqtR/TWAd4VuYsDPpQoLkWrFSgQS4qh1okV1evmTnRUuWkiAluLvizLS
tU29YxSf4TPNgcn91hpFMNIGbPMBPolnWLF718VtaRXhowz4RvqNQMplGnUc0G53
yZ+d3EganFx8pgVpG1NIBhgT5Pi/oRV/URDF1epZEOgHA+2VifrE04Um+dzugo3U
xGBaP4rWCT8HSWPFQM6JgpMyjVzKQ0wsKzxIgQtgX6et11IrWtytMZxgaz0L1U1p
w1Rp1uJCw0HagsV6zo4idA2auO5Kgw==
=/vx7
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
