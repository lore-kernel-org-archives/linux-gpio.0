Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C183DA7D7
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245809; cv=none; b=aN7xJVAAJnxxT6gBFW/+c+cHtvpAA5tFF9a2B/MehqwN5lNmcZnJ3eYVYlnXgCKva0iPg5NQiNyaiDfbVBpb+l+xoIX17wr90SRlhzOPoxzbfJF5CaUIb/pkAtqVoelxne/B+YR4BOxE5cmCfs9dJaNElbAwjplcB13qfS1IJAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245809; c=relaxed/simple;
	bh=/LEj7nFYNYQWhLcTifUB6p+HLu1eIqoWYOtXxvTlZwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RszK6OW5AqoJ31WUkh/deGzRD5Ac0or5YOm7HvPUuj9H3a0QYwQERWjjN4n/lkYWM4Ji49cvZyrddZWcu0IdYGX1zA1O8hRZyspUeG00AULFuYgl7wY8lrCoeh0wwDPgUvuOAqQkPKCodBUeSNnTOyMNzUIFYDsttYir0lWXWp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=advLkqOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="advLkqOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B813B1F000E9;
	Thu, 20 Aug 2026 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787245807;
	bh=ZUc5YV110k74U+KdsTtUUql+J6xWpZqAEKBmmblVNVw=;
	h=From:Date:Subject:To:Cc;
	b=advLkqOptoRhlafFL0nXEx5QinOXR+RcsYGtBcjvtzaHSJPCu6J1DnJjzjG4lBE30
	 XO2GZVcldFox7Nlq1dpVdDD7kMNQ3n/I7LQa/Z4fkjltE/mtCzEOD7y/z5FRTkDAj8
	 IukaMP2sSH4b3r3o8rjKE6Nuh5hT0QCHx7QHOQBAO4B+gaaU72lQj7kxndquKFZfQx
	 srirX5TWS8qp82Rzl3pn8175LNpN6X8w6dDlI6NDe4hJwjU05Q+/8ArSDRVVjtdY3G
	 suS29SAg5aE2sdeu9EQvtb/w8SLccCsXMpc5yM8zFuf86gz/VR1LuphdHOX30aytSJ
	 1QlHY6hIQdKbQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 19:10:05 +0200
Subject: [PATCH] gpio: generic: Avoid pinctrl calls when ranges are missing
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-fix-gpio-mmio-pinctrl-v1-1-62c2d7dd4903@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBBFryKzdmCSRdVeRVyYONURjSGxpSDe3
 andfHjw3zsgcxLO8CwOSPyRLFtQMGUBfurDyCiDMliyD6ot4Uu+OEbZcF11ogS/pwXJ966hajD
 WNKBuTKzHu9t2f85vN7PffzE4zwvzlk4teQAAAA==
X-Change-ID: 20260820-fix-gpio-mmio-pinctrl-0cab907d1219
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, sashiko-bot@kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Most calls to the pinctrl core is done through the generic helper
that go into gpiolib, where the library checks if there is a range
associated with the chip and just bails out silently if ther isn't.

gpio_mmio_dir_return() misses this check before calling
pinctrl_gpio_direction_output/input().

Fix this up with an explicit range check.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/linux-devicetree/20260820073920.909F71F000E9@smtp.kernel.org/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpio/gpio-mmio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index e9c531eef452..7e4b3e8d609f 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -354,6 +354,11 @@ static int gpio_mmio_dir_return(struct gpio_chip *gc, unsigned int gpio,
 	if (!chip->pinctrl)
 		return 0;
 
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&gc->gpiodev->pin_ranges))
+		return 0;
+#endif
+
 	if (dir_out)
 		return pinctrl_gpio_direction_output(gc, gpio);
 	else

---
base-commit: 9d2ed026f031f764e9450ac9aada2f46bc977397
change-id: 20260820-fix-gpio-mmio-pinctrl-0cab907d1219

Best regards,
--  
Linus Walleij <linusw@kernel.org>

