From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] pinctrl: zynq: configure SPI SSx pins separately
Date: Fri, 24 Apr 2015 11:21:17 -0700
Message-ID: <c8981060-7f8d-4d0c-bc4f-c7be8f5ce02c@BY2FFO11FD032.protection.gbl>
References: <1429694097-3087-1-git-send-email-helmut.buchsbaum@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0064.outbound.protection.outlook.com ([65.55.169.64]:43092
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751195AbbDXSy2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 24 Apr 2015 14:54:28 -0400
Content-Disposition: inline
In-Reply-To: <1429694097-3087-1-git-send-email-helmut.buchsbaum@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-gpio@vger.kernel.org

Hi Helmut,

On Wed, 2015-04-22 at 11:14AM +0200, Helmut Buchsbaum wrote:
> Since SCLK, MISO and MOSI are the only mandatory signals at Zynq's SP=
I
> interfaces, SS0, SS1 and SS2 have to be configured separately as they=
 may
> be used as simple GPIO lines.
>=20
> This, of course, has to be considered in the devicetree, so pin contr=
oller
> configuration for e.g. an SPI0 using SS0 and SS1 only might look like=
 the
> following snippet (derived from the example of chapter "17.5.3
> MIO/EMIO" Routing of Zynq-7000 TRM UG585). So MIO20 can now be used
> as GPIO instead of being occupied by SPI0 SS2 function:

I think this is very valid and correct. Thanks! One doubt I have though=
:
[...]
> @@ -548,10 +591,20 @@ static const char * const qspi0_groups[] =3D {"=
qspi0_0_grp"};
>  static const char * const qspi1_groups[] =3D {"qspi0_1_grp"};
>  static const char * const qspi_fbclk_groups[] =3D {"qspi_fbclk_grp"}=
;
>  static const char * const qspi_cs1_groups[] =3D {"qspi_cs1_grp"};
> -static const char * const spi0_groups[] =3D {"spi0_0_grp", "spi0_1_g=
rp",
> -					   "spi0_2_grp"};
> -static const char * const spi1_groups[] =3D {"spi1_0_grp", "spi1_1_g=
rp",
> -					   "spi1_2_grp", "spi1_3_grp"};
> +static const char * const spi0_groups[] =3D {"spi0_0_grp", "spi0_0_s=
s0_grp",
> +					   "spi0_0_ss1_grp", "spi0_0_ss2_grp",
> +					   "spi0_1_grp", "spi0_1_ss0_grp",
> +					   "spi0_1_ss1_grp", "spi0_1_ss2_grp",
> +					   "spi0_2_grp", "spi0_2_ss0_grp",
> +					   "spi0_2_ss1_grp", "spi0_2_ss2_grp"};
> +static const char * const spi1_groups[] =3D {"spi1_0_grp", "spi1_0_s=
s0_grp",
> +					   "spi1_0_ss1_grp", "spi1_0_ss2_grp",
> +					   "spi1_1_grp", "spi1_1_ss0_grp",
> +					   "spi1_1_ss1_grp", "spi1_1_ss2_grp",
> +					   "spi1_2_grp", "spi1_2_ss0_grp",
> +					   "spi1_2_ss1_grp", "spi1_2_ss2_grp",
> +					   "spi1_3_grp", "spi1_3_ss0_grp",
> +					   "spi1_3_ss1_grp", "spi1_3_ss2_grp"};

Can we add this to the spiX groups or do we need individual
spix_ss_groups[] arrays? E.g. for the SD card detect signal and similar
we have individual groups arrays.

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
