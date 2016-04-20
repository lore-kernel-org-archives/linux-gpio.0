From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 18/23] metag: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Wed, 20 Apr 2016 10:26:02 +0100
Message-ID: <20160420092602.GX7859@jhogan-linux.le.imgtec.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
 <1461142701-21096-19-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4PR/+zdSfVlxyWed"
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461142701-21096-19-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael =?utf-8?B?QsO8c2No?= <m@bues.ch>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

--4PR/+zdSfVlxyWed
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2016 at 10:58:16AM +0200, Linus Walleij wrote:
> This symbols is not needed to get access to selecting the
> GPIOLIB anymore: any arch can select GPIOLIB.
>=20
> Cc: Michael B=C3=BCsch <m@bues.ch>
> Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Thanks
James

> ---
> Various arch maintainers:
>=20
> either ACK this and I will merge it into the GPIO tree for v4.7
> anticipating no clashes, or you wait until I have the enabling patch
> upstream (patch 1 in this series, removing deps on
> ARCH_[WANTS_OPTIONAL|REQUIRES]_GPIOLIB), and you will be able to
> merge it to your arch trees yourselves for late v4.7
> (post GPIO tree merge) or for v4.8.
>=20
> You can also ask me for an immutable branch if you prefer that, I
> will put the enabling patch on a branch and the patch for your arch
> on top and ask you to pull it.
>=20
> Select your option from the menu, silence probably means I will
> merge it to the GPIO tree. Unless you are X86 or ARM in which case
> I will be cautious.
> ---
>  arch/metag/Kconfig.soc | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/metag/Kconfig.soc b/arch/metag/Kconfig.soc
> index 973640f46752..50f979c2b02d 100644
> --- a/arch/metag/Kconfig.soc
> +++ b/arch/metag/Kconfig.soc
> @@ -16,7 +16,6 @@ config META21_FPGA
> =20
>  config SOC_TZ1090
>  	bool "Toumaz Xenif TZ1090 SoC (Comet)"
> -	select ARCH_WANT_OPTIONAL_GPIOLIB
>  	select IMGPDC_IRQ
>  	select METAG_LNKGET_AROUND_CACHE
>  	select METAG_META21
> --=20
> 2.4.11
>=20

--4PR/+zdSfVlxyWed
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXF0sqAAoJEGwLaZPeOHZ6SwsP/11CI4SRTCWvZa8jEXdoCUoO
jeV6CPqzNK6/eoRPW8ct3ir3O5QpoELbHguBCGMHtFkJIc3qDP7AeUCm6xEa+5mn
v5FNX2AtsyB80iyVlk20P8ePoxOnRvw7pG/58h0m9Ifey8/EkvW0UEIk+DJTfKpd
en21o1bxIL6N6syLGHHLKEgONWXMuvb+gterK60akE6IgmcQU3p7h15c89ZA5gdJ
+j7FbDqpJm8yrmAfWSlK4Z3+VfaYYP39IpLQQ6XTIf1H9enjnHmNF+SV1OAewSMF
SJMiT4YUVqdk4u7JpFGkPEtNGA8xhlIO4ZuXe+g4zhsIj8Zw14Vh5tg6Zv3fVmtH
ESHjx3etmm3eSpISHltUw0O+p/R1fGqUhTRG5E+VHy4aAhSxMBRKiVpx+hMHPuMe
qSLh1G+b34dfDsD9DpZZZjRs9orS/mIpTfSs+srl0SFw2nyjrXiUyp/ohRXcXnvS
i094RzFQyjeUbjOeAwkvsXP6Vi4QG4UKHpHrXMFz1MaE1tlRmWI7Na8U65TSqYGx
4jF9XtcdHVuBNSjSYMLviDaeKSqVP2xE6T2XuO5bU+tTTZcbPieatKWX+8il9w1P
/s3O/OcobyDKMAYj458VzTq544t79Pn7BTiYWA68fHNIAOrjw9Wtp6E1SpIuWgIU
Jq7yllbIm6Ehd3e9DI/S
=i6sG
-----END PGP SIGNATURE-----

--4PR/+zdSfVlxyWed--
