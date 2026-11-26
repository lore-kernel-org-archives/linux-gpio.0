Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716202;
	b=ytyFSnDwdpaosuwR5eW6WhZ3ppreOZ1nVf74Tmt8HLOi8xBEwHIvpbWFGdwI4gsKoWHu
	 yIhFRe/jD5ayx57OUnD1xi3GunD1wpC6XknprvjDuXJuQrBMiQSwazhgeuh/BaxTOn4k6
	 ZDqVziKhKaJBu5A2xI4DCDgqa3p4qlDBmguLl3RlOaERwwq1fJYHX651Dg+42wbhE2XJc
	 p7leDzK0DUjMg/JF1ffn5kkNvY3DUKLwi8fn97L8t9CtcIhoHsjThNcjr2LIcAPg9TIXJ
	 /c+NOFyXGVth1PSRJKZApxLeG0ZeMTuXnago+Jor4kEJsXvTsxZKeA3mGwK1eEauA0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=byjiEAVbgVFr0Nir+Ue5CFd2zsKVy7OkbkAJjnT09DI=;
	b=WSVce22xqWjiHjtRMqmp5A4ASBliyNLR+V3TrXW8PWkG+cQGRe/nzueOhFM9n/ohQPzK
	 3gOq1lw7Ac62R3nplTDNwRTVxVuKRoQwRhMxlhR0A0E/j1L0Ygusp5Ncz6oMwHjKC1sJ8
	 4rBMpTr5BwsYbIl6nZXmY+Rn78UqzjGe1toN+raR6TOqguRyi3d+EQ4miV6kX+Swp6xdp
	 RYSrAqLZSiOC6z4CdpqVVX3tyO1yBL0iBRFDNOztljWXhiqXuNlsxjXz+6DjcDzK2Mt/A
	 46rZA0dbzs7rV0IYbmXUUmuNUVMDAfw4E8d+XMqx1tlK/Zg3ZHCyhdCAOr+VwvTQS2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NAK/uEvn";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8518606A32A
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 18:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8518606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAK/uEvn
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4353222f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716200; x=1796321000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byjiEAVbgVFr0Nir+Ue5CFd2zsKVy7OkbkAJjnT09DI=;
        b=NAK/uEvnGhKF+M0LNPHchp71K9d6SgR6eBnLmdYlhqJ1KvCK/46Wt1KOoRWjBXWu6l
         WOCZDbdb0Ovx0QxqWmOmyDm7ULACSwAYC5cMYH5V+tNW8T4mG2akD47or0ZbbjtYBulx
         6p3piW3ShqB2/U00vqg55ttqjeL9TdWoSiJ3iB4PZKI+JhQgrkW4+2D830//EvEuKmPe
         MqpRdoJt3vbGESd5rlyWwLEMgaExPGhDIC4QmXTiE4da0FtRAxOonWCdqLhm6Fwo3Y2E
         yU8Xig+sETNRy/ZZ6uPY95qiTrLgKw925GwiEXj2rtrZwMnqnTIfYMYDzpgnF0NVyISC
         Ayrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716200; x=1796321000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=byjiEAVbgVFr0Nir+Ue5CFd2zsKVy7OkbkAJjnT09DI=;
        b=QEcYx78tStjvGxQ7d4OUxf6uLGoPgy7hSUlm03prBtxo4XiIrP8YRjr/5zNiocTLxN
         gf3/l9FW9NjGO9vfQKbsCNuxeNO/pQET2xWpsOMQAA1S8F1r2pMjCRSzLP/NZFKF9oMo
         42iqR/1ZFp+LI9lYfjFG1pxD22l7omN+ulebvp58AISoaM5qKV37bsRGA3LsO74kgisu
         91ZCIpNqIt6TqcbzKba+W++w3qIhu6upZ2Wz4zP+LJmKPRw2SrfhjVGROSY2O+AWBdBk
         wY9yIZ/LGGH4HvV6fe++zL8h1j2U1clQ7eOGMfO5hUTf5xr4u4grCaKLwy9gAzIWoaff
         4G9g==
