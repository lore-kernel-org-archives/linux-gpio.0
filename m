Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B913D171C
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211799; cv=none; b=N4eXwP8U7PbKYqzCIse8+36pbSC8CKpk5aTwG8ojWm+lvSeyod2uAml0bkGa3x8NGnd/coGd/M+VNi9q6L+fShJlltocGi2+taUbAld4LinuLnfm187HZarCBOzp79XryDDcmk4e/OAFYMIAXuOL98PAdHD2c3N+7uOQsCEry9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211799; c=relaxed/simple;
	bh=T05qU3QP38O2C/gkrcm6SRVlPYdACpGqdMD1WnF8jI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hp/qNZeppLGAD0pQm/JvKfa9tq01u8P8vckSc/LARlObUXMOV4v/4KEC27VHm0jzrvlzoBLtnH951BFJBamziabzJqccE9KPp+O3Au6xqR9Fc3kLRgKkv2dxdBSPhA84v3hQGJEiZLWVxZeL1F/jfCn/lnjolWmHLdrI3t4fcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+Fa2E54; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+pRFb1b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Fa2E54";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+pRFb1b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H4CduQ3683632
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ApuLXzOKhLv
	eYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=; b=O+Fa2E54y5xOUlqS72RXOq6R7x5
	9uVTSXGVvj++suz5ZwLv510fnwOgxc6jx25xhDr6F2cWzV/x2WtdShzr0v1xtKuz
	amJLLJnrNbXufAj7Abcugd70G9RMrPMxbF3bhFWCgfuvF8GUvvGNMVivA+db+W6w
	PGQ8ADNhcEGQtxRu1JMAHZTlfPAppCWS2mN+a/egXzzYwucIvlVmPjmpqz2xrwd+
	7umj/CQVDS4s26UKJft5VlTuUFlHw+m+sNdnZZcClIzvNzdnGmigUcyH4NdNkFt6
	yDiqUBAG6T06G4iwHMbDQLX3kBL6WOnT8R23vbXx5cehCSHUi4y0r+St1Dg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se01b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:36:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so3143937eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 21:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211797; x=1792816597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=H+pRFb1bJbczApsq57d3ANNf/bsc7pQfk3BsvYtm95/ay77Ipq9t/Ez9QRF2DKiMMc
         uc6o8I9eF1BEDAMIC3q+c5vHDqJfyxSXUqKfOi8yH/WypLv6v3IsG6ud7jNkbK4L0y7u
         HwmgGHmThnD4FDo2l91IxAdC1sk+FYWeL5Z52VuRucKGp2RFkl1i9RzXGXS0tAXbYzzK
         NoBdjFJ0Pn77hd7w98aSrAA4tpZMaz8L8uZUsNxZdRPHbUT50YiO6UDwYK5CCUWZ+Vry
         2qXvYBB/UmNwik+ThX/9i2uo9J8SgXvHUZrg7Qf6GrPuxvMZoC5DbbjGxZjA4HdMll8c
         eYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211797; x=1792816597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=vGyU5W5VDo5/4sBZ81rr6q+9Zg40FfrNVK0n62ULFToUO+Z58Su+9nkixHTq5Lk2aL
         FKiG82FR9bV6mKt5PQiyaMgJkPfQxR68toZbjOOO002MEKGc2TDDvIl+tuaSm4rRLFuJ
         qLgSAw6xMKOGmKvp+0aGGUzQRd5vz9Un5nZLFMWs/finaaYo6hYV/kVpRW2jmBwmAS8t
         jrMEyjinoMJyfA43j4pJz1QR0rkTep3ai8Q2t7hNhoUHFvOuCgodivXfGShNim6Srf3v
         UO+SZ/EfnuTg9guRzEXEE4DLrWjQlSwjjI0WulI+NvwRyPPex/rhXNz49WyEPlivAFCC
         JD0A==
X-Gm-Message-State: AFq9FYJFuhmP/dAXKWUKa0AAMdumCyba+ZMV1BSSDjWMS736NqpIxZxW
	/PX8HozW7KhB6bmZySjDv4VtvZQFXloOcJcx4WjfFmzHnAgpWKFOt25Y8fObPvJX7mYxRgTOnVQ
	Az+FJ5mTaHtDL17ae8OVzbHDk0NauRCa5h7Jn05KaYYzS3oTS4jsPlZ9GJT206f8Q
