Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985416;
	b=Gseo7JpaN06xwYqC29PypLQqsb//0EWQrFwr8wq7a9T4UGq78bgeNIqHxvfV/mJ/PIvs
	 /hywHHQrUfB01/nHhmhZPJDE2OTloDt0F4a2azj12b7rhSxnqdD9gNivK9VbxN1wrguP7
	 kJF0/ZZxYEQCPmob/+pwUfNi2N9FFsoR658410f0nHAXT3eY57aGsNWMcvPbFjSIFTVbx
	 W4wQ50g6PEhQYLqs5YJw21piG7t2eh/vcRxiAS1klEx74IVwaQMcuoNxdnPdBI7sRfpH1
	 HNrRfZaGhXrSZMqGZ8zwJ3eIMGIip/6AuWd9PLBzCn1wah3Pzn2wFXOwYizVa3hKnPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985416;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=h1VBUKnemsO9XaRfaEdwM906RtF4ETg965AOGYzb7pM=;
	b=CIrrHlQ75whn4Wyp3/qbe0uF27WkDJCSZdBe7+0A23AHGXsmg48NMVHoJvLbJ4vYv35Q
	 g0EhYPbm/JeSiGOM9SqK1hyno5o2zBJ/iuLatOnlS1DOcsOtPQw58uRQE45fsqX+afxKD
	 FTDQbvpQksWtralmdvIXluzxvcSPXT/smpm4Boj0zAsFMBR2Mfem41R1y368yftJzcULC
	 bzfl+HT1pOBKs9hfwAONWdzJdk1hewnsTY8RJYwgh4o6xAMD+3PNlwIhL+Nmh2goPFTQ8
	 x1qV61oyQeZ5FEPSLe4rFhRrGf6/gRhCsyIQnigqg4kc6aZZ5iUrdOR9Emf3LA84FWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sellers.id.au;
	spf=fail smtp.mailfrom=sellers.id.au;
	dkim=pass header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=hyg8TeeS;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E42606A32C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E42606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=hyg8TeeS
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id TQHdxtPypyb4YTZhex9H7l; Wed, 18 Nov 2026 07:03:34 +0000
Received: from just2044.justhost.com ([173.254.29.206])
	by cmsmtp with ESMTPS
	id TZhYxYe3UuJrPTZhYx53qI; Wed, 18 Nov 2026 07:03:28 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6afd4dc6
 a=pynxHT4M0AVwz8ROpNtnNw==:117 a=tbVZtiplu92VKpH45hjydQ==:17
 a=zJRp6_cAMcgA:10 a=QzMiS2WfBm8A:10 a=VwQbUJbxAAAA:8 a=tjeQfB6RoHAyGUvcEiwA:9
 a=sW6rCsXrbcaOzks2YK80:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sellers.id.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h1VBUKnemsO9XaRfaEdwM906RtF4ETg965AOGYzb7pM=; b=hyg8TeeSeHVlMc9tDvP9mzfRMU
	XtpWm9AmiL0Ikqz3YfVJ+9dEYQCVAHwCJwCM437+ILMiFabokkWAlSaTlC1tfiuH4uG0ABTQbYDZP
	afkGRs9Px0FlaiI0HEf2HIdwAEyaDavxs1y4vpDkYZqw+/bWw0onp1ughB6wUONVlJdEm0ukr9ild
	qo7uBgYrBofTHdmLtDqUb/f6F29S0LiO6L/26SAflATF5aIU7//DCoJFX+nonpibPeKNATpMsXM/b
	GdDJcIy+RjP36TWQw1ea8HfqNbzGrtD2KQCXNmCY+FeOCHX4M6jdZHU9tPQYW7JAVmFwaltHthMtG
	bqgnLj8g==;
Received: from n110-32-20-158.rdl21.qld.optusnet.com.au ([110.32.20.158]:44998 helo=localhost.localdomain)
	by just2044.justhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <dean@sellers.id.au>)
	id 1xTZhX-00000002U0j-16Iw;
	Wed, 18 Nov 2026 00:03:27 -0700
