Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1649F101;
	Thu,  3 Sep 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436921; cv=none; b=qiXcUvl8uj82DLKS1VLJtNRF6mGwumhymel64XCzEm/tVWXKQlqnLtt96C4dPjZcq1gwGsLuYltf9fErd4Zfh9NXvKIAmVAQnr8KHJICD0RQdaoWpr44U0ToZavQm/VuLoYzM2mMsQgtryaEYVQFc/knKAWZgfmrRZkLD1mbWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436921; c=relaxed/simple;
	bh=W1oOhbMeJt2RiugorOqzzo0WowoEdh8EMVhpG1Pzy80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Slq00nhdzF5Qyeuq8tLh19J5wRcxyEVB6fnhbaNNK2vduJafLO442lPlH+HMQYSLggg2KNuQh/PpvKo18AD2iiEF/fx2m1v6/9eFk5CIdJ/pEQ3uWnILy02AmjOR2zxIvwog0HLEmVMS3BouZcS8ZlPNISl6t/pKo+pOYPSHqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xYAIe+Nh; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xYAIe+Nh"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AF9Bd1514814;
	Thu, 3 Sep 2026 08:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ojs5a
	/on8aeVv7qhpOrAk0cJYJcxqIhpfMIgCmJ3dxs=; b=xYAIe+NhKCK/6wMfl7YYq
	ZalnC8kW6qxNEyhpRNtau7/DdNaKIAIGu7KBX2ylOpGnivoGXntBz4vdhbLc4+wg
	3YUkH5+wewgLvFihelgqFRi9xsz5rj99STiggIyleLNii9KQRx8u8DJxnuSlnkCj
	ES0ayoHyG0JW3OjAqXHg0SkeqKqQLnmvGd8Utyh7k6Yj7VmZXemZ5wSpBPkKAfpO
	QNvO7YfK4d5rDntwjiW5GvCMj8Hk9lMpV0ixiD/OOvQTXI66XdQHNYSDhqZZ5vZj
	Aj8Pj4+N5necrrb3/imYD4VQh+sRJAl0vqI7Y8ME2kOnn25Ql3561/+a/H0cZ6Dt
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4ge469gxh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 08:01:55 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 683C1sX7003609
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Sep 2026 08:01:54 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 3 Sep
 2026 08:01:54 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 3 Sep 2026 08:01:54 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com ([10.32.225.204])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 683C1eKp016937;
	Thu, 3 Sep 2026 08:01:50 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 3 Sep 2026 14:01:27 +0200
Subject: [PATCH v6 2/3] gpio: regmap: Add optional runtime PM support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260903-ad7768-gpio-v6-2-4254ef6c9b38@analog.com>
References: <20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com>
In-Reply-To: <20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Jonathan Cameron
	<jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Janani
 Sunil <jananisunil.dev@gmail.com>,
        Janani Sunil <janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788436900; l=6940;
 i=janani.sunil@analog.com; s=20260903; h=from:subject:message-id;
 bh=W1oOhbMeJt2RiugorOqzzo0WowoEdh8EMVhpG1Pzy80=;
 b=oR6kv4X4xLn5pcio+EqMTYqC6de7bt21jb8wCC987cnfSjxWgFpuEaXUlofQYop+Txrdr/3rj
 NKmioDQ8DUKA7KQxpwRKt/fuHW1f6SYIgt7A4YCit4ztuugXllipEC3
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=0UJo4rLJeMHBMco/+wcMHzXI7nV8k1T72+XQlBNV4Rw=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: BSh_ZilyFAD2UMeZzchKw3_icalfx_qF
X-Authority-Analysis: v=2.4 cv=LuCiDHdc c=1 sm=1 tr=0 ts=6a9961b3 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=QyXUC8HyAAAA:8
 a=gAnH3GRIAAAA:8 a=3fJ8ZLtifNgCll64qzMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXw+WKhheRCLbs
 IZN05YlyWAEXlku1au5ZOkk1CraOVY+CtvCEBNOD3ADkKC6II7Vk9q6y0UxL3/JW/t+zXN59SwD
 6d3kBIQvmJYNFzaXGACD5ydhBjGDMc8rBIU8q7SV9ye9QkSajoCj3NtaeI5sVHjAJrhWfNDB4/o
 lP9/wgaii5Rn0LcJJGUr6l8CyKkdvKH/9JPJHNwc1YK3lUF4OzpuJKjSA8r1B16siHpmxNCza65
 kE57TITFqypdll91gIwuV31s9+7a2uo9vlXCj0XPitzyNTYcPpZ73COyr5urjkNt/p6w54BPQcg
 9ODLYNg4iZy6djScT9yy7jjV2hSaUgKiM73urV4nAp9efItW3dHCSZ/S+dR0ORLk2u+aCp2H3U+
 TTxKY7n4rN4a6hhorA5rHgZmIpLBw5YvwaLy6bONMmp5EAT4r/y9pzMaFhuu1Z0rS5y5h2oKPrv
 nFRZ4mcWNkSETRFz2gw==
