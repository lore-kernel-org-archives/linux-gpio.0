Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D6B318EC4;
	Tue,  8 Sep 2026 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852312; cv=none; b=ujNlOCrXPOaxPaS6GRnEcD7DZRgDBK9TR3BjqVr+6W1M99yjjX7Kd5NS1PPHBZeWsJqVyN/nLSo7oCOhckpX9l5cyhF75Oy/5Z9qmgi57nLV9zcgIbIkTuizG/jfEkcmfIRRFwrPUEzebx2Q3WkLg/Ugim+1Xjvvy23rUYD7akU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852312; c=relaxed/simple;
	bh=SUPdCQ9y6smqEBkTRXfO7L9iuHWsQz6QNl0nLGK1rLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sqvg607lk9ZOz+py99DNF/OjCRPIkU2+v7+dTNhTXhiWLpuT4mtPhptEgtIfsnFhUV2EzEsjOhLbE3AnaOff6qn5UzWvva5PSM8vTpvjF7tb56jRKAlFOu6sWjnUzrWZWw5VVo+OXjNJ/x/LTDRP0/hRuX9oJ7KCo4UvUu+jccM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jSIBi+/U; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jSIBi+/U"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886QZwR2130664;
	Tue, 8 Sep 2026 03:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SO2Eh
	qdXVuyjFuYaaFeApvFrp1DvhV3lKMVL+nf3JeU=; b=jSIBi+/UhBbTVqt0WFAHK
	rSzjCcnkd3IvsvdN0d3JAJgEYXOYMCfLhmCZgzKMVq3JTEi6BEIk5hXepEwoQg6I
	OHZj2L+6w7QiioJBLMGVgEn0z2P3O7ce3KTHE+v+vD9M2TXpVZMhC9hdnTqFUxK8
	YrLmoc5yOBk+jZg402uj/zl2uv3avYWRJ9yVh3mJW99lTkjRX7nCXncthZ11NRS/
	oX09/JXxxoGdlwq+A9uK1P9c+cggzESy8h3hNdhlB8MOumfpsK+yD3O/olPfgYrP
	5/0aLB1AYclnDNMdp7sgvI8Q6oDWUlNS64RMaPfz1ncRH8pmBu0aA+8BkGtWtfRB
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4ggcx2ums6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 03:25:08 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6887P7ak039600
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Sep 2026 03:25:07 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 8 Sep
 2026 03:25:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 8 Sep 2026 03:25:06 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.59])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6887Ot8d016290;
	Tue, 8 Sep 2026 03:25:03 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Tue, 8 Sep 2026 09:24:52 +0200
Subject: [PATCH v7 1/3] gpio: regmap: Use regmap_test_bits() for single bit
 reads
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260908-ad7768-gpio-v7-1-52ee6ef18a1e@analog.com>
References: <20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com>
In-Reply-To: <20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788852295; l=2016;
 i=janani.sunil@analog.com; s=20260903; h=from:subject:message-id;
 bh=SUPdCQ9y6smqEBkTRXfO7L9iuHWsQz6QNl0nLGK1rLY=;
 b=4YIPWzX5ysDZ9agDbKkWwRWu0TVbM3s6UEE1j5/2uBTPZggj76EE0aQBdZZOuvAor6K2OyTof
 ge2p0ASqFYbBvEZR/89t/UdEJ0kLwBVexipPeV4vKfQLMEwAouKnQly
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=0UJo4rLJeMHBMco/+wcMHzXI7nV8k1T72+XQlBNV4Rw=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX9YePWyMk8Nui
 V8OAu5Ee/fw7LQc3Lu7liwnmV6fqVFzrdRmQ01RII/9L3KP/pDMYrTHmstwB0+0R3c675CbciOS
 kTfQ8oKvoF56aUei6Kp0bR+DN8IZu9Vdrljf7QNovKjCvhPS5bAf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX3JeEkPWkst0t
 HuJUGJWrYRR7Gw4tPeP6sMjIMzawZZtsswfxZc/LNQshBiZ+1NYWuEIj7hXYuWU3vFUhRI8udGZ
 LiLfE6YUWQDVXy3hDow7avFEFjynVz5lV1JIzWlcsLo3CkdI1zgzdjrdHjb+Gp/kFlqmbH/6+Oa
 NFAUJf5V7LWXFg87DjmxmCfCZZV9FNNYMUpb1VE0VGGQ/umIOCpfZsmk+0dAea32AdVPfroas+S
 oR+JuUMTkdDyr7QtjDvpWAs2gNd+ABoyKn9PGKDJdaxlyllbkEa9J3puGojAIYjnjv96P820Wwi
 3t7H62DHBrsKQVQmyt/rmp1mTBsOt1E9y1Dmcg7tDs+UsSnqwQD5+/n26MFalrKlqjrXjBI/bSA
 y23wMOfOszqSYBAICt7/WtIn8y35yaZUgm8Ks8u+lKeZoPM8dj1pGwApfhyo0GtVgPKwyzNFLYE
 p922l7ONVCc0o0TkIgA==
X-Proofpoint-ORIG-GUID: nwKz-WGG0OmYRkV1dWnHm3c0H5bf_Yx2
X-Proofpoint-GUID: nwKz-WGG0OmYRkV1dWnHm3c0H5bf_Yx2
X-Authority-Analysis: v=2.4 cv=SOdykuvH c=1 sm=1 tr=0 ts=6a9fb854 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=gAnH3GRIAAAA:8 a=h95pfnyYhxuxbSzySfwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080076

Use regmap_test_bits() when reading a single GPIO value from a normal
register and when reading the direction bit.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
 drivers/gpio/gpio-regmap.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index fb21396e1d02..ae6fa42b00a4 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -95,11 +95,11 @@ static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
+	if (gpio->reg_dat_base != gpio->reg_set_base)
+		return regmap_test_bits(gpio->regmap, reg, mask);
+
 	/* ensure we don't spoil any register cache with pin input values */
-	if (gpio->reg_dat_base == gpio->reg_set_base)
-		ret = regmap_read_bypassed(gpio->regmap, reg, &val);
-	else
-		ret = regmap_read(gpio->regmap, reg, &val);
+	ret = regmap_read_bypassed(gpio->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -183,7 +183,7 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 				     unsigned int offset)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
-	unsigned int base, val, reg, mask;
+	unsigned int base, reg, mask;
 	int invert, ret;
 
 	if (gpio_regmap_fixed_direction(gpio, offset)) {
@@ -212,14 +212,14 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 	if (ret)
 		return ret;
 
-	ret = regmap_read(gpio->regmap, reg, &val);
-	if (ret)
+	ret = regmap_test_bits(gpio->regmap, reg, mask);
+	if (ret < 0)
 		return ret;
 
-	if (!!(val & mask) ^ invert)
+	if (ret ^ invert)
 		return GPIO_LINE_DIRECTION_OUT;
-	else
-		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int gpio_regmap_try_direction_fixed(struct gpio_regmap *gpio,

-- 
2.43.0

