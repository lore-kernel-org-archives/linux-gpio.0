Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BEC2E54D1
	for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2026 15:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786204566; cv=none; b=UScEpdpzeTheFFgOBpJC+h8A0Wz6hjvetJB26r0KKd6C3PtZs1FyFLGCi+U58GQrK+0/3FCi+A0rqIcjmka790BoLgTz3ob6KmF0qCq9xxdk1qRkKySD6mytuehCgDBeHnIq0TInR8mpILtK8U/4rXzvBdTk8a+tkeSplUTYs/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786204566; c=relaxed/simple;
	bh=i696J/gXK+RpkG0zn/Hf7Ox8aMAw6efUnT10D+Ea+m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPZ+AMZP0O2wLP2oRPi4z0ZKgLyjMMJ/2F1l0s5jm4vZQXBi9acm36WinYH4LthYp/uB9MbOt64wBuMW4XFhxM6s39mcwsJl0/SKiZFenAxvpboRpzcggbSfQe+lhUGSd5Ey+9T6hegymscnn6bGDG5N6DT/6AcNvNo5SdDXjWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHHM68p6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHHM68p6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc73e322dbso5132565ad.1
        for <linux-gpio@vger.kernel.org>; Sat, 08 Aug 2026 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786204565; x=1786809365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1fnok8b1HIkkpNvGzYE+StwjNqCvQ2feItOzMlKbV0=;
        b=qHHM68p6IV9Y3e+ryKAy65kmSKjR0oyn2FCqgh0qJVhWHV6otw6FoBplFNZ4fu4CEk
         masPSyUyH7QZf5w2d8CZEcd0iyWx0H0O7L3ZDXQpYcoi6OBtjv3CguOzoKj7tv2vtl06
         igJ4Ksy/xIwnJy7+KtVSmKZBIspbtwjReBAhDRJFvTAJbbZ0btVzt8rI0mP7JoLjl+hg
         2uVyNOMTmzMtqkb4BuaI0srmibxpMU/khFW17YTylsa+Jyg+wrKu+DXPXBE2303RM6Rh
         smtg8ZiUmoDHx2xbVVTBIQIMZAi/+GTU0GFLzFKH0jRFGRAK0+aACXksiDS35leYR2oa
         8kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786204565; x=1786809365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1fnok8b1HIkkpNvGzYE+StwjNqCvQ2feItOzMlKbV0=;
        b=Ud5/6+xNmwk0tY1piPlLdgM2W01ZzVGEJn5JsMyBMNilVh6p/1g7mvS2TTkIXwqfn6
         cytWJkryl1nOTCiPgVcY9Aiss0Mo8VdCPdMAEp2zlcU1NPq7gyP+MxjtMevssyzw3dLw
         /8cM1CyXA5F2SHqNVk+sgFUx1kCqea0ZRBZewORLgbIbwaL0GSVkp0TZ1yaP7n5qxz8k
         NdDqSq1RNYLku2oEf61aK41LcnnFw/Zz/AJyRcQlq8GEtxpyt5mPMmV7CeCAcguauBj1
         A3nTMnjcG1y74i8KxLWKHQ/qz/MAwXlAy/mH5/WE4nBBhaD9hFe5kc8NlXmowUzlFDLw
         8XOw==
X-Gm-Message-State: AOJu0YyG827Q+W8vTe15ANvBIPlplAab1MNO6IeHVNcyqFAX5bmX4qho
	YoI1QQs/AFMaB9Dpqz48NdebkaHspGIh+U9Q1UJGAKr25enfbQOqfRyF5B2WI8W45g==
X-Gm-Gg: AR+sD131t/62OTzhi/jJGreH8N3RU/MHr5lSjzOShbAV5nOOLr5QatDkc8ZOShPgCoQ
	qbwl3CV/8c7ZSinV7pS1lzVxxTATXuYEpOCdWnMpRUxLRetjnMODZ6t7ZqcJThjORtU2GP9ALDh
	gkqKr9W9IN9rLjWXFz85vT5sAiXYRRMPlXOtc6jlZHVVcad/9PHZSb5CxnWAmv0rRQtnGPoLY1X
	AQyayUUuDte7Bp/BBGgiHLYG57iOWyryxE8xqMV1XTjFRS+3imYmfydZX9HTbytOudDz0Z3pa1N
	aV1z7Pi5JyIYR44J0EaLs8GNHwMgarQ7kOmrAcmIGOuKCHHqNq/6O8zQ5EfoWC2Lvr616TmEFbu
	+xmJnZAeiP1IIE2NaGIxX0o/RK1Ycv5HxeVc+KAhkAvL3MIzQqI9O4Yox+NLsKeUOyQ/19NrIAx
	5Vhicd0BW9u2NsOO/P7NzIEvffRsDMSXldDjNGKyPlfeSvxo9iP7U+rKx0JPgUoQ==
X-Received: by 2002:a17:902:ccca:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2d0ca962f22mr363775835ad.21.1786204564842;
        Sat, 08 Aug 2026 08:56:04 -0700 (PDT)
Received: from DBA71591436.local ([38.76.196.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4ea157sm19404345ad.78.2026.08.08.08.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 08:56:03 -0700 (PDT)
From: Yao Qi <xnorigc@gmail.com>
To: westeri@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Qi <xnorigc@gmail.com>
Subject: [PATCH] gpiolib: acpi: Add ignore_wake quirk for ASUS TX Air FA401GM
Date: Sat,  8 Aug 2026 15:55:13 +0000
Message-ID: <20260808155513.2221976-1-xnorigc@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS TX Air FA401GM experiences immediate wakeups from s2idle
(Modern Standby) when suspended with an external HDMI display connected.

This issue is caused by spurious ACPI event signaling routed through
GPIO 24 on the AMD GPIO controller (AMDI0030:00), which triggers a
system-wide IRQ 7 (pinctrl_amd) wake-up interrupt during sleep.

Add an ignore_wake quirk for GPIO 24 on this machine to prevent these
unwanted wakeups. This has been runtime-tested and verified using the
`gpiolib_acpi.ignore_wake=AMDI0030:00@24` kernel parameter.

Signed-off-by: Yao Qi <xnorigc@gmail.com>
---
 drivers/gpio/gpiolib-acpi-quirks.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f004..8d7d18b62 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -392,6 +392,19 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "VEN_0488:00@355",
 		},
 	},
+	{
+		/*
+		 * Spurious wakeups from s2idle when suspended with an
+		 * external HDMI display connected.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TX Air FA401GM"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "AMDI0030:00@24",
+		},
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.55.0

