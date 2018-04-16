From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH v4] pinctrl: msm: fix gpio-hog related boot issues
Date: Mon, 16 Apr 2018 13:50:26 +0200
Message-ID: <1662515.4UeQ9r5Xdv@bentobox>
References: <20180412190138.12372-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8230085406943062932=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180412190138.12372-1-chunkeey@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

--===============8230085406943062932==
Content-Type: multipart/signed; boundary="nextPart4223788.DlfLbA2zPg"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4223788.DlfLbA2zPg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 12. April 2018 21:01:38 CEST Christian Lamparter wrote:
> Sven Eckelmann reported an issue with the current IPQ4019 pinctrl.
> Setting up any gpio-hog in the device-tree for his device would
> "kill the bootup completely":
> 
> | [    0.477838] msm_serial 78af000.serial: could not find pctldev for node /soc/pinctrl@1000000/serial_pinmux, deferring probe
> | [    0.499828] spi_qup 78b5000.spi: could not find pctldev for node /soc/pinctrl@1000000/spi_0_pinmux, deferring probe
> | [    1.298883] requesting hog GPIO enable USB2 power (chip 1000000.pinctrl, offset 58) failed, -517
> | [    1.299609] gpiochip_add_data: GPIOs 0..99 (1000000.pinctrl) failed to register
> | [    1.308589] ipq4019-pinctrl 1000000.pinctrl: Failed register gpiochip
> | [    1.316586] msm_serial 78af000.serial: could not find pctldev for node /soc/pinctrl@1000000/serial_pinmux, deferring probe
> | [    1.322415] spi_qup 78b5000.spi: could not find pctldev for node /soc/pinctrl@1000000/spi_0_pinmux, deferri
> 
> This was also verified on a RT-AC58U (IPQ4018) which would
> no longer boot, if a gpio-hog was specified. (Tried forcing
> the USB LED PIN (GPIO0) to high.).
[...]

Sorry that I was so silent while you did all the work. I have applied your 
patch and now I see a 

   [    0.020619] GPIO line 58 (enable USB2 power) hogged as output/low

when adding following node directly to the pinctrl

	enable-usb-power {
		gpio-hog;
		gpios = <58 GPIO_ACTIVE_HIGH>;
		output-low;
		line-name = "enable USB2 power";
	};

(this looks at the first glance like it is deactivating USB by setting it to 
low but GPIO_ACTIVE_LOW would switch the meaning of output-low for gpio-hogs 
and the GPIO must really set to signal level low to enable USB)

Tested-by: Sven Eckelmann <sven.eckelmann@openmesh.com>

Thanks,
	Sven
--nextPart4223788.DlfLbA2zPg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlrUjgIACgkQXYcKB8Em
e0YpOw//Wk8sjiOV37iXxnLcjss2SeSeRVGzu+LedIO1D5Xna/OpuDbx3PP9Tbdj
daxEAz2TUq2li35VtaAbgSc5QghV2Hfg6W7dUig4jl/LKYBFXQku1F7Cg2W09WDJ
ZBT9OFEnUFX5vIxqEkTSgd4B2sgmJ/kBs5SrtXsN6qk2J8j4w5T37nJm1Z9m9+et
O4B+QevCYXcxVBlp8PzYCJcIRjV8vn25yQwtKPORWLRELQaMBX5L9h5o5vx9LyeB
IhbdsPPbagwthaY3czI2ISUVc+jHXh0OTSeQf2CgMmpfuoQwRWi8WjEvkb/CnVUC
gJN5UT9/hJNwbAwOAfNzR0F/gwdPNEgGdmJrT0ztQ1XSVtKT8ux4GAumAnB+UAfd
2Wis9BZm2sdfLbulub1LotuSTl9NANoumsd2D4R26CrqwZur0LpLoNsYrpiGdpIH
RDPulg5zAmoyp9XLhLJDcUmHVFvJnObZgJ+IVQE09ovwJbdi4gLvUsQLj9REI3q6
jA6pZf6LQbseRYK41Dby72bZUyAKBDe6xiPDOs8BsdfQoqvgwlPAbg69sMSYVSHF
RD+IDuaAzLPVYdadFanB2M7C4b6Y43WKAi/ewd/xwZFzuAUc7xSjcvnCMJMph/TR
XP6jN28SSVBXAS6JzwzURdGe8ispzi9ZS+DEINR6nQcpTT7tjhA=
=/65K
-----END PGP SIGNATURE-----

--nextPart4223788.DlfLbA2zPg--



--===============8230085406943062932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8230085406943062932==--