X-Proofpoint-ORIG-GUID: BSh_ZilyFAD2UMeZzchKw3_icalfx_qF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX8L5sjJay4Yua
 S1m5PJt/iCRTW98h0eJmG7gyc6jzPvP4Sg1HxEnYaW55K28bir7sAK0Z88ZHpG+ZBBhxBkiPySM
 T64yXaKDAqL4PRoTshNiXpbFScxPqrtYFU0sSbGhSwVWqI7KrguH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

Some gpio-regmap consumers share their regmap with a parent device that
may be runtime suspended. GPIO register accesses must resume that device
first.

Add an optional pm_dev field and acquire it before register translation
or access. Release it using runtime autosuspend after each operation.
Keep the device active across the complete direction-output sequence and
propagate failure when setting the initial output value.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
 drivers/gpio/gpio-regmap.c  | 80 +++++++++++++++++++++++++++++++++++++++++----
 include/linux/gpio/regmap.h |  2 ++
 2 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ae6fa42b00a4..2f5f45b84cc9 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -6,11 +6,13 @@
  */
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -23,6 +25,8 @@
 struct gpio_regmap {
 	struct device *parent;
 	struct regmap *regmap;
+	struct device *pm_dev;
+
 	struct gpio_chip gpio_chip;
 
 	int reg_stride;
@@ -79,6 +83,33 @@ static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
 	return 0;
 }
 
+static int gpio_regmap_runtime_get(struct gpio_regmap *gpio)
+{
+	if (!gpio->pm_dev)
+		return 0;
+
+	return pm_runtime_get_active(gpio->pm_dev, RPM_TRANSPARENT);
+}
+
+static void gpio_regmap_runtime_put(struct gpio_regmap *gpio)
+{
+	if (!gpio->pm_dev)
+		return;
+
+	pm_runtime_put_autosuspend(gpio->pm_dev);
+}
+
+DEFINE_GUARD(gpio_regmap_runtime, struct gpio_regmap *,
+	     gpio_regmap_runtime_get(_T), gpio_regmap_runtime_put(_T))
+DEFINE_GUARD_COND(gpio_regmap_runtime, _try,
+		  gpio_regmap_runtime_get(_T), _RET == 0)
+
+#define GPIO_REGMAP_RUNTIME_ACQUIRE(_gpio, _var) \
+	ACQUIRE(gpio_regmap_runtime_try, _var)(_gpio)
+
+#define GPIO_REGMAP_RUNTIME_ACQUIRE_ERR(_var_ptr) \
+	ACQUIRE_ERR(gpio_regmap_runtime, _var_ptr)
+
 static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
@@ -91,7 +122,13 @@ static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 	else
 		base = gpio_regmap_addr(gpio->reg_set_base);
 
