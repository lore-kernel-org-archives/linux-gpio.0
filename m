Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCE7456E04;
	Fri,  2 Oct 2026 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945203; cv=none; b=YtW7p/ZFH7VpxUTaaf40VNERD+FmYqrXv4h8oaJDv6Oz2pkejFW9oJPZEPrNvH2MQXf8TB12mil97lJcpf3Q6T+egyMeh3m+27M9/S49/ImHDAFoiJknHe0+FpZv1HsJNKGCXBdABXrK2o/eslD4BXuRX33hQofb5j9a+EEtL+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945203; c=relaxed/simple;
	bh=JQxR4eGGYbKJwHhbYpIJsQpaBxAF5zzb4gtTpnFDNTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lkDAj9oFunIjgnCzV6s1oFnZf/EnMHNud/KakMK9Gp7zeDRDjZvCpMvqtvPUXymqaqfL1QUG5I0WgreOiSyoEyXqO2TonrMfE4YrCnInIY/ffD+Zbiz9ktXLhrXA5QSFaX3/SJhbNmig8xE4NsmyoIV9LMWLE702MpoTUncPiCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwCP57dZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwCP57dZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A431F000FF;
	Fri,  2 Oct 2026 12:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945201;
	bh=AqUEVR1oYCfboeWUpeYHEayLw0kUQOKUQHYOMXYnCKk=;
	h=From:To:Cc:Subject:Date;
	b=ZwCP57dZaSZHoXZtSx8OhvflHTqNOpbCC2OEf9FlbSNE/oHqW8Ih3LDPW4EkrojGj
	 JKOz8xbSApfjn8rGsoJIqKfP6H+GKM6KsipzgZi2RVnVv9VHa18ie9R/EXiPGt+GIu
	 vBkwwY9aTV6Qr8WjAsFh/nreuf7tYnfaUB8ll/Si/DjMfu6MsoorsGPB++EAIR7nA4
	 IndJX7zIiybSTRMGSyU9mHzWXpSPeF2gtUVhbhaj+sBBjmM26ltvZouCrrEL3o6Opb
	 wztZ3Ase7MrPoOc5/NWcTuzGELoxuyo/kWKli9mLAohImUPRr661hwDByl9VqHLxTP
	 ChJmfXV4Gk9MQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Benjamin Boortz <bennib@mailbox.org>,
	Frank Li <Frank.Li@nxp.com>,
	Johan Hovold <johan@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: ambarella: add CONFIG_OF dependency
Date: Fri,  2 Oct 2026 14:46:20 +0200
Message-ID: <20261002124636.3514597-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On randconfig builds without CONFIG_OF, this driver fails to link:

x86_64-linux-ld: vmlinux.o: in function `pinconf_generic_dt_node_to_map_all':
pinctrl-ambarella.c:(.text+0x54cdf0): undefined reference to `pinconf_generic_dt_node_to_map'

Enforce OF as a dependency as we do for other such drivers.

Fixes: b40e9d140c24 ("pinctrl: ambarella: add CV75 pin controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 6fe53a684dc0..83f68bdd951a 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -41,6 +41,7 @@ config PINCTRL_AMB
 	bool "Ambarella pin controller support"
 	depends on ARCH_AMBARELLA || COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on OF
 	default y if ARCH_AMBARELLA
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
-- 
2.53.0

