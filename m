Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199F128488F
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 01:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790473366; cv=none; b=DA17Oq2aaf2bX/XMHHyh86zZW60R39GbDnMJ2bm5xrYf0TyDwXsCSgT7VhMGNYKypEfH/c1mk8H/ORvFibVy0mOVVNcznttbKMoYa+XIakdfkPRPYqAMP3B/8UCiNSvywPwIFhuCab19wfP88iW0/ciMYhCQmnR9GvfAQZkFZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790473366; c=relaxed/simple;
	bh=MUz2w9T6IPyLJD/sYBCRSOg5qWq2x/IjxuRNkNDt/F8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uKOk2C+6YV4JXsAwZO99kCE91gio1gTSeiVW6JOutc2aCUGSoUAzig0R3eYLm2ZIPm2V96DiMLJ65EIy7PqKbxfV7l/6IbaLqm7prary1czP0PmLBzRMyuyooJ+VC2Dh4knRAjaAURj7k7C7E7b75inwtMAVj4gP3jh/b9uUakQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kzski0ug; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kzski0ug"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so14523935e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 18:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790473363; x=1791078163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BobMbsh0X9XKX3XYpDfcOJwdkHyKyJ9cvn88xx/myf4=;
        b=Kzski0ugP8diN8rXQc+akIjnztiqoYTCp5BbuEHxYdAin8iOj9YotY01kjO0c26jC+
         PJ8AAABXGNWQaJ5yl5R5TddCMTzzQnuucZUhqWPk6kcBRXYSP6EMDsHDvFFXveEceCyZ
         Q2yohXcCl8mxPYTjkt6rE8MZ6+uJM3M0uWZ0JcYTHIDgfGe4yUAN0nYBAPDLnb9Zmijl
         Rial8NZCqGCWPk9w4l4KFCYpxgQeaovYI7gLmpxDwt49LXd04hudxmaf4hDYXBPm4aAK
         vWi2NfV4Jtasy+IDO8QoWB5K1T1lQlCAYLgyRBXyKPdHc/PkRu97VuS5WkFxKfULwA+E
         oLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790473363; x=1791078163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BobMbsh0X9XKX3XYpDfcOJwdkHyKyJ9cvn88xx/myf4=;
        b=oCTvvLTn+ni32wKA4aUm1fchcKHqlknmub0k2gIDY+206XD7tbL6ZDXcNUgwhBNJrc
         1gMB6X/FS3HPyIilGud0tmFsnlI4rNz0oGfpFpVXcSC7Qpq3a8Ed9gSfHmik0qdQ4c7F
         No5uFAv5BypSTVGwQYDQrIg73BJ9ZMoyas/iZOqQ7QyGCOiQdn22tKdWGr19U4THJifI
         6AHE2nSlzPGDWfwR8KIkFWm0/eXzJnFV8xhi4FBUoyl5xlb86/QhpJnGSM5VVnGrrWh0
         xUfTGZwYDULC5sBwlYycVw/vUY6T2PBEQpAiaTUu3C8RnKlR+0/n8DughI14IZxp+lzA
         HbLw==
X-Forwarded-Encrypted: i=1; AKwUvBwlC2m8e9AvVQ0JwnsxjwQE1gRWFJQurRwh32iW0WfHcWOoQ2uJTA+0MQZIGHwFoOu0+GG8Otwyrti4@vger.kernel.org
X-Gm-Message-State: AFuF++mFYi1d+HS9HRjSkDitv/Riquzo64v8Q0cK4tZALT7CPnK0tUkk
	9e/dogoXf3tyvy+OmCsGmFwfn4pDBynfjjrsxuw1/JB93xAYhnC/y9W4
