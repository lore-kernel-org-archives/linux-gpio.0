Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE3299922;
	Sun, 16 Aug 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893482; cv=none; b=UZO6A29RvHQTaDDQBHgMYyiazffzHnHh2xCJJamIEObD5Ov5VYK5zoU0zVMw01PwZyyYS6ukd9vAiPTPOTs0uxwMY6aWpNtt1AFES4XelzlxzKc6FWLRKDDtCbfTS8XJq1WcVN6Y4FJ89O1qzVZNnmt0Jp5SaRxz1rHvWmUIe7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893482; c=relaxed/simple;
	bh=uMgRTn1LfMHVvJu9vCvm/Se2UXAsvdyF6m2A3kuo3oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=I6bj3k/Q3SeulhD3r6v/2cgTryGpC0bfDLVJk1fcuz/VG1qkLq/sBT6yBsHYWhNH7JCPNGSyjxZFzq3QVSGEtCNLbcEevDSsWKDp2kYoAj9VPziGumeydxs8xESNg+DzxBs79CMRWP+3ckVQR8uk1ttsKD0fj8uFilEFKIKF1Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=lV/6Cd1O; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="lV/6Cd1O"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67GFHgzcE3038980, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786893462; bh=X9ZA0k6QcI7BmAAopYzGdOMVbL6vlK/u7OQiXiwX58A=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC;
	b=lV/6Cd1ON2DbohvexANKld7wc05r3ear7H59gpKSYjaEVkhLl4d3giC3bE0F/L4mN
	 JcBunQ8RF/tCExDCk8MjPRyNPyOs26YyFAAuNP242cwGcjcn0R1IarqSRzCYzvAE8l
	 NMsWIVF+NxWudLBYN7skUH6qUTMtvqiwr5TJbhaCCJ3AX+OKfL9HqG7ajqISIHaPhk
	 IRvTxoq+WzfIdGIz2BJ22TEbdLBPn6CgReFysJDOYwvmHJnWM7ijUX1j9FkpMQulYW
	 eNLlp1Z+cgqVVEDtKuYqtFGjUum/nEMM76yV/pCiP7AIhZsLnexY1K3gdw4LIsfmVL
	 XyNuPf9PR5osg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67GFHgzcE3038980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 16 Aug 2026 23:17:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 16 Aug 2026 23:17:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 16 Aug 2026 23:17:42 +0800
Received: from [127.0.1.1] (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Sun, 16 Aug 2026 23:17:42 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
Date: Sun, 16 Aug 2026 23:17:34 +0800
Subject: [PATCH v3 5/7] gpio: rtd1625: Narrow 'hwirq' variable scope in
 loop
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260816-gpio-cleanup-v3-5-f298cdd65fca@realtek.com>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
In-Reply-To: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, James Tai
	<james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>, CY Huang
	<cy.huang@realtek.com>, Stanley Chang <stanley_chang@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786893461; l=1129;
 i=eleanor.lin@realtek.com; s=20260815; h=from:subject:message-id;
 bh=uMgRTn1LfMHVvJu9vCvm/Se2UXAsvdyF6m2A3kuo3oI=;
 b=BgKxKI675FCBXUoVEScpRUafCmtSPn85BySqUjAS8P9nMEruOKCteEqwucmH7ROdVYgpbJXqb
 d5VElByjbyIArHrTaW70UmWYgw4ELJNYNQ6MNpxRdAdMN0Hvyztuj4t
X-Developer-Key: i=eleanor.lin@realtek.com; a=ed25519;
 pk=BrWV6/OS+PyXJgzExw5/cR0hiQtaxRmD7afOAe91lws=

Declare 'hwirq' within the inner block where it's used to reduce variable
visibility.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 2652bc6cb523..8f584287c2e6 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -225,7 +225,6 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct irq_domain *domain = data->domain;
 	unsigned int reg_offset, j, val;
-	irq_hw_number_t hwirq;
 	unsigned long status;
 	u32 irq_type;
 	int ret;
@@ -267,7 +266,8 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 		}
 
 		for_each_set_bit(j, &status, 32) {
-			hwirq = i + j;
+			irq_hw_number_t hwirq = i + j;
+
 			irq_type = irq_get_trigger_type(irq_find_mapping(domain, hwirq));
 
 			/*

-- 
2.50.1

