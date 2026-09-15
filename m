Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A6A3905F5
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436703; cv=none; b=UdAtoRsW8JdDHPAd45DVB0z4diruFlgP7rWJnL7LiMxSTeHXJ7lSTUC/PE/hEgGUtTI02anxvID+uP/qqI0AZ9UG+69YPIJEmIqmQCvZYTck8g5jorcOdD9MVV8LB159i4VkyKhiGuXZVb+PBBBZChI+KS0kCn4eKaUMv+uxZbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436703; c=relaxed/simple;
	bh=cxClLc3F7b9To+aBikoH1pXoLnHbZKhAEcLjvpWeTsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJFNQx6vh81LNWc9/5lLKjyjQEb/yt/aawrX2axSXzVVAXx9hir281l5ouir23oh1xZpqQTsywL/+YAjpIt0Xn7npBnIPWuSjB2bGC9Y+i3BKPXpeWCtqOO0p2mEMmwFy91KW3jcATCsr/SxIpLHiNcHC87+09XgU+9rVW3XzLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVcy8ueA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAMYeG+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVcy8ueA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAMYeG+0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxspX688290
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NOXUuKR44XL
	Tchlp/J2XJqSJVBG1NIbxSHz7scbWsJ0=; b=SVcy8ueAHX039/L2e5gjvTML7O5
	Jw81d4yObxCi8ur1/16tCcKBwbqfDOC5ZI5DJeau6duPQ7HKA1UHFRKpuKSXdovk
	jXwrP8vaMPSIu9h05J0GTrHpYDj0G2UmBdo7oNAHg9O2xdBPrTBjimrD6kAtyRUC
	67toXKxcgMExJz7RTzm6hq6jOliwpHHqlU7UiTY5s0YbkMOTg9YXZNdoqdxHyyAj
	br1564O7tBz4tk4VdkqLPfgGfHsI9kZNrHYEHt0nZTzfDzqn2Fz8k+Jwpeg4eBql
	UNxG9mJBHZ18SkhmGzYtCvTKkYqQ9pyZQsbtfF61kFb7p3aFj2h3Ti9eo5w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergbcby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:45:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so5799647a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 18:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789436701; x=1790041501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOXUuKR44XLTchlp/J2XJqSJVBG1NIbxSHz7scbWsJ0=;
        b=WAMYeG+0wNd7fIElcyt86mTmLB19nNW0yiOiiIjAQflY41i7RK025gdKFy3PUJxdHv
         gk4kI/MoKUwYvQRr1JNEIew0T+yduPRDKgIjv37V+CatGX6BmAd1OchVlLbdz52XXyK0
         QNB9aTyOO6I/jN4ihU79BmGahneS0p2vZj+wXNgbEVfyHKexu5TmJAxdUFKTV+PlIqHE
         jX/WDelsHpkKJEdjqLoj+yQ9fFIxdboMgIcy9+K2O5ayO88+VzB8GrCpzRaTHYA2mciB
         PX19nv7QgEgnNJd3wDx5dm1YpcXYpO5JqQcChz0+MNHZbgTBY15mLAAOzziiLP0IkJpA
         fgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436701; x=1790041501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOXUuKR44XLTchlp/J2XJqSJVBG1NIbxSHz7scbWsJ0=;
        b=1T5Af/pULhB7vhw+nFpyaoBXi80/uYm/kwBnkEIAwCJo9Rl6ShfKFGMflw1Roy0bAL
         AaZwyOLZqt2K/ROyb9ITHnYdw658QTBVjKk4uDIFVRV07OSU+AiqejDrMMTW0nBhF1CN
         p/Rdsl4jYXZdssKDJZFUln38gC7HoLAWGZVqWYqpiRR9UJSDn9C1+sYO8bZ+YGctKH8K
         ufb1y5uYAaD1pcNey4SlrRexU3C8eR5aVk4F9PW2L1U2sSKRY1n1eO9xgDiWBV4Xw5LF
         +W7k2QGxhlGmV6ySJlzgTukOVhjP7j+ObrFLPAIMLHylkLnL1TMcQFw17AVWsgTobWeP
         obIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy7fqnAhd5GoliUOXlnJyhxDpL2EZkObjee2ql0tjQMTbxOMt5AlQ1Prrzvj9KW+y6Zr7ZFdHUw8Pv@vger.kernel.org
