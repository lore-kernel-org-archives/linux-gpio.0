Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943338;
	b=bR6qHCIEE3bKvMIviUnErstCRGutkbIJsIxj0wgxtDBkMGggW+aWioTZrny874p5qu/B
	 UIoiKz/GDhhXO36VUT3t4jvxtoqeXhwwkID1orWr67V/uc7XGkyvzizCOXqtNHgXAO5zV
	 OrIrxNRVt6co1nDMsbMEd9mRPfoC39WXw33bj7dNRlrmA3xPVtN5zN9ayFnYZzrjK1/LC
	 qiB1t36YeHiNYXqWDyqFAfmBf/QuGvDzMGHgT6bfGwPuYACFGG4Z3LlLQmQpqYXh0sywK
	 0Ld67PmIGzXU8JNnbmwfJJ5FK2+a89Hyo3/KzTGL2hXprhPJ8ZMoh705tjI5usPVD6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943338;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=OwIRfy0BTm4A1J34tMOinBnqIFx+G7jjinpDp0Bl4EQ=;
	b=tTFyD8SgMaX0lETCCfwZZboei9L5D1sKAk55WS2A2SJZZwvgu9/gdmng4UrINJT1SZIy
	 vLu6WxsLOIHld7EkQIf9nf9dC4fuEZHHuQcjX3KJLip9Z1wC4qLc3nBPoMQeE8w1sb9Wt
	 Y2LyPii8sdQt4e4XnO62mbpGle0VEGvMQDDFrvBf22nYUJ7F6AEZLBW+ao4hkZR2/3wqm
	 15Wuu0LHqLqvRWpCz7wobe7FxdnjHOBI2AsmUDPPFtZN21cmR/bLwVgHY9mkWE6kNoOgl
	 M5TBLdxjyAFClBSle87dLQBi8Jxq+Ij6EuA9T1pzT4Ec+8Wph7ZTuxTrUT6l9CvSToQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=none smtp.mailfrom=master.debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.master header.b=fewSYMcL;
	arc=none smtp.remote-ip=82.195.75.110
Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8801606A31A
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 15:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8801606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.master header.b=fewSYMcL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	In-Reply-To:References; bh=OwIRfy0BTm4A1J34tMOinBnqIFx+G7jjinpDp0Bl4EQ=; b=fe
	wSYMcLIPi9zocS9vERDV5rLkeIQm30HkCK0qMQ7NE9QeClX8azQeP+FpntIxen9BfTPDrdJSeHucg
	rXfDPjnPrA4M5itSPXlZUen4oqpz1eob5aDQk3aj0DQSYcf/Q69Ynt6gHkG2XEfsyi52PaGHWMT3Y
	jSu492MRJ0d8cSjVyLTTPUC+3fSitL9Wi/ANYZrf68UCMdtI7EDWRfbA+ooAxSbyyI4tXiqACc9mR
	Sl8NwdB/aUvjyVfFonLfjzBPg4IE547W1tEiiL7/Yx5eLWwJXSVRiUeuyWoiymWUppxmjO2/vNgMc
	CLN3j0VrIOi6qVzj9JDDX3JgdSxpfhYQ==;
Received: from ukleinek by master.debian.org with local (Exim 4.96)
	(envelope-from <ukleinek@master.debian.org>)
	id 1xL0So-00013s-08;
	Sun, 25 Oct 2026 15:48:50 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: pca953x: Add support for MaxLinear's XRA1200 / XRA1200P
Date: Sun, 25 Oct 2026 16:48:40 +0100
Message-ID: <20261025154840.657888-2-ukleinek@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714; i=ukleinek@debian.org; h=from:subject; bh=HTllxPd2KB42SEaA55lFQ/gSM5olBWKb90xTYK1Beic=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3iTZ1ewFyhQBZ+JDBA+FRV989uUgZtIL9/Tab xwyxUb6bpCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat4k2QAKCRCPgPtYfRL+ TsMYB/43fn1XEk1x+2u4tjw/3p7FYB1us9AZC1epYcz16lSGPF6Q3JsaO5evygtdtJqc5BNUbRB bU5LDrf/58uEuFqk+G5c4M9fTSsuN9N4HJchBjLVJzCnXsE5ENxcE1+xc1dr0/LGppISgmJH925 JgGT7wF0j78WWT1xrmZgIn1YjarVvHDR1PpVgMOeqMTVgNKXCfuwnLSDRiH6e86Qr7z/IHI1ZRQ zSK3KHRuGoRdWp0PiSwUYfNPJZNPtQy3MEfEt5Gia5YAJT7VjeO+vAy+KWBXL58Ml943x1bSuhI xxWICAS9kKufNL6bFlY/ONn+P9v7Zv2Zz/r2uVZxEm+XBvBh
X-Developer-Key: i=ukleinek@debian.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These are documented to be compatible with PCA9534 and PCA9554
respectively. The difference between the two is, that the XRA1200P has
the configurable pull-ups enabled upon power-up.

Datasheet available at https://www.maxlinear.com/ds/xra1200.pdf.

Signed-off-by: Uwe Kleine-König <ukleinek@debian.org>
---
 drivers/gpio/gpio-pca953x.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index afec5ec23696..ea01fd152ac2 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -124,6 +124,8 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ .name = "tca9538", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
 	{ .name = "tca9539", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
 	{ .name = "tca9554", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "xra1200", .driver_data = 8  | PCA953X_TYPE },
+	{ .name = "xra1200p", .driver_data = 8  | PCA953X_TYPE },
 	{ .name = "xra1202", .driver_data = 8  | PCA953X_TYPE },
 
 	{ .name = "tcal6408", .driver_data = 8  | PCA953X_TYPE | PCA_LATCH_INT },
@@ -1485,6 +1487,9 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pcal9554b", .data = OF_953X( 8, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_LATCH_INT), },
 
+	{ .compatible = "maxlinear,xra1200",  .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "maxlinear,xra1200p", .data = OF_953X( 8, PCA_INT), },
+
 	{ .compatible = "maxim,max7310", .data = OF_953X( 8, 0), },
 	{ .compatible = "maxim,max7312", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "maxim,max7313", .data = OF_953X(16, PCA_INT), },
-- 
2.47.3

