Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B4B3DEAD3;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367079; cv=none; b=E2L2aWvw4nOZ4CiVU3CmcAl84BGTi9ynCvxEwh6VZBMp0gYjaTvGQENH/dCtqph/uiQgaE08RAHzHQbrtJSPyqi1ATpZxE86vOXI1ZV5thlnNQGPHSyuFzyqbSQh0Y/KavMPGKiwKcC4AF+dXvFhjQnHuwxSRIMtAuOyP03IiHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367079; c=relaxed/simple;
	bh=sE76SDyt9tO/Vc836t642bP0UkgFXewo7SBitySNNUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T689hCYQQ5+XVRjT7ysgPE2yTX28OwwMxaQ7/cmnb33ZfoCrAhQZANXNnVhzgFCX3T3Qp/Rwyyqx08MSs+8JDhSSfYUvJ0DQlVxre49cklI8ZOzbelKrbCWCrc2iUINH/ta3X1H7qy+Nc7d16SEUqHU0VwVpVbWLulQD7XPAZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0SW7pBg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0SW7pBg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FDB7C2BCFC;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786367078;
	bh=sE76SDyt9tO/Vc836t642bP0UkgFXewo7SBitySNNUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G0SW7pBgrv38cUY5gBbb7FOr2fQXJxdmhOC3/lUIDCdmkpEhgBMkomatmxdAWGpi6
	 3xX9RaHAaDmcJWytzGOnVG5dPWK+qu8Kdv71V8VjZyUByH+RIqK70ffnpj/99srJao
	 KPRFxKztqjghdCRhVh7wHw8FnOMlrXjzKKLU9/r2Oe1yGCOHvoR5Dgkvzx/1EqCneN
	 PayPPQ/SqXagKujcD+6FPk2qqkR3Sd6fj6zPyfMClsr1EKWeo2asevFjd/2RsBRRRg
	 rxM8s6JaqZmnyPh93Uefp7TgmEGcYthhJPhtgzwaX8hqtcyhtVHwWx7wqE3aTQ1MSE
	 WGe3s8GMpp01A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A42C5AD7B;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 21:04:26 +0800
Subject: [PATCH RFC v8 3/8] mfd: ls2kbmc: Redraw using exported functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v8-3-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=R0w0JF+qT6VK1lT/PxMrgYCt2zFDY7MivPLY0o0OME8=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecxj86Xe/U1Mg25T70Gbq7ySVD/xA3BsUDC8c
 vGQeX6tyUeJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannMYwAKCRCwMePKe/7Z
 bka1D/0TuM3JU2aDaQzWsx05MrsGZtoMZYpKoRRuk6ijBONraSsRXY15HFScQGyQ/kokesQQg/L
 JJpLMHu5VBO8b8pXjge9bLvIDWIcnhiBH4ATnzBaLKNJWKljKt9USjWyORT7Ho8lEQfhx65bmFQ
 Q+WcLQg2biGXLxLUPPYRhR6RHPYDx9ueh3S0RTmR1YwbWs60kFJ0vdRCfIbFr9tBJ+ATcAMeDjR
 Z5m2qRoC7Ejv18Xwo5G+3Rh6ZSI4yaQS6v6puGaxPvcbeVRvaSPdyy67OHxuw6QLSCdEW7S9CfX
 nLRTdSr3EXePmqGcO9398rpj/bKRW7Qhqs3j3WrX+Fdqe5g1di6//zFgzusjGfGipInpGyP+iws
 l6kEIyhdnFE7qcUr7jGlKxEm6YTEOCfv+LrBW8ckhepSjyPtCUQypo69730j8sEuj7+D2/v7l5Y
 wKL6DH52nRZh0L0Z9UO7AcWEYSJ6J6rO3eevOCHfXF1waW5xMYBBnzG+Bzl4WWNXPCcoFtzI3Go
 GR2MshUTpxEa5/kkl7oKWp7XX7ScK0tFpK/2VxFwjNP1Py1xGr+QSxnu8Zj9EqwSN8Ncq58sV7Z
 i5hSATTkqTA6ottSE63UZrZ1xHJy6vsxfeUPIUP71XFB2V7WECSCfLrXcLMQ0P9Q7lrrpctgvL6
 ZO3zK0WcpGhSd1A==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

Use update_screen, i.e. redraw_screen() to trigger the redraw of the
current vt.

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 434db99ee501be8e18de7258af0f465fc16c0709..06ec8143d8cdbe2c8e5a141020d96c21b37fa699 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/stop_machine.h>
 #include <linux/vt_kern.h>
+#include <linux/console.h>
 
 /* LS2K BMC resources */
 #define LS2K_DISPLAY_RES_START		(SZ_16M + SZ_2M)
@@ -310,7 +311,9 @@ static void ls2k_bmc_events_fn(struct work_struct *work)
 
 	if (IS_ENABLED(CONFIG_VT)) {
 		/* Re-push the display due to previous PCI-E loss. */
-		set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
+		console_lock();
+		update_screen(vc_cons[fg_console].d);
+		console_unlock();
 	}
 }
 

-- 
2.49.0


