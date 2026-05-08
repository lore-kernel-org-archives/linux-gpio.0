Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EF01A9F9B;
	Fri,  8 May 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244690; cv=none; b=Mg/XIA7qRBsYqE4Syths1ZxIZMUvOnJbZD4GkMI356vm+LDfa1U/IU7Lkmv/K8pGEliGWgBw3A5XuxO93PTvJ9odN9wbY14BMT4KxaF0Oblt5zvnjb9G7vUKKmc2zeyRH5h3AioFtkvqR+6yrm68c7hsoly8vHWyiVdT/dLWP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244690; c=relaxed/simple;
	bh=E2bjb166+y0idkh9tbyBE/epGduSKdbaXa1SBSsI0cI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ua8uTG2rrxUWC5BZSQutD8XjmHrfKoreB72URO5q6hV079r+BWcfQRtaPEvrYsVR9Hc1MX/2+Lvu9nyTx6mgdZwnP6f+IyCgfORWqeiUTKot7jeP6BLMgE7vvnef8aJcd0szQu+t6j13zjbvjOnLTNb9R+1wUuMhi8TGz/3XsYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqyeIT3A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqyeIT3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABBAC2BCB0;
	Fri,  8 May 2026 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778244690;
	bh=E2bjb166+y0idkh9tbyBE/epGduSKdbaXa1SBSsI0cI=;
	h=From:Subject:Date:To:Cc:From;
	b=kqyeIT3AevaSH/Z07yqRxz7vQWqaiISTHAU5+0QU8xoxfbOg2DSZRFBTPPAiFH3Bm
	 Vvul8lzr6RlHr0TVefSvM6YXAFLPxrcu3b7QKNjjl6vashEsqa9RTiKYoid30QvKBr
	 HUWWSPx3h5bLro39NWyB7Z6QOAo9kPZwd5u7fPI9M5u/uOOQFIs5wnLeoRCh2Fqnmx
	 rpVw4FQL3CCQN3pKL18KtUCZRKbbfGz8Bz7rSywQa6WMl59x0zw69ick1q8/uQpmUK
	 JXYelhauyZ7sVnduU5UI+z1/5AS4lmcVtOfF0Ls7Qlaefpjs5iCo+rg3uZ8hEgup1A
	 TFJSU7hoD+ccg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/2] Improvement spotted during patch review.
Date: Fri, 08 May 2026 14:51:25 +0200
Message-Id: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ7CIBBGr9KwdgyQ0BpX3sN0gTCl408hQ200D
 Xe36AVcvnxf3ltFRibM4tisgnGhTHHaQO8a4UY7BQTyGwstdSuN7IAxPGyCkChCTpYzwkAv9OC
 JQXnjpNeoXTuITZEY61j15/7H+Xm5opursz5GynPk97e/qPr7M7UoUGA1moMxqDupTjfkCe/7y
 EH0pZQP7Owe3NsAAAA=
X-Change-ID: 20260507-regmap-gpio-sparse-fixed-dir-1d5c0d2e2c6f
To: Michael Walle <mwalle@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Alex Elder <elder@riscstar.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

Support sparse unidirectional GPIO lines.

To be used in a forthcoming submission.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Make a second patch to exclude setting on unidirectional
  lines.
- Link to v1: https://patch.msgid.link/20260507-regmap-gpio-sparse-fixed-dir-v1-1-a2e5855e2701@kernel.org

---
Linus Walleij (2):
      gpio: regmap: Support sparsed fixed direction
      gpio: regmap: Don't set a fixed direction line

 drivers/gpio/gpio-regmap.c  | 40 ++++++++++++++++++++++++++++++++++++----
 include/linux/gpio/regmap.h |  7 +++++++
 2 files changed, 43 insertions(+), 4 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260507-regmap-gpio-sparse-fixed-dir-1d5c0d2e2c6f

Best regards,
--  
Linus Walleij <linusw@kernel.org>