X-Gm-Gg: AYBFou3TiWUhe/pmTux8joKSobpeQVjbqM6oPD1CKGS6sZjmebf7FrgDlSqeI9vpgJW
	bREzEp3tLj4W3420Tj983o84RkRrR5JEFmUtXmI7cUCRyW7YCfObjHrOoR0zv/2F1sG2bOHWgoQ
	eSvSUdXiNvh8biVn+kCgf09/4wSBsD3gNoa4kHMVWnDDCGuR09kODBWJy8lpIRd+sNp2df86dm8
	UZz9GjWmMCmP2NWSIR07sbOXtACUUoyHzuqfgTyzSW74loaTnSghTVTrB1FiH1xV9kbFbC4/UNa
	XR6lq6BDyRlOA1VBi68MRK6SYWRrvK93ImPrgk064xNcHhVV3dGo2BzKknjAfwlnyqdq6RLFdZ5
	HWq0cr0cT1IC+ybE3+nD437zpjIaqjSBi8REg6Ctw7yALD9yXMVSm29sMltXbBgBKnldwZBB0TY
	uIE9z8UzFYEJBF0CAGbP/FPNVgtRacVzuBuvbuY7W82+8cZhq1dmZ75agBbH8iFIP3MNdLDh0=
X-Received: by 2002:a05:600c:3514:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-49fe6701e7emr165732325e9.35.1790473363268;
        Sat, 26 Sep 2026 18:42:43 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001778312sm44267655e9.8.2026.09.26.18.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:42:42 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartu Alev <bartualev@gmail.com>
Subject: [PATCH] gpiolib: acpi: Ignore AC adapter wakeup on ASUS FA507
Date: Sun, 27 Sep 2026 04:42:12 +0300
Message-ID: <20260927014212.302743-1-bartualev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS TUF Gaming A15 FA507 wakes from s2idle whenever the AC
adapter is plugged in or unplugged.

In the CPMGPIO0 SSDT, GPIO pin 23 (0x0017) is declared in the
\_SB.GPIO._AEI resource template as:

    GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullNone, 0x0000,
             "\\_SB.GPIO", 0x00, ResourceConsumer, ,)
             { 0x0017 }

and the corresponding \_SB.GPIO._EVT handler issues a device wake
notification for the AC adapter on pin 23 events:

    Case (0x17)
    {
        Notify (\_SB.ACAD, 0x02) // Device Wake
        Sleep (0x05)
        Notify (\_SB.ACAD, 0x80) // Status Change
    }

Both AC plug and unplug transitions therefore trigger a spurious
wakeup from s2idle. Add an ignore_wake quirk for this pin.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
Hi,

I tested this quirk on my FA507NV and it completely resolves the
s2idle wake issue.

FA507 ACPI disassembly:
https://gitlab.com/voidvore/reverse-engineering/-/blob/fa507/fa507/FA507NV_FA507NV.318/disassembly/ssdt26-cpmgpio0.dsl#L263-269

FA506 (same pin 23 handler):
https://gitlab.com/asus-linux/reverse-engineering/-/blob/master/FA506NCR_FA506NCR.304/disassembly/ssdt8.dsl#L263-268

GA403UI (same pin 23 handler):
https://gitlab.com/asus-linux/reverse-engineering/-/blob/master/uncategorized/GA403UI/ssdt18.dsl#L267-273

I have one question: this issue is probably present across the whole
TUF series. If I acpidump more TUF models in the future and they all map
to the same GPIO pin, should the quirk list the board names one by
one (FA507, FA506, FA707, ...) or match on the product family ('ASUS TUF
Gaming A15', 'ASUS TUF Gaming A16' or 'ASUS TUF Gaming')?

The DMI outputs on my FA507NV laptop are as follows:

  board_name:     FA507NV
  board_vendor:   ASUSTeK COMPUTER INC.
  product_family: ASUS TUF Gaming A15
  product_name:   ASUS TUF Gaming A15 FA507NV_FA507NV
  
Thanks,
Bartu

 drivers/gpio/gpiolib-acpi-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f004975..6d56ea0d0581 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -392,6 +392,15 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "VEN_0488:00@355",
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FA507"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "AMDI0030:00@23",
+		},
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.55.0

