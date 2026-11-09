Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227296;
	b=lj5ZdTTkfKJajy86Z050R5OHp+lzI/lIBYpVysLeKRXHiMLE2XvD8iGSUHdBWAlmcNpD
	 meFjFSh0FAgKbogIyNOvLjBsvkeugZY7/2ddO5M8V32Bwqkuh/WMBhLnGCucqF58NXeKB
	 YqdEKe2AqPbANCxI55EMOE98QEq3Ct/xIxB0/bqLeFGYK3dHcpDQoEh0LnoeE/pedlpKS
	 9IbuTcuzxxx2BXQ6iZ4XliacUGm9ilMReomDSK5LwZfDcxNMAysy4zd19rKubHAA+SjOA
	 uJAb/qtMYWAeU/fvBI/fgH1WKz3e/0uRvhHvbUHPYNN+MXO7daplU0RjiVKLlPLSunA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227296;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=iS8GiYS6BEKZKYojShCn/PzarfE6Hwuxq2fwUTCgOqc=;
	b=dGt84tqLkOLxHw8vHQAk+E9o0Mq5L8rJW5q/TogLlf/dVUCZw4aXZHQwbXJ6PXgq71d7
	 8iUDd5+uM8lurdz8AdcjFG3ExpVrRA8ImQwJ8FL4FkJNcMXUc8pM8UpBVKd1PPnvTRVmK
	 g8OBj0OYQ5Tvtm4XtyaiW234UtLSZkn5I7ENJL9dBOXro99WhYw3hISFeyU9DEEraVmyt
	 B5zUsMzLoCz1sA2N3gg2YNsfbpSZNATwFmjeBmzBtPP7/99CVJgBLum3autDKteLjcJKD
	 G8tCb4d1yecfb0IEFth+6ji0Wrvj6CjojYUiZQKgiIzPCM8IzNJAe75vyxASZeRt1FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GZnzTybZ;
	arc=none smtp.remote-ip=95.215.58.20
