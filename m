Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449903;
	b=nqBX9NcyNo/CENntqfBgvLwwQRWJ9i2eYQjugvwKTyh38ub5IvgSpPasBQFQ2cKmISCG
	 bhvYfnUvntXZdCzRg1F1HWfRkzj3nnCQRCBTEJiyEqkon5sWLjPY6G0Gd4Q9tdz26gqNT
	 u15r5afWjQ2R5NJQo3bQ3t9SJstHTHE3yh8NDGemeqXsOmnYLKzBptwWg8N85fjw95YX+
	 UkZ+09j4F1o9LlN/0SnUeiKp5tIYTuPrAXbm+fiWgxuK6qwQlS4v6J5AhzMBAHhmAplkf
	 e9k34TJ5IG9h7/IzP5XJxu0K2sZr2fJ2BPXxIOauzD1/y5wRK6jNr4f/JTjFqhdXRDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449903;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZoMjrMzQeBH7iKc7EEEwSoDdM+1d7cDwqbiWlwo9rYU=;
	b=CeQq7rT0wHbT+DmIUPaD3eu6XdbGhhyPO9hb79SYnyfTfxsvuRfH5LM5bmF4vSSzoUHJ
	 1fdiPpIQj5U/nr0SS3FtXGG2b6J6KeasIks5VkTm3fw1AKDe+EkWUwKlIGOL5PENTFmvS
	 H6HESAtCAICE/otWNqgkvf4IbXM7hodKHmhc7a+JtAcJoQJWgs1QjGjw9d067hu9OlxNh
	 7Vq6L30mxNT6kpGXI2ZMh4pSvAM2A7Q0aT+G4oS57PglN+vVJDEQr7MmSPtuHPPPWRSQR
	 BPMusGwtLT5EvemlWXdauKHKbHruFKWogUt12eoBKG69Bo53Tzd2DBgPWrbRoDgW+bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=uRgbo0IG;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2DA606A31C;
	Thu, 12 Nov 2026 02:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=uRgbo0IG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=uRgbo0IGvedd5iyfXrlBxltDPdFW6MhhKCajoVtmyP830LQmrXf0n63O33W2+bMzgMnRGXukTVukg
	 FV/eZbYiR5nFJ9KqexmmGNEP/vKBNOYqQajoWm1rdQD/PpHApEjyPVIgG1fJx8ePykkPEeyHpeOFlY
	 EgELWQiC54hoQ7Yw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af521ea753-186b0;
	Thu, 12 Nov 2026 10:18:19 +0800 (CST)
X-RM-TRANSID:2ee26af521ea753-186b0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af521ea351-ee7c6;
	Thu, 12 Nov 2026 10:18:19 +0800 (CST)
X-RM-TRANSID:2eea6af521ea351-ee7c6
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: geert+renesas@glider.be
Cc: linus.walleij@linaro.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] pinctrl: renesas: rza1: Put fwnode after parsing gpio-ranges
Date: Thu, 12 Nov 2026 10:18:18 +0800
Message-ID: <20261112021818.1819-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

rza1_parse_gpiochip() parses the "gpio-ranges" property with
fwnode_property_get_reference_args(), which takes a reference on the
returned fwnode.  The function only consumes the argument cells and
never uses the fwnode itself, but neither the function nor its caller
drops the reference, so one reference is leaked for every GPIO port.

Release the reference right after the property has been parsed.

Fixes: 5e455dd93397 ("pinctrl: renesas: rza1: Switch to use for_each_gpiochip_node() helper")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index d2949e4db..76a61533f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1183,6 +1183,7 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
 			list_name);
 		return ret;
 	}
+	fwnode_handle_put(args.fwnode);
 
 	/*
 	 * Find out on which port this gpio-chip maps to by inspecting the
-- 
2.50.1.windows.1



