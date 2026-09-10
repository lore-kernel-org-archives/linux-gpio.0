Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4561C49DBB5
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049817; cv=none; b=ijHLG6LmNnmuWVqwiZB6H1aZOAKEpPARwkh/rDTL4mk519igzMlDG6D5loaJSxID2tpLPy2YIC3M4IwkGRgenSpVcTwOKcRNUhrSCyk+ejOIqMJn36N1u15R3VdrEk/XVPRQNSQfLQob8n7Zefr9C8s6dKHm3qe7M+Qe70+LIXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049817; c=relaxed/simple;
	bh=14q/AGuCI/1cMUweJgIB0L3OMxxoLgdTw1EPzcv06eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pjfMEWHX10PSdSZQLgsvaWGn1Ey7pVMvAvwe7LBAFpq10QN701+YpMB+Vv9a4cGZszTEPR6yyumgaBB7hd+xHswYpLAAoV63pw2IrY7eiKg+fEBFVRO3wl+UUTQ7dyrYv21/uSVO1uYwZBe4Jj4S5jXk0/eVBVxXTFO/Yc405Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlJAfg+h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlJAfg+h"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso52800775e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049813; x=1789654613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwWBBZH7mpniW2ZzZNxzBtSQJ/59woxlB51LlnMYp5I=;
        b=JlJAfg+hycewDNa7L4DM6tPzQjnNrEqQt76IN4C3HIJgwfVJo8KXIybw8BH3ogGO+N
         heZthqX3VUqEvDJDVh/rcjgYeyTQV7+/2UFjwWWAZx6Xh0ZCrxVPjh+ZZLGcijDbJ9cJ
         Cdhl5Qo293+hugTNPsF4y0OkFh2r3aJZJNs6G8tUC+1oZi7knRkw8AzgrBxBQF9PiFtr
         erbVLZiX4+M/7fsieqB+6+aLusDT4nxqFcG0cu0LMfC7qkZhC+rkLhToIUBaprJbSvUY
         IZnscjIv4wv8XW6pUDNELFtxM1gEk2DZ2PxaMwZMU0A/bpATSnQgVZ3wX1eZw9ywucIw
         vv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049813; x=1789654613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwWBBZH7mpniW2ZzZNxzBtSQJ/59woxlB51LlnMYp5I=;
        b=fXUOy832ErHttMgaxnhrRo0gxyDn0Rj1y2zROgZ8d+x915UvLI9HyWKdrB774FVICJ
         1V1LvVsuo2Z8WVjXQQeJQOLKAp30g/dRUhsUabCbOFrr16gxDDjDLJszwP2FR4j0HPT1
         8CR2sJoSXLPSDuqd8gQ76Q497PoOFCyC7J/vQtWGahilEw4NqKJ5Yj4+seDqHWYjcL83
         wC87cT7U1RKh32aUZ51E3RE8NXo1rma1/2Jdm4ga70q7euynmx0WHr+QkvpZX+Qrb2qc
         BCD+AVl5e0sR/1K2hh4n4uz1uCeBqjkdU0DGW/xB6T5s+2wam4tsbJCogD/hw+Y0XSpe
         Fe8w==
X-Forwarded-Encrypted: i=1; AKwUvBysEw75TBscvWHZ0YmD3UeY2zvSoYtjKBZX6xrTXcf8swZkaOf6frMe6wETMnZ/qAbEZs+yB9zj4xih@vger.kernel.org
X-Gm-Message-State: AFuF++kMOqifSi5VVJcAxvUKjg1lwJVWRQO45+r/bE1itlEce1xxLIa6
	MPuC11vxe1W+oXHNoni7eLlqUfpWm7YSFMk66eTIicnAk0pprZ7aZDcb
X-Gm-Gg: AYBFou08uue7kpx26R8YtYTJx+fA8qGIkdfiw3HjGOprzAP1rF7ewY6NfPz2KOJ4AB/
	cHkwmP1yoR1kcTkVw1d5JR8ggNGPgU4ZepNqA+4aa8v+kgnbiR0RHxs+Z5F/3vK/+UXD98derbP
	Ud5OxuTBYeVlM8i+j1ztfBz68+TzjFDNOfKDWfio98VGBBrViXENBnOg75EKBRSEnHLuTm+K49i
	Tl16pYcp4UDxFZ9+LpJlt89DK7PHoL2ewtj+kwta+uo09BgVXeteY8neEMw+W5pZEfWAeq7aIPH
	z54fBFELMZHNyniboPmgV8ItUslgI7K5jmhRNPh96811bzig3Sen6UDRYs1QeStIjxlSQGZMCkv
	aDk2j84FTUVz/PGStabMzYkEuK2JxDhcwOmTdHV80AWsBmrnns7VMIFVyICl+LAXuEgop8Nkjif
	kBZe+e7wZ0pHZTF3k5nnGtW2sOllKnMDVgVQlLxd9UdZZaDHDa2+CSwya6swB6kdEDMgz/2IU2B
	Vaw4u+KiylSAMN6sVFLZdUugELNSO+MbjE1k05jTUicUH4mKA+I05ANdwRYyIuU7RT3VbF9kw==
X-Received: by 2002:a05:600c:4e46:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49cfc6e8e51mr381246695e9.24.1789049813262;
        Thu, 10 Sep 2026 07:16:53 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:52 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 16:16:44 +0200