-	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset, &reg, &mask);
+	GPIO_REGMAP_RUNTIME_ACQUIRE(gpio, pm);
+	ret = GPIO_REGMAP_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset,
+				   &reg, &mask);
 	if (ret)
 		return ret;
 
@@ -114,7 +151,13 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
 	unsigned int reg, mask, mask_val;
 	int ret;
 
-	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &reg, &mask);
+	GPIO_REGMAP_RUNTIME_ACQUIRE(gpio, pm);
+	ret = GPIO_REGMAP_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset,
+				   &reg, &mask);
 	if (ret)
 		return ret;
 
@@ -146,6 +189,11 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
 	unsigned int base, reg, mask, value = 0;
 	int ret;
 
+	GPIO_REGMAP_RUNTIME_ACQUIRE(gpio, pm);
+	ret = GPIO_REGMAP_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	if (val)
 		base = gpio_regmap_addr(gpio->reg_set_base);
 	else
@@ -208,7 +256,13 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 		return -ENOTSUPP;
 	}
 
-	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_DIR_OP, base, offset, &reg, &mask);
+	GPIO_REGMAP_RUNTIME_ACQUIRE(gpio, pm);
+	ret = GPIO_REGMAP_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_DIR_OP, base, offset,
+				   &reg, &mask);
 	if (ret)
 		return ret;
 
@@ -262,7 +316,13 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
 		return -ENOTSUPP;
 	}
 
-	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_OP, base, offset, &reg, &mask);
+	GPIO_REGMAP_RUNTIME_ACQUIRE(gpio, pm);
+	ret = GPIO_REGMAP_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_OP, base, offset,
+				   &reg, &mask);
 	if (ret)
 		return ret;
 
@@ -293,6 +353,11 @@ static int gpio_regmap_direction_output(struct gpio_chip *chip,
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
 	int ret;
 
+	GPIO_REGMAP_RUNTIME_ACQUIRE(gpio, pm);
+	ret = GPIO_REGMAP_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	/*
 	 * First check if this is gonna work on a fixed direction line,
 	 * if it doesn't (i.e. this is a fixed input line), then do not
@@ -304,7 +369,9 @@ static int gpio_regmap_direction_output(struct gpio_chip *chip,
 			return ret;
 	}
 
-	gpio_regmap_set(chip, offset, value);
+	ret = gpio_regmap_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return gpio_regmap_set_direction(chip, offset, true);
 }
@@ -399,6 +466,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	gpio->reg_clr_base = config->reg_clr_base;
 	gpio->reg_dir_in_base = config->reg_dir_in_base;
 	gpio->reg_dir_out_base = config->reg_dir_out_base;
+	gpio->pm_dev = config->pm_dev;
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
@@ -406,7 +474,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	chip->base = -1;
 	chip->names = config->names;
 	chip->label = config->label ?: dev_name(config->parent);
-	chip->can_sleep = regmap_might_sleep(config->regmap);
+	chip->can_sleep = config->pm_dev || regmap_might_sleep(config->regmap);
 	chip->init_valid_mask = config->init_valid_mask;
 
 	chip->request = gpiochip_generic_request;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 6f52c140e50d..6fe0877717cb 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -46,6 +46,7 @@ enum gpio_regmap_operation {
  * @parent:		The parent device
  * @regmap:		The regmap used to access the registers
  *			given, the name of the device is used
+ * @pm_dev:		(Optional) Device to use for runtime power management.
  * @fwnode:		(Optional) The firmware node.
  *			If not given, the fwnode of the parent is used.
  * @label:		(Optional) Descriptive name for GPIO controller.
@@ -117,6 +118,7 @@ enum gpio_regmap_operation {
 struct gpio_regmap_config {
 	struct device *parent;
 	struct regmap *regmap;
+	struct device *pm_dev;
 	struct fwnode_handle *fwnode;
 
 	const char *label;

-- 
2.43.0