X-Forwarded-Encrypted: i=1; AL+hErFLU9ThPN4RbdNOnyG4R1L3sruTLj08KgwO6y0LohQLQYVZ7VlDfqHwTpJoFSnkvYh6kF7/TmgmF/Z4@vger.kernel.org
X-Gm-Message-State: APuU4Z/W56IQqDDeuSkYC8UC8Q80YxKTurjN85fX+wZz9qdk73xrT3yG
	ltUHUELzgwWt3X7YZIC+7WDD12G7GUPFuF/k0AP89SICuLxHZrYVyCY=
X-Gm-Gg: AZFdTZe4ARzkJC70m+xxBvKrMkFzsSRF2Le9QxXKikzf+Xw3q6sY5/I0Q7kLh5SmUsf
	vC/NAZl4lJNCZ44+EVCn6D1hXlG+Ab+FlA//YjEExzCFcW65T3mL6KBjAA30qGw4CZReW4XRcN/
	qaBo3UOBkMiIRne86Q/bkXF5Afh5cqFwJH7g5O08Mr9d8Py624YZxfWV9HCDcTFGrMdrGcbszdH
	mTq30q2VBqIwNuMyU+1DqL1PcM9UkfmWJWrNGOBpcQ9jkpRp4KvQiKHDN5Kw5alT+wG/fM76HhZ
	3FTBeqGp3YiYjKTYSjzb4EyIp5WArjpvJ5KI1LpioH2roX0Kut564s0bK2bB4FZs3sicOJngAZd
	hDrbFQcJyaufRQwmkn9j2d+cU/Bx05IxlWnFgPEMK0GqD4rdUcJT5sKkXdIzOcoSjOaccYtUu3J
	o8shtQ/cvv1qQ4JeLQgrSu3L/btgBX4cIAXojm03D9NiN9rrI3mTLu2j6pi6TEEPPDv0w27wlVd
	Ad2fFMdCHRaMT67z5NxaJ0p0I8a75GSI0Kmxq6fvY5iuDX+RfN2SVBq5QlJs2t42QnVZqXxTv1R
	nA7BJ8ijziI46gStY6jmNd22p9Ah9lBN3zj/U1ClhjmwsmUMTGLgC0JEtPX26kQQNieAa/pQFyK
	XFXbAEaZYms5TdbmP4I7TSoTvHV6ngwJsRxUhfy+cPvDWflzl3Dpg5gu0tOI=
X-Received: by 2002:a05:6000:1789:b0:491:971a:c568 with SMTP id ffacd0b85a97d-4abb3861356mr40253790f8f.10.1795716200322;
        Thu, 26 Nov 2026 10:03:20 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:20 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 1/5] gpio: fxl6408: Fix reserved register access and disable burst transfers
Date: Thu, 26 Nov 2026 19:03:11 +0100
Message-Id: <20261126180315.98034-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
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

All valid registers on the FXL6408 are at odd addresses (0x01..0x13),
while all even addresses (0x02..0x12) are marked Reserved in the
datasheet. In addition, the FXL6408 datasheet explicitly states that I2C
burst read and write modes are not supported.

Currently rd_range and wr_range specify { FXL6408_REG_IO_DIR,
FXL6408_REG_OUTPUT } (0x03..0x05), which exposes the reserved register
0x04 to regcache_hw_init() and debugfs, and causes REGCACHE_MAPLE to
group 0x03..0x05 into a contiguous block that regcache_sync() attempts
to restore with a multi-byte raw I2C write on resume. Meanwhile, the
read/write OUTPUT_HIGH_Z register (0x07) was omitted from rd_range.

List only the valid odd registers in rd_range and wr_range, include
FXL6408_REG_OUTPUT_HIGH_Z in rd_range, and set use_single_read and
use_single_write in regmap_config.

Fixes: 03810031c91d ("gpio: fxl6408: add I2C GPIO expander driver")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/gpio-fxl6408.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 8a7e70180efd9..9f80ea1214e03 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -45,13 +45,16 @@
 
 static const struct regmap_range rd_range[] = {
 	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
-	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
+	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
+	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
+	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
 	{ FXL6408_REG_INPUT_STATUS, FXL6408_REG_INPUT_STATUS },
 };
 
 static const struct regmap_range wr_range[] = {
 	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
-	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
+	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
+	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
 };
 
@@ -78,6 +81,8 @@ static const struct regmap_access_table volatile_table = {
 static const struct regmap_config regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.use_single_read = true,
+	.use_single_write = true,
 
 	.max_register = FXL6408_REG_INT_STS,
 	.wr_table = &wr_table,
-- 
2.25.1

