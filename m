Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531EB49E148;
	Fri, 25 Sep 2026 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343514; cv=none; b=pfweJsCjRsaDcCxjo3hwM6PuwdkfVcdttqWTvzAma8mh9uGYCaShyBwJXPrJR31ItOD9gFB6Y0+WM/OTPE+ZK0mUnCx2r5gM0QIYQZkLFjCLu8UG8l0CxoN1487mNB012Sb5eS7qv19crRY+ac/uaZeH/EiZDjCHB3LPQJY+JRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343514; c=relaxed/simple;
	bh=PUKasSWL2RitJ5nHj2tqE7JdYBV8ERftRPezkgwUyAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aFzWfxhJRjYI7l8QfoPDmZiCS2Wz8zJm7wCa5sH0MMy3XhiZkBbP49FfSVFFnsgNfDOkTlRu4yp/UB2FVSS2A27HsRktA4md+1bNj9eGgoL2tteKxW0daguoZKB3FcWlL4AO6t0BX0j8kiQrD3eXgKum58+UkQfUPF9F+P2YYtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hlRFwrMe; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hlRFwrMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pa
	LEJk90FeCzQuR6VwX1fOt4b0tKpFek7mwb/9zcrQs=; b=hlRFwrMe8znFxVWx9e
	B+iXT2iDpG2Wlyiik/tnXySynkYq+5FOB/r7f9rP52Q7E81qy6mzzXNcSJ7U4PAW
	JMyl9QtCjmADa6sKbcDZ4EdA/OqfRpEONCBGeCeVeXx1l/dYTLRIzltIDhMPRy2l
	mINJyG0tZxuViopVMr4rw5uI0=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnZ649ebZqlabTAg--.10528S2;
	Fri, 25 Sep 2026 21:38:06 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Linus Walleij <linusw@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] pinctrl: mcp23s08: reject devices without match data
Date: Fri, 25 Sep 2026 21:38:03 +0800
Message-Id: <20260925133804.2231004-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnZ649ebZqlabTAg--.10528S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWDGFykuF1UGw15uw17Jrb_yoWDKrc_Ca
	4xury8X3s5Ga10gr4xtF13ZFyvyFsrtrnYvrsaqan3CFy3Xa45XF95Wr1rGws3urWYyr9x
	Ar1rXw4FyF1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuLvutUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzh6172q2eT5fUgAA3c

A device bound through driver_override need not match an entry in the
driver tables. In that case spi_get_device_match_data() returns NULL,
but mcp23s08_probe() later passes the result to the regmap setup and
dereferences it while setting up each device.

Reject devices without match data before reading device properties.

Fixes: 2e44555b05c0 ("pinctrl: mcp23s08: Simplify probe()/mcp23s08_spi_regmap_init()")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index bacebcff67ef..926034fcd512 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -146,6 +146,8 @@ static int mcp23s08_probe(struct spi_device *spi)
 	u8 v;
 
 	info = spi_get_device_match_data(spi);
+	if (!info)
+		return -ENODATA;
 
 	ret = device_property_read_u8(dev, "microchip,spi-present-mask", &v);
 	if (ret) {
-- 
2.34.1