From: Dean Sellers <dean@sellers.id.au>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dean Sellers <dean@sellers.id.au>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: pca953x: restore output registers before direction on resume
Date: Wed, 18 Nov 2026 18:03:21 +1100
Message-ID: <20261118070321.2557621-1-dean@sellers.id.au>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - just2044.justhost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sellers.id.au
X-BWhitelist: no
X-Source-IP: 110.32.20.158
X-Source-L: No
X-Exim-ID: 1xTZhX-00000002U0j-16Iw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: n110-32-20-158.rdl21.qld.optusnet.com.au (localhost.localdomain) [110.32.20.158]:44998
X-Source-Auth: dean@sellers.id.au
X-Email-Count: 12
X-Org: HG=bhshared_jh;ORG=bluehost;
X-Source-Cap: cmVhbHN0cjE7cmVhbHN0cjE7anVzdDIwNDQuanVzdGhvc3QuY29t
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNa8384N+k16vn+oIsxPIz5lHiAhUYABmGS4xow3i3OT1OvCbEAnF+Cpxi6MR+X1gOLQ8HUaydS7s0TWq0tCHDm5KYprlLEvEYxb05alX1zFxX9WgI9r
 QpCMsrFkQCNHoKykVYNFs5jIalroRi/dHVMithQyb28C1q6ajMmZ0krCl8E40fPVei91xI1tP1dEFu5ND6p3T/CGdsg7biph5Ow=

pca953x_regcache_sync() restores the direction registers before the
output registers. If the chip lost power across suspend, it comes back
with every line an input and its output registers at their power-on
value, which is all-high on most of these parts. Restoring direction
first turns the configured lines back into outputs while the output
registers still hold that value. Every line programmed low is then
driven high for the duration of the direction write and the output write
that follows. Where those lines drive a load, there is potential for a
spurious output.

Restore output first, while the lines are still inputs, and direction
second. This matches device_pca95xx_init(), which already writes
output before direction when bringing the chip up at probe.

Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
Cc: stable@vger.kernel.org
Signed-off-by: Dean Sellers <dean@sellers.id.au>
---
Testing: developed and tested on a TCA6408 on a 5.15-based kernel; the
reorder was exercised through a configuration-restore path there, not
through suspend/resume itself. I no longer have that hardware, so this
version, rebased onto gpio/for-next, is compile-tested only (x86_64
allmodconfig, W=1).

The rebase onto mainline and the changelog were prepared with help from
Claude (Anthropic); the code change is my original work.

 drivers/gpio/gpio-pca953x.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 3b2407690281..270cea8b4b49 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1337,20 +1337,23 @@ static int pca953x_regcache_sync(struct pca953x_chip *chip)
 	u8 regaddr;
 
 	/*
-	 * The ordering between direction and output is important,
-	 * sync these registers first and only then sync the rest.
+	 * The ordering between output and direction is important: restore
+	 * the output levels while the lines are still inputs, and only then
+	 * turn them into outputs. Restoring direction first would drive
+	 * every output at the power-on output value until the output
+	 * registers are written. Sync these first, then the rest.
 	 */
-	regaddr = chip->recalc_addr(chip, chip->regs->direction, 0);
+	regaddr = chip->recalc_addr(chip, chip->regs->output, 0);
 	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip) - 1);
 	if (ret) {
-		dev_err(dev, "Failed to sync GPIO dir registers: %d\n", ret);
+		dev_err(dev, "Failed to sync GPIO out registers: %d\n", ret);
 		return ret;
 	}
 
-	regaddr = chip->recalc_addr(chip, chip->regs->output, 0);
+	regaddr = chip->recalc_addr(chip, chip->regs->direction, 0);
 	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip) - 1);
 	if (ret) {
-		dev_err(dev, "Failed to sync GPIO out registers: %d\n", ret);
+		dev_err(dev, "Failed to sync GPIO dir registers: %d\n", ret);
 		return ret;
 	}
 

base-commit: 90000c03a9f6c74759f773a5078088db81514347
-- 
2.43.0

