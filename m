Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A768C3D45E5
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 22:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448987; cv=none; b=u/3g9jBooDxsLkxlIdDNFj5/JqshNrm67Pmpy0PEGJbAKffQ/+CA8cE4UBAq1m7jp4DBPMWRoQLVvPR9Sb1kpXkeW+UJmkeplJiZabwx1K2LWGB9t3+YgXM5Rvrgchr5YyaI6wpkO5VzZu9J6abjnFse8sIfWZbZR3/lOOErpno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448987; c=relaxed/simple;
	bh=oEXLNXnwNFnBh8FaM6ePT/ll0kk+YxcpMKbzCbj2mzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qol8RhyMy/KofeSS/20PqNimLq/uJ1G9vS1TPi6HtpIGVNVlIMNtWmadiYUb6DbTr5wFYESh9xL3Aamm7Q+5KcrbEVXeybHpMwjbfIgD9AEKdCRZiFIv+fEemFCp0nNIYSYYojxPC93fnd+MfWozayKkoEjC79p9aCjVx2mPO0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=aaR8a5NV; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="aaR8a5NV"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ECADA3FBF5
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 22:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1785448982;
	bh=DpyqIi0S+bFGwD7jF/Zi8lKmZ1oDPv6PRswX266BXqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=aaR8a5NV2njc10tVM7NLRCgZWiRYUvPq+8sJ2VbpMBZ3dIMguym1GywPLUqEK5LfS
	 QT4h0RWVGQrJccMJC3x+VqtA9YKqpFIiJFyoXRbqUoFZeZk5z9xgXUhXgSrF1nwTlR
	 vkE7lRcrOr0oK0DAhwcKWb+BrqAa/PvC7HxZMPYSSGwtZbl/b4c6NJHNw2C3ZitWeD
	 VlO3cFwCt1QUm2TspWIcpomcPb60avyMdDqF/KxeC16RiOz6s6eitJGKdZsvZ2ZUAO
	 RaS4uZbfS+2GXw0jQDWUwfGQolzVKfK7yIImNibRinCZCY1w7GjRbftKveTX5qRu7z
	 OF48do/BTd3c0mxKCo+MNZtO8HyP/RSwbuyP2DQCQeH2D98j6Gg9xUVdmb+O6Nu1eY
	 VJnt8sglpbU/RVsR0peXBI8T0gsKtzSU2LWkWAsRRGaS13384GW4+3eWiceDNnHNPv
	 6KCTmAdM+0rUnrT6po/ikWRmY7hus2r5gE3e6452xmtUb5jMQGLXrKfXj7mlJ9yHlX
	 DyBM1MKFQ/LLHoa3BehxW62ZeebFUI50fzwzAOf9LQrDnnWq5FhKDx2k1j+z+aC+Op
	 P5hF1AF0ynkWs8fhPhN6gWGRSCVOj3HmvKo98Qwpnhior51XKBNwehVXFpCasX7LX5
	 ow9qlCo0WhhqFJ9svqoOrmEo=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4954b1c6310so1666865e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 15:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785448982; x=1786053782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DpyqIi0S+bFGwD7jF/Zi8lKmZ1oDPv6PRswX266BXqY=;
        b=W0JWBAvXRHwX2JeYsCZIUn/K1C5WKdm0Rgpug2g7URi5Z+OCwp3uG5aII1V843CCf/
         5IKRhw2nh+E+mMAo2t2p2SRQMqvVA6Wo8SB3L4l3cQhuJM4ON8z8k6COh/KtZq+swEUM
         BAstfM6vgzfCEm0PShI4hxfMIqK4Lrhlw8xDCNbBDENn/Aq4nORb7SYq/mX0BW2R9wR7
         aIrMrgSRyZ/+DjuNub7MGCt6iPClMOmPFDSBohabBIapn9e3B3PSRm2BOJb4PkjxfNEQ
         U1l7tlywv/ncngl0CPTR8ShRUd1WfudoYsI94wCgca8Q2mqtuAMOE3Wvg6Vv+K+BzIyN
         k8VA==
X-Forwarded-Encrypted: i=1; AHgh+RpbHi9ZnggDzyomkf/COWQ8PZdlJ0ayT4hhli5BlroUBaKTWIO6mep8lg7pOPTQimgBo941C/be7Sya@vger.kernel.org
X-Gm-Message-State: AOJu0YzVx7qHeBL/81k9JCuE+q/skKnoRGUzr+UCv9Qa3BWHApaHSjso
	+nbujMA1xj/JkX4+bbGsmaMnlRmTaBa6eHA/6Ou1RtxVFPKB1fnaI1FG9/obxVC0Gd/YbsFEtCe
	HrQ5DO5arB/ztzKLfb22kuBpBhf4iRe3aeBuU74i9lv3w/h4QcvrFe7ox9YtdcJZsygM+k4Q4Qa
	q3bKY=
X-Gm-Gg: AR+sD13Ug9zNSB8HIejweu+XCnRU0wo+l3oBxFLSPXhI0SyA1iW7Lrhj/WfqTCdLipW
	Bv2vdrl76EMgQ7JFxlW/HbNN5Z5PZUBDiFg2PH06ACVMwY1AzHAtHZtit+ZW1PqnLkuNFU7q28w
	T3Xmc53BanZAkzSK08vdvIBoFK3JDFLEBff7xXBjIynYpngZ0EV9nZOYe1agLMRb8+dxu16mN67
	1+OpEZL0ZOz8dcem4AVRUsCD4sup6hZs//cSra4riVlu3Pcx83rUUrs2/vzzvYxkyNYQdLzR58I
	7/4dCqYWNcLvJQDHd0zsh3jHT3xbIO9NC/4bfE1XnHp7n/0Y9utixrHYZbL94JEyjbHZBi/C7jy
	McrQp
X-Received: by 2002:a05:600c:1d8c:b0:495:6713:9a40 with SMTP id 5b1f17b1804b1-49800ea2aecmr59396635e9.18.1785448982402;
        Thu, 30 Jul 2026 15:03:02 -0700 (PDT)
X-Received: by 2002:a05:600c:1d8c:b0:495:6713:9a40 with SMTP id 5b1f17b1804b1-49800ea2aecmr59396395e9.18.1785448982037;
        Thu, 30 Jul 2026 15:03:02 -0700 (PDT)
Received: from localhost ([176.43.219.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498011fec37sm88909405e9.9.2026.07.30.15.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 15:03:01 -0700 (PDT)
From: Cengiz Can <cengiz.can@canonical.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] gpio: sloppy-logic-analyzer: fix use-after-free via debugfs trigger on unbind
Date: Fri, 31 Jul 2026 01:02:57 +0300
Message-ID: <20260730220258.358169-2-cengiz.can@canonical.com>
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

The "trigger" debugfs file has a hand-rolled ->write handler
(trigger_write()) that dereferences the per-device gpio_la_poll_priv. The
file is created with debugfs_create_file_unsafe(), and the handler never
takes a debugfs reference. Nothing keeps the object alive while the
handler runs.

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
before it returns.

The use-after-free is confirmed under KASAN with a minimal reproducer of
the same debugfs_create_file_unsafe() plus devm_kzalloc() pattern
(available on request); it produces a slab-use-after-free write in the
handler.

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

