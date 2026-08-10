Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C83D8901;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364749; cv=none; b=ExbcoEruWBbPgbBr4or25qnJ/Z/yb+W1RDv2DOcO7sNkvsQBaufTBRU0m67B7ZCrZRzFW2c3aDWLozS7IFosXHgd8fhAuh0wCWyC8H0gyJ2xDU7B/muv58QFrZLq4FEg6yzxwDsxU3jicjF0bbWjpWV5h1VY8RYjdCRyCKWYrgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364749; c=relaxed/simple;
	bh=STrnsz8WNMiuyoiZVYpdv4alg8jAQTH4HexAp5WAsoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBas+OEv0nDJHEWNPcbBtuOcdpTLgfl7ohdIhQIU2Uc1HcjRBNLfFmLAJCtFHH/+kzEaaCppjUALtrA/6OOTQBHFFZiJ407hBtAwM8490PFF/fbUOncjou5a3y9WMHFhEDjQRKcL/R7PLArPiMFxVNc/rY5rvO+7wNd2xrUTBYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNzs0XXr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNzs0XXr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 758D4C4AF0C;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786364749;
	bh=STrnsz8WNMiuyoiZVYpdv4alg8jAQTH4HexAp5WAsoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JNzs0XXr/zc89rw+iMHn+gMdNhwhKPQtuQWxYCudeof3m+5zLL8oFuUbKHKZdLx3X
	 uaaUS8ld5NGbPKGpQa9omFPsMNxeXLsJMRZyk44zlmYBhear+jfmsoiXckT2Kxlw8O
	 vT89gALjd5EWsX6hnCIolNNdWeHlURnxVvalH5zxJbfzHwhw21VR30xNjlRwnXsItf
	 Scd0A2TLx4KpHiFEoYDLof+xPYVh1pPOTCDOdZnENMWLuTDI+jf2DddVeIYsbdeuoo
	 mcSN0qeoUE4nWZmf1Cl7DzlhZPSZ+CcSCunTZmTXcRYkkGz4tPxuexni2/vBlaYlTZ
	 s1XQjwCVHpInw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61609C5B56C;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:25:31 +0800
Subject: [PATCH RFC v7 5/8] ipmi: ls2k: adjust dependency to its mfd driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v7-5-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>, Corey Minyard <cminyard@mvista.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=5F0h5Qv+XPb37y2d1dKKxcFdJW7AFH0K1WRgvpNasK8=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecNKD/+ONE0nqfCKPLy1MCc0+MF1LvjZmZFaQ
 tqJLQY43aSJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannDSgAKCRCwMePKe/7Z
 bsUaD/4wt/rIkjhA73FhH5uU716uJZ4vyFcMUQMlyG/qA2ZcyiE8fOkKD+yRTFobswUmBSi+b1q
 5e/KpFyLA5Y8LdsG9vyUePosVFohtm9+Nv/NZPuLazaTzUq0M9EWBeFdApV/TxiD2Xprd9CBTga
 dB0QZr7LJIutxeP0fxNdo+SWRoK71P6CrRZJhlWSosnr3RwnWgFo1m56ZGgDdhBFgWn06a14kBm
 kCFr7hvKuo2WmCrUxldsNR9Z4TXfxqgztgJzP6z1+Nte84Lp9okQUebUjXHjkJ/nXxpkv/5eoIH
 y6MvB86cgtv2q9p6syPjxWi8z03WG9kjd2VccX2D0ZfmbimiUtCrgEMN2z7BAZ5dLQMvYW0jN5J
 YeZeVsGIUz0xlpSpnui3LsOi79ajakqWZ1+/uU8gP3zOZ3nr++wrXuhHPrgyR5B2blwnXd+TeVw
 f+gWM6JPwKTTlY2qc0GcsXOfm/agddullD2XtR+ubT3jyNCCyCnU9TxfY+jiBCM+VgVsCSPtm7e
 B5iiFVWcTSVYpIKhc0FQSkkyxBuBuV9JK3ek/bEjLHE/9mXF3ULFpejSvDxi0XOgoyunR+/tmUZ
 /m6LgSZ26oe1hshrxLNsHmGOHisool0I3fVZNzL+Bnmc5svuV3Bppkc8ica7CvNfo+Mp4IGKJn+
 K5MjSW0e9QDypgw==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

There is functional dependency between the IPMI driver and its mfd
driver. Previously, the dependency was set to "select" from
IPMI_LS2K to MFD_LS2K_BMC_CORE. However, the ipmi driver is actually
compiled as a part of the ipmi_si module, and IPMI_LS2K is a bool
option. Therefore, the dependency "select" will force the mfd driver
to be compiled built-in when the ipmi driver is built as a module. This
is not desirable. This patch fixes this by declaring a conditional
dependency from IPMI_SI to MFD_LS2K_BMC_CORE if IPMI_LS2K is selected.
This will allow the mfd driver to be compiled as a module if the ipmi
driver is built as a module. The adjustment to Kconfig for the mfd
driver will be introduced in the later patch in this series.

Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/char/ipmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 669f7600019747bcd2b37563477cf336f19a0407..07f3308c71616215871a730b87f1991d2b502e63 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -62,6 +62,7 @@ config IPMI_DEVICE_INTERFACE
 config IPMI_SI
 	tristate 'IPMI System Interface handler'
 	select IPMI_PLAT_DATA
+	select MFD_LS2K_BMC_CORE if IPMI_LS2K
 	help
 	  Provides a driver for System Interfaces (KCS, SMIC, BT).
 	  Currently, only KCS and SMIC are supported.  If
@@ -87,7 +88,6 @@ config IPMI_IPMB
 config IPMI_LS2K
 	bool 'Loongson-2K IPMI interface'
 	depends on LOONGARCH
-	select MFD_LS2K_BMC_CORE
 	help
 	  Provides a driver for Loongson-2K IPMI interfaces.
 

-- 
2.49.0


