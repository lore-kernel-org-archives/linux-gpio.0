Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792482882;
	b=iUWmUL5q+3fCJoHSspwJW8cazsaKLXBheFOXEUmvUbT7EIKz5+j7HuooVyCaCScv8rsI
	 8zBuPd+AC/NGJcLiRR9EKooQd2dym6IqDSW/7lwLD7DySC0UN0/CqMAwxBQP3Peo8OSlb
	 pPHhjRKu2ljW6vnAkns+tXm5PHsKu0D+tnsGZClS5y101t3w44tDhakIsB9IIIlqivPUc
	 vlLthHZiArB8GZ67IlKWg3myE9s2Vz0ve5IKsZwSt+6nnG+iL2axwEmd1uD8RELOu8caD
	 1QQl/9wBXemab1mPGlQmvoWS7mGbjVZxXFuzp1ubyqQnG03FpkEGNe1zfAd8S+XoOvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482882;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	b=V0BiZKH85Pa3EQCRFaB4oCpBQJBXvfYxZ/euVMfl7P68A4EkxNBA/qkt9L/KQPdNk9Qn
	 qBRx2lHveZl9bOosArNWrALicJQKhBl43Kc5KrqCN5olza5HUyZjWJsyE3dh+9nDf8JHt
	 vGphm7S/lYw36Ma43rEfZ3rMXRifsc9JajDyAgYuK2E0ipJB6m5FT6AsKx6TsBFf/yJy0
	 w/BTEyA/BMh31CAcBTglydGPdGXHkCtqwZ1lSSme6TT6JKF2PiRMspNkvHJvmdgd8hqol
	 4I1YHASKi0b9Fr1gx22wmlul3iysCAtS2yG0ZOE9L/N+ghSieWVaotImK1gn/MyOp2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGWw9nCF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FB606A31D;
	Tue, 20 Oct 2026 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGWw9nCF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792482882;
	b=fmTsObsGGnV39dSElIGvD1zFFCFnLbMlsKglBtF6cTocpNq+E300Ff8hGuWA/8Rpm79d
	 kEwvoR++6LEu41QJFDEi4EW+pgG9JcG2fP8uhG3Prt+5ctW9jCIjEstYGOrx6UKOxO3OI
	 Q9jq7kov4DDyUQPHaHDJcvwfMD0kyj0XUcE+W391OqR7x+BZnK1jECfnNkwkHRS3+RMU9
	 HiGQpW4NIz0MWSuSyYYHroSyscfbRJnIDJ8E9+a2evty9NQNLClKAqTyg+yghYsyhyONv
	 jxGJgt7ppoizjEThA8O8hCltzlgetJ5ZwOGmMcet1AVfJSKnKnnYQ+sv8WbpZNS5H6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792482882;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	b=bJLXFbhjx2uzFGIezGstLj1OAHRLQUGSiBr03m0DJ7rCx0EzjNGGLVid2Rv8fGNHBZrE
	 TfAQyY4KUt14QrcmiyCs/p7GU43AcmfwatBjr9+8AItGikX6VNnzcTLNqolaZCoPwtH9C
	 LuvtFb4F6eNcgBfo8VdJL5461XwCoqVyiLSk40X5/td4Q1DQoKcqVeYjzk3XQOPhi9Tk0
	 jswavRw9CEEEA/H18iqcbs9s9mTTrfCro/TuSpmHBGig3daRtQb6ryN1y7/cxYV6k2oTH
	 O06G1MdEkdQcG3+eq8bO/QZo3T0Yiys+aYqTw+6JN3LIxeN3iXRY22zUxR2n80zJPyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C2A61F000C4;
	Tue, 20 Oct 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482882;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fGWw9nCFSE2BkzKEI6sB5xUOFznSeudhvgVbWNuAvI0nb96w7CfUaTunw4ixDRtYM
	 2aZsa+nXXDjdajcAVHWL8J1/d8K5UDuV7VOwC1X8Av0sBCJVEGNnt0c8Lgqgr2OnS1
	 Ry+5U99/HQ8cxUEoZ7NC1DdzWqK4mUHhNn/OvACTq12U6I03GOmR+4sr1eXqJUg/nH
	 bNpcHecHHjwJOLdRnBS2hOXOK0Ah2eybuYGu4eyQf3rMiPB4LotoMqSsGSbeRMojyO
	 vHndBu7BOub6yPW0tNyQdLaHbi/enqQ53svVWbAvusDj+HIARpxLrYx/e0hIWlqZcU
	 q5xsX2iRo83cQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 844C64308E;
	Tue, 20 Oct 2026 07:54:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 20 Oct 2026 15:54:07 +0800
Subject: [PATCH v11 3/9] gpio: pl061: drop redundant pending check in the
 IRQ handler
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
Message-Id: <20261020-cv75-gpio-v11-3-e058bae19571@ambarella.com>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
In-Reply-To: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482878; l=1082;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=3XWHZond2pOFeGIXcPtw+mHYxFL9WC432M4BN6DutlY=;
 b=24RcyVJR04fWwFo81vqAqi7vwj3ItdKTh0AeopAD4BEGKR81cupAkOrYX3PxWgmMVQJvFXXiG
 PljuIopZXDCAzQ141mtirmvDMP6PwBGBFbNTLLAAPaYZ54smUHI8R96
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

for_each_set_bit() does nothing when the mask is zero, so the
if (pending) wrapper around it is redundant.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590..721f14cf404e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -219,11 +219,8 @@ static void pl061_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(irqchip, desc);
 
 	pending = readb(pl061->base + GPIOMIS);
-	if (pending) {
-		for_each_set_bit(offset, &pending, PL061_GPIO_NR)
-			generic_handle_domain_irq(gc->irq.domain,
-						  offset);
-	}
+	for_each_set_bit(offset, &pending, PL061_GPIO_NR)
+		generic_handle_domain_irq(gc->irq.domain, offset);
 
 	chained_irq_exit(irqchip, desc);
 }

-- 
2.34.1