X-Gm-Gg: AYBFou2tqjXkyQqZTcKJcI2njtLWXmp18cEL62E/CiNe3iWDI82uVNhYGGFHyhoPX/w
	SkZZHrHUB4Lu4lvA54h650mKGbhe0G/KHMmR4evJfwupMTLmIJspm0sge25r4/1lqxDnXJJa9sm
	vWglWKhbQTgWgul3Uryuu+CdECn9dqfF/Kx09+R/Vj4PmmC0bYgANK1l5xd+CCwUJbFmC/1sqYM
	tqYquhuYcxKOgNum+jeOx9d5RMqukBE6RkHOsy+pcncq+sUqq6ipp2XXM1sqPlH3nvmTUx3m/k+
	RZdVGQhAtCBR2Cip3Gq3wRuuVOIlZb4lcHBtKX53ODqxZUwKuNK7mjnUYwdzKnqapfwuXtLkykJ
	m0fiz5d0s99JFPWIcYbG4XnBkG1+hA0810xks0n7LM4zKZy1ttNd8ZVymyn4=
X-Received: by 2002:a05:701b:458e:10b0:151:5d01:9316 with SMTP id a92af1059eb24-18512f1d08bmr2587108c88.23.1792211796696;
        Fri, 16 Oct 2026 21:36:36 -0700 (PDT)
X-Received: by 2002:a05:701b:458e:10b0:151:5d01:9316 with SMTP id a92af1059eb24-18512f1d08bmr2587074c88.23.1792211795982;
        Fri, 16 Oct 2026 21:36:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 1/4] gpio: shared-proxy: Fix race between concurrent first users
Date: Sat, 17 Oct 2026 12:36:02 +0800
Message-ID: <20261017043605.1503563-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T_v2Ac9ywjHBZB1O_GsaE5hN-HjnOFAq
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad2fb55 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: T_v2Ac9ywjHBZB1O_GsaE5hN-HjnOFAq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX02nKVDKJy+ke
 fkCuI10vgJgZ8Iqt4PvRspT/phCZ7af242hyB3T+TwcShTBefhAzG9WDMm5pwKov4dxQMvBkdeW
 WI56pZw6AAvKPgCiljDftbdxtQhFppw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfXx7Q2hczSxTht
 haLXc9VU3If61sH/8IW5aa90S9TPBzbynT+l5UBpzEbE++rtLQym3CCzJB7eTLRLtkaHR22YIHL
 i/BsqDP6UnZX55r1KUPwzQ2b0/0xa/V5sA1nzGhh1miB37eAjB5zirJjUNhEgPRouUDEb/6mIhu
 ANl1jqrYATvHb7fFwNrNjzrdQpkl5OjmB+z8t1GQnHGArgNEhG/4wR5Pwc88qmreooOeXnU6mHb
 ux7gO66HEPlu5526lPJkvBJpSawvq8xbrsWOm3I96zEwmZJ7t/kCAfqeoK5XmfP4U9b9ZdJgbpL
 PWJJwuZz+3BA0Nyn5bjBRwii0MYzJWEPwvvLXHmj4a1qv3l0kl4JiJ9tFCzQBjlTYYM3tlF2Jrp
 kTJXR9DiavTVc2zLULIJaiR9KU3vCBCZryUMLLmDhgGxyeUtBOdVcpGaXM6dAgE8K2oRFNs97yH
 CNK028EsOpUeqXlgyrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170018

The proxy lets a consumer set the line direction and reset the
default value and vote tally only when usecnt == 1, i.e. when it is
the sole requester. But request() and direction_output() take the
descriptor mutex separately. When two consumers probe concurrently,
both request the line before either configures it, both see
usecnt == 2, both fall into the shared path, read back the still
unconfigured direction (input) and fail with -EPERM.

On Nord RRD the two DAC supplies are reg-fixed-voltage regulators
sharing tlmm GPIO 41. They probe asynchronously and intermittently
both fail, leaving the codecs without supplies:

  reg-fixed-voltage regulator-3p3-dac: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -1

