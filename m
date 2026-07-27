Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AD83F44CA
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 23:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785193834; cv=none; b=uyWAYqzp97o9w/fZJ+HbfezrWpsZKdX4Fdyp5UXBmN+taT9+xbWfMURVasHtuH+QpOpOdSKWsmPlr6YhhoEZCqIAoKLgFd2rBccZmo+dQvwH6QoKCPMhnbZeS8c43WyMQM6Cw66TK/efneb3UM+1ccOwVlSit9FyEF5d8bPm2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785193834; c=relaxed/simple;
	bh=q5uBaE+pvKLkonQVvFmVkBaO+ZH7geTTl+UD156AW7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TK8TwigGAo/9dPxMbSy/yrBGypmQ9D1Q7izSOrmwAaNjHdHEbPlR9VGt9XNimQ82IYQVDp5k5RWgK32d/twljqEJt562HVASaeaA38TIGuwCdJcZzRVTH6Txh92CpIvt/QgJKuQ9sw+gfr//aqkqrImfseif72egOSpBZxTqtbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=EkbehhAO; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="EkbehhAO"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C113A3F169
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 23:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1785193830;
	bh=eijPHTWXo76lCjdGYGWYkIix3ouR1m/Gs/qiCjM99ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=EkbehhAOqh9XNKFJddn2wIJ8LftjEpJb0F0RpL1T7ypWUPvI07Pb6dERz9RRRy9LJ
	 o1l8lyMBOBXhfjOzbg7TAxm3IWkcbSxj7rhB+6bR9AJxTJ6k4h24WHJ5KKO54ErsHy
	 caWno6negYUOaxXzS0hQ/4y9zaYmwyrUJu+XYutto8NuB4cZfvdyPIwrV2Myk8bwUw
	 EHGJIU+J1uYt76WB1VOMYaqC0WVm6dtCjRYhWiNbISjh37JJLZRExBbd5hXlfa6i1J
	 blExYdDeugvq8KiemvMHzkWC1ILXBtKvz30JCkP/eVu1HvLVCduOZd1TI963U9UzF/
	 s/9K/7BW0GX3TRFy+HhvI3kJPTHHDa6UddTq8O+M4NzEGxfIVJ367MAEa+hgN5ToB/
	 aaWgY7+BBpj2fJ44bqEwL7zBcv33fZ3DFTgyCAuBnya3RDYFO+MhgrtAGaIKbCu7XZ
	 ooIOFBO0/MhDJa60/VylQUkaONpQpW6qEAPYCajj4lg83QfD//ZgJDoAeUFF+1vbu2
	 EzlGpUeM4onEFV6HxTzg2GvrOQyyYs51zFG1pNbZjRnPUDXr/tAuBmJb0aDFvRuI1M
	 CH0vABUBkGR1bfxa6WMesJ/7w8za3VIPR2rJZAQcTYXtOO8beZDkS+MFfVPLIII7uz
	 LqsVEx+xRKNyogfXGEIrevpY=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47162f83c75so164619f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 16:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193830; x=1785798630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eijPHTWXo76lCjdGYGWYkIix3ouR1m/Gs/qiCjM99ns=;
        b=I1wQr9xZfvm4mL2Cbfoywa+v98wBZWOUIbjxGrNDHSnhKVFGlOj1Od6HvBOAXlEe2I
         BP5SN1ld648A6j8onDJEbkaJnSP4q7kgW2n7SuOxYcEs8PiZ+2jP9RRo0g2KWM7IZOmu
         FuYLKXMoMAA8dMOWrgNZR1y1k2r9sq/84spXSDdVhZsR9wf9LR+GxSuyhzr8bv4KohJE
         OH92GexPR97xYmCCbxGf1ZWJ+5hKy3Rm4H0Mfslu3AxeofPGblGUWHqtpjVuL34sz0b4
         Rzc+SpFfINQ7CjFHNBhkGBMpgVa3FBZe5jNQkWEHZjhowWV3fvLc+4gFq32QDa0ZEXk4
         MT3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpdT2p5r3RHma8HcsYhWQlBLE2I0hQduQEvXwEj9+kDoi/l67lu1ar4Ae6CukCsDuikaBsDP8ceR1ii@vger.kernel.org
X-Gm-Message-State: AOJu0YyBPm5oWJ6b69f2vXlJmXDfjwrCctxKo2vpLQTc9HzrS+okevdL
	BkdNs6mivsgC45k+MT48nFdSvIfteav+LN9oL60YUSl8GHze8LLmPNkPa+z9mSCX3YjwYMNTYBs
	Y4Vl36P+y++1QNmph5QwCqp3S/md1Vb9WIkL8lb9OFeGyemr5NK9AhOKfPXdoZwt37ZZ69L7F+Q
	9QllA=
