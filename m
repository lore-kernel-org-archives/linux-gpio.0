Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B6D3E0C4B;
	Fri,  8 May 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244694; cv=none; b=WWYvCnpq/0MrFNUg8Z/mRKWvBZo3qdq80BGPs4vrGGlnfFKhDAgRRUvlkl0rT6wYYiJWF2iEJLG4FH4XE0maYzc979wa6XztLYMPRMfWdqXSQcKx3sKg7gJtPw+bwri+4uPUGWRcNOJKo5R/eiq9dWHKMtUGey/9sCDdnv/rRAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244694; c=relaxed/simple;
	bh=1VxQGneYMsXJIX225dqHkzOd38aTPB8bOOneM5Nayi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuWFPZz3g5+sU3+0FIprDjhLwbtRgoU9uugdOwDY4XkWRjRjXG1IsQA6Idsr2aV4052oRPQdGhagPBclL29kT9f7hJ8nE6y1VPMh4RhrB9egiYlQYQkqie66fNjj94F2Yy3xjPq1v+9I6YrXZXvhD9jR4npZ2fywkV9BMYE9CQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNuM9Of1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNuM9Of1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E60C2BCC7;
	Fri,  8 May 2026 12:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778244694;
	bh=1VxQGneYMsXJIX225dqHkzOd38aTPB8bOOneM5Nayi0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TNuM9Of1kHTccbRfVLYhTkeB0VeVGgtE64fqo8yacSSWyfNw6OyRGO1X/n77go8QT
	 QS1LjouH/lvB9GHTKTHzFSRLmJxDibJUwpXnEszhJKcztZDfAA6KqNKGsNChYl0NOI
	 8CZgDUW1XqQfbshtgcNdWtK5pLQjDbGN9qBvOoo9uifC4JnRJbOraXc9bpiz2hGMv+
	 GdvpqIldj360fiGk0zI+cIVP1XIvKPLBi4p1JIxwqf14+vwbuW3MLvHr3lz9BLl2OF
	 sNx8dWo/086iQd+LG4BskF/zJevKVESIYMLYD8NWHOl5cWu4d/ArkUl1I02IlpKPNY
	 EkEgYmVmDIutQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 08 May 2026 14:51:27 +0200
Subject: [PATCH v2 2/2] gpio: regmap: Don't set a fixed direction line
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-regmap-gpio-sparse-fixed-dir-v2-2-deee84df3027@kernel.org>
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
In-Reply-To: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
To: Michael Walle <mwalle@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

If a GPIO line has a fixed direction, there is no point in
trying to set the direction.

This didn't happen much before because what we supported was
all lines input or output and then the implementer would
probably not specify the direction registers, but with
sparse fixed direction we can have a mixture so let's take
this into account.

Suggested-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260507-regmap-gpio-sparse-fixed-dir-v1-1-a2e5855e2701%40kernel.org
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpio/gpio-regmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index f45a432e8ebe..52a67dea8107 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -203,6 +203,9 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
 	unsigned int base, val, reg, mask;
 	int invert, ret;
 
+	if (gpio_regmap_fixed_direction(gpio, offset))
+		return 0;
+
 	if (gpio->reg_dir_out_base) {
 		base = gpio_regmap_addr(gpio->reg_dir_out_base);
 		invert = 0;

-- 
2.54.0

