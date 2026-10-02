Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD62D36606A;
	Fri,  2 Oct 2026 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945249; cv=none; b=BEAARrnkZjQIKj2hoTKVUFtskRz/r2J8qWrvuEE0q9JRhTCqNRK//2s/hJT94EF3uKUboLkgTwKR1jfchd8mOzMt0ZhjT+fg5Pd1Ms5LWq3pWvZJEFPfeyTNrJ+qbE4B/L+LN2C/1OYbGCnU+HbWPQPj5kWhYZqzwGe8cOKPDLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945249; c=relaxed/simple;
	bh=DFJixfsIIsAGQ1MSX9PuJBKchNKJqzGO0iLvyteoq8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tLevi8iSUUz8l85IM46liKSFY9TRyPtu9YiN65csdwaAQTClQQfP/ENlqfZ2Kh2rHGQxxeLM4OWy3zcdiVcBy/8JwulzKquG6xxNimOeRp6JjCnZ2oH0Xd0TxQUbKZY3C4X+2eZ/vVmTTzJn56yI930Y057YfSBna1brNahfpL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GA7YOjRb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GA7YOjRb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D03A1F000FF;
	Fri,  2 Oct 2026 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945247;
	bh=R2xU9ceQc0e8UmIXLVO9+Apn4tm7FqEhaNqlTP4GigE=;
	h=From:To:Cc:Subject:Date;
	b=GA7YOjRbHeW6/SiKhyawvhfHXc3OlriUbi7gLKA4gyOzSPw90yY03h4O8y1oIHmtB
	 qFH2R5FNHcDJAtdvTMMmR8fBDom7YXQjdTb9HZtxTVGAyEXPrh5fs6sN7HNQa33sQF
	 EABr/gsESBU7J2qNRYJ8zjiK3yPCvk7rmsOl1/XB+HsHalQm5Ni2ilbYV3pIhVDR6J
	 aS/cyGvsMuukoLRSfqvEhSyVrOAIU0wj5tY/0jGEFKmPC+cqnmRLbQ3YvjCgsbHb7k
	 frnlSQKwHP2BwbH5kxdVrdlwskA6VVjKY2Jzw9fHg4iy0k75s4F4kXprXaCgHxPv1b
	 VBzX93wWD1fWQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Alex Soo <yuklin.soo@starfivetech.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: starfive: fix missing CONFIG_OF dependencies
Date: Fri,  2 Oct 2026 14:47:15 +0200
Message-ID: <20261002124722.3545736-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The common driver portion requires CONFIG_OF, but the drivers
selecting it do not, so we get random warnings:

WARNING: unmet direct dependencies detected for PINCTRL_STARFIVE_JHB100
  Depends on [n]: PINCTRL [=y] && OF [=n]
  Selected by [y]:
  - PINCTRL_STARFIVE_JHB100_PER1 [=y] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
  - PINCTRL_STARFIVE_JHB100_PER2POK [=y] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
  - PINCTRL_STARFIVE_JHB100_SYS1 [=y] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
  Selected by [m]:
  - PINCTRL_STARFIVE_JHB100_PER0 [=m] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
  - PINCTRL_STARFIVE_JHB100_SYS0 [=m] && PINCTRL [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])

Apparently the problem is selecting CONFIG_OF_GPIO, which is a mistake
the newly added driver copied from others. This was recently cleaned up
with commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies
on OF_GPIO"). Do the same here for consistency and to avoid the warning.

Fixes: 9c4d0c8fc4c1 ("pinctrl: starfive: Add StarFive JHB100 sys0 controller driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/starfive/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 11bd429b45b7..7ff506a15dd8 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -50,11 +50,9 @@ config PINCTRL_STARFIVE_JH7110_AON
 
 config PINCTRL_STARFIVE_JHB100
 	bool
-	depends on OF
 	select GENERIC_PINCTRL
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
-	select OF_GPIO
 
 config PINCTRL_STARFIVE_JHB100_PER0
 	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
-- 
2.53.0

