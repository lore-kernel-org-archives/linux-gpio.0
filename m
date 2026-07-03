Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE3B3E5EC2
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088901; cv=none; b=G1N+hOEq+w1Y/c3CnOazJQ2NisVPe9vxu+zqBTegI/YRzSDP2c+Iy7Jl3wY59v27LpaGcpRCYQ1Yr4ARznTH0G3UufJp6tB7qLNZ7wTJOGEPODBKu4UKkvKPKh+kjZN53bBghLegICpnZc/RwcrvzKXXuZEphdUlc0KOaQOw1SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088901; c=relaxed/simple;
	bh=cSWcObhNusU13Oj32dVFBFz/zqLc5Snk08dxMjEK+JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b4mVzDd6gEZ5jRLqU5mbQzkTha3xkKES8qUqKPfWZWPTUFloSVxfbmQeL9iFeOcLNg11ds3EjGUDtT22ZiH5+ey2ToPEcNZvePRWTgQqlVrEgwtcYCiliWYpT6veGYF1ssQSAVd9h2AYuYzbQlu+OK40spTBZsRcA4l6OueWahg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDDzmjMa; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDDzmjMa"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8b49639fbaso469861a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783088897; x=1783693697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG2y+koG365pWfdqnykSJDadz8vDj+bdgjUKuwxQq9c=;
        b=HDDzmjMaMvEOkUlPpebw3de6qHS/nPiOheUmGRIxbg999J3yKNRA1wMQBWbR6z8bw9
         oHyd8UvUc/sZXUdE+/1QZde8NF0FsUxnYZUlOQztBZykCKkcgLe8z1dq7kdkMqiPaN/5
         79xihewItpBu+ubmnHQIGQjdzTKgBJ7Qa8HuLJSoRWXvzxuM6MR2vC5fvhuRGbl7+pTr
         rf+nddfN56O9QulYcFRqcnAvIEQAesbC7cOw+zxtbSGjxuU9uWvDx6Mh3egvFS90wLix
         jkrf0hrXAL8322ro22/9dtcPOckUbmtosGZMU4gbtT+9EGqlXDvt+w8Dq8tD1I0LRV5m
         XVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783088897; x=1783693697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MG2y+koG365pWfdqnykSJDadz8vDj+bdgjUKuwxQq9c=;
        b=hbGUQ6znMoaYLlygi/WdtFTCnOAz3ugimgJEMel8gOTy9V8ZNrg3zyX9tsq3P2KH7E
         SQJiLSkWfYa55SGXHrz+Qa49PNKFrD17qPuvUIICarurEfOriGlvUAFQme2pMVtoVhUg
         biswATXHGLF2n6ebgF4O1F0JdvFPnpAsnfkFgq9xfoYgCxerAwFRiW9CsXNkQnWsV3iO
         aICJdJJmtX7F7joiRMGL5iHd02mgf+QHVpRhr51FqKoCohL3ppfsvbvqzkyFtHVDQW7F
         kvMYBWd8oyPd9hLUk7Mess/V0P2ntxFmUMOeGcSGiM4yGM5MjLEiqWl9Xoq9fUTTUN7u
         nWMg==
X-Gm-Message-State: AOJu0Ywosv3nJ+tTt8fsBjNUb6z+JiDZWpv9IViU8ac8pvAq40XfDS0o
	AVO/M2/DAU8wnKPJScHqR9Y0O1gU3Rf8z/koe1zIAHzzA2IJ9/r5G5Ng
