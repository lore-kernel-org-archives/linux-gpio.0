Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002854;
	b=V7MgN0V+iT5HhXZAfOusmiivagHvgGNcrXHU1r9WXzpyHH4AHA28iUzOnsZpzolX190s
	 R2MzChtBHeKdWNFw8nJL0CcoaYWMwwFVZEkL/RGZbcBLQmCPHFHgoFK/OAd2XUcIux7Bn
	 UeEV+ASyGylJSda2Hg2vOq3K70XMyQfxoZ5i6nZJebArmJx7MiIzOt97Oe3hMwKMR3yir
	 1aWmWwfXk1gsDHCRQtOFT5ucoPTCBMfgg2s/8CLurBKbR61be3izL90XEPOeZ4bZBkleo
	 FyHRBdkqLAE58TpyQHdAuhiw3dcshPVFiybnFuKOQHgcPtIIkOhW7ESM29G0vVHNlBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002854;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=T/Wed2wkIxaLiq4pFLT/70s7XIckzWPpLQaCHz3q10k=;
	b=gB0fd0aoNsjBtgb4VNkwP5VOMeN//e7aCpjO/yNbUiiRgXsVmSnToCTnfrG8hgfciGT9
	 hSchrlejvSBnPlBgGHdeCaNjMUvAnbyUendhGiFfgs27Q0iYKBPg18zaI6DcJe37kYBgy
	 kKC+FLniuDDVhUaTK0P1c4woupoKCm9xloQsWP8OzPBR+cKBqH3ziT+Uhy1HPsMkQhdr4
	 08NG9hZy1Ebzr6SlRnYL0RvSCYL6Xe7rNUjcfssfPWuVPN2S3Be4wwlC98jDlKyJvlTjf
	 dzEU/rPOGjPYiqAme7VFfc96lFMxizTacMjfgELMQw5czNn925I3c82iuHMZN6030QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=none smtp.mailfrom=master.debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.master header.b=0uVUiacC;
	arc=none smtp.remote-ip=82.195.75.110
Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16768606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 08:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16768606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.master header.b=0uVUiacC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	In-Reply-To:References; bh=T/Wed2wkIxaLiq4pFLT/70s7XIckzWPpLQaCHz3q10k=; b=0u
	VUiacCXvdjzk84XXRx9f7XSiOyD/AQb6a+z8OXj1xOu1szMP3mOY+kXzbTTZrHsjVxseR72hdfFs0
	PaCB3z5TGgfa5z473oUKCzXov7suf162/rF3lxOiqLFRxqnvGnPFxoNsBLSmFNi4zxjPmeoTm5q0W
	lh7cojHSl4Cx7g+tr4pmqNMxOpXnzuW50N+unIEeuDnVLIwWDqyyAQkb6w71PQKTgBeJhUbkdhfty
	62+MWOoKT2tSp71Axq3Q/wldg87vvR5B6R5NVnQ3yYhYPIofJ2IoHrlNhJo124e4jnu2NcK02v3k8
	SOPOMtHzOsr9UemQEYQXfPf4asgB7Fdw==;
Received: from ukleinek by master.debian.org with local (Exim 4.96)
	(envelope-from <ukleinek@master.debian.org>)
	id 1xLFwq-001FQ8-0e;
	Mon, 26 Oct 2026 08:20:52 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH v2] gpio: pca953x: Add support for Exar/MaxLinear's XRA1200 / XRA1200P
Date: Mon, 26 Oct 2026 09:20:40 +0100
Message-ID: <20261026082041.696626-2-ukleinek@debian.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2096; i=ukleinek@debian.org; h=from:subject; bh=uORm1+sr941h8AyJnpv1NDOX9awvNvc02Y3RsEJIjbI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqz7vJE9d5/wdaZ+29FjVSV7LP/w0l/xIlfeRc04EHi1v /HUJM6ETkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAm4v2D/X/Iy8knpmg1natw iTAI4ZK/ov5lfZdcy/WSpFny934+vf7d8A2Hd0bDWd0j5XvrJ8TZ3TkvI/hHR69g7padkUtcfC6 ZajSLbdNN/G+11LzU5Zz2S9WirMS3Jqo15r+3Z/vqseSGJP5XiGvfYXa+2cTwaqay6togFm2fBV ZPuf87tQrvZljrkBa8mGf3ZIunSo3CDAwPl+Q5uF1aUKsqpyygsmfixXD57XLrYm59PyLOVuywO LqZIyBmWt6qGYXab6c1yrk6KnUlu13Jc990wV/s1/xHJrzxag++97B/kz25bf95va1KPyS2uYda n9hw36RJ6OHWRdZ5O783SDCu8Cjfp1/snTsrQ/dDWpoLAA==
X-Developer-Key: i=ukleinek@debian.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These are documented to be compatible with PCA9534 and PCA9554
respectively. The difference between XRA1200 and XRA1200P is, that the
latter has the configurable pull-ups enabled upon power-up.

The chip was initially built by Exar which was bought by MaxLinear in
2017 and the parts were rebranded.

Datasheet available at https://www.maxlinear.com/ds/xra1200.pdf.

Signed-off-by: Uwe Kleine-König <ukleinek@debian.org>
---
Changes since (implicit) v1, available at
https://lore.kernel.org/linux-gpio/20261025154840.657888-2-ukleinek@debian.org:

 - add PCA_INT to i2c_device_id array
 - use 'exar' as vendor in the of_device_id array as they created the
   part initially.

 drivers/gpio/gpio-pca953x.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index afec5ec23696..721f17cee89d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -124,6 +124,8 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ .name = "tca9538", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
 	{ .name = "tca9539", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
 	{ .name = "tca9554", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "xra1200", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "xra1200p", .driver_data = 8 | PCA953X_TYPE | PCA_INT },
 	{ .name = "xra1202", .driver_data = 8  | PCA953X_TYPE },
 
 	{ .name = "tcal6408", .driver_data = 8  | PCA953X_TYPE | PCA_LATCH_INT },
@@ -1508,7 +1510,9 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "onnn,pca9655", .data = OF_953X(16, PCA_INT), },
 
-	{ .compatible = "exar,xra1202", .data = OF_953X( 8, 0), },
+	{ .compatible = "exar,xra1200",  .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "exar,xra1200p", .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "exar,xra1202",  .data = OF_953X( 8, 0), },
 	{ }
 };
 

base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3

