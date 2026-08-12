Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3482F8EA3;
	Wed, 12 Aug 2026 02:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500017; cv=none; b=lewpONdP+OZHoyUQkiYNj62deb/B0ntw73RHfZe5i59Msio4RLLZ5D9bntzbtpMFLwsP9RMxZqQ+a97TiAxox3Blb5vOVwvr+AIxLP10+pUrDfOhp4HshyQ3iVdAU7e0h1030nuOONpxsAzN0Tm6kpGZHdO/gc74tptB2JsmHDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500017; c=relaxed/simple;
	bh=gaOLMRpinKJEjDBil+8zxya+yxldED8Puoqt94hDAbw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TiZVlTL1+PzW/3zWjM0bb94kyii6AizSxBCPlm2xzXx2uV8fQmvrZEwQj7kfXT9uQJC6yvggEJ7X1U5aS1Qjm7So9EREbEPPHrC22NwC9tmHh1yBAHiaTGt237KNqGmkWaKk3lUx/5W+sVwpMrQy/dOYfuNH8aoEeGWbcjl1VfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=LfmX36E/; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="LfmX36E/"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C1xISs93194418, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786499958; bh=hhRaPAy4Dl83sOqHYla210dTHhsUaJ3aEMwaAfPhLDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=LfmX36E/Zx0PVSW7UIq4SaSqCv6fmaM75/Gig9He8kgy0SX5EixDV2qS8Kx405sJq
	 4rESmX0KX88YSLIPmX6WVIGawNeeZtbgLF0/9L2ZdLzD1XIn4E3ns84jqJ3vhjSd6W
	 Io+ICiwWnaV/8E8OBlTrnvdUPZ41okSRHJOLKYxKsjIVV+Q6/HRhHsSGRDXYJLwTHn
	 SGDkOf6oDDgh3f9ByIkFhS4FNQ2KiJUKr2o45OJtlaOn5eZ8B/49TigLA+rw9WCXIL
	 NTUIZTSA7ar/gEPljL3ljh+PCKcbcGbgN2YgFx4DjwYH+4fTS1bIzGxMNQ9APA9kva
	 mCa9T4kYtqhVw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C1xISs93194418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 09:59:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Wed, 12 Aug 2026 09:59:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tychang@realtek.com>, <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <james.tai@realtek.com>,
	<eleanor.lin@realtek.com>, <linux-realtek-soc@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<afaerber@suse.com>, <stanley_chang@realtek.com>, <cy.huang@realtek.com>
Subject: [PATCH 2/2] pinctrl: realtek: rtd1625: remove unused group name spdif_sel
Date: Wed, 12 Aug 2026 09:59:15 +0800
Message-ID: <20260812015915.3477180-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812015915.3477180-1-eleanor.lin@realtek.com>
References: <20260812015915.3477180-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove the undefined "spdif_sel" from rtd1625_iso_spdif_in_coaxial_groups
to clean up the code.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1625.c b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
index 796e51f9dff9..88f2be37f743 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1625.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
@@ -986,7 +986,7 @@ static const char * const rtd1625_iso_pwm0_loc2_groups[] = {
 };
 
 static const char * const rtd1625_iso_spdif_in_coaxial_groups[] = {
-	"gpio_163", "spdif_sel", "spdif_in_mode"
+	"gpio_163", "spdif_in_mode"
 };
 
 static const char * const rtd1625_iso_spdif_in_gpio_groups[] = {
-- 
2.43.0

