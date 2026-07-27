Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B863BB4A
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785154837; cv=none; b=KJrDViY6CnDpxKVY5ntYRS7ak0AUXbF1iXgchD4R4+aXHkhszlfNnOUH9QeJbAqRRKuGxK403a02yednd/6cQMxjjU5uh3XmZQLjhCb+vhueLO4bzEP2AlJfKGdUgQEXhjObseUArcSJTCTTV1RuevlHp3D4xfOv5AlrqO5gP2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785154837; c=relaxed/simple;
	bh=PksZ+j9puDCiymgXA6vzYLuCtaom0yh5ichLqB4vxj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OORL1TTnf1yq6d9Dfj2Xmf3Ho3kNIM7MOnqhbr/F5xnyXxzQlL0fp3ckkxz72WnJWqk0V3HWOd0zLyJE5SU0lHK2OLHpsgQUcMY+CFJTwtOpEpuy19TCMeHcbKHn1kQ1a6YmOR9kQxAgeD0O8AY1eezrRhwL8LyHwzXt9siEFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=ABlC20mD; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="ABlC20mD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1785154830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jqPcJfTZbClirTT1Zqkxulql8Pk1lN2tenSuewadsDM=;
	b=ABlC20mDchDTObg3R+VakSr8m7/P2rY4ig8Jem4U2BLrake9L+bea47RcJZrCRJ44Tw7u5
	J9vxGo+pxVC8SGrnRLl4mtxK72IJWWG+BWzOHglHiUfCZXWlW9JyCreZhZpBs4dMVWp9c6
	xMzx1k3t1RhHBA/UpNmFCT8x/quZfgoRlYnKP4aPXMT+zzLlrY7u8uGAdIJE3HQ3/c18uZ
	YVUt++CQFkOiUnBdWUIHe6/c0pni9dbZeG8yJADQZQdaDW++GqG13BrxzyzUawlpNgUL1p
	sQhsfUcS9YpRhZIsN0TMMH7g7aG0x6tOcZ+r/BcxFj781ICsp907HZuLbhuhlw==
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Mon, 27 Jul 2026 14:20:08 +0200
Subject: [PATCH] pinctrl: fix PINCTRL_GENERIC_MUX not always being
 selectable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-pinctrl-generic-mux-fix-kconfig-v1-1-5abebd6f1a8d@analog.com>
X-B4-Tracking: v=1; b=H4sIAPdMZ2oC/yWN3QqDMAxGX0VyvUDXSYW9ytjFTGOX/URpVQTx3
 Rfd5eHwnW+Fwlm4wLVaIfMsRXo1OJ8qoOdDE6NEY/DOB9f4BgdRGvMHE6stCb/Tgp0s+KZeO0n
 owsWFtq59jBGsMmQ2fTzc7n8uU/tiGvcsbNsPxRvIeYMAAAA=
X-Change-ID: 20260727-pinctrl-generic-mux-fix-kconfig-06306b442ddd
To: Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alvin.sipraga@analog.com>

CONFIG_MULTIPLEXER can only be enabled indirectly. If it's not already
enabled, then CONFIG_PINCTRL_GENERIC_MUX cannot be selected at all in
menuconfig. That's because it depends on MULTIPLEXER.

Follow similar consumers of the multiplexer core and select MULTIPLEXER
instead. This way the driver will be visible in menuconfig as long as
PINCTRL is selected.

Fixes: 34acc5a8adfb ("pinctrl: add generic board-level pinctrl driver using mux framework")
Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index eda54aa5fde6..28646a87b332 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -275,8 +275,8 @@ config PINCTRL_GEMINI
 
 config PINCTRL_GENERIC_MUX
 	tristate "Generic Pinctrl driver by using multiplexer"
-	depends on MULTIPLEXER
 	depends on OF
+	select MULTIPLEXER
 	select PINMUX
 	select GENERIC_PINCTRL
 	help