Received: from mta1.migadu.com (out-20.mta1.migadu.com [95.215.58.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3222606A323
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 12:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3222606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GZnzTybZ
X-Envelope-To: linux-gpio@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bqVtQ6P0h3fZuMSz5KkI6pN2g1Enr0aSOZ5UYfB26Bo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794227292; v=1; x=1794832092;
 b=GZnzTybZAk36XLwLOZUCgUBKQNqi0dynVG15SJqCDyXUf03m3H6jFEiXgjKSNXYmXwpqCswp
 59CKDDhBrk+D0PdbUj8WuvpGrIIUQf7kHOj2roieiDTs414HJagMP/CqEWe/KnBYp0l021gpjPK
 KxEZLDsToCLYkmglJ8wxclY4=
X-Envelope-To: linux-gpio@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d1122df8eed1b4de;
	Mon, 09 Nov 2026 12:28:12 +0000
X-Mizu-Trace-ID: d1122df8eed1b4de
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Mon, 09 Nov 2026 20:27:55 +0800
Subject: [PATCH] pinctrl: pinconf-generic: widen the packed config argument
 to unsigned long
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-pinconf-widen-v1-1-469726456c84@nxp.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBMcA8uuEi3ExprNJAoVhHdPW
 r7F/y8UykwF5u6FTBcXPqUB+w7C4WUnxVszGG0sonYqsYRTorp5I1F6nHCwbgjGR2hNyhT5+X/
 LWusHvh3KQl8AAAA=
X-Change-ID: 20261109-pinconf-widen-07813693c2af
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

The packed pin configuration stores the parameter in the lower 8 bits and
the argument in the remaining bits of an unsigned long. However, the
argument was limited to 24 bits: pinconf_to_config_argument() masked it
with 0xffffff, and pinconf_to_config_packed() took a u32 argument, so even
on 64-bit systems the left shift in PIN_CONF_PACKED() discarded the upper
bits. For example, the pad configuration value 0x1080000 used by a new
i.MX SoC was packed as 0x08000000 and read back as 0x80000.

Allow the argument to use the full width of unsigned long so that such
values survive the pack/unpack round trip. Cast the argument in
PIN_CONF_PACKED() to unsigned long to keep direct users of the macro
consistent with pinconf_to_config_packed(), and print the full argument
in the debugfs dumps.

The packed argument only has BITS_PER_LONG - 8 bits available, so on
32-bit systems values above 0xffffff still cannot be represented. Reject
such firmware properties instead of silently truncating them.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinconf-generic.c       | 16 +++++++++++-----
 include/linux/pinctrl/pinconf-generic.h | 13 ++++++++-----
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 36845517984e..0876015a6575 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -95,12 +95,12 @@ static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
 		seq_puts(s, item->display);
 		/* Print unit if available */
 		if (item->has_arg) {
-			u32 val = pinconf_to_config_argument(config);
+			unsigned long val = pinconf_to_config_argument(config);
 
 			if (item->format)
-				seq_printf(s, " (%u %s)", val, item->format);
+				seq_printf(s, " (%lu %s)", val, item->format);
 			else
-				seq_printf(s, " (0x%x)", val);
+				seq_printf(s, " (0x%lx)", val);
 
 			if (item->values && item->num_values) {
 				if (val < item->num_values)
@@ -152,7 +152,7 @@ void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
 	for (i = 0; i < ARRAY_SIZE(conf_items); i++) {
 		if (pinconf_to_config_param(config) != conf_items[i].param)
 			continue;
-		seq_printf(s, "%s: 0x%x", conf_items[i].display,
+		seq_printf(s, "%s: 0x%lx", conf_items[i].display,
 			   pinconf_to_config_argument(config));
 	}
 
@@ -164,7 +164,7 @@ void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
 		if (pinconf_to_config_param(config) !=
 		    pctldev->desc->custom_conf_items[i].param)
 			continue;
-		seq_printf(s, "%s: 0x%x",
+		seq_printf(s, "%s: 0x%lx",
 				pctldev->desc->custom_conf_items[i].display,
 				pinconf_to_config_argument(config));
 	}
@@ -268,6 +268,12 @@ static int parse_fw_cfg(struct fwnode_handle *fwnode,
 			}
 		}
 
+		if (val & ~PIN_CONF_ARG_MASK) {
+			pr_err("%pfw: value %#x for %s does not fit in the pinconf argument\n",
+			       fwnode, val, par->property);
+			return -EINVAL;
+		}
+
 		pr_debug("found %s with value %u\n", par->property, val);
 		cfg[*ncfg] = pinconf_to_config_packed(par->param, val);
 		(*ncfg)++;
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 1df63c732b99..9d28d4de1415 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -172,27 +172,30 @@ enum pin_config_param {
 /*
  * Helpful configuration macro to be used in tables etc.
  */
-#define PIN_CONF_PACKED(p, a) ((a << 8) | ((unsigned long) p & 0xffUL))
+#define PIN_CONF_PACKED(p, a) \
+	(((unsigned long) a << 8) | ((unsigned long) p & 0xffUL))
 
 /*
  * The following inlines stuffs a configuration parameter and data value
  * into and out of an unsigned long argument, as used by the generic pin config
  * system. We put the parameter in the lower 8 bits and the argument in the
- * upper 24 bits.
+ * upper BITS_PER_LONG - 8 bits.
  */
 
+#define PIN_CONF_ARG_MASK	(~0UL >> 8)
+
 static inline enum pin_config_param pinconf_to_config_param(unsigned long config)
 {
 	return (enum pin_config_param) (config & 0xffUL);
 }
 
-static inline u32 pinconf_to_config_argument(unsigned long config)
+static inline unsigned long pinconf_to_config_argument(unsigned long config)
 {
-	return (u32) ((config >> 8) & 0xffffffUL);
+	return (config >> 8) & PIN_CONF_ARG_MASK;
 }
 
 static inline unsigned long pinconf_to_config_packed(enum pin_config_param param,
-						     u32 argument)
+						     unsigned long argument)
 {
 	return PIN_CONF_PACKED(param, argument);
 }

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-pinconf-widen-07813693c2af

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