X-Gm-Message-State: AFuF++kNpQejkUEPhVXO5USGMZVUjJICy6xY+n+4A1nXv+ZgIjtEosH0
	HgMstA5teJX4q6+ZFSkhgFMA75Hqn078a1kTdqgZqN7wLxpxT91TfAx1KG0osfnxsLkHG7vCL25
	mEMzsuL15hV6NjEJHn2qIpXJzsFdodHU+oV7RVCh1tt1lYTCwrhd3W0Sbf+nh1wvc
X-Gm-Gg: AYBFou1bbxiEIXqb525Af2ADfBM/AdLyWtg1rUIiEjfC0xsfFNCITfVc1GHrZvhx8/9
	K1KnXtDwfRjl9TuX7ZS5Ay2mIF4ee8940o0hcEk9j/udg9JYVM4BK2KXKu6Luim4oSJaVeaqmTp
	dn3nSHfEWu/WOw5VWM+jPvIIffiK4MXDktc79CU+wURh9pWWhsXptWnf0sf4WD5KXQh94pI+puD
	93+OeHeVGMlVYtCNi6R0T5Qvs0g+nqcSVrQoXT3JVq+vlxUXHIta3ysyW5hOuL45Is7lBYZmlS8
	WlF2ZESV0m/67w1J5w7/T6rbIIz5FRFlSwVif6dXuXlJSSfO+nreDLDNbg2wiLH4+Cmny28CClY
	5+83PeUbRkU2JbhrXHEiTZeTjzzPbCTCi3OsFU0McUwBCp9+llGKPhQ+40o3K
X-Received: by 2002:a05:6a20:3952:b0:3d8:f78a:9349 with SMTP id adf61e73a8af0-3db4064eb17mr10424776637.13.1789436700594;
        Mon, 14 Sep 2026 18:45:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:3952:b0:3d8:f78a:9349 with SMTP id adf61e73a8af0-3db4064eb17mr10424715637.13.1789436700059;
        Mon, 14 Sep 2026 18:45:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm33104723eec.28.2026.09.14.18.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:44:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] gpio: shared-proxy: track direction instead of reading it back
Date: Tue, 15 Sep 2026 09:44:46 +0800
Message-ID: <20260915014447.282121-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8a31d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pDVGNxEPf9UmUjjSLAIA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: AygqLL78RoAr1KuhmOnZwZsnSaxAZqmy
X-Proofpoint-ORIG-GUID: AygqLL78RoAr1KuhmOnZwZsnSaxAZqmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfX23ZhzXVkWkiz
 SucObv0++lV0zE5tUzKB3U8/33H02+oxYg6jDzlfGCHOdEZ+qO/bWnwWw0XgCJN1mfLB5n4Wc3P
 XCIMrjxv0sJ9B8JYvtQbzwBxRLYN3Z9MDlsGngJtvkCpfzWlNzm5MXQR+JRqv2s/1Z5UKx0AqT3
 3Kl5gHTsTcx+UZFAci+M3yFq/Tll/c6y5bCE72IJCTxrg7jcxk04QBRTYeX32285Ily+B3+i2Wc
 MnGx6p6LoPtt585dk28n4TI8CqoAbWgegosv9ic5ItRU+MUHJvwyeWgFo1atizCcwMNah1gN7t2
 v6zz5Sjk4O7SVbZP6DBXDzfgwEci8aWqO2c9xRV5xSfUkBxQRvwDUJZoEnxwTIUKVai/2lnxjYH
 3Hh1KZ5dZpqlxpJgoWzOA538PaekA9wmZuuiMXGZPQi36BrmqFQKFkm5U06g5VXVjLbrHqYUYoD
 Vz8AqHCSCy+lz/m48ZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfX6vTglcvuy/pN
 AlZgaDstJEqUi1UoG3UOCoV92oDAPeeX9xfIDJAddEpVAAba84BNSwKi6fKr6JzC1U3zpZTP9Ra
 3dIquhO9sSosiPB5HZHHnPxkxLzbgzU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150021

On boards where more than one consumer shares a Qualcomm SPMI PMIC GPIO,
all but the first consumer fail to configure the line as output:

  reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO

