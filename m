Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E2B4570C5;
	Tue,  4 Aug 2026 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838952; cv=none; b=Xcnd5rDyH+Obt2Ap7zIPJp9ysKPVxrzruqm86iRQ0ff9YN4cUhcgrXcfy2lQw9Xfn3Me3+9hQ1GPISM7exMdNMvGxkoQLmMazsND3PKxHj5dmb2Qr5Wd7dJ6/oyib+2nIx0djBm0hvCFHR093g2hjbA/IEp6mvBEaa0d5srlzhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838952; c=relaxed/simple;
	bh=ZTadhVg6AtUC4v+l90c7b/loSdJ5IvVwzuW4ZcqWLhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBTMUv+6Wrj0rTA7DyA4XKIt792Xdiy1P53gdT/4MfOAS4iChWfJ3RGiauMBOFpplRkL/zUuyore2rQksJn0zoxeAYhdikwiSoQul5YGg6PoH6RJZAA6ZGYJTHGvZaUxW4n0X20VtAxCurPanE3nuh/EH6vvn/AmTZR6Cohu334=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pRX7kmyU; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pRX7kmyU"
Date: Tue, 4 Aug 2026 13:22:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785838948; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=RfLGwsjCP60Ir/hOAeAbRvgZfihCYMIhCQhPuXNOxB8=;
	b=pRX7kmyU4gLW/WKkVvQNr/6WXGweW2RacyZNxXIMj1MvdE8Smbht9adQuqeDWDTFHGJF8R
	s9SMfVmjNSpVb/+3gTyHJq0va9V9Y+jSCOopVSBdwFxHz6MLRawJ+TY4fJr7c6semtgvK6
	uycHx/6oC85mq3qDnPgvt8kAcfYhHDc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 06/10] rtc: bd70528: Support RTC on ROHM BD73800
Message-ID: <bc38e6da43919a745f2fe953c98c1fb67e793474.1785838585.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1785838584.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iQjTmZB97oqapRWx"
Content-Disposition: inline
In-Reply-To: <cover.1785838584.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT

--iQjTmZB97oqapRWx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

BD73800 contains similar RTC block as BD71828 and BD71815. Only the address
offsets seem different. Support also BD73800 RTC using the rtc-bd70528.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

---
Revision history:
 v1 =3D> :
  - No changes
---
 drivers/rtc/rtc-bd70528.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 482810b61495..fd415e327ea6 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -8,6 +8,7 @@
 #include <linux/mfd/rohm-bd71815.h>
 #include <linux/mfd/rohm-bd71828.h>
 #include <linux/mfd/rohm-bd72720.h>
+#include <linux/mfd/rohm-bd73800.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -284,6 +285,12 @@ static int bd70528_probe(struct platform_device *pdev)
 		bd_rtc->bd718xx_alm_block_start =3D BD72720_REG_RTC_ALM_START;
 		hour_reg =3D BD72720_REG_RTC_HOUR;
 		break;
+	case ROHM_CHIP_TYPE_BD73800:
+		bd_rtc->reg_time_start =3D BD73800_REG_RTC_START;
+		bd_rtc->bd718xx_alm_block_start =3D BD73800_REG_RTC_ALM_START;
+		hour_reg =3D BD73800_REG_RTC_HOUR;
+		break;
+
 	default:
 		dev_err(&pdev->dev, "Unknown chip\n");
 		return -ENOENT;
@@ -344,6 +351,7 @@ static const struct platform_device_id bd718x7_rtc_id[]=
 =3D {
 	{ .name =3D "bd71828-rtc", .driver_data =3D ROHM_CHIP_TYPE_BD71828 },
 	{ .name =3D "bd71815-rtc", .driver_data =3D ROHM_CHIP_TYPE_BD71815 },
 	{ .name =3D "bd72720-rtc", .driver_data =3D ROHM_CHIP_TYPE_BD72720 },
+	{ .name =3D "bd73800-rtc", .driver_data =3D ROHM_CHIP_TYPE_BD73800 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_rtc_id);
--=20
2.55.0


--iQjTmZB97oqapRWx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpxvVsACgkQeFA3/03a
ocVq+gf/Tkb0YiekxH5nYMj7MKydIE8Y2GrQP/sboNHDIW9hSGwGqf4q3KdZIHwJ
13+Acirxz47W8jzrkYqQPIzfZ0nraeTExX7tOB7Zt31i86gN+fIKZTmN5q2REvaA
rNfeadw1TpJFVX4Qp2sMJJuVE8K/qOJ/Uusn9PH81DhILcG0J4y0/4g4/AvFI83n
aFqwmlQTVfJWHf5HeQ/ZKPmBL9XHfv3iDLRzzpkmkvKoRc7/t4rna+NmDRAXaqFt
Powwyy9Fz1dvOA5KapB5tWEP11id1TkUN4sQ/q83ii+YOOncwDdhOoVt9LZ33hMv
qvktXEHX53nXNZYf6m72kYzJLOuYhg==
=rOLP
-----END PGP SIGNATURE-----

--iQjTmZB97oqapRWx--