Requesting the line is not evidence that a consumer has claimed it.
Instead, count proxies that have actually configured the line (set its
direction or voted for a value) in a new cfgcnt, with a per-proxy
configured flag, and allow (re)initialization only while no other
proxy has done so. A consumer obtained with GPIOD_ASIS that votes via
gpiod_set_value() without ever setting the direction counts as
configured, so a later user can never reset def_val/votecnt behind its
vote. The count is dropped when the proxy frees the line.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 74 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..0d1d724a6a37 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -21,9 +21,33 @@ struct gpio_shared_proxy_data {
 	struct gpio_chip gc;
 	struct gpio_shared_desc *shared_desc;
 	struct device *dev;
+	bool configured;
 	bool voted_change;
 };
 
+/*
+ * A proxy may (re)initialize the line - set its direction and reset the
+ * default value and the vote tally - only while no other proxy has set the
+ * direction or voted for a value. Requesting the line is not enough: consumers
+ * may request concurrently, so counting requests lets every one of them
+ * conclude that it is not first.
+ */
+static bool gpio_shared_proxy_may_init(struct gpio_shared_proxy_data *proxy)
+{
+	unsigned int cfgcnt = proxy->shared_desc->cfgcnt;
+
+	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
+}
+
+static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
+{
+	if (proxy->configured)
+		return;
+
+	proxy->configured = true;
+	proxy->shared_desc->cfgcnt++;
+}
+
 static int
 gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 {
@@ -117,6 +141,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	proxy->shared_desc->usecnt--;
 
+	if (proxy->configured) {
+		proxy->configured = false;
+		shared_desc->cfgcnt--;
+	}
+
 	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
 		proxy->shared_desc->usecnt);
 }
@@ -131,7 +160,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt > 1) {
+	if (!gpio_shared_proxy_may_init(proxy)) {
 		if (shared_desc->cfg != cfg) {
 			dev_dbg(proxy->dev,
 				"Shared GPIO's configuration already set, accepting changes but users may conflict!!\n");
@@ -155,15 +184,21 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 	struct gpio_desc *desc = shared_desc->desc;
-	int dir;
+	int ret, dir;
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (gpio_shared_proxy_may_init(proxy)) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to input\n");
+			"No other user configured this shared GPIO, allowing to set direction to input\n");
 
-		return gpiod_direction_input(desc);
+		ret = gpiod_direction_input(desc);
+		if (ret)
+			return ret;
+
+		gpio_shared_proxy_mark_configured(proxy);
+
+		return 0;
 	}
 
 	dir = gpiod_get_direction(desc);
@@ -176,6 +211,8 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		return -EPERM;
 	}
 
+	gpio_shared_proxy_mark_configured(proxy);
+
 	return 0;
 }
 
@@ -189,18 +226,20 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (gpio_shared_proxy_may_init(proxy)) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
+			"No other user configured this shared GPIO, allowing to set direction to output with value '%s'\n",
 			str_high_low(value));
 
 		ret = gpiod_direction_output(desc, value);
 		if (ret)
 			return ret;
 
+		/* Only this proxy can have voted, so the tally is ours to reset */
 		shared_desc->def_val = value;
 		shared_desc->votecnt = 0;
 		proxy->voted_change = false;
+		gpio_shared_proxy_mark_configured(proxy);
 
 		return 0;
 	}
@@ -215,7 +254,13 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 		return -EPERM;
 	}
 
-	return gpio_shared_proxy_set_unlocked(proxy, value);
+	ret = gpio_shared_proxy_set_unlocked(proxy, value);
+	if (ret)
+		return ret;
+
+	gpio_shared_proxy_mark_configured(proxy);
+
+	return 0;
 }
 
 static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
@@ -230,10 +275,21 @@ static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
 					  unsigned int offset, int value)
 {
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	int ret;
 
 	guard(mutex)(&proxy->shared_desc->mutex);
 
-	return gpio_shared_proxy_set_unlocked(proxy, value);
+	/*
+	 * A GPIOD_ASIS consumer may vote without ever setting the direction;
+	 * count it as configured so a later user can't reset its vote.
+	 */
+	ret = gpio_shared_proxy_set_unlocked(proxy, value);
+	if (ret)
+		return ret;
+
+	gpio_shared_proxy_mark_configured(proxy);
+
+	return 0;
 }
 
 static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aa..ae10506b7029 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -41,6 +41,7 @@ struct gpio_shared_desc {
 	struct gpio_desc *desc;
 	unsigned long cfg;
 	unsigned int usecnt;
+	unsigned int cfgcnt;
 	unsigned int votecnt;
 	int def_val;
 	struct mutex mutex; /* serializes all proxy operations on this descriptor */
-- 
2.43.0

