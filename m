Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C734D44471F;
	Wed, 29 Jul 2026 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318454; cv=none; b=uuNylAcXgN16QXLppU1GlO4Qg+o4j6I3O6jRc5oBBiMTueFrZ5RfQAK610rDUTn+ajMsYLvPkeEhvQP9hSM1Qe058PBmByEzH90XgCeSgWp+ZnzjNUvgqAGOZbjiXnPrt0NT+LTyCtLMTOHpFk/56xest9siyYyTubdsPIOMWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318454; c=relaxed/simple;
	bh=atkGlq6jwB2hBk3HPOpcwdW5qPxuOYpVuR6WGHv8BLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gh2ocEmK9D1w0idfWI3VQYdF9hipaLXj+7+5hOzEujOCQuvaQt3xEK7oFD3sqgKdAH/YSWYTqc960SvJm8NwRuIUP3Wyj+M45zDgQ7gW4jpNcsmHVqhz5pGewCm66IKkmsIBRoOLu+f9Dzl9L3OGAlMkz+oGTX5V64oJn3if41I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOuMH1+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOuMH1+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510FC1F000E9;
	Wed, 29 Jul 2026 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785318453;
	bh=PsKOoAxchI+o6Rprtpzn1zFLicGXgF+8KUPrke4ID9Q=;
	h=From:To:Cc:Subject:Date;
	b=nOuMH1+gKCdVOYko+8Lw3DMe+jBgyBlK4y8mDZeOpNgQCUZHyxg0qKiKsQD7+Glqq
	 lZoEpNmORYXrXULTEzNQslLY6tsDo/NVnFATKJTgKzjqS1xSrNwO6LXbc6wREKbgWt
	 B2OcLEDtXmizaQT++pAgdXwRd7Lc4sK8+ZfjQ7G2M8IQMYd4KDKXWLI9N+6iyMBctj
	 8P9GhTZ3alTuh3k6ze6gyre+m7oB/CQyLtC933PgJzr+Ur+tMAeLumKIt6X4Ymnzby
	 wvhUUd1hd2sRQq/v5bzsrpEN0bOCVY8UxnpoxYFof9i0ClytKuIWtTzRNCmN1v1Azv
	 YNzocW370Vy6A==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: Check gc->get_direction() before calling gpiod_get_direction()
Date: Wed, 29 Jul 2026 11:47:20 +0200
Message-ID: <ad89f92f91d004e63dd5599bb58e9581f373a601.1785318183.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600; i=chleroy@kernel.org; h=from:subject:message-id; bh=atkGlq6jwB2hBk3HPOpcwdW5qPxuOYpVuR6WGHv8BLc=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRlntFNNL+T/+nFMZWFIrqeZevzp1zO/M+XXjj39F3+a x+5lwb7dpSyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJBCYy/DM+PGHfpVfq6Tv7 Wtj9E815Pqz7tqXCTq1wSq24QGbEx26GPxwz18w6te7QW9v+6x4rPn5OPeFTvEF+71Xr9g+rczL 9YvgB
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit

According to 'struct gpio_chip' documentation in linux/gpio/driver.h,
implementing .get_direction() is recommended but not mandatory.
Most places verify that gc->get_direction() exists before calling
gpiod_get_direction(), but gpiolib_dbg_show() doesn't.

Until commit 471e998c0e31 ("gpiolib: remove redundant callback check")
it was also verified by gpiod_get_direction() itself so calling it at
all time from gpiolib_dbg_show() was not an issue. But after the check
in gpiod_get_direction() has been removed, calling it inconditionaly
leads to a big fat warning in gpiochip_get_direction().

In gpiod_get_direction(), verify that gc->get_direction() exists
before calling gpiod_get_direction().

Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5fb60111151..6abf73bf056a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5417,7 +5417,8 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 		flags = READ_ONCE(desc->flags);
 		is_irq = test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags);
 		if (is_irq || test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
-			gpiod_get_direction(desc);
+			if (gc->get_direction)
+				gpiod_get_direction(desc);
 			is_out = test_bit(GPIOD_FLAG_IS_OUT, &flags);
 			value = gpio_chip_get_value(gc, desc);
 			active_low = test_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
-- 
2.54.0

