Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC3C3624A4;
	Wed,  8 Apr 2026 02:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616942; cv=none; b=rTri+MY7VgTpfe/ODRGcYlIgtaHqSbdreKZtRfAqt5v8Hv6kBBpaoxUz6GT2lHeZKzJlYN1zgJAPoJCfFvMxt/xgXuQM0yqEN281No78z/j8WLJp64AIiM3Kkt+s8ZWGKtVi7EjPjEDGSsZukdj3OdxWXcBnvk5opaHzvI7rpr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616942; c=relaxed/simple;
	bh=L2IlH+XqJND7EheUfZeGq2LXHHYkaEHvtjIidP59Nmk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2Qip/7D4TKpCL23w632Im7MQtdO3px2/W0PJ4k8MAxxA0d8nN+vSHx5oGKonrxqNmYMyaGG/lil63PnwL8tkmm5jsbEE47kZQD+aIZf28+jjuOXgLX8sTurgiESygGUO3jX/jp7BpnuThzomE7BqQU3xunfyVklXArDjtPfVCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=R5Q5mQoa; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="R5Q5mQoa"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6382qjoF72349153, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775616765; bh=2Zf8tghgY31ELN1oGicZic8C6mc3PnABGIIZfUK3NRk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=R5Q5mQoa/E6fu+nf2x6zha3XeOFxVYpthbhE1jGMzYLo+81jtmmx9Rgjwmji4kivP
	 Yy9AaGUq0TKSYLtkMlJgtp/ezTX3BrlPdM/XBNPG3N87B19kEkbjEC6UzSf5TvCBz4
	 kKJ0eBZfYH4uiTQPZmsKLENi/UnJ2o8OB1LYKUzz0Xqnx0mLXdeBtH3lGmqUUsqzF/
	 QXevYY+IO58IbLa8kDOGtGrfHcoO4qCQ7IAF+/dWgJmGjFsAhF4rX22/0CKTwA7e/g
	 zTU+N0MyrAxc6fiy/04x4hvvk7QsTWJ5Wt1ju6tf81sIvZzbKo7Biry1+XFbfD4YhS
	 geDG+U5LGCSLQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6382qjoF72349153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 10:52:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 8 Apr 2026 10:52:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH v2 1/4] gpio: Remove "default y" in Kconfig
Date: Wed, 8 Apr 2026 10:52:40 +0800
Message-ID: <20260408025243.1155482-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260408025243.1155482-1-eleanor.lin@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove the default y to avoid bloating the build for non-Realtek platforms
when COMPILE_TEST is enable on other platforms.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- New patch.
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..5ee11a889867 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -629,7 +629,6 @@ config GPIO_ROCKCHIP
 config GPIO_RTD
 	tristate "Realtek DHC GPIO support"
 	depends on ARCH_REALTEK || COMPILE_TEST
-	default y
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for GPIOs found on Realtek DHC(Digital
-- 
2.34.1