Subject: [PATCH v2 3/7] of: unittest: Test fw_devlink with GPIO nexus maps
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fw-devlink-nexus-ready-v2-3-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add OF unit tests that call the fw_devlink add_links operation for GPIOs
routed through nexus maps. Verify that each mapped consumer has exactly
one link to the final GPIO provider rather than to the nexus.

Also cover direct references and all GPIO property spellings recognized
by fw_devlink, including the deprecated singular and unprefixed forms.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/unittest-data/tests-phandle.dtsi | 33 +++++++++++++
 drivers/of/unittest.c                       | 75 +++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index 554a996b2ef1..c3727ed15bde 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -79,6 +79,39 @@ consumer-b {
 				phandle-list-bad-args = <&provider2 1 0>,
 							<&provider4 0>;
 			};
+
+			fw-devlink-tests {
+				gpio_provider: gpio-controller {
+					#gpio-cells = <2>;
+				};
+
+				fwdevlink_nexus: nexus {
+					#gpio-cells = <2>;
+					gpio-map = <0 0 &gpio_provider 1 0>;
+					gpio-map-mask = <0xffffffff 0>;
+					gpio-map-pass-thru = <0 0xffffffff>;
+				};
+
+				gpio-compat-consumer {
+					gpios = <&fwdevlink_nexus 0 0>;
+				};
+
+				gpio-compat-singular-consumer {
+					gpio = <&fwdevlink_nexus 0 0>;
+				};
+
+				gpio-consumer {
+					test-gpios = <&fwdevlink_nexus 0 0>;
+				};
+
+				gpio-direct-consumer {
+					test-gpios = <&gpio_provider 1 0>;
+				};
+
+				gpio-singular-consumer {
+					test-gpio = <&fwdevlink_nexus 0 0>;
+				};
+			};
 		};
 	};
 };
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..dfa3c885d142 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -10,6 +10,7 @@
 #include <linux/dma-direct.h> /* to test phys_to_dma/dma_to_phys */
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/fwnode.h>
 #include <linux/hashtable.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
@@ -710,6 +711,79 @@ static void __init of_unittest_parse_phandle_with_args_map(void)
 	}
 }
 
+static void __init of_unittest_fw_devlink_supplier(struct device_node *tests,
+						   const char *consumer_name,
+						   const char *supplier_name)
+{
+	struct device_node *consumer, *supplier;
+	struct fwnode_handle *consumer_fwnode;
+	struct fwnode_link *link;
+	unsigned int link_count = 0;
+	bool found = false;
+	int rc;
+
+	consumer = of_get_child_by_name(tests, consumer_name);
+	supplier = of_get_child_by_name(tests, supplier_name);
+	if (unittest(consumer && supplier, "missing consumer %s or supplier %s\n",
+		     consumer_name, supplier_name))
+		goto put_nodes;
+
+	consumer_fwnode = of_fwnode_handle(consumer);
+	fwnode_links_purge(consumer_fwnode);
+	rc = fwnode_call_int_op(consumer_fwnode, add_links);
+	if (rc == -EOPNOTSUPP) {
+		pr_info_once("fw_devlink tests skipped: OF supplier links are not supported\n");
+		goto purge_links;
+	}
+	if (unittest(!rc, "failed to add links for %pOF: %d\n", consumer, rc))
+		goto purge_links;
+
+	/*
+	 * The suppliers list should normally be accessed with fwnode_link_lock
+	 * held, but that lock is private to the driver core. These test nodes
+	 * are isolated and have no concurrent link updates.
+	 */
+	list_for_each_entry(link, &consumer_fwnode->suppliers, c_hook) {
+		link_count++;
+		if (link->supplier == of_fwnode_handle(supplier))
+			found = true;
+	}
+
+	unittest(link_count == 1, "%pOF has %u suppliers, expected 1\n", consumer, link_count);
+	unittest(found, "%pOF is not linked to supplier %pOF\n", consumer, supplier);
+
+purge_links:
+	fwnode_links_purge(consumer_fwnode);
+put_nodes:
+	of_node_put(consumer);
+	of_node_put(supplier);
+}
+
+static void __init of_unittest_fw_devlink(void)
+{
+	static const struct {
+		const char *consumer;
+		const char *supplier;
+	} cases[] = {
+		{ "gpio-compat-consumer", "gpio-controller" },
+		{ "gpio-compat-singular-consumer", "gpio-controller" },
+		{ "gpio-consumer", "gpio-controller" },
+		{ "gpio-direct-consumer", "gpio-controller" },
+		{ "gpio-singular-consumer", "gpio-controller" },
+	};
+	struct device_node *tests;
+	int i;
+
+	tests = of_find_node_by_path("/testcase-data/phandle-tests/fw-devlink-tests");
+	if (unittest(tests, "missing fw_devlink test data\n"))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(cases); i++)
+		of_unittest_fw_devlink_supplier(tests, cases[i].consumer, cases[i].supplier);
+
+	of_node_put(tests);
+}
+
 static void __init of_unittest_property_string(void)
 {
 	const char *strings[4];
@@ -4533,6 +4607,7 @@ static int __init of_unittest(void)
 	of_unittest_dynamic();
 	of_unittest_parse_phandle_with_args();
 	of_unittest_parse_phandle_with_args_map();
+	of_unittest_fw_devlink();
 	of_unittest_printf();
 	of_unittest_property_string();
 	of_unittest_property_copy();

-- 
2.43.0

