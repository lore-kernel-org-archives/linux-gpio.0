Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117226A08A;
	Fri, 13 Mar 2026 23:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773443273; cv=none; b=bTSsDM07W0SWecvo70bx41B7ur0QkQOBF14PlQ908Q23ZLk0Zgi65xypAZmsxyiXuIFgYBBnL+TcIVvZp8Uge0L/+BNHsNJLpJwcHCMobftCoG3dJWJQsfNY9EUjNY60sxUuuPB5uyqscLiv7+pjDRpblvJHF/wvZI5AVGM7tWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773443273; c=relaxed/simple;
	bh=U0JR/zwuYItOTXr794DeYP/MNrGW1PbPk4aqVvSPkW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T4SUFGcNi7OjrA+S5zIeKeePo5xlQPej2D3iYvuMNiYkwJTvR5vYVk21xHfzywaCbbYHQTBZW19PNpKjqUSJW4VBRgvNo+Mz9RXTlkE6LW6BrTJ73wR7BteScReh0syr3UIbU9qYqADtgFt4ZJjN6ephG3uBLpPjgFGJlLDi0Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiDBX56F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiDBX56F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3193C19421;
	Fri, 13 Mar 2026 23:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773443272;
	bh=U0JR/zwuYItOTXr794DeYP/MNrGW1PbPk4aqVvSPkW8=;
	h=From:Date:Subject:To:Cc:From;
	b=MiDBX56F0ySdjf0NrEcx67BqjTRTocZm6eiYhzloqJ2D4KzNmqk1sPmILuDkAvNO2
	 KmU5/+LNPTugLPgYKn9+qsb8y0b5ef9KFp5fdhmebvnBhlkJzsXk0JA5/H0CqguMM3
	 HTeV2ENYHzcxJcT+Tljd5/xiPqCbkmv5/BXVQWFMMBpzoqJuf+2sMPHSnDjPFKvbjv
	 WfVPCD5ZkwZ3iaGaCdPe3rumZJxuRKw61T6BlXa1IgCP/+qlDxer508hm9kYdr96hV
	 h5P5WvWub5Yd8wEhWWSFzJTBZ6XXCVHz6QmxCeTHlQWBXytFgnroUlnNNY2u7NwOFA
	 uK8VBfGc5Iwdw==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 00:07:50 +0100
Subject: [PATCH v2] Do not enable the v1 uAPI by default
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-no-y-uapi1-default-v2-1-578f09c91b8f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQqDMBBFryJZd0omCSJd9R7FRTQTHZBEEpWKe
 PemQnddvgf//UNkSkxZPKpDJNo4cwwF1K0S/WjDQMCusFBSaUSpIUTYYbUzIzjydp0WMEoaaup
 eGqtFGc6JPL+v6KstPHJeYtqvjw2/9pcz/3IbAoKvpdPYdLXv6DlxsCneYxpEe57nB37Ylhe1A
 AAA
X-Change-ID: 20231103-no-y-uapi1-default-4204e86c04a3
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

It's been five years since we introduced the v2 uAPI and
the major consumer libgpiod is at v2.2.3.

Let's discourage the old ABI.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Rebase on v7.0-rc1
- Do not explicitly state "default n", n is the default.
- Drop RFC, I waited like two years+
- Link to v1: https://lore.kernel.org/r/20231104-no-y-uapi1-default-v1-1-f60d318b6fbe@linaro.org
---
 drivers/gpio/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..d574e5fb851d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -95,7 +95,6 @@ config GPIO_CDEV
 
 config GPIO_CDEV_V1
 	bool "Support GPIO ABI Version 1"
-	default y
 	depends on GPIO_CDEV
 	help
 	  Say Y here to support version 1 of the GPIO CDEV ABI.
@@ -103,8 +102,6 @@ config GPIO_CDEV_V1
 	  This ABI version is deprecated.
 	  Please use the latest ABI for new developments.
 
-	  If unsure, say Y.
-
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20231103-no-y-uapi1-default-4204e86c04a3

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

