Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9492DF13B;
	Fri, 12 Jun 2026 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301142; cv=none; b=BzFy8HjiNtV34U9+k6Cn2Rwij6QUJQiWhyUua0xUTc6oY93ypJsf40v6Vg5TOjpjScqwIY3NgweVpNtlbEbxn29rC03TPA/JII/IVSCM29TR+JEi5C7af7anjyM2rfwc61br+v+l75fTrBA6H+HXNMJsLzCdafmI0FD/Bw1lySw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301142; c=relaxed/simple;
	bh=OFTU3FXdKP7KdU/zCT2sGW5F4uSTL7T8jks7Xz/Y6N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z8EiTAFUzEfHSWx7jCJUiKz1KcBfcw3fKnnLgmuCLRjohnMFYjyYyGkFV1tZamHcXkXR2FbmFR+xW0z7w1Gtdop5/jyz/50kqFJZREgP5QJjPevZHyLLID2JZj0T4LihWwwzMpDw6rA+ZJhUEyAw4TjiF8nKfS4Lj0kltFxQx28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAw4ZiBs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAw4ZiBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBCB1F000E9;
	Fri, 12 Jun 2026 21:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301141;
	bh=JWT1H2uBGNeOO2dDZ8KfY0M6xARI3UrqCDMWpE/ZZLQ=;
	h=From:To:Cc:Subject:Date;
	b=iAw4ZiBsI8IQqFQkl8+plhIEKBXrkievRuGRQIBUjT8gmXhT6coeAkxO0DSB8YIiW
	 pzzLGxChvXimK+KqDdWkFF4v5hot2UNCczrMXL9f1Ptt6ZIw5ZIJasRvQidw/3L4hw
	 7hSBW9gHIAVdZcTkKVpQ7Gx0GiBGOh5H5hhys9NY+A3EmNKlYhsx4qUtp3Dfezot0p
	 vrGZIu3GFv0zoeG9Q1aWP+sipnw++05puLo7iCHFTGiBt5UbBpfkeWBRGZsfbfF49j
	 /IuN1D2codICd91FUt3tGooOWZ+Udf8p4kRPoeEG5QrYRf1ZcIuYWwb3eOHzd5418e
	 n4hGC4GNOoylg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: pisosr: Read "ngpios" as u32
Date: Fri, 12 Jun 2026 16:52:16 -0500
Message-ID: <20260612215216.1887485-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic "ngpios" property is encoded as a normal uint32 cell. The
pisosr driver stores it in the gpio_chip field, but reading it with a
u16 helper does not match the DT property encoding.

Read "ngpios" as u32 and keep the existing assignment to the chip
field.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpio/gpio-pisosr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 7ec6a46ed600..2732ea8c16b7 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -112,6 +112,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
 	struct pisosr_gpio *gpio;
+	u32 ngpios;
 	int ret;
 
 	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
@@ -120,7 +121,8 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 
 	gpio->chip = template_chip;
 	gpio->chip.parent = dev;
-	of_property_read_u16(dev->of_node, "ngpios", &gpio->chip.ngpio);
+	if (!of_property_read_u32(dev->of_node, "ngpios", &ngpios))
+		gpio->chip.ngpio = ngpios;
 
 	gpio->spi = spi;
 
-- 
2.53.0