X-Gm-Gg: AR+sD13CJXRb+ZP86pg8tSHXf7mZbS2SFQA8OWFADF7QdtBOirjnNOsc0PAYjpw4mJK
	AjmG6Y72iZIOBnceDLe6HwzLN/CBwh/EKjGmzYUzm0nXneKhr8316hrwP5nRsxaUD9l6O/fzC9V
	3+VTirUtKnAC8FGT2JZ88ZesHj/xg3OMyPMrt/9y5m53byTn0IR2ahAdywJlwGCVZZM1SI4RiEz
	fJAKhqR2BbXq2dOKbtGeJav4Rj9QMxxc+Tb9l1KqxEae16ZC99VO5RDhDhCHf1m7sAkahmem1Oi
	ZIuTtoHpxeJr19NqFXzH9kClsKygj/POS2XJ/Vr/tzIVYrIn2uVte4F3Ye62ZLDFHq2mytkp9MY
	3dhod
X-Received: by 2002:a05:600c:190c:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-496c60c3657mr37975e9.0.1785193830346;
        Mon, 27 Jul 2026 16:10:30 -0700 (PDT)
X-Received: by 2002:a05:600c:190c:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-496c60c3657mr37765e9.0.1785193829993;
        Mon, 27 Jul 2026 16:10:29 -0700 (PDT)
Received: from localhost ([176.43.219.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bd9e980sm262333645e9.0.2026.07.27.16.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 16:10:28 -0700 (PDT)
From: Cengiz Can <cengiz.can@canonical.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: sloppy-logic-analyzer: fix use-after-free via debugfs trigger on unbind
Date: Tue, 28 Jul 2026 02:10:26 +0300
Message-ID: <20260727231026.470146-1-cengiz.can@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "trigger" debugfs file has a hand-rolled ->write handler
(trigger_write()) that dereferences the per-device gpio_la_poll_priv. The
file is created with debugfs_create_file_unsafe(), and the handler never
takes a debugfs reference. Nothing keeps the object alive while the
handler runs.

The sibling "buf_size" and "capture" files are safe: they use
DEFINE_DEBUGFS_ATTRIBUTE(), whose accessors take a debugfs reference. Only
"trigger" omits it.

priv is allocated with devm_kzalloc(). devres frees it when the platform
device is unbound. debugfs_create_file_unsafe() installs no full_proxy
wrapper, so debugfs_remove_recursive() in gpio_la_poll_remove() does not
wait for an in-flight trigger_write(). The blob_lock taken there does not
help, because trigger_write() never takes it. A write that races an unbind
therefore writes into freed memory:

  trigger_write()                  gpio_la_poll_remove()
    priv = m->private
    buf = memdup_user()  [may sleep]
                                     mutex_lock(&priv->blob_lock)
                                     debugfs_remove_recursive()  [no wait]
                                     mutex_unlock(&priv->blob_lock)
                                   (remove returns; devres frees priv)
    priv->trig_data = buf   <-- use-after-free write
    priv->trig_len  = count

The race is reachable by root via
/sys/bus/platform/drivers/gpio-sloppy-logic-analyzer/unbind.

Create "trigger" with debugfs_create_file() instead. Its full_proxy
wrapper makes debugfs_remove_recursive() drain any in-flight ->write
before it returns. "buf_size" and "capture" are already safe and are left
unchanged.

The mechanism is confirmed under KASAN with a minimal reproducer of the
same debugfs_create_file_unsafe() plus devm_kzalloc() pattern (available
on request); it produces a slab-use-after-free write in the handler.

Fixes: 7828b7bbbf20 ("gpio: add sloppy logic analyzer using polling")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Cengiz Can <cengiz.can@canonical.com>
---
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 2bbd308ca08e..c356cf2ed688 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -290,7 +290,7 @@ static int gpio_la_poll_probe(struct platform_device *pdev)
 	debugfs_create_ulong("delay_ns_acquisition", 0400, priv->debug_dir, &priv->acq_delay);
 	debugfs_create_file_unsafe("buf_size", 0600, priv->debug_dir, priv, &fops_buf_size);
 	debugfs_create_file_unsafe("capture", 0200, priv->debug_dir, priv, &fops_capture);
-	debugfs_create_file_unsafe("trigger", 0200, priv->debug_dir, priv, &fops_trigger);
+	debugfs_create_file("trigger", 0200, priv->debug_dir, priv, &fops_trigger);
 
 	return 0;
 }
-- 
2.43.0

