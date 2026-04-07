Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5943A3E87;
	Tue,  7 Apr 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556666; cv=none; b=jM7iFBFT2zPQCSmHyza09K/IB46aaOv75ZWRCLXU5BS0UBGtauoMh1/4Ha7AUj/Mvv8yAJnmgA0e5oGub+YoB76MMgZq0NCymfJeXvSwblqcKVg5jEXC5pYmjeIkW3djiaGcn86JTGkMsfcvVKXdLYpv8NrhAo+yNvlI119A1ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556666; c=relaxed/simple;
	bh=FNnUzitxmRE43VfgYBlZ0aU2WJcZ4Tmqcpsd26P/2cU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gHnJNooSO8xnVQh995FmL0WaFalP3v7FxTxCQzOJuOL6bcTpt1rPyb9dOySG5IgogCkb3+VOVGkF6ZNFXgr18ywTLBSZetWB4uzx/vcogx6xu4Nm7WzKTYI4f3n+s1VFfyAIlSX0o3FTHavs2FGDT0TrwJSIKqUX5c7arS5f9Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EDFC116C6;
	Tue,  7 Apr 2026 10:11:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: gpio-by-pinctrl: s/used to do/is used to do/
Date: Tue,  7 Apr 2026 12:11:01 +0200
Message-ID: <b1ecb31a37f8e35447122554a38985cb6240eb11.1775556619.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing "is" to the driver's help text ("used to do" has a
completely different meaning).

Fixes: 7671f4949a6c9111 ("gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d9b3486772083d33..5db449e7c636cc83 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -253,7 +253,7 @@ config GPIO_BY_PINCTRL
 	  create a simple GPIO device based on the pin control interface
 	  without doing anything custom.
 
-	  This driver used to do GPIO over the ARM SCMI protocol.
+	  This driver is used to do GPIO over the ARM SCMI protocol.
 
 config GPIO_CADENCE
 	tristate "Cadence GPIO support"
-- 
2.43.0

