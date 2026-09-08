Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A8D396561;
	Tue,  8 Sep 2026 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852315; cv=none; b=J6MNdaxFuw2Ljf2CGcggkpT92YjYDOR0ecREmzhP6iEA3v+cb1FDCh2tvF9ndwXzgPtHbkIwL7GYcrxuQgayxSo5hgF7rMNZfM+O0Fv7Cf/mtWRj6j2FiClj/eB0JO+1cScD86qbvxgOQ5q7IU5I50Vhf294JiUvRAbj1G0Sc2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852315; c=relaxed/simple;
	bh=Rvho5R3p9z34bElAQ63YqEnhP+/R0Fnn9h0VmL/Pxto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QMjE6kJZBd6GbPB4dhI+QVf4IZvc52zh/bYNmJ/3eGHogUHLlerdjGGYebVseuQt4xCS6fthmxsWmc+6hWYJJLRsSBSrrZoOOsZk05/y0OMsCXTgg9gLFCQp+PoTMFpflq+QC8ZlGWhWyPJyQXxv0Q33blClBifs1auhS8BNZf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=UkXol3Go; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="UkXol3Go"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Qdiq2130744;
	Tue, 8 Sep 2026 03:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Fl+7K
	7BAXKhPoru800gVR4cCwgCOqIx22a0MTu3D4xw=; b=UkXol3GoPN/jHl6u1gmhz
	33F50T5llFu+slQMhyqn4RO4LtsdmXIUrmj1I8Utpe5haJ3QSC3F2OKJT81dRyyY
	j3/W09wFHlsLIbYFMfamcEnU9svC8VLeRfYmV1UccEaJIwZSK/kY0GneRJYtIPrn
	25LKkNI6nAmbFHRKbKNdPk46i16CM4Q9Th2A154x+2627JHJqcKydM1gMS9Hxcnn
	d3XHY7qO/Pzyh/lLlKoGHzHlaozZSftomC1sOrAnO78p2EyV2fMG2Yrg2rGs3865
	Lt8zy/UAj8XuzJA4o1WQbIM4wqWDFZHhREiLRBH/W7ZoW4HYbxMbDuALhm4rdXMQ
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4ggcx2umsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 03:25:09 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6887P89P039603
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Sep 2026 03:25:08 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 8 Sep 2026 03:25:08 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 8 Sep 2026 03:25:08 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 8 Sep 2026 03:25:07 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.59])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6887Ot8e016290;
	Tue, 8 Sep 2026 03:25:04 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Tue, 8 Sep 2026 09:24:53 +0200
Subject: [PATCH v7 2/3] gpio: regmap: Add optional runtime PM support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260908-ad7768-gpio-v7-2-52ee6ef18a1e@analog.com>
References: <20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com>
In-Reply-To: <20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Jonathan Cameron
	<jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "Janani
 Sunil" <jananisunil.dev@gmail.com>,
        Janani Sunil <janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788852295; l=6988;
 i=janani.sunil@analog.com; s=20260903; h=from:subject:message-id;
 bh=Rvho5R3p9z34bElAQ63YqEnhP+/R0Fnn9h0VmL/Pxto=;
 b=Ifh6sl8DSXpqA5RlsCv9V0GjZlbWtGf0JWcCg8sRtXhqCtmRwUbsDihHADrO5ojWZmoGaahBN
 PziOT1SNxHoAWkhvVRLyPxW8lvTFJxenyjQRg2COXYofKervZpLOHRv
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=0UJo4rLJeMHBMco/+wcMHzXI7nV8k1T72+XQlBNV4Rw=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfXxFoavjpZOKjS
 4G0aY3y3WNHf9E7FwflysK890W+0RmWWnn42dLs5CMGwubg4hKit/WnDPlUwTBEYYQzrOg3pt0D
 9EjIITvx80qcP9L9NQWvgl49pbS/XlslveX2lV3+8KtsEBrf0ViK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfXzOHhdIVkRThG
 Hc1y/m0O9Prjdgt9ZBQA3WlyyAhtVlsIN7CJmyw3i8kVUFRP0MUD6zx7BWqLSrqvpcNjfgYy4hs
 xcUaJCV7jJ5F2EIS0Q3WRvVgx0Oik3FurFGEGMyvhxEcToElOdKYQRwCTCQYn54sVeG8TRz9lic
 gKtb3/NkKPyePG5tEmGx8Jxw8mB3NfGi5fL/SwH0Un0/SwF6Sw1SQCw1jQONmmDI9V5MXP7c7NX
 MxksCU5l1aG3vtBmmac2fQcF6jwiZ0MN7ECQ/W2JpU1Q9UhuWNavwxxyLPN06JIjlKciuCpRbNg
 0VK1Us4kPJRgBWa8dZcuQK8GvcoVaM6pDjEF6wt8CrnGJUc0i9PkEu7CR0Qs59rvKLlBkVpaT3w
 1xVUXGXr3d9XBugwD6KWI23V4CXaXwNQK3bb4aHJZTmdbDIzDmIH8puRMii5zCERRYKjpTqlTxN
 E+FuUqphLL3bU3Q1IoQ==
X-Proofpoint-ORIG-GUID: 89zivAWlAncqtVU5LO7yV2fX1WUTgmiq
X-Proofpoint-GUID: 89zivAWlAncqtVU5LO7yV2fX1WUTgmiq
X-Authority-Analysis: v=2.4 cv=SOdykuvH c=1 sm=1 tr=0 ts=6a9fb855 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=3fJ8ZLtifNgCll64qzMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080076

Some gpio-regmap consumers share their regmap with a parent device that
may be runtime suspended. GPIO register accesses must resume that device
first.

Add an optional pm_dev field and acquire it before register translation
or access. Release it using runtime autosuspend after each operation.
Keep the device active across the complete direction-output sequence and
propagate failure when setting the initial output value.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
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

