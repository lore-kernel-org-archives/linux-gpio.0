Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B0B49EC6E;
	Thu,  3 Sep 2026 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436921; cv=none; b=T0Dnwwa7uHef0CPnzkJzTB85ZVD480i6WM/TAJjeRZ0npNEV3pj+pXWw66SbkbaoVl6CNzItm8jYTtppQ//8lbWLIlwwJg/+9UbqYQEpZg0lgqdF1oO7Wd+mYkq6HtIPTEWwNpvXxqAeRR7fXZggMpsJIezvJY/3/YfrNAVw5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436921; c=relaxed/simple;
	bh=SUPdCQ9y6smqEBkTRXfO7L9iuHWsQz6QNl0nLGK1rLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=seCGWKZToZEmv2btAyXEDTCz2jCcjz6STbr4QCeUQQyc9gjjaU2cZTkTG5NkNJvvYn79WkYVKYmklzTjYq+XOQgqChKgB22k5KcoiOPcpd0z43jjsRcqcKyFR7FVrk9BXx1Uu0iKvWuotWh9AQeKZziNzblZdOsYY9tY7pHRB6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=c7a3kP+S; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="c7a3kP+S"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AKnXG1310658;
	Thu, 3 Sep 2026 08:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SO2Eh
	qdXVuyjFuYaaFeApvFrp1DvhV3lKMVL+nf3JeU=; b=c7a3kP+SC8SMQoVE59BR/
	W1L/3QeBuc2Q7MXeLOHuZt9UnmU+iZ+7mexJs6HcaJcfWwLWl0BgnfOgG3Zl2qs9
	nrVAKxK7nzR/gXchnDo50h2eCvPbBgVjIV5Pc8tlSk+rLlNbuWM2LUmxOCvWzRpV
	gpNURGFL39cDin5krIq9Uo4mM2IWeduTHxFz8zMLmYRiena1hdlUZm2lMKQHUzMs
	et2sYkjsZh9+l124CkQd8mtSxAH6TATXoc4pKNCwSbWBl4is6Rx7fSzb2+5GjJBq
	vE5lti28jNxxI/oDTfZN0ExtWQ92oSgJJyU8R8RiCoBhB1xR33yqpPHMBgqKaS3K
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4ge0yqt1te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 08:01:54 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 683C1rp7003604
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Sep 2026 08:01:53 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 3 Sep 2026 08:01:53 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 3 Sep 2026 08:01:52 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 3 Sep 2026 08:01:52 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com ([10.32.225.204])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 683C1eKo016937;
	Thu, 3 Sep 2026 08:01:48 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 3 Sep 2026 14:01:26 +0200
Subject: [PATCH v6 1/3] gpio: regmap: Use regmap_test_bits() for single bit
 reads
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260903-ad7768-gpio-v6-1-4254ef6c9b38@analog.com>
References: <20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com>
In-Reply-To: <20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788436900; l=2016;
 i=janani.sunil@analog.com; s=20260903; h=from:subject:message-id;
 bh=SUPdCQ9y6smqEBkTRXfO7L9iuHWsQz6QNl0nLGK1rLY=;
 b=Tnf8dQOoZo9x3b92YnP6RGAEV4ldyUG0cl08yeOxzJ3nIECfjy8Z+B1lURPWqWDi2kJwb8tID
 oC4X+r+P4BoAL9cd3/EqgCeQ53zz/q8MldSTar5WAJVuHijlq2ytPie
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=0UJo4rLJeMHBMco/+wcMHzXI7nV8k1T72+XQlBNV4Rw=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: cW_QZ2Sm5Sd9qTOGbcsFP-YcdK0OvPm6
X-Authority-Analysis: v=2.4 cv=S93pBosP c=1 sm=1 tr=0 ts=6a9961b2 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=gAnH3GRIAAAA:8 a=h95pfnyYhxuxbSzySfwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXyKaGOu4j/CcI
 p9JKR2A94ybGJyt6uk4D3tK5mmww7y7MWKZMZ0d+cOu44LPRDYbgsianpVk0XX8CV0EgYqRFDb2
 o6etXkHfQL99X6czInHOH+mes8nyjkguSfyaiztnwV6y1a6qZMHdaIc6Ie84cJb9iC+pnkFiNmU
 dBuHGHxQwmTtUSbmT4q64yLAlyaAbOGqFH1OeO75qCg6IQ5Yp2ohnZwSJB1nKNZr2xE4c1fHhcy
 0M4w43oV3Ba0Hd+NaKShViekRn5B4V1xJdJT2+nsqbn/i3FvX91SjT8Ije2dOkDl0w+n4gntC1b
 Dbsj2ztCELqAUPbl41xMrMEhcE3nzqIq9Mn+tuW3QUhQWVoBM4mejcRfWoI1Ii1M6qo1Cijk+WB
 N3tlc7qJjGtFjCy2vis7Wmgs1KoDnk/Sk5Df844+UW+QVldIo7dSYYrAZbbvNtEWLfZENyALEXY
 TWmCjGfDiImgKa8/vTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX/TKrOpzq7t2r
 A7KQYRQsci1H0aO2spUdg6bMF90EvG3+aZu5neYd9Ivi5NrTZgYpYQl/b9weJiQondsO5TRJ9hv
 dpPcN/k9wxizjRmrhvs3nShLKl/hxbD6qox/XSd8PutMV7lsHLB5
X-Proofpoint-ORIG-GUID: cW_QZ2Sm5Sd9qTOGbcsFP-YcdK0OvPm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030104

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

