Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517174;
	b=YZFB11twpG+IZc2IXsBtboxy72Y4Fc1uca5g0X/aAdVmY8dnD/OR4krYtMWNK99l2HIw
	 WbNBWCTOtv1JWJC85c7bS4zFoxpx8ccBNQCe6MHxUoF1hu/HHURJbC38pZ8XzjA19UyXE
	 4AN/PHBwwKQq/ACI7HUU0dZmDREzDU7yjTncdNgLnJDrrHdo9/aGzHrIDYwW+6emishP5
	 pUn9NuNyNc7lZ8xm5wtWh63Hh3AN1SXhXOcesye2IHDoITZoa2kILSTEpqadK6NnBWsGw
	 LC6wI4CSv09vtgaY5V1hI65oTfIebHScOeOQQ0O3sVgw0+acpwXcsYAhOCm1Z8izDxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UCrWbctlSHop+9cZ1ZCw41LJBn4yifLcSO91GaqF4lo=;
	b=yowsNy1YkfT+zmaW9oC8cvlafniXFjsrRyLC5nv1Gu7aGnYYGTb6iAiIbNkzRLwEoJCP
	 OAzgYVmkn7Yq0EJaj6kx3Om847ctyZeaSLL7Dgbuq7J3xd+fX+ZJ3YiWiRMoWMYOBYzsV
	 8MOAQxP2qspH1+5KlZukqnJE7XuQ6WVWq/Oa8TgjX8sU0FRM4it/Imc9Hx/Wr+G5HhMo5
	 jhROMBndKhHvu5GfmnO74WqQn8KjgidDYf8o70XtXz8f9HyzFHyKcfoWoWXwlgLWLMWGd
	 zCAaMtjVF8qQzgwyHuRTCiIqGWK1JmEXewpZJN7cxYZuQM+MkligE40fTeyC6dZFGsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="LFOl6I7/";
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B13606A31D
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 17:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B13606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LFOl6I7/
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1482975a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 10:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517174; x=1793121974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UCrWbctlSHop+9cZ1ZCw41LJBn4yifLcSO91GaqF4lo=;
        b=LFOl6I7/+pBvIX7W7Bkhrq2rw3YeWsXAFjTrVLuAIfGlRxftiAitCngGsjR6pFPkrX
         kbJmvwVWR9Rc+M2PTyBI0wRiUJG1pWjp3IBeL1Dv/breLKsmjZlcIVCAOj2tLIWXOkih
         oYOK8UlPW3OK/EfaF5/DyBadM9fY/MU1kTsN3JqxKXZuEzUMCU7MER+1nOLa40P6jZB8
         ZOeehPHogzEgmtpHCmf9mZJ9nUtWGB/5unXHX+kZkM5gqU7RFiBpjI7EeOWjdsTXWGNS
         AQaKm67Me/rJ8wPokZXkmzuM4bFgdlG+2CUriu2DKLYkW46vkkbrWX8lliLTN67ecEeM
         fDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517174; x=1793121974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCrWbctlSHop+9cZ1ZCw41LJBn4yifLcSO91GaqF4lo=;
        b=HY1WEjLSR2LhlfBJ3JR2Jhydy1BUENTHuBm8oLmscfStSseqLAswRJ380GkULC1KYn
         tudlsYfJXaJnVb26r4WOyT4zYsorwnqOAG6zgzPzbemMYsJ5jkkhl1pCZJ/2D1jXxIIa
         oZwNFV8S8ktI+/ga3dQaO+BnSgduirGLGB4M6p9xWk/Zdn3YgCSQA25RfMKHkn80cVI9
         bGfcKWtLYPxVNJ8QKXb/OSA1W68J6k0CaldH1b0750UEp/Cdt1PRQSLFb7vo0SHMjesS
         Jgynw/GmOLUQxnSBACxnjoXVodj9IK5dky2Zx3L9JIeKIvf9wJFOJpxq1V36iah4gPgg
         jzRA==
X-Gm-Message-State: AFq9FYLAazReDe2dz/NkogzvsPxQjMuUTUX27AJkeJYwPsK6v4upcKyw
	w2bKQV4c9e1fa4QBWOOqbS5rdB+rsCm83Nwj41GBPiSkCq0+GBNkhH/3
X-Gm-Gg: AYBFou3qvxY7yxmhG3yU/oklcjAWFzTCy0l8HGK3t9s400CZiln5AGgo3SfM1/2+jR9
	lGUQ9dY9Nfhbxyc6pySVf71jN+9diEGV+25AThfCzFp0M6SO6RdaR/BihgSzIyQ3EiTsYpEZmcy
	P5Bek2PSACp6AHNA+pLZbxO7T6NDs5hALcCuOYIrQE3VFdjCFPmBAVnakTTX+qXncfWDuGgo26e
	IBS5O0F3rwA4fnFWn5+DLxrZDsbqsSzvlTShmgvLw0b6H38rH6LFtbFcpsEHzL7yyactG39e6GA
	FkzJNgk1H9PsL7v90mG9RwMMWc6+SOQGUvYotPu219++m9xJ6Ij/F/IoiqflSz0yxwWi+BB8NmQ
	sHifed6MzjQzMESMxDtonT2jihNHM327md6BE1xDObjmV7XQfSnIRSw4fxw81iAwBc82c0dfkhb
	ZiXy85euTWUSUECbf16dhzcIouzMmEK5kU2a1BboneHpASb1A5RShvFoKdaslnpoUleb3sPXSaV
	RMSx37EPZk+O40=
X-Received: by 2002:a17:90b:2b47:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3aceed9feb8mr9538989a91.30.1792517173733;
        Tue, 20 Oct 2026 10:26:13 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80cbe295sm326600a91.5.2026.10.20.10.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:26:12 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pocj8ur4in@gmail.com
Subject: [PATCH] gpiolib: Propagate emulated drive errors when setting arrays
Date: Wed, 21 Oct 2026 02:26:01 +0900
Message-ID: <20261020172601.221861-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpiod_set_array_value_complex() ignores errors from the open-drain and
open-source emulation helpers. If a direction change fails,
GPIO_V2_LINE_SET_VALUES_IOCTL still reports success, including when
updating a single line.

Return the first emulation error after freeing the temporary bitmaps.
Keep updates already made to earlier lines and stop processing the
remaining lines, as for errors from gpiochip_set_multiple().

Fixes: 8ce258f62f90 ("gpiolib: make value setters have return values")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU through GPIO v2 ioctls and libgpiod with a test
GPIO provider. After a successful line request, an emulated direction
change failure is reported as success before the fix and as an error with
the fix. Tests cover single-line writes, both emulated drive modes,
active-low, mixed arrays, retries and partial updates. No physical GPIO
controller was tested.
 drivers/gpio/gpiolib.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1438f97d0634..9decee5a95c7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3945,9 +3945,13 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			 * open drain and open source outputs are set individually
 			 */
 			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags) && !raw) {
-				gpio_set_open_drain_value_commit(desc, value);
+				ret = gpio_set_open_drain_value_commit(desc, value);
+				if (ret)
+					goto cleanup_bitmap;
 			} else if (test_bit(GPIOD_FLAG_OPEN_SOURCE, &desc->flags) && !raw) {
-				gpio_set_open_source_value_commit(desc, value);
+				ret = gpio_set_open_source_value_commit(desc, value);
+				if (ret)
+					goto cleanup_bitmap;
 			} else {
 				__set_bit(hwgpio, mask);
 				__assign_bit(hwgpio, bits, value);

base-commit: a0fe269293509acdd93b9cfb3f46636f7b91b33a
-- 
2.55.0

