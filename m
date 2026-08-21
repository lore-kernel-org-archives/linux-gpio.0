Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07FB24B28
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296034; cv=none; b=W/zZvswNuSUDCM/u1HfZPrDu/alaOt+ALGEXst5MSHg+BbDL6JLNcztTcZ1uCb1I/jaXK/CzXB26ubCAFaDxy4A3zWazK1H9Ztz/rxLmy3TYl3sxT/BOO1DK/H4/h/JCKF5uLgJq5ISiZQX9xFZy4GXu40W3DCbVo5EsEuyhZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296034; c=relaxed/simple;
	bh=KHiT9Uz3L1tUUvPiMn+ljKbKUXigLaVXOr8hzafaS7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMGBDxbqDwr64LfMl3N2wVHiYLZ1jKnhx8MsDk6VjmHYkB7jqYUePGTHmXJpmJpAmzzsAyz7G9t6iutfFuzi4hioMBp8vVv7eh4RGt2Jp4weADjlEfAlVXqoKFi2vO4U7yah/SWozhVhsvPS/yhJkimbFNrTJsz8Ev/fnLiY+uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3+iFbah; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3+iFbah"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15d47266baso81368766b.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787296031; x=1787900831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/P0D6GBeuWoJ3fKJc4nQEvpIIn/RZFrAaGDwh5r7l8=;
        b=n3+iFbahR4rSqm2LoLtHV9HvbAc0jP+2Gm8W2zAu0ryEkju/THb03W3oELy8jHtYW4
         YuWVb7U2VrfaPn9wCf7p9Jw8UeppLWClazCwsFna/Jwmq72mddE0S72BbRaBXQ5DjozV
         AkfIGqrxChVv0akQYi2l7nZGzYSHOalK8h9PJYPI+UH82OCy/MaYq8fQZc4bBOUPH0AB
         tD6aRNE520p6mi50qz1w9vqrBwdSo8xLWy5QJB/oUPG7yVpqGXOcQAfYpaAp10rvoIhm
         KJdjw46h4ozala4k/gJHO5jZpclcZOaPgPezhTp7QjCrStpIiLgd3/JvLQNMo1i+25QI
         1gOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296031; x=1787900831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/P0D6GBeuWoJ3fKJc4nQEvpIIn/RZFrAaGDwh5r7l8=;
        b=bQOUa8LRuaNOl+uEYSjSeCEE5fD4eVmQlTJK1kuKKIt36c5x1jQROxXmB5cJfw7Dra
         UpiV+aACz2yvOXpL8LAMzyFkxii3HJ08wn53RfzWJ4fAPUi1lR7QaOaT/28g5yAfWvR0
         7W6HtlQLgvBdralF/NrwJtt3+ENGEhiEOtcK7OULA87D4Op3CYSmNqUWBUoM2IQZLtHM
         XGtRC/B0m9mP7gCKv+zFe7WtItz5JZTQ1eVwwueVk/GkgjdTV24qwhzkUblwIVVhFRSu
         bnsIDubwYX5tOcM2GoByeZV/YPtGqRQBKWzr+9fqPKR+/9J52DzoRhgiVUCd8gC+68+Z
         +ZKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7svp8MaeAV4A8+Doj1NhS21jc1yeeRrtV5S9z2r0Vd/Ypa85uc6oH1Xi508WJA4il8Z7leLio+VMT@vger.kernel.org
X-Gm-Message-State: AFuF++mKbAdjtUVai0sEkzbEPm6G/97mCgTlGjK/551czARCP3oW5gkx
	XMc/6wEHcjLAiwyPZWI2qiGaJJOTB2NHvUotOfR8h+cPFJQR0YrR16WM
X-Gm-Gg: AR+sD103PEcbz9To+9qtx7SDvN2zo03+pzdC7VAwvd6Trhj2a3n5sVS64aP8V9WjwkR
	BRLVtq3X7Yh9939uQiyZcmKpLcuC6sY9Zn6J5tvQi7qchqr0TfXh10QtLXZtNMateB75sJuzD7n
	SbSWLjRaEHHEW2EzflYcuLu1tG819f+seJFW7qe3Iqw5fPWYX7Zj+M7fpm1EzgGS2NOEYuN3WyD
	qzItiDFYSAmZ/L4FY7mUvYiI8pY1LADsRN3QCuC+clQ3GgCXCwOmyZPL0FYQ+VYuYpWTTUxsp2o
	y+rJaFNA6QcUx7sojhAALA1WGJbZWDHsCyxRnR/4eM/sk4fYZpRDPHNqIqwZj0dyguHgFxk3xgL
	9qUgQVVFiMsEy3MSeNa+yLMNmaPPxkvLiNs20YFCPyQFelHBfS7gbynJQpodZQ4mttpL5fM33M+
	AHT2Jr+ijYlXDIDK3Py89KD95awxLE5Q2hSHdI0PjHIiT97JYQS06Gbl8cv87VJb16/dggjFj+B
	6OnecIFK9TNcjrFX23xCk2q3V4F3sgEZ3+XWDowWJB4Om7dh4mhYznT2i1X+8NwMPmVzbJqM5HJ
	mblVOacLxFLlQqM=
X-Received: by 2002:a17:907:7ba7:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c246a6836bcmr403412566b.21.1787296030701;
        Fri, 21 Aug 2026 00:07:10 -0700 (PDT)
Received: from localhost.localdomain ([5.22.132.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df622sm332597366b.46.2026.08.21.00.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:07:10 -0700 (PDT)
From: Kivan <vaknins33@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kivan <vaknins33@gmail.com>
Subject: [PATCH] gpiolib: acpi: Add ignore_wake quirk for ASUS ZenBook UX425UA_UM425UA
Date: Fri, 21 Aug 2026 10:06:50 +0300
Message-ID: <20260821070651.39763-1-vaknins33@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ZenBook UX425UA_UM425UA (with AMD Ryzen 7 5700U SoC) fails
to stay suspended in s2idle (Modern Standby), prematurely waking
after 1-3 seconds with 0% hardware sleep achieved.

In the laptop's ACPI SSDT tables (SSDT15), GPIO Pin 24 (hex 0x18) is
defined in _AEI as ExclusiveAndWake targeting the PCIe bridge device
\_SB.PCI0.GPP3:

    GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullNone, 0x0000,
             "\\_SB.GPIO", ...) { 0x0018 }

When the SoC powers down PCIe root ports into low-power states during
s2idle, an electrical edge transition triggers a spurious wake interrupt
on GPIO Pin 24. This signals the AMD GPIO controller (AMDI0030:00 / IRQ 7
via pinctrl_amd), aborting sleep across the system.

Booting with kernel parameter "gpiolib_acpi.ignore_wake=AMDI0030:00@24"
completely resolves the issue: amd_gpio reports ignoring the wakeup on
pin 24, and interrupt counts in /proc/interrupts remain at 0 during sleep
cycles, allowing uninterrupted s2idle until intentionally woken by the
user.

Add a DMI quirk entry to ignore wake events on AMDI0030:00@24 for this
system.

Signed-off-by: Kivan <vaknins33@gmail.com>
---
 drivers/gpio/gpiolib-acpi-quirks.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f0..dd4db58 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -392,6 +392,19 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "VEN_0488:00@355",
 		},
 	},
+	{
+		/*
+		 * Spurious wakeups from GPP3 PCIe bridge interrupt
+		 * Found in BIOS UX425UA.301
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX425UA_UM425UA"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "AMDI0030:00@24",
+		},
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.55.0

