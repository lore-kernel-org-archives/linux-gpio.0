Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606241;
	b=oas0T0jLFCovp6tagFu3tWtlRkC7qdOJERvkrJb1JC7mglUNUjHCWPlQXBT39lpjA7LJ
	 OtQEt1qLiRswa5Rz3XrgvtEP6idkf0FpNb0Fb52R+NgOwGF9nUGChrzmDM9jJMM9DE3iT
	 05NYxPQfbE+YCSrlb4bHxoOggsS3BjuWDtJEyvDUphF+QS/RQj9fgwJx2D+Uu7tvblExA
	 /s1nSEWHZU4roeUOl7f4XShO6lQqt7UdNNdEKyF2pmjPtva1VCvwB0E6CE+CQnRvFsMfF
	 1C/YuUQ8yORSLoK3Ax+bE7yTAtezRSgi8ddVJREH/ZVQnjDj3zSRL3xPlF9Bm3kLlOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5c8E46H9D8n1iz1NiuFP9wVSIjo8xwMshDoKle/plSc=;
	b=VOrY0IjYiyjGqTDePFgNQTCdf/Ru8aNs6h/aWgGuqLg7MSVxbQZTd+vhAaivL+OA13Wi
	 F2BebuyW3ikInJiBTyEDUuCq6nH/Z36JTXGzcNRsvUGq9NdXUoi4VuELU3sCWpLdUDLFr
	 a/syN7PWnXOXhBGeSzXFHT/be8canziOUn4zV7A+o7tFupvKFsGcJOcEW4QcXnzhRgKKn
	 INYCTVK4pBcLEPG9EvyUDmBIh9qTrZJs32wxTKfYIaHS2U55+eXWk8/yTr/6lva9FhmoD
	 MugyRd6coXW+wDhE1mF+zJLL9J4OmKNj6gRGXVzyBC8qIb2PyyWScD6upC6PcllZP6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDdzpWtG;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E198606A32E
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 07:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E198606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDdzpWtG
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e942864693so14820455ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 01 Nov 2026 23:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606241; x=1794211041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5c8E46H9D8n1iz1NiuFP9wVSIjo8xwMshDoKle/plSc=;
        b=PDdzpWtGMOwoOLfrPO8sDsEm8c1q5TKZxZsfhrFyo/wZpemg/P6zlhmZzFUPk79JHV
         3oBL1ytEl1/IWa8+Bn8VeSqcZxIVkdHNCFAMI/ucugnIZucZrmBBuaJuTpXHcc9a8hKo
         WSmfZu8PFRQeafdtChAIr9j0wOBnqCS2dIjTEt7sS5ZKdGpCyIivbLWgq+h+FGZ5v8cY
         YSs79YBlKK2gglW313UAlFcNmovMailRncuC7HQVR2C5Y0beO1LvMO5Ho1MrP1kcyx4P
         tOTtulTapMN97YlVnz5cKUawd1meRglO964+tIlZHUdHA71Ny8JjhkZM3B6n0jbZcpuk
         dZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606241; x=1794211041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5c8E46H9D8n1iz1NiuFP9wVSIjo8xwMshDoKle/plSc=;
        b=tjA6piUgNjySxCYqQ15IO6SdAl7mK1VBrnV5pNmyt0WNncTaqvkCEUmwusM9BRMfy8
         VTw6P/eEuUsJWNDx59eqeGk2eEUzTQbTB8hyXMaZapgiNFsR2IwCvrx+ONneZ/FC5ssH
         ouuVRTnmCa4w3CSP/MJwtMnzdAItoup7bzGyxRTqv6tdgaQ3nOP+h8KZoqgPS+JKDuFm
         VCmPZFdpiKmrqC9mVTn7IEP+i5MG3CIuOPVhd+v/Wxf2lIt5GSAdp5tZhe2VxUWzcmsf
         NzKl8pSYDNpGeMly86qEx3+HG334Q0tvQOeHfPIQjmkjlX5cQGGMrGKJe/wxK/xRNLrP
         rdyA==
X-Gm-Message-State: APuU4Z8Un129wGIJSUC9iYiBmSgRVRywsWRHvLZ9vxdi5RFnbjGf8zPi
	XMFFRbHm2lkIUyoAcHP/HVJ5GR4PzGtWOnq2hykcF//UkOSC5hcIfW9KgpbtbQ==
X-Gm-Gg: AYBFou2Tmw8Y7GVYloM9Ie9wlqaUhv4VE3TdXb8RwpMp2sP0Z2nBjYMIUjiTujtZCL1
	/bLhVZGa0N22wXA43RvT+dLp3g/z6VvHmODeBD6BSlNsmbjpffEPbijQgEe72aIeR07UtcUWBTg
	5vj69/4onPzNOzEncTbItsmZmdypDHVnQDhzQIVv7vgxD8XEMoREPhbix3rG/YivUGnjc4k9pJC
	MiFHq0CyZ7NkIznTP4+Ml+u/xs6sdvmnVUnoEcfHefRm1OHSM4JZVyianpWiLoxqi4AfGjfDfZe
	NiMtPo2YFjEuSU/T/B5jBCw+zejC2KgBj51s7ueTXkplQjQKeioai8ihKja5HDS1kaaxH7StthF
	oJwmjLcZ3RSHafOfcR5BIzEzxAYAqpoMHyMIari3XPt870FMgh89y2+/Wbx5ZWzrY/2JS3x2W3i
	tFWD+CqFrTnkgDGMSGuD6ZuMIYe5HHbFFMUPdO8HUozEESqq7upnGqDH1tddYuvw6UdgSpBUzi6
	ohxOYvVBBCVQWIjNQDvxyQQknFmTM5nH5FvWf5pgpiQp24qET/tPs5fSpuWSnpJXwnQMZgQKaAq
	NvBPTRf5DL20OCZPWDP3o2SHyY1kziDECLK4j7OfdQok4QpiG+QjE7LM359+t2zShRCtg/wmZAs
	ew+Ydpseg+SzBQcXsdE3cf563lo57kuIFckjoQNK9zof41k1p02IUoLpT+m/0zzDx5fG+Rccafm
	82VeU=
