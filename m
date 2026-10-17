Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E46392C27
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 02:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205031; cv=none; b=n/gJbStQVl96yeod564T5rR4fLWJrqloYg4TRDz5zrOhLFsKMA7A1vBgbybuUzFUQVXj7SQ1SG8VHWLpLC+I4nT8L6p+aKY3qfTcVQ3LsBNPcs22eLNNdAI0xVDf+1epqV0/kF4n9665BsGYAQUeZVcFagQOyky1T2FIN0UPZgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205031; c=relaxed/simple;
	bh=T05qU3QP38O2C/gkrcm6SRVlPYdACpGqdMD1WnF8jI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDEfmdZiA4qq+2KOdWHDFBUA5PLBgikzyIMNeBBjpJhQlWJd8J1LAQ68sPSmj8mN85f0KeMt3TsmZBkMjXfpqQp06lufPWtEs7sTP91+Ko7xP2B02VUBqahSSYCw7rlTUtMRRuj1yRWAHT1WTfORhf+IixQccwaEUbYFO1kzJ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7rsUPdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNwtoc7N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7rsUPdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNwtoc7N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H2Xnqx3726179
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 02:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ApuLXzOKhLv
	eYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=; b=c7rsUPdDBlW95UGFIAPOMyK3TS2
	wd5CIPLG7EWXxibnODp7PNWgkcv6tDlFmVfPFetwY7WljcIaVm9lMEdtjYZ6iV0k
	TI9B1F8FIp4Wvx6JZtKxmnXu4d/tAablJYh4HD3O/609ZMNzoPs+6eggHSp/WTHp
	WdNQEjYCm4hV+FRdCGLn7/iIwi1dInFAmWQXeN4oA4hyO/DADQmxZYJMn7XAR0Sg
	gUetp0T3GTLa4Bxm/T5YpKMfzbobDniSh+45luO++Q+7boXgahv9Tv4JkTD7Nqfl
	Kf1Vu4WjwTIt0fjhQJSE7cq6ejVdogUj8jCEMDhBvdeNYVEBNdy6uUDe9gg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgg0j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 02:43:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so1621646eec.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 19:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792205027; x=1792809827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=HNwtoc7NCUnjo2kOwLe7+w7n75QmSgqfCd+Sex3sdLlJpeTvvVPtA9enmq2I8m4JYp
         3wYVCMpSfvDoczT/s642S9jGKeItMZKInOpqUPWZaPEaGypHYvW6JHZxtarB9rvdElSM
         uawNED9QIbXN3A46X4T+/Tkzo993Z/ZSAesXFI7PGziOhlDcQ/QPIi/cBXC3HpFxE+b9
         oCdOcgrjWbZNPbwyMtWObpcjE/VlvxL7pAZUXZyqSrcRwoMbhobN6DzHCbZLt0XfWP+c
         YOisuls+K4XpEsIJIKpfRkB4N4Ma9KnGGvSNVCCK7ON0Pb/HveshpMVipgHWy/6If7gD
         X0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205027; x=1792809827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=usytAIwPG0tgnTF3obFov8RAJR3MXE4HVJBQsuR9/DEdiIYrtzUB3xmRxCL8l6bqsJ
         wJ6iC3XMAerjMELkGcXi4ayn3DhklP2loyhMEjxAwZWbihLxFkwkCmm5RwnilxZzr1io
         UBgS549swHqKDqN2O53qDwsTZrE28i7JC2cQn10/hFI9djm+oMbq0Mb0t9jqnWUmZAIx
         sosGTdcDteK/riXTXdrn0yd81k+zvvy1ong4R4NS2e/8fjPOFPq63J4iXeHBTuSin5Ga
         bZETHmcDZg4ub0+2EJh5hItE3K30VM0z5XBf3cuuwAQ8KMtmxBnl9Z2pxy+9cBw48FsK
         QBVQ==
