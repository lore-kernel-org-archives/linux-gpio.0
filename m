Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409FC3DA7DC
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448988; cv=none; b=LmBwAoj5QIbqDTUrS63Vk8H2A/3E298I0i7evNWg0GXuMYZPUYbB1xEgJHjo063vkx9r1LVTvPwH4DIEmPugkVlaMwgpVvk+hTFJ/4GTmFuH3zCFF/A1msapBGHlnblLotXOd0eTu8ucPI42yXCmIpwRXx/WDUU1P8uuMMFjvWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448988; c=relaxed/simple;
	bh=iTDFpckipKtTiZqHeJ1AhwO6Qc6aVxsq5NRLvvjy2hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iiqwwyvt0ZOGknEsXXVbKD13wVnkF27Gv1zl31fXv9aROHTu2UPLNw865j9pINmKrI+scsuFnMmvo+qTrE9c9qgvibOiBfGwffygr3tvu578FzdsjtJUYxy2d7b92V422DJk83ioZ/VmaMpnOSAsY3/lqIB0UIWkxvzeXcAVjSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=mU9AvsGL; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="mU9AvsGL"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DB4773F9B0
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 22:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1785448984;
	bh=vtYICgJvjVsMuO9CCtlpSFWkZ7uEMRteVvdVhxhRuJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=mU9AvsGL8RnSs33bBfQgkIaVLRwTtSJWXUIm/deAo8DmYbF3Lh/IUXtvOpkGu94UC
	 lPVLiiWlBE3kPdsyXN6IwHFILhy5dGQAfTgNZJd//+yep00i4bdkzDeRLqTAx00Evk
	 oARuH4vXnBj0evjFMmMmRGL2gGL73R4BbExw8mepU+r3rlH4lVdbxIYlGbSvzHQru0
	 Cf9olIphaR9C+Uwh2S52l9kxYqStbQ63JZ5tEPzqWDyhxA9u9ibR2l80MsK3il+dgC
	 PBNc7HmbEBV5I9/qehZj6igs1DZGtzFxAHlYk3mlEgy/V9xry7yExihS/B8YoihR61
	 ixKIjFjOhjYkAE4D9qJHWa4sLQ6u+wlWg1wgXc7AzRk+VGVy6ZLyQLxo2yibmqyX0+
	 PKRQC3xx03oLUPBH0b7oEyNyYg73oi0o2hE+dYQvyYnoHuL/FcqnmwWvp2ZZmaEKzu
	 jfHIpNa2xyqP2aV6Mon0t83ohGOWriypeylzzIFOKL3heOpkU79oVkCOo9Bwaaiih8
	 ZvwvF6ptP0y6En15Do0ZYYcpKWLfkA6ZdSckK/9W8Pv386fvXM1DfOzrE6v0ZvpKLb
	 7VNVm86wgHw0GrF4RLKqNrLTmpd9/I2awppMTAzS+A1CZcYovrUHp6eGdC7PPN9vqQ
	 CNDH8eESgrcvZyXn4MQl02zM=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490a767b782so839205e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 15:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785448984; x=1786053784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtYICgJvjVsMuO9CCtlpSFWkZ7uEMRteVvdVhxhRuJw=;
        b=OCV+jfqc2B8j3xYyZFJO9ojZvMAiuebox57Tlnzpf8OpaH0YPyfqJMax5AAD19mlXT
         1PcG1N4fzmUdLuqpSzeFv2VEeidkg/bGozAFzkM+WFSt8Yxg/xbAS7pFofL3SerSxYB6
         MA8/JldGzYxuHFhdLe85yjNyMg7AWEk759MBvyO8SydIOqBfRFk3GOEwp+bAeZOoFT9N
         5LQPFkxdxksIucaG5ILgSPlTaihM1r7VGDtC2bYCyepHPXrAhEbnj+dp23iusRz8McZ/
         Ode5LSedyrrIR8i0IqEf7+ZBQIWF58Kon+1vnEE1WtQ+Kj8/Cf/Zv8ZC+8UhUm2ez07I
         48Dw==