The first consumer takes the usecnt == 1 branch and really does set the
underlying line to output.  Later consumers instead read the direction
back with gpiod_get_direction() and refuse with -EPERM if it reports
input.  pmic_gpio_get_direction() derives the direction from the pad's
input buffer (pad->input_enabled), which pmic_gpio_direction_output()
never clears, so a pad whose input buffer is enabled at power-up reports
input forever and the proxy rejects every consumer after the first.

The readback is not needed: the proxy is the only entity configuring the
line, so it already knows which direction it asked for.  Record that in
struct gpio_shared_desc and compare against the recorded value.  Keep a
readback in the get_direction() callback for the case where no proxy has
configured the line yet, and reset the recorded direction once the last
user goes away so that the next requester establishes it again.

Assisted-by: LLM
Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 43 +++++++++++++++++++-------------
 drivers/gpio/gpiolib-shared.c    |  1 +
 drivers/gpio/gpiolib-shared.h    |  1 +
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..a8f0d08c6d9f 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -116,6 +116,8 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 	}
 
 	proxy->shared_desc->usecnt--;
+	if (!shared_desc->usecnt)
+		shared_desc->dir = -1;
 
 	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
 		proxy->shared_desc->usecnt);
@@ -155,22 +157,24 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 	struct gpio_desc *desc = shared_desc->desc;
-	int dir;
+	int ret;
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (shared_desc->usecnt == 1 || shared_desc->dir < 0) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to input\n");
+			"Setting the direction of the shared GPIO to input\n");
 
-		return gpiod_direction_input(desc);
-	}
+		ret = gpiod_direction_input(desc);
+		if (ret)
+			return ret;
 
-	dir = gpiod_get_direction(desc);
-	if (dir < 0)
-		return dir;
+		shared_desc->dir = GPIO_LINE_DIRECTION_IN;
+
+		return 0;
+	}
 
-	if (dir == GPIO_LINE_DIRECTION_OUT) {
+	if (shared_desc->dir == GPIO_LINE_DIRECTION_OUT) {
 		dev_dbg(proxy->dev,
 			"Shared GPIO's direction already set to output, refusing to change\n");
 		return -EPERM;
@@ -185,19 +189,20 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 	struct gpio_desc *desc = shared_desc->desc;
-	int ret, dir;
+	int ret;
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (shared_desc->usecnt == 1 || shared_desc->dir < 0) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
+			"Setting the direction of the shared GPIO to output with value '%s'\n",
 			str_high_low(value));
 
 		ret = gpiod_direction_output(desc, value);
 		if (ret)
 			return ret;
 
+		shared_desc->dir = GPIO_LINE_DIRECTION_OUT;
 		shared_desc->def_val = value;
 		shared_desc->votecnt = 0;
 		proxy->voted_change = false;
@@ -205,11 +210,7 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 		return 0;
 	}
 
-	dir = gpiod_get_direction(desc);
-	if (dir < 0)
-		return dir;
-
-	if (dir == GPIO_LINE_DIRECTION_IN) {
+	if (shared_desc->dir == GPIO_LINE_DIRECTION_IN) {
 		dev_dbg(proxy->dev,
 			"Shared GPIO's direction already set to input, refusing to change\n");
 		return -EPERM;
@@ -240,8 +241,14 @@ static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
 					   unsigned int offset)
 {
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+
+	guard(mutex)(&shared_desc->mutex);
+
+	if (shared_desc->dir < 0)
+		return gpiod_get_direction(shared_desc->desc);
 
-	return gpiod_get_direction(proxy->shared_desc->desc);
+	return shared_desc->dir;
 }
 
 static int gpio_shared_proxy_to_irq(struct gpio_chip *gc, unsigned int offset)
diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 5f9623e40b0f..8267b5089244 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -661,6 +661,7 @@ gpiod_shared_desc_create(struct gpio_shared_entry *entry)
 	}
 
 	shared_desc->desc = &gdev->descs[entry->offset];
+	shared_desc->dir = -1;
 	mutex_init(&shared_desc->mutex);
 
 	return shared_desc;
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aa..0ef3bc7a7916 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -43,6 +43,7 @@ struct gpio_shared_desc {
 	unsigned int usecnt;
 	unsigned int votecnt;
 	int def_val;
+	int dir; /* GPIO_LINE_DIRECTION_* as configured by the proxies, -1 if unset */
 	struct mutex mutex; /* serializes all proxy operations on this descriptor */
 };
 
-- 
2.43.0

