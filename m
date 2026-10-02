Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94412455615
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936320; cv=none; b=girW53IpJL2fzP+HZx4VJsYh+u3B9nKUefY2AdYUB6CSaU9COLVFCUsHfAlmGvbWnGnVM19SgxgdlBlcEIsRsca1ro42icbOJezvRwdwYQfExXco1wBMFyrXb8EZAGC5dHH19EszOm1T4hBFYP26APQB5ReynUD6Cfej8dXX6FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936320; c=relaxed/simple;
	bh=Mibw2iCp18VIFMlhV/kjcqAYiFGLy8WWeb9id2+XlQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cNfnUogCDzpKfDRyw0/CapeyrzTRWrEi+wRm7aTpqGS00xCQeD2vVzpg4fl9GacZSyhFHxGLsYbZgtbqw8VpO2nW5bEhG/XlXiwsVnnpNvyu1+2opjayYAdcbKzkyAOgbgBQ76X9fAlXgxG3Sjnw+6iUdyCKByYmKEl0Z/gbPmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLIIqjJf; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLIIqjJf"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e2218e711so33527466b.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2026 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936317; x=1791541117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ff/XvzxY93KOQfzC3a54rsMSJuWp3rTdaJjJYBq0PA=;
        b=eLIIqjJfBCrYJLZZ5hQPmrBDOcHmEYfy7iQOgabtezoB5zSYeqLqroPxVlnLkBVEg8
         C5s3RaHGIkG6d4Hf36KGrS1fV/qOWLk9V/wBIzj+I9pfqSDbVFoaEQdHApSqxfGQ7qq5
         238y3mB63WU2a2bsijV3wYy/i2MwMZbx1PmpJ/j/3EXmR+suri5SAHtZtgN8zRZVUsX9
         Lzzs5z1KTXozTmBImliEk0oFHCizPb4BHmNVCEJ0akEtVp3GjJfNigMUqF3oMMdsaBEb
         Kpl7lldlAcHQWeP9EXETFtbSlzjb3ZSxW9Dy39ArLbD+nGUZiXtc1OS0fgKosAjNSX0B
         zkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936317; x=1791541117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ff/XvzxY93KOQfzC3a54rsMSJuWp3rTdaJjJYBq0PA=;
        b=fm8xwIfI1QHBVx+h/5zYmo+oekL9D6oK+UpPPAJ4aLmD4y6737MnpxBVfU62/xurng
         TOVGKYPCqoYOYVYSnbThUmZ1PC/+36GvBSoelA/reMcKWHl4tMDXBBZOxNShe6A+srSo
         r7KcNIL6X28h2vZkRfXEJqdLOV1+WjUOQuxLhKIkikd8LJcr4Il4lh4tDDAF5W6bPny5
         F6G9ZhzwjDE4t47M6Wo1YcGbNmMdEnH2xnLKYS4+2lJDWl6HSu3BT17PVVFXwChz6q75
         2XDiQzx8JJrtOpKqlaFka2MlNURYYZgBOdXc4ZXuggBt8BrBKfp7QkkfotroexXqKfVf
         8CaA==
X-Gm-Message-State: AFuF++mTHx38BEFs5vrTgKgn8S+uKJ+P2LCOaAuPQLQs86klwnF5fGmC
	46FEHK0Jmcu17w40ZAXsuok8GPdCqZ8D01XRtqBiBI7u6Hbq91CGusmE
X-Gm-Gg: AYBFou0NGmZtuSPBNe4eIVL7PDkw18RSGxJ3hGHGpOmmRJZxsUj8FmSt2/hJuxMsUYc
	Ow+nypxy/57c8MQOZNZK8EnFv85sL/FFB0JZq0M18qF0INkaJWANhz2GcYWFr0HEpzUNmc5Z+/I
	tx9SAD+Mwjb44HwNH3vf48smmXlQlCFjZ0RkiuuYcptWsczuqAdiIkoFFGC5TvqmoR/7c6Ait9b
	OC7Z0y2NGvncNhAxe/W3Uu0lWpdJ0Eww+s1NhaH9rF0grenyQVssXKUs9FDBO+bzQBC2Cx3Bf9L
	7dBSLDqMdM+L8ufozjIKjt/0daUFOYyswZBxlgMyeslwjVO/ddey28JD4ct6XmiuK1Hs1wODcaK
	vdqkt+XuimECLisLT+CSBP1xev0fujW5WJjthuFX14gGQtBvrXzSv8hPhKPJJD4AzYCrL7v+2N3
	B5nJlfAE+9sEgj09HrG2Yq9glLoMxL6o29vOOWwTrX8OKSVo9GLkg7bBLMYVpHQCdPKJvd6h//3
	Hwenf2jeKGN42nPXxv8aPnCQq72
X-Received: by 2002:a17:907:3f90:b0:c25:ca8a:8e25 with SMTP id a640c23a62f3a-c2e4a92bfffmr195136666b.1.1790936316710;
        Fri, 02 Oct 2026 03:18:36 -0700 (PDT)
Received: from omarchy.onca-albacore.ts.net ([185.139.138.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4ca4d8a7sm74934866b.1.2026.10.02.03.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:18:36 -0700 (PDT)
From: Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>
Subject: [PATCH] gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro V 16S AI
Date: Fri,  2 Oct 2026 15:18:00 +0500
Message-ID: <20261002101800.51506-1-abduvaliy.hbai@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Acer Nitro V 16S AI (ANV16S-41) the internal USB camera
(0408:4035) works on Windows but never shows up on Linux.

The firmware drives GPIO 11 of AMDI0030 high to power the camera. The
same pin is listed in \_SB.GPIO._AEI as an edge-triggered, active-low
wake interrupt whose _EVT case only writes a debug code. gpiolib-acpi
requests _AEI pins as inputs, which clears the output enable bit, so
the camera loses power during boot.

After boot the pin register reads 0x00447a00 (output value 1, output
enable 0, line low). With the xHCI controller kept away from Linux
(pci-stub), the camera port shows CSC=1, CCS=0: the camera was
connected during boot and then dropped off.

Booting with gpiolib_acpi.ignore_interrupt=AMDI0030:00@11 keeps the
camera powered; it enumerates and works with uvcvideo. Add a DMI quirk
so this works out of the box, like the existing one for the Acer
Nitro V 14 on the same pin.

Closes: https://lore.kernel.org/linux-usb/CAPGafdkBb49YFV+d0rYjbi4QjifCUr1Wos6C5TZtDQzN6-pn+g@mail.gmail.com/
Assisted-by: LLM
Signed-off-by: Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>
---
 drivers/gpio/gpiolib-acpi-quirks.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f0..5cb0d5f 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -343,6 +343,22 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_interrupt = "AMDI0030:00@11",
 		},
 	},
+	{
+		/*
+		 * GPIO 11 is the power enable of the internal USB camera.
+		 * The firmware drives it high but also lists it in _AEI with
+		 * an empty handler. Requesting it as an input turns the camera
+		 * off, so it never enumerates.
+		 * Found in BIOS V1.14
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Acer Nitro V 16S AI"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_interrupt = "AMDI0030:00@11",
+		},
+	},
 	{
 		/*
 		 * Wakeup only works when keyboard backlight is turned off
-- 
2.55.0