X-Forwarded-Encrypted: i=1; AHgh+RqWgzFXj9W0rUtzASc7uQBwXG6igowK9LuG7uMSVLN2lOnkuwLr0rym4DaUQMEvVNbOV7PJlQxYBHUg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+pqqg1QspQetIOE94eB8CkFKzlj72TkmYrQejJGcNrSCwfgLr
	3PoP+cL7uH5/+ts2oMbzKEzdKnGPNEo+J8GRUcHnAYpY6bmhGx7RJTf7MsKqwuTrVZcmbHG7u+9
	M5K0WuhyT1vK9QJ79iqqGIINPerhELB4+13cR/Lohb7M7Uc3j7OEuDtiL4vF+F/c0egMXlItWfx
	U6LOY=
X-Gm-Gg: AR+sD12L4M4i0Mkjot7yBro5ynBR+nih+9P1CbZ/MisbOcwmwEtxdQtaj2Hhosy3S33
	HJfrIFda60XOiH2lTfRpPY6uFhmIthhk4RadWXWRV1NtRgVOkUcRpEd+e0ELd5asWFT0eUi63RR
	WZ8PUTtXZbMD+v2f6Re0zAah/bI5nxJEuS72SSS9AD5069OQXyZWuBdyhMRMnBBKJ2sTB4FSbKe
	dEra0+2diLOXDfK+NHUDH0rqaiy3deGSJKtYxbfEvr/Q0rBStH2y+APtV+Gm1ZnZXTMFNO+FSul
	JghYcHJAKItaK45hZAE8VHBHGnPrBuDqHCGPiMZ2sa6OMa3KvC1P18Li9lKi15UNFLJ5rrYW636
	aG7gK
X-Received: by 2002:a05:600c:1392:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-49800e6d405mr60486715e9.8.1785448984342;
        Thu, 30 Jul 2026 15:03:04 -0700 (PDT)
X-Received: by 2002:a05:600c:1392:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-49800e6d405mr60486405e9.8.1785448983865;
        Thu, 30 Jul 2026 15:03:03 -0700 (PDT)
Received: from localhost ([176.43.219.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498011feca8sm98212865e9.8.2026.07.30.15.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 15:03:03 -0700 (PDT)
From: Cengiz Can <cengiz.can@canonical.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] gpio: sloppy-logic-analyzer: use debugfs_create_file() for buf_size and capture
Date: Fri, 31 Jul 2026 01:02:58 +0300
Message-ID: <20260730220258.358169-3-cengiz.can@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730220258.358169-1-cengiz.can@canonical.com>
References: <20260730220258.358169-1-cengiz.can@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "buf_size" and "capture" debugfs files are created with
debugfs_create_file_unsafe() and DEFINE_DEBUGFS_ATTRIBUTE() fops. That is
safe on its own: debugfs_attr_read()/write() take a debugfs reference
themselves, so debugfs_remove_recursive() drains them on removal.

Now that "trigger" uses debugfs_create_file(), switch these two to the
same call so all three debugfs files in this driver are created uniformly.
This is a cosmetic change; the extra debugfs_file_get()/put() added by the
full_proxy wrapper is negligible.

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Cengiz Can <cengiz.can@canonical.com>
---
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index c356cf2ed688..017377347295 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -288,8 +288,8 @@ static int gpio_la_poll_probe(struct platform_device *pdev)
 	debugfs_create_blob("meta_data", 0400, priv->debug_dir, &priv->meta);
 	debugfs_create_ulong("delay_ns", 0600, priv->debug_dir, &priv->delay_ns);
 	debugfs_create_ulong("delay_ns_acquisition", 0400, priv->debug_dir, &priv->acq_delay);
-	debugfs_create_file_unsafe("buf_size", 0600, priv->debug_dir, priv, &fops_buf_size);
-	debugfs_create_file_unsafe("capture", 0200, priv->debug_dir, priv, &fops_capture);
+	debugfs_create_file("buf_size", 0600, priv->debug_dir, priv, &fops_buf_size);
+	debugfs_create_file("capture", 0200, priv->debug_dir, priv, &fops_capture);
 	debugfs_create_file("trigger", 0200, priv->debug_dir, priv, &fops_trigger);
 
 	return 0;
-- 
2.43.0

