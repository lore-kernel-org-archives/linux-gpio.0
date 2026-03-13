Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6293374E57
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 22:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773442180; cv=none; b=Sq5qjN5vZZnC5ifOMYsltUalhtx4KgtsJiZkkvmvL/NqjV12zkwPx5we1mgvjg2wwyqe4NbGQdgZZoHZSHR9m7H6Y4RrPrIfqz2M09Ll2l7Xk6VcJQ4c4lHj+70HFXIhSmbYaq05oUtpFNSMsLubOGARshN84+Nna+r4jWL4s1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773442180; c=relaxed/simple;
	bh=P/e1Lt/oqhLJkK5i2pGB/iYsuRFFybOb9u/EkmER6yk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P0+9BG8ga3FN7ELrEq5GlukR7N9TgLQBHaJpVcuHKzbg/gxVOb1EHKqY4b2bMvdbmO0uYh9axRKwq7n4qy+yG8cfcJGSuynOJuJT92jUIX2bxDmpEbK9X0w5A9hR69cyVgBVeWGv1fMLFxlchxHxkfvmwCRLOGf+bnx8Qqf9pmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YndtjnTC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YndtjnTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA68EC19421;
	Fri, 13 Mar 2026 22:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773442180;
	bh=P/e1Lt/oqhLJkK5i2pGB/iYsuRFFybOb9u/EkmER6yk=;
	h=From:Subject:Date:To:Cc:From;
	b=YndtjnTChSlIZi0NecXr+6/xhxE7GtyA7zHYwB5xQF2cQxo5cU3VmDN4HbjODIHnI
	 FGM83V6EWFfM9I3twJPqKKI4RpRdyp0vUUcbIrEL0LH2GxyuRpSehUtdwi+eVve3zb
	 6CLyHP56mvf2ac1djNTaW/wS7Z59e+LjJMO71NaKAa4qYdgE9IF/vcJSwFmDf/jZzv
	 Dnyx4wZ9p6e0fq8ht24iYSWrA1KdPU9Lxu6iKxGMlmB4W9W35rwmJoHjRtUZyjyoWM
	 Lqb9QDhhZSQ6CwnkphKOFMa7hf5PMZGs7C2oNmQ8JsgmU97Ak22drD0DVv8bY6PY3c
	 IQZxZnCXPVKLg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/3] gpio: Use generic MMIO GPIO some more
Date: Fri, 13 Mar 2026 23:49:36 +0100
Message-Id: <20260313-gpio-mmio-more-v2-0-0f777b63105a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMQQ6CMBBFr0Jmbc1Qioor72FYFDuWSaQlU0M0p
 He3sHfzk/eT91ZIJEwJrtUKQgsnjqGAPlTwGG3wpNgVBo26Ra3Pys8c1TRtE4VU1yEN6E4X1w5
 QpFnoyZ89eO8Lj5zeUb57f6m3929qqRUqJGusM41r0NxeHKzEYxQPfc75B+Zgb+utAAAA
X-Change-ID: 20250227-gpio-mmio-more-990eb0d68d5b
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

I found that the Altera driver is easy to convert to
use GPIO MMIO.

Only compile tested, I do not have this device.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Rebased on v7.0-rc1
- Rewrote to use the new generic GPIO config struct.
- No reaction from maintainer for 13 months... Maybe we should
  just apply it?
- Link to v1: https://lore.kernel.org/r/20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org

---
Linus Walleij (3):
      gpio: devres: Use devres parent if undefined
      gpio: altera: User gc helper variable
      gpio: altera: Use generic MMIO GPIO

 drivers/gpio/Kconfig          |   1 +
 drivers/gpio/gpio-altera.c    | 124 ++++++++++++------------------------------
 drivers/gpio/gpiolib-devres.c |   7 +++
 3 files changed, 44 insertions(+), 88 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250227-gpio-mmio-more-990eb0d68d5b

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