X-Received: by 2002:a17:90b:4b90:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3ae8984b662mr7868096a91.58.1793606240670;
        Sun, 01 Nov 2026 23:57:20 -0800 (PST)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9583c1sm18649416a91.10.2026.11.01.23.57.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 23:57:20 -0800 (PST)
From: Yu Zhang <yuz08559@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] gpio: virtuser: remove the debugfs files before freeing the line data
Date: Mon,  2 Nov 2026 17:57:07 +1000
Message-ID: <20261102075707.41742-1-yuz08559@gmail.com>
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

gpio_virtuser_probe() registers the devm action that removes the debugfs
directory before it allocates the per-line and per-array data that the
debugfs files point to. devres releases resources in reverse order, so
on unbind the line data is freed, the consumer_lock mutex is destroyed
and the GPIO descriptors are put first, and the debugfs files are only
removed afterwards.

A read or write of any of the per-line debugfs files (value, direction,
consumer, interrupts, ...) that runs in that window dereferences the
freed data. debugfs_remove_recursive() waits for in-flight file
operations, but by then the data has already been freed.

Running eight threads that read the per-line debugfs files while
another task writes 1 and 0 to the configfs "live" attribute triggers
this within a second on a KASAN kernel, with gpio-sim as the provider:

  BUG: KASAN: slab-use-after-free in gpio_virtuser_value_get+0x19/0x60
  Read of size 8 at addr ffff888005109e38 by task vu_race/3479
  Call Trace:
   gpio_virtuser_value_get+0x19/0x60
   simple_attr_read+0x109/0x290
   debugfs_attr_read+0x5e/0x80
   full_proxy_read+0xae/0xe0
   vfs_read+0x1bc/0x7a0
  Allocated by task 1:
   devm_kmalloc+0x89/0x1d0
   gpio_virtuser_probe+0x56f/0x910
  Freed by task 1:
   kfree+0x196/0x430
   release_nodes+0x77/0xa0
   devres_release_all+0xf3/0x150
   device_unbind_cleanup+0x18/0x130
   ...
   platform_device_unregister+0x3c/0x50
   gpio_virtuser_device_deactivate+0x3c/0xc0

The same run also reports use-after-free on the freed consumer_lock
from the consumer attribute.

Register the debugfs removal action after the line data has been set
up, so that it runs first on unbind, and remove the directory by hand
on the probe error paths before that point.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/gpio/gpio-virtuser.c | 46 +++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 70ddccc..03fa951 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -927,38 +927,50 @@ static int gpio_virtuser_probe(struct platform_device *pdev)
 				     "Failed to get the IDs of GPIOs to request\n");
 
 	dbgfs_entry = debugfs_create_dir(dev_name(dev), gpio_virtuser_dbg_root);
-	ret = devm_add_action_or_reset(dev, gpio_virtuser_debugfs_remove,
-				       dbgfs_entry);
-	if (ret)
-		return ret;
 
 	for (i = 0; i < num_ids; i++) {
 		descs = devm_gpiod_get_array(dev, ids[i], GPIOD_ASIS);
-		if (IS_ERR(descs))
-			return dev_err_probe(dev, PTR_ERR(descs),
-					     "Failed to request the '%s' GPIOs\n",
-					     ids[i]);
+		if (IS_ERR(descs)) {
+			ret = dev_err_probe(dev, PTR_ERR(descs),
+					    "Failed to request the '%s' GPIOs\n",
+					    ids[i]);
+			goto err_remove_debugfs;
+		}
 
 		ret = gpio_virtuser_dbgfs_init_line_array_attrs(dev, descs,
 								ids[i],
 								dbgfs_entry);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to setup the debugfs array interface for the '%s' GPIOs\n",
-					     ids[i]);
+		if (ret) {
+			dev_err_probe(dev, ret,
+				      "Failed to setup the debugfs array interface for the '%s' GPIOs\n",
+				      ids[i]);
+			goto err_remove_debugfs;
+		}
 
 		for (j = 0; j < descs->ndescs; j++) {
 			ret = gpio_virtuser_dbgfs_init_line_attrs(dev,
 							descs->desc[j], ids[i],
 							j, dbgfs_entry);
-			if (ret)
-				return dev_err_probe(dev, ret,
-						     "Failed to setup the debugfs line interface for the '%s' GPIOs\n",
-						     ids[i]);
+			if (ret) {
+				dev_err_probe(dev, ret,
+					      "Failed to setup the debugfs line interface for the '%s' GPIOs\n",
+					      ids[i]);
+				goto err_remove_debugfs;
+			}
 		}
 	}
 
-	return 0;
+	/*
+	 * The debugfs files point to the devres-managed line data allocated
+	 * above. Register the removal last so that it runs first on unbind,
+	 * before any of that data is released.
+	 */
+	return devm_add_action_or_reset(dev, gpio_virtuser_debugfs_remove,
+					dbgfs_entry);
+
+err_remove_debugfs:
+	debugfs_remove_recursive(dbgfs_entry);
+	return ret;
 }
 
 static const struct of_device_id gpio_virtuser_of_match[] = {
-- 
2.43.0

