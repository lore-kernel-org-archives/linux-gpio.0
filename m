Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A928373;
	Fri, 10 Jul 2026 18:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783708523; cv=none; b=FdX27dTV6CCixdxA4+U/lRtWVTH6rNINRf9NbAj1758k3Lfv+99RHYXwczEk3MLkBWLNBo9E0J8ekG/F07QQKNL1t3Fh9ADvE6XQaBUUqQeZFj/jBA/3IC65OSuVVonRiJXiierouRV0Qf4djVJslEfTh8dKEiL2IS+LpcilfMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783708523; c=relaxed/simple;
	bh=OJFOEtomlUKrob8c1WEjI4Vz2MMTWoh83CnazceU5x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXMQah+u8YNoym6vB8CnOhLb4rwWK4yzTNE55fQ9zJrliRLYDKjyz9CqYTNrIQivFa7hADsCI5jyd1un6xV+iZjf2w8g9cfFxUuje0gFF4tduTcBqmQK5LORbe4e5C+2ipK4olesf83pGOfiQURvTeDJMHg+mOEhqk6SA9gHR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=czhy6zBn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="czhy6zBn"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EEA0D86012;
	Fri, 10 Jul 2026 20:35:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LK6z6iB-4mhU; Fri, 10 Jul 2026 20:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783708518; bh=OJFOEtomlUKrob8c1WEjI4Vz2MMTWoh83CnazceU5x0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=czhy6zBnHVttfSJI25skbQgzi4ZJV63lS1OB9/Iykxuguoy5GA+jWBh2Sedh226ZG
	 rXvH1QgYvSXu6SCGucIdHjkmccmI5Ss/mpBQZQ3cy2uOGnJ/DnCTCyodeoYp0IRRfH
	 xSlR2LgQ9AhgK2CSP6kvV0ZIjDC9P32VaANckJU99gT5LmuVNB2erfu6AGHI7+7/Fi
	 CGPZAMCi5QEZ2tKZh/lhcYqlSkceCFd+SUYj6iCEq8dAQRJljgQ9n30WblcgxGYTlH
	 o0npjUS2iQvTZdxKjbfnZMt0gCXiCyOaKz+nJs6b/eYZKBngEPhaBL55GRoaILX8ix
	 XsLEJSdDX8jbw==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH 1/2] gpio: realtek-otto: use __raw_readl/writel in realtek_gpio_update_line_imr()
Date: Fri, 10 Jul 2026 23:34:38 +0500
Message-ID: <20260710183439.996923-2-adilov@disroot.org>
In-Reply-To: <20260710183439.996923-1-adilov@disroot.org>
References: <20260710183439.996923-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for upcoming changes to how bank reads and writes
are defined in this driver, change the ioread32 and iowrite32 to
their __raw variants. The realtek_gpio_update_line_imr() function
is used by all devices regardless of GPIO_PORTS_REVERSED flag and
thus this is the only place where there shouldn't be any byte
swapping whether SWAP_IO_SPACE config is enabled or not and that
is only possible with __raw_readl and __raw_writel.

Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/gpio/gpio-realtek-otto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 4a606bad5848..491fde846d46 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -176,10 +176,10 @@ static void realtek_gpio_update_line_imr(struct realtek_gpio_ctrl *ctrl, unsigne
 	u32 reg_val;
 
 	reg += 4 * (line_shift / 32);
-	reg_val = ioread32(reg);
+	reg_val = __raw_readl(reg);
 	reg_val &= ~(REALTEK_GPIO_IMR_LINE_MASK << shift);
 	reg_val |= (irq_type & irq_mask & REALTEK_GPIO_IMR_LINE_MASK) << shift;
-	iowrite32(reg_val, reg);
+	__raw_writel(reg_val, reg);
 }
 
 static void realtek_gpio_irq_ack(struct irq_data *data)
-- 
2.55.0

