Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987759;
	b=ZWxuYNvH5oeMm4JPesUCTe3eHWneo2HZvhAmxwwNWbvWLRqLgXvnMjcW0j+eyiFJlidM
	 O0efpoAMjXmlCTfTuAn5qXIRML0W+Wkudr7CsN2T9QG4zTwBPsdFbR7mOke6awmRNwokM
	 vPAOwXEPqSx6W9h3Y7xyMfYLAtSFSnIQL2f6/9xgy3lLFx+9mp8T3+UerkAv5ZK7eYoHB
	 1ACfCnn1MVcmWt0o0y5pgiImiEYELvltNu/vNtxM4qTu1gRFG4EqMNoyBd0xCtB9sAopv
	 BcwOuWZWGN7HrgJDu9lbICjVJqByBf2OmWuCoxvz2ZAg2UgBV32m/OuLp5qfnTLa3hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987759;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uf6P9pV+6Dk965yxtIrtMuGc2HAONCerIiu7f7QAa0k=;
	b=O7fco+BOd/yqfTgzY3qfwSWMaVN8ADM7mdkFa0mg0mnuXJP1C+aO+tzUBb8u2/Tb4ak+
	 duRH5AbcY9E6x7S6YfjZuWhFipC7s3LhgMiqw0gQAvSRds1LPGH0KRBGddkgscOvUmvr6
	 wC6ifcNO1jZKB7CjneZ8tuMz9rK2oeY7hIus7Ue/2QceBkdrvb3gh5AUZQdvlkw9bAksT
	 7JGMlAW1q7rYhLZZscB2mGSR41bCfZwvA3E63jXbKVVpOpCN1vZ0PyErMa5WogHib3fql
	 EnkK3qi2LJyWxdGNUPr8HHR1M4iNRREd2lRQATE3h4CtD8xtIqeeciQCBSLdqFDOzoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j5I6v5as;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D20D60A262C;
	Wed, 18 Nov 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j5I6v5as
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987759;
	b=If3LoXNtAjqyB/Gn1BB38x1+gWJgHnoX/JQ4aMaQFc97SIO57Lmaw0V3K2YcVKUqUlqn
	 HOt2DqxnptPajBlD7kUpVSoyzLmCGnY6Ds90hIuRbSlzBcv8RkZL9sARvwy6CxsRELoZb
	 kbyX4cDZT4XabOHkKjXCZLJiF69a7U40FI0fty2/d46TswwEkxZeh+hegeRcZOhspdLkI
	 xFkFTdm2lksK9a06Vs5UZup753NFYPt0z2MAQwc9QYB7xog+2NXZyxTWLS5mHfc8od0QZ
	 nWR1vQLdTylwjVZI9ivO2w7dw7JTTz/eKlgJM0Ua7QzN+fJ5K8kEPC/k/JFG3rKQMcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987759;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uf6P9pV+6Dk965yxtIrtMuGc2HAONCerIiu7f7QAa0k=;
	b=szYYfxDs61N/+hoowDlLDb1E+DOlra5JncvybzQCACmAscQAD5vwmVeR5f7fxiGHHXfS
	 i6RUyGdytZN1CXExlSlwrYfChuHL1XFc48W5dxGrkvynvoyARU6V4z5omi+KLUJMGWSHq
	 O9vRd9eMMh+MskqTksLlgmAnVdvbMKrxH+O/BAzjrGuGRtkynSZGN6e1Gm+UfzeW6X6j6
	 rbrhuhbFe7oAQ/Xt8tE63KFaLKMLBrjn3ZcAGmwsGTqqoZ1hyGMGEYJFAQYgDlkbuzx1U
	 Xi5dQ1yY6rcgX+JNsqc27kLHa5uKe+bxOGy19jL3bilx2EUJr7cTz7BiHGnc2dq5s/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56F071F0092A;
	Wed, 18 Nov 2026 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987759;
	bh=uf6P9pV+6Dk965yxtIrtMuGc2HAONCerIiu7f7QAa0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j5I6v5asvod3/RHufJ5G3tlXRgnXzjL1RQSUm2r7O8jAJniMuzSKKSnNVHoUVjy5H
	 zyE63Ktw6ljUCus8ijpts1pQD4vVnx57TUrrKZyvAdzoqMRu2WrDUkYzbdAsC19b6q
	 iGGZRoadGNINoJ0QnQWG+mKzOSmPQHexK9LrXNln1ftvZQMbBjg2uPbE6SCF792+FL
	 cOyZNFYXjTkJZzFaEAtnlo7oWJNgZd80XyEtN9j5XbAfBKVdX+LiDXShXsxlkGcKWg
	 Zm+smdHOfjzW2sbnQiqaRjuECQPAl8THjGvv7x5KyJZ/Z5yQOHsvMw8LJ5DpkrfPkS
	 UpSe0P3+fYJ1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 943594AC82;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:29 +0800
Subject: [PATCH v15 12/14] gpio: pl061: tidy up IRQ trigger logging
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
Message-Id: <20261118-cv75-gpio-v15-12-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
In-Reply-To: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=970;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=p7Z9u3ngOc5syILLflVzIV7nyZ9es9xNruSYn8Vifgo=;
 b=JW8SztEkB04l0RIgtqVTn3y8xilwHRd0c6dolhWdf+M29eWt7TJ5UmZ8Ku9/SnC9gaauOAJ/x
 zNEnLHUOX5JDgNPYtXMB1N09JtziDKvr5OCeCU4uHczvuq01AgpfC+6
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
index c0a3a8b5c2c1..332fa51f8ccf 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -172,8 +172,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 
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