X-Gm-Message-State: AFq9FYLxS7V6q9yaJgp+aNhl9DfgOPIumzJcJiEgH2UchrKdJI6g72tZ
	e28+Ej8rd9z61dnPOT6XPo6lrg/haXgwEBIg5PB+Uy2jTisVSnl/vEI7umjMNU9k8Na36VIfY93
	W6Kxq4BA3KLVWqd89qrFPJk6/DpblWtjhkPapjYtRObKqIDWD6U7mL/tYtnHuw4i3
X-Gm-Gg: AYBFou0CX5iABZqhzgLVJXvV4VGN3pAHvirtqndpHPhURldOmpCJyYWKEndqeRQdHIq
	avilA6hzZuc0I2WPfdYyrYAI4BMlQm9IBads8rnN6gbLcsgW+qlVigvxi/BoAtCJStuOtGsXN01
	Orc9D3iYRtkNd2qeUM1zr+P4B3naaWUIdC88U+mHvayxxZ0fPvQjBSRh4Fr/n6xzZXEFtpdR3x5
	1kL3lLnG1vYqfDJjfQ9cV2jNPBWSLkBOyjRv1kP/2OzgvC/dURZdoxCS+8/Q1I1bKKcULn8TUrH
	w0q8Spa0LurGZVzR4AcnP6PSMccoCXU/a71FZlcXVQ9HIhTvBl+6KXDcnWRzyJuE/qsYOjsSAAE
	ARZWcGsSgODLOEN6yG4NKxJscGA+h5I2VqS0x5wiEJ64U/jS9z46mGK1l7C0=
X-Received: by 2002:a05:7300:8187:b0:351:6f5c:5d16 with SMTP id 5a478bee46e88-361a1e4e978mr2582284eec.22.1792205027418;
        Fri, 16 Oct 2026 19:43:47 -0700 (PDT)
X-Received: by 2002:a05:7300:8187:b0:351:6f5c:5d16 with SMTP id 5a478bee46e88-361a1e4e978mr2582247eec.22.1792205026737;
        Fri, 16 Oct 2026 19:43:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm13066829eec.3.2026.10.16.19.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:43:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/3] gpio: shared-proxy: Fix race between concurrent first users
Date: Sat, 17 Oct 2026 10:43:33 +0800
Message-ID: <20261017024335.1432020-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
References: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfX7OPWR04tXixV
 9OqYpGjdo9HrWMdwtFswlZ7Qgbf6HhDiQNM6Wev6DvdfjzxPBBfsdfOAEXbkUJGCRiT2Rcn4k8Y
 rgL4+3PLGHM6VfrdafWvM+E+Tjz5+Dc=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad2e0e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfX/Ybl/zHMaeFe
 p3ZOexOJQve7qcOo9Bo+WzZQVfAMCREWvwJQ7CovHrhlTdAT8GI54WYvh1DrwebWvVuvB2Fi92R
 Vf/Kq6hrtJtljCHMHNAIcH/vgtLWkmO18dQJCXzEk9lK7jhkCkBwvM0nNWc412PuD5nDrsBZF1I
 acWzBWXOThVRZu3V/ROO2dr4N7QpSAadkp6LOF5ZdjpS4A+8OYNWj/pdXZiDRdIRnr2tVRUrVCX
 EGoUn7jPNlFed53BvWIIvmJWOlhgud0Eatc0RoYXA7t51Cney7RxhoAGkHGzkIw5Zua2tHCxspD
 fOjUGrfwVwzeCGxIgRNjeXfJIXgUapZu9MlWeBYgbGvjyCx3yr6E9t/rvNBLYLTRXO6wW2UQTyx
 HP0PD23NzHaxFNF9j9I8fGZM6ysYFEgW8qBi0ETVAk8NYX+EeN3RRP+opb8hhTCHZET9GjkiGzi
 +xq3L7LmzNtj6NmOeEg==
X-Proofpoint-ORIG-GUID: tX5b06aKiMkOQ4KNI_lhGsBFHLNxh0en
X-Proofpoint-GUID: tX5b06aKiMkOQ4KNI_lhGsBFHLNxh0en
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170009

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

