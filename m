From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: [RFC] Periodic Output, Timestamped Input
Date: Thu, 16 Nov 2017 11:29:15 +0200
Message-ID: <87ineapo5w.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:24953 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758985AbdKPJ3a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Nov 2017 04:29:30 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Linus,

Before I put a lot of code down, I wanted to get a feeling from you as
to how you'd like two new features to be implemented.

In a future platform we may have two new features in our GPIO
controller which allows for periodic assertion of GPIO Output
(controlled by HW, we just program the interval) and Timestamping of
GPIO Input events.

I was thinking that we could use pin config for that. Something along
the lines of:

@@ -700,6 +700,12 @@ static int intel_config_set_debounce(struct intel_pinc=
trl *pctrl, unsigned pin,
	return ret;
 }

+static int intel_config_set_output_periodic(struct intel_pinctrl *pctrl,
+					    unsigned pin, unsigned period_ms)
+{
+	return 0;
+}
+
 static int intel_config_set(struct pinctrl_dev *pctldev, unsigned pin,
			  unsigned long *configs, unsigned nconfigs)
 {
@@ -726,6 +732,13 @@ static int intel_config_set(struct pinctrl_dev *pctlde=
v, unsigned pin,
				return ret;
			break;

+		case PIN_CONFIG_OUTPUT_PERIODIC:
+			ret =3D intel_config_set_output_periodic(pctrl, pin,
+				pinconf_to_config_argument(configs[i]));
+			if (ret)
+				return ret;
+			break;
+
		default:
			return -ENOTSUPP;
		}
modified   include/linux/pinctrl/pinconf-generic.h
@@ -90,6 +90,9 @@
  * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
  *	this parameter (on a custom format) tells the driver which alternative
  *	slew rate to use.
+ * @PIN_CONFIG_OUTPUT_PERIODIC: this will configure the pin as an
+ *	output periodic toggle. The argument is period in
+ *	microseconds.
  * @PIN_CONFIG_END: this is the last enumerator for pin configurations, if
  *	you need to pass in custom configurations to the pin controller, use
  *	PIN_CONFIG_END+1 as the base offset.
@@ -117,6 +120,7 @@ enum pin_config_param {
	PIN_CONFIG_POWER_SOURCE,
	PIN_CONFIG_SLEEP_HARDWARE_STATE,
	PIN_CONFIG_SLEW_RATE,
+	PIN_CONFIG_OUTPUT_PERIODIC,
	PIN_CONFIG_END =3D 0x7F,
	PIN_CONFIG_MAX =3D 0xFF,
 };

As for timestamp of input, we would likely request the input as an IRQ
and use the IRQ to read whatever register, wherever it may be.

Do you have any comments about this? Should I go ahead with current
assumptions?

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAloNWm0ACgkQzL64meEa
mQZ2eA/8CScexsESoTfWyrMBeZfhl9QwoakY8fpxYhBbjSVAtTAaPNVovKLkdWIg
/dZyuxKv3oSOdVKoQvqG3CUm+1dx7X9hbYXpsEGSoLbSAZ8k2PXP9E4pdusj2He4
FSi60VwnJVck7uGH3Ul5yp1AQKC4fNufSizdlECJ9LyNijgJe+3U5QyW5PgYBnmh
TJYk+QNpwtq1fbX3tbVPppM5tycnMx2qrcTrTsxmAVEd9Q1SH+2+ZWgJJ1LmXuvD
c9coCxXXcHBGO4SE6zZ4zukGk5afCrjy65FD5esHomvinEkYnFEJuoMtTwDCR5wV
PBerCYulvjYxVevW2si9HAVWC4lzFTa0RE/w6IMwT1cNB8nYbekc7e5suC20jX/W
p5KVaZBNRwzotw4qWkoTsi6hmYVlLkpVUeuC4eizXKWhOVIC466CZ2YeIZVyadVT
ydE66RZrRx5UF3JqllrV82i13xtk0kCHIiLRnRHmxboCk336oHfiuLvNR/LK7r08
nDqsNoISpbAQlMVrmkuWD8KP2nIIH+uZVJKwGCmiFJA/wgRkJf2S4Xw1pFrvS77T
dcW+QK4OVf085Qh7iuyAJIJrsp57mM6cTutNb7zYogih0+Nvz21qPLNHb7N1BrZF
DxYB0TkVC80oLkMSYhxXXNg+0Nd2ClaJ3091xl7vAAOFxnMZgyI=
=KmPb
-----END PGP SIGNATURE-----
--=-=-=--
