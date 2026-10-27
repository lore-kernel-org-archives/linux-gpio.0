Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080944;
	b=pbbVBxbzr7rLhr5vNfVz9wCqcPsPkGnIa9hGBji/YrmycpmnZzD6nsmBsxbWzItAtl4v
	 BPjV393k/rV9MJPeuWazXqjvq/0wc6hla1tA0odKfE0QsLerHg+oK7HIZzZ5dLLlKBvs/
	 DpoWFkPbZSFAorgjg5CEc2VTyLPl1QSo1eppBIAu4FbK38/m5jOty2nWNpKWjE2oVrEc5
	 PZyTdriLkoqsMJC0j2N/3HkDbAMTij6UKesYzsKWzf/QS/T5U+y3pjETFONRWgp1eKB12
	 hD9KBlWPO+HdSUnNrZVfmNuocBr+Di6B+JLKDScEpB2ZgMcawlEC41VYh5vTYOw9TEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=P9lF/15sStv8YUEYbc2AwKR4Towep3VvwFsfF2c6Wzw=;
	b=afEKbEWb2ekZgfSFse2RiaGFNo0soJedE/u1mAwUqaoBtnllz04xaFltKAB+4IXxLm11
	 APFhBy1iUZaKGSoPOwP0EgNlvGEIHSNp9g/xUQOhEJ81E0bHZcmBEfeTSUEt5DCO2jmFE
	 oUrrAAtyB3NnaMigm3zIRhPlci0lAvcFuzy3Bv/7hRlfvYjqCtco3/mxRJO0jLJcIw1WC
	 Al2l6fHoFhnZN0SSlCvd8yc1G4EUFlU9TNUVLx4/lvwI0OmPMDJLhQp61iEiRGcbXqQWt
	 LYfsksjPDxofySp7IlA0OFwPH/Nl6crLShnTC7qipx9UdeA3ZP8+C+vrPQP53qsSKQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="JDm+QoD/";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE4F606A31B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 06:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE4F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JDm+QoD/
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so3911765e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 23:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080942; x=1793685742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9lF/15sStv8YUEYbc2AwKR4Towep3VvwFsfF2c6Wzw=;
        b=JDm+QoD/9VUZxgG6Xc4HhDT7aDIg2djSwXQYn2KLF+ZVkszotvxLf9fZ2SI4NCoF86
         8accEx5TNSB0SDBUphTxmAIbkRwJk0aG+DoyBYC2T4ji1jcJa47L+Q+0LA8hPTo/UrRy
         WenjUIRvXkdyChaPKmjD2cn9Mi5Pi5q5SfyM7c581R2f8uPHo9nRyVYJkEMOO6521aAu
         0NB3MpkSFaN6+CmDbdMLPpjma3iGdsN+jQFsEWA/h8/UDNS50szeNwxHVhaKa70r8BoA
         muRU65loa4MGAvXdZ0+YRBBMeR+vz0b3PJ8Iz+L6YeYPjgZWaKJI/aI1zYuLAqx+KDz2
         xHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080942; x=1793685742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9lF/15sStv8YUEYbc2AwKR4Towep3VvwFsfF2c6Wzw=;
        b=r4dB83mrF2MPAvK9PKN+NUFDVOub/Zf0QTzm7/SPp79jkt4ot8gKjNCkYoqInti4pL
         JqwGQiFMft/pS5a146Rn9BCEEZG0P76LB+bqMp/5cU2sad2ANp9Hnj9vr0mMWS6Jucvp
         tZ+MdxkygXmnE1h8wk1il0mPwTExxtpiU48clDtihkwFJzJ7QCGIGNZDG9OEQiq015A7
         3/x4i84EZ9dxOVhbqvgpSnAtEboVNyqZRc48pHF5Dxb4AoEQvTq/7zxFihHTPAxUmAb3
         4YSvGPWwyKdyz7WXBzWbS+naZsiSCXYc8rGQF23wncSVyCrEG6feg4wc8rXagBc47Cry
         pWCg==
X-Gm-Message-State: AFq9FYI8F66wdjSBDC4lolR+SBk7k+nomWzPgnyChtvqpYrUF+JnPtI1
	R9saepC+HKZIA7kVZM1qmgZa9ZlncDJoAUNeR3vXBfft+7tdYJKMKcgU
X-Gm-Gg: AYBFou0eAeXrmBaZ/sWBdylia2ihpQ71gdQQsaDxTOb9IPJ4uyp8q6BWHIHK9Ximm+X
	wZtXOhH1iCtwIlCEiLi9u9tNzAf4udeTAgXr/id5GbCp414vrXaiqoL/aqcgpuz0keYgWQDe5ib
	Nr2iRq9YnVUqwJmoGRyojwSpIJwBNUTuWD1eeUo0rTkfMUmDpKmyHmkVYmVFaSyMnf+y7kX6vHL
	p8KBlUpekYqdz+LxkDPfA7JW/4ZPJgHiQW/z26cpdPLfLOSur1LzygfcuWKmLYfY8E9I4YMo7Ml
	wu1I8Qq29roJWWlGyZPBO2gGv1d/JsyS5BbxaEQqKPepZRZWQq4w/l6zufpJphel+i18ds99Mvj
	fYA3ymtoxw9o1Jp0LE1y2hc12WFycafLmRjFklfmjcgsOJUXcYV7UcvLcLObtgLbgP3EGec5XYp
	EpwlVLjCcDiliMBtVOV25kyju6aWx7RYYdKOKRkZVzkB88t9rBbw/YJW6T0va+y2ewvYdX0s9wA
	T+r8vL5kboA82YucQqz/sFRUFaEtwjQEErm1DxkmKBJaLb/WKpbatqLW/4sYP5KycR9YmCBTcRk
	5Rf+4oAk4oHAcMiz+8vWKvDFJlIf2SxS3tueX/Ev6DYWyIgPnhpyXcviR77T259Uhx0QF+mO5Q=
	=
X-Received: by 2002:a05:600c:a318:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a7c0b3f6c2mr23931405e9.8.1793080942301;
        Mon, 26 Oct 2026 23:02:22 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm234543795e9.12.2026.10.26.23.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:02:21 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: octeon: allocate the GPIO base dynamically
Date: Tue, 27 Oct 2026 06:02:21 +0000
Message-ID: <20261027060221.2687941-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The driver registers its chip with base 0, which gpiolib reports on
every boot:

  gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.

Nothing needs the fixed numbers. The only in-tree consumers, the
gpio-leds nodes of the D-Link DSR boards, reference the controller by
phandle; the GPIO interrupts go through the octeon-irq domain; and no
board code uses the legacy integer API. Let gpiolib pick the base. Only
the chip's number in the deprecated sysfs interface changes.

Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Tested on a CN6335 board, in a 7.3-based tree: the warning is gone and
the chip probes as before.

 drivers/gpio/gpio-octeon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index 777e20c608dc..5fa4825d1a96 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -102,7 +102,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->label = "octeon-gpio";
 	chip->parent = &pdev->dev;
 	chip->owner = THIS_MODULE;
-	chip->base = 0;
+	chip->base = -1;
 	chip->can_sleep = false;
 	chip->ngpio = 20;
 	chip->direction_input = octeon_gpio_dir_in;
-- 
2.53.0