X-Gm-Gg: AfdE7cml6meSis0NLvEmf8jO4+MXqA68PEmClb3FsbyZow6nn6U821O1hHfa3QjRZxq
	MfNcxsHYKN2LnR99CJmkWPZZqOO4rQPgU0HL0qGMDRybKDc7fTranl1DPbkYkayo4ikbmuQC/Oh
	9IBHrpkYcl15QlLMCn0oo22ahFJmD+Vy9lzM8Uqea/ESD8EQYvYUvv4DyNYSpM+gp2EPSug8Uw+
	pLjAbgYwKdFCiNGupOdU2RiRx3Cp3+B66IKapvY3TZPhVGA09Mx+NzohrQotePM+hAWdj7lbSlD
	A+rAnhdEdK3TH/e/OizG61cgSpNbDPlSTIKzdn/DsIAcn3nxqMnPLRNELMkmjoK717kjLyaQrqY
	O06zDBnxwM4ExAu30BVXtXw+c3wKSss14NhIxaAalcpooxox6vW7Y5RX1EP9R1X9dWzNfIxwoiS
	WL6N6DtRcycl8G0JIIt6Y=
X-Received: by 2002:a05:6a20:6a0d:b0:3aa:c93b:625b with SMTP id adf61e73a8af0-3c03c46d39emr103058637.3.1783088896947;
        Fri, 03 Jul 2026 07:28:16 -0700 (PDT)
Received: from localhost ([112.65.12.207])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ee85sm2636210a12.3.2026.07.03.07.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:28:16 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: hoan@os.amperecomputing.com,
	linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liang Hao <haohlliang@gmail.com>
Subject: [PATCH v2] gpio: dwapb: Add robust error handling in interrupt handler
Date: Fri,  3 Jul 2026 22:27:49 +0800
Message-ID: <20260703142749.24203-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260703131833.17097-1-haohlliang@gmail.com>
References: <20260703131833.17097-1-haohlliang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current interrupt handler silently continues if an interrupt
handling fails, which may lead to interrupt storms. Add proper
error handling to gracefully recover from failed interrupt
handling.

When generic_handle_irq() fails, the following recovery actions are
taken:
  - Write EOI to clear the pending interrupt
  - Mask the interrupt to prevent immediate re-triggering
  - Disable the interrupt to stop further interrupts on this line

Use scoped_guard(gpio_generic_lock_irqsave) to protect the read-
modify-write sequences on shared registers (GPIO_INTMASK and
GPIO_INTEN). This prevents race conditions with irq_chip callbacks
(dwapb_irq_mask, dwapb_irq_enable, etc.) that access the same
registers from different contexts.

These measures prevent the system from being overwhelmed by repeated
unhandled interrupts while logging a rate-limited warning for
debugging purposes.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
v1 -> v2:
- Add spinlock protection for register access in error path
- Protect against race with irq_chip callbacks accessing shared registers
---
 drivers/gpio/gpio-dwapb.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7b92b233fafe..dc9676eb1429 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -209,8 +209,23 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 	for_each_set_bit(hwirq, &irq_status, DWAPB_MAX_GPIOS) {
 		int gpio_irq = irq_find_mapping(gen_gc->gc.irq.domain, hwirq);
 		u32 irq_type = irq_get_trigger_type(gpio_irq);
-
-		generic_handle_irq(gpio_irq);
+		int ret;
+		u32 val_intmask, val_inten;
+
+		ret = generic_handle_irq(gpio_irq);
+		if (ret) {
+			dev_warn_ratelimited(gpio->dev, "Failed to handle irq %d\n", gpio_irq);
+			/* Clear the interrupt */
+			scoped_guard(gpio_generic_lock_irqsave, gen_gc) {
+				/* Clear the interrupt */
+				dwapb_write(gpio, GPIO_PORTA_EOI, BIT(hwirq));
+				val_intmask = dwapb_read(gpio, GPIO_INTMASK);
+				dwapb_write(gpio, GPIO_INTMASK, val_intmask | BIT(hwirq));
+				val_inten = dwapb_read(gpio, GPIO_INTEN);
+				dwapb_write(gpio, GPIO_INTEN, val_inten & ~BIT(hwirq));
+			}
+			continue;
+		}
 
 		if ((irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
 			dwapb_toggle_trigger(gpio, hwirq);
-- 
2.50.1 (Apple Git-155)

