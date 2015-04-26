From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2] pinctrl: zynq: configure SPI SSx pins separately
Date: Sun, 26 Apr 2015 08:18:18 -0700
Message-ID: <a0e92a8d-1c8b-42e8-886e-56987c4a4212@BY2FFO11FD020.protection.gbl>
References: <1430040767-26299-1-git-send-email-helmut.buchsbaum@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0053.outbound.protection.outlook.com ([65.55.169.53]:48498
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751968AbbDZPeI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 26 Apr 2015 11:34:08 -0400
Content-Disposition: inline
In-Reply-To: <1430040767-26299-1-git-send-email-helmut.buchsbaum@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-gpio@vger.kernel.org

On Sun, 2015-04-26 at 11:32AM +0200, Helmut Buchsbaum wrote:
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
> as GPIO instead of being occupied by SPI0 SS2 function. Note the sepa=
rate
> pinmux function for the slave select signals:
>=20
> pinctrl_spi0_default: spi0-default {
> 	mux_spi {
> 		function =3D "spi0";
> 		groups =3D "spi0_0_grp";
> 	};
>=20
> 	mux_ss {
> 		function =3D "spi0_ss";
> 		groups =3D "spi0_0_ss0_grp", "spi0_0_ss1_grp";
> 	}
>=20
> 	conf-output {
> 		pins =3D "MIO16", "MIO21";
> 		slew-rate =3D <0>;
> 		bias-disable;
> 		low-power-disable;
> 		io-standard =3D <1>;
> 	};
>=20
> 	conf-input {
> 		pins =3D "MIO17";
> 		slew-rate =3D <0>;
> 		bias-high-impedance;
> 		low-power-disable;
> 		io-standard =3D <1>;
> 	};
>=20
> 	conf-select {
> 		pins =3D "MIO18", "MIO19";
> 		slew-rate =3D <0>;
> 		bias-pull-up;
> 		low-power-disable;
> 		io-standard =3D <1>;
> 	};
> };
>=20
> pinctrl_gpio0_default {
> 	mux {
> 		function =3D "gpio0";
> 		groups =3D "gpio0_20_grp"
> 	};
>=20
> 	conf {
> 		pins =3D "MIO20";
> 		slew-rate =3D <0>;
> 		bias-pull-up;
> 		low-power-disable;
> 		io-standard =3D <1>;
> 	};
> };
>=20
> Signed-off-by: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

> ---

=46or future reference, please keep a changelog here when sending anoth=
er
iteration of a patch.

	Regards,
	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
