Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285171;
	b=Vl1baJ1hROCWhhrq9T3ngwSjH2TI7vSZsOUWlLdDRQzD0Ff0SFUUWekSD9YNDZ3xqE2B
	 Mwx5YEM292//l0arO7RHluAD+e3nFafjKjdImY0refmrK1lNdDFZ9wIc+auwf7hRBrHb9
	 M3nyzmM4C0VFGyV+l84v1yuxbatFty0xeO6UhMmuxdsMxdHZouQTL6b8heO0Ir57lGSv8
	 8ypEOPYm4pprdI2yfwBVJOoRA9vIClAAPmqYEKsRKiAeMxyMzxhBZV4tMx356P7K52D52
	 binuEp++KDvxeRnGJ6a8osZN/g2pTeYrlMF1DJC0vUTq95zCgHXZj956Jt/0W7RxvWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285171;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EJpI4QogSRuAuAGS4HeuZknbhC0fZfvUjk9obIfUV8g=;
	b=LZDwVzqx9dy2uGyxxVVvy7yecGwNH4NRY2fcu4C7aXBebA/w8ynT0jJNRnyOAWCdhGqi
	 c4Qgpq4WN5C1FZNiHA63DUr39chrW3B6Lkt8XU0L9jI2pcvdmnyddqCuMkGwXvQtyBlc+
	 FyXLWceh5pizbge6Aex/LN37HL9k1X5Ev54GJYYVv/3UFZYlHwJ4UjtFzVdExxlL1ggjc
	 ox0glLBEgapr6zopb3cv4oSbd6bCokqC4tAoeaWR0G8SaEMkJQMQGYD2FYw9JrzF5c2+U
	 QmNLXPPLG+A1Avqpufu8se+WseCtHkENuDsrJtXdK5aO1+aXN07nxSORdkioLqzzoxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MXDei/d3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D7F60A381E;
	Tue, 10 Nov 2026 04:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXDei/d3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285170;
	b=I0vx7C74euGOPoMCEsO50QRc0116WvqTOcDeKWWfZd5ja77jISb6RN/8Mdpvl/xKGHh5
	 xiXq6OgVx4xdD+6kqoOX5uuAC4VxAhMqZkSYOtQUFTBnfLYaNHNEOXN9eYpqj3JO7m7wR
	 NegDc+JOvoksqZ4T8Pw7krpC+o3/Uhyo4Dqz8k4xNTDT7dCMUhL6LNLEqJ6Nadls0oLq3
	 jkpwj9w6ech0zk2xGxq8d7Q4oJhrE0boqIYFFiXzGgRRII2p1VP8Urbt2zc5/TF+/5nbM
	 gdE1GZ4U2KoOQm1drTegCvKnTflfTJubepmlsGp5YXZTp7k6W5v7cdHUWpLLz1tvABA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285170;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EJpI4QogSRuAuAGS4HeuZknbhC0fZfvUjk9obIfUV8g=;
	b=gQ1FTIsIIRqr0aj5rC4SjuP9ZpGnnpeHDUmiTi0DKip6z8Agv4DjUfXgjoLrkW4pIqfP
	 MsmEN4gjn6P1Q0GUeX0KuDKm7vQ0FCqODF8oZmr/bfA+47IDQ0OLttRnfuQpgWjL7V/Xc
	 iADsFvP/n3iWH8vFg8WrqW++3C0xVX5bgVp0YhqMrE1aIiSnth6dJmXx6oq+2nOUaXhvk
	 Mb26AxTV0esDfcynTTC2vZp87M7tBbs6LUcmTFd6eROIvaRQU1ilEDWtwJmk4HJAAW9Ux
	 sa7ET0T3Ss3AUvXqa4eUPSzwg7rUnPZkbxwHhHf+tOeNXJgFogCjE8rb0/hDptQN23Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8595A1F008BC;
	Tue, 10 Nov 2026 04:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285170;
	bh=EJpI4QogSRuAuAGS4HeuZknbhC0fZfvUjk9obIfUV8g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MXDei/d3s/GK+0AeqDvPoAULnDLEnbALBXoIfOi5gbqIBkRyu4MuoY8Z8NPmNt8Mk
	 mrL//JQuxooUTWyjNr7/I+ulRBgby6K9VveePIlJeAjyb5EhMDLsq4sVer16qalXEC
	 i2UJJU7NOG99nYbK67hb+IoEoN5/hLROvpm1WHwJXCLaoSCNUldv+Ge6WL4+c/pxnH
	 L67OXNXtvodCQuqfahVFB1r+XVqJsUYVJYZeAkz4qSJgnWHDaKFzYi3mmBK/WZQytf
	 E2A9/LYPK3+9r+45CqxNB2QnoVddpCoLAU/MMDGMnVZwQ8Vgf42KVnue4rSm/I2+0e
	 PSppmfMwocYkg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5FA874887D;
	Tue, 10 Nov 2026 04:32:45 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:37 +0800
Subject: [PATCH v14 12/14] gpio: pl061: tidy up IRQ trigger logging
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-cv75-gpio-v14-12-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
In-Reply-To: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=970;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=NH6oHUs4Wq4OKHpVbaA3cH3G5q6ygkmHpl5qjy7ZpOc=;
 b=7l3FQdyf0Imyw5EhO+e9op6POfCTzVptpLZE11bVQyfd7EaL8Xz3zLP9MXhleKZm0EDwGoseK
 zbRqTaiDG2nDGDc6sFRfrlsqr870iGLQMz7E+I6M+XCsCwILym3an5R
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Join the level-and-edge dev_err() into one string literal so a grep
for "edge detection" finds it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index ff9215447bbb..63ec5363dd5f 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -170,8 +170,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 
 	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
 		dev_err(parent,
-			"trying to configure line %d for both level and edge "
-			"detection, choose one!\n",
+			"trying to configure line %d for both level and edge detection, choose one!\n",
 			offset);
 		return -EINVAL;
 	}

-- 
2.34.1


