Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202105;
	b=BSFgmBLMhEkQPYqrUvAIBh7KbP9u5uNDUQD3Q8Xjm34th+xFPaakVrNQlgtS0LeioZVJ
	 KtjbJoxJROZOfc61c7IZm9alk1RCMaNdklt9oQlQgar8JNlZJt1IQDMCP081ulV78z9j2
	 aJhOyJHmfpOWLRxUQzXGH+P2EmFFJDMoRixJJm5WZiJbWjKM7zL0jG5nkdslm1XOx9S7K
	 wizXYVnPBY2TvdskyXIOGloXJHWdt3qz9uOWSf1+F3iO7YvK/YxRsehye4Vv0ceKc2RjU
	 gwKoBZvAX8AF+HxLxHPaBz0SLXXPI8bKcgdRCPyE+wv/Qov4GkyFETCvC9jvwyF/HdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score:x-atlnz-ls;
	bh=b13hWvAgV8DviRfp+ydZxb5i9q7xCSUe/ppSIBqfi8U=;
	b=qmjdqboEhKfaQxNCh56DXKUhP7Tj9eUlOIHMN72RHkeMk+Uz2RCzycLVeSRvWATWgtdv
	 6qjO11zbdKXq7c3bYFlBSqZNsuRmvWQzGSLla22K/XYZVLrmMP6ZbeXl+/b3E1ZlgaGI1
	 V71nYhmTj9ALOuaQ5Be0j8qhhBbIyrGmp13QkovkD4QGP2aIcDMTpYGjPuJSQL77ZM6Xk
	 vUT3J9fGbNV4jTTCA2uekG5NZ4lfYQKH06n5lMQzfa+wweTkVHtEnyVCz3xgzzjfSJ6aa
	 DfAUKlqQ1Y+bzWH0zLsRyraDK4fszCtjzTcoP6QsjHHCXrhoF+wMLGtnRw0p0cyilbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F93606A331
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 05:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4F93606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 00ADC2C06AC;
	Mon,  9 Nov 2026 18:28:16 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1794202096;
	bh=b13hWvAgV8DviRfp+ydZxb5i9q7xCSUe/ppSIBqfi8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pTh22+UMy4aTB7c2w2EDyaViTpmj0wk0N+7NopptZLvj0l/UHuG1rntTTkGG4K8iL
	 mNHqzKzHzeU/HRH1AE6SH7U0fD9aMJTJoK0UOIXB7DeVj38bVe3Ux23MOq1rK65RD0
	 aJHGbtI0rKfGHpn2uy/IwdodzFyFsh7iyZa4L5wGrwuQBzMwZ5xOiy7Q29BcSCmxIp
	 qPo5VhZ8Qyb663xQd22mAb6yjKadj5ogMU8/XfmKowwu1RFCznYJrsfkf3H5S057Az
	 5J2AriMAPKeZ5dQpc/DRvaVssul2835V/Z3HW69tkCzY/NP2BipPo8xqVKN9U8fCJW
	 VAFjjgV17E2YA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6af159ef0002>; Mon, 09 Nov 2026 18:28:15 +1300
Received: from joshuas-dl.ws.atlnz.lc (joshuas-dl.ws.atlnz.lc [10.33.25.13])
	by pat.atlnz.lc (Postfix) with ESMTP id 6571E13EE94;
	Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
Received: by joshuas-dl.ws.atlnz.lc (Postfix, from userid 1634)
	id 64D4F5B0036; Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-kernel@vger.kernel.org,
	Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Subject: [PATCH v2 2/2] gpio: realtek-otto: Allow building for the RTL9311B
Date: Mon,  9 Nov 2026 18:28:08 +1300
Message-ID: <20261109052808.3035449-3-joshua.scott@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
References: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=S4h6w5sP c=1 sm=1 tr=0 ts=6af159ef a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zJRp6_cAMcgA:10 a=eaL4X0gMfRqexhGYWbgA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The Realtek RTL9311B is a network switch with integrated ARMv8 CPU. It
has the same GPIO controller as the RTL9310. Allow the driver to be
built for ARCH_REALTEK.

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
Changes in v2:
- Drop the "realtek,rtl9311b-gpio" match entry, as the RTL9311B now
  binds through "realtek,rtl9310-gpio" (Krzysztof)
- Retitle from "gpio: realtek-otto: Add RTL9311B support", as only the
  Kconfig change remains

 drivers/gpio/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e4280029d8..bc584da1abbb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -645,14 +645,15 @@ config GPIO_RDA
=20
 config GPIO_REALTEK_OTTO
 	tristate "Realtek Otto GPIO support"
-	depends on MACH_REALTEK_RTL || COMPILE_TEST
+	depends on MACH_REALTEK_RTL || ARCH_REALTEK || COMPILE_TEST
 	default MACH_REALTEK_RTL
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
 	  The GPIO controller on the Otto MIPS platform supports up to two
 	  banks of 32 GPIOs, with edge triggered interrupts. The 32 GPIOs
-	  are grouped in four 8-bit wide ports.
+	  are grouped in four 8-bit wide ports. The Arm-based RTL9311B has
+	  the same controller.
=20
 	  When built as a module, the module will be called realtek_otto_gpio.
=20
--=20
2.53.0

