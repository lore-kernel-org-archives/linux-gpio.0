Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414315293FB;
	Thu, 10 Sep 2026 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061403; cv=none; b=emHfd5X1RVTVbZOU7l5woykekGEhXxmA2YGtbF7vSnA7IwtReQs+spFjzxOFyu1uTmrdS/be/eaLF45QzlxsRhYSfDaAe3SLS+3BO6zxXlkJNc3hT9TlO4TwyngmmoZdtGLngzUo1RMsed9Mm9eH3RarsSaAAAfWh44ev29sxDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061403; c=relaxed/simple;
	bh=SUPdCQ9y6smqEBkTRXfO7L9iuHWsQz6QNl0nLGK1rLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HJctK07QVY2XFTunvq7FuwbBFcULXyLPG1hQdN2lJv0nqCAo07vkjmaSGl0y1rG6zw72DIKN8DqKerpFvrBvXk9KFr0RTQLPBnFl9Fcv3GLbMlS+G4yHbzA5Wh0ix78hkV+Xf0DFKsfwZfqOtWLTOxJD0cdcQj2fmZrJke4GKYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=agWX8DSH; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="agWX8DSH"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF8Lhd095017;
	Thu, 10 Sep 2026 13:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SO2Eh
	qdXVuyjFuYaaFeApvFrp1DvhV3lKMVL+nf3JeU=; b=agWX8DSHRzsix+31JvB2p
	oFmOPAvW/Us6fRTPGuq1yUbOb0c3Rj+pNG67dbm3ObsMnuJOND/t0mkmuom5Otc+
	zaEtBIPEnzQyZRH7+Efrxyxg9B/kzqwKmglf0eHEXk6FC7MY8/YpsKRmScAtJvhr
	kQI9cHxb9AJqix1kxmBTezgDLGMfuDFBGZ/mR33bjGDLdjXTeuVngh9mqutWz6t7
	d5+2MMa5I4E9hDbpBbzt4R/3d8DLS4cPDIuVOSHsVmLb6sIOnbSS5xTzAp5QP8ED
	bEOr6yhSJo8vvjUdEUfX5jv6GljLbAli5yDm2PirS8zVRAvvMgktWZhRwuFCE0zv
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcxcw0rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 13:29:32 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 68AHTVZB037794
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Sep 2026 13:29:31 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 10 Sep
 2026 13:29:31 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 10 Sep 2026 13:29:31 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com ([10.32.225.204])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68AHTIdp018670;
	Thu, 10 Sep 2026 13:29:27 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 10 Sep 2026 19:29:10 +0200
Subject: [PATCH v8 1/3] gpio: regmap: Use regmap_test_bits() for single bit
 reads
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-ad7768-gpio-v8-1-6aaaa15adeb3@analog.com>
References: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com>
In-Reply-To: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789061359; l=2016;
 i=janani.sunil@analog.com; s=20260903; h=from:subject:message-id;
 bh=SUPdCQ9y6smqEBkTRXfO7L9iuHWsQz6QNl0nLGK1rLY=;
 b=Y+0kLstCd9ouo1GJvMyWf/gfwQjNxP96JYCzN/jARi++0ihz/CVtzdSIfruBhuTk5nC+YAZpB
 ksiP+x5sVLFC0HPj6ikDZBtsune4Ub+E2si/+iuAdV3CedHxSk3PnIn
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=0UJo4rLJeMHBMco/+wcMHzXI7nV8k1T72+XQlBNV4Rw=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIxNCBTYWx0ZWRfXxerk5UiByZbm
 nkP1dZtZl8WQK/LyR2pAX9XtXiyMr7odktBOXlu5/DC6gAoZX0NdhFDS83D4Ev/lDCf6WuyXtKE
 8PwDgita8F23bA+sM9/ODuxBhPkJRvOdBrwvr+3u4SAHwvtQLWO1iM6julm3wC6Yfg9q3TuXZS2
 v8WaZLmTZcaas+bpvk7G9h7dB3qhn9ERDFi5ZhD6SVUj+xwvdrpuTZZIK9rr2xG5PnCwwiDnh9S
 mcbwM8NpvKVsGf4lCBXUtwzV8l52WeV2GdvX2a6q0/hogZGCjfNW6Ws0CGXolSnD7uGgDURt6YG
 F+XesKDF/LHPs5q5f2AhRcmOinrATlME7OXs/FaJLBbImHVaghQgNILUglkChMr4fFoWf60RM/o
 OPsZJjBD5LIkqSjoaD1hj299VZaJh9TssgMWvWHJMMRwztv2eyUQoYAcC9IY1TQolAZbhJP6yJJ
 2qcViy1Q/t6YjRBg4Gg==
X-Authority-Analysis: v=2.4 cv=GoTXaU1C c=1 sm=1 tr=0 ts=6aa2e8fc cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=gAnH3GRIAAAA:8 a=h95pfnyYhxuxbSzySfwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIxNCBTYWx0ZWRfX3D8eBVKWTdX2
 XljK+1/3QC0xrLstxUWyBbfp97A2Zx40RGjIrxHJLR5m+62v0VzmLFZ/jSRWoOdAR5wxLJa0iib
 Eg7g19B12w0VL0yiR7InLTpXssmTa02xFDwT+nV81fVZhZqOG8mB
X-Proofpoint-GUID: Yho0zWQM9YlGNtmUhBmRly2hITTySJup
X-Proofpoint-ORIG-GUID: Yho0zWQM9YlGNtmUhBmRly2hITTySJup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100214

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

