Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190922;
	b=5PkPkH2M4W2hCBIZuFJoBArxcL38y/SHIiAB5QTfV9w3VYM631SCF67y1JvPrBvNFan4
	 yxcHrXuMTmFOnPtYGW6aAFlpEFJKe2a1ZZiaSv8TJntOWDx0bLyicgsVQr7B9fTRQx7iz
	 o/zzrtE/eZpp4VBJHsGotB0AdIIQmIi7QlRlLqfzkNdMo21uQNqc3l64mO459wdjVkNxm
	 bVJeT5T0e1qcPWhCBfzbl/Dxsh2PnsjP9OeoC3ahXKedbte1xiYoUhcm8FBBLCCFnjVFj
	 rY5KExech5cq4KPAqYY4T1PAtBSvqDzrlsGl3Q2/3Cdwq/Mmv0jJA8rAqZbeR1onT2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190922;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=slFFczqOpjhrvLnkcpdd8nCGnHw5b/P+7bIMt84rEyg=;
	b=EVpXNboeC95LVT3WWP+CETiKu2csl5H7/Sw4v6A5tRu/fZhJ42IuIHy33ed+SIeAI4ok
	 VPQrUjBxx1P9kVkr1ywUo42lZpEUqZDieb4s5WkpivOBIktacgw4X04OfcG0ES/RcZErR
	 ESUnf1YqYZ9jv+uxXA5tee6pv9uv8NGaTfgUpko9p1cJN0utdVrR8PEDCHDcfNgD5l6Qk
	 NnRaLkrWJXOtjXhlDNDoasKdebgY6ze/+zn/oXECfuAL/tNCaSY3w6Ay0fvlx0Evr0xtD
	 vOE6OnFHlCOHoVt4kI4CcCU6+NQZpZF2XHARK+CEEioLat1VuXBABrS9IRBFqbt1zpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPfQFMX9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b+DABC1C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC08606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC08606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPfQFMX9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b+DABC1C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeEAx1053933
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=slFFczqOpjh
	rvLnkcpdd8nCGnHw5b/P+7bIMt84rEyg=; b=BPfQFMX9t++yS6Lcit3zbvYdbTG
	h8AXXu7UY2TyT2FKO1IYAloE7HGdp0u8+yctyY6SCAU5h1emC+7TrfUTY90zsKTp
	zHEL5dLYgko+FNrFc1tuyiBB+AieJQgRGlBTqLRz7af4lelLCKRyINqQbLS+Spla
	lS4iAXUEPFmtP1yd8oq6pVAi2UcVStXtbQIbIfC/CVmbrJeJ+sr+gPxiaznUUAvC
	R+8b9oH3FgJnua72qPYdR1sQ8XjKWeEP0FX5hI7lJvFOew5ascRW127DfHzB3jV/
	yUG4xwYHu2qt/6g1BUJ21I371lN6IK80cP+r9xU958C6hdlCVqA/mETIhfA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9cuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso2186916eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190921; x=1793795721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slFFczqOpjhrvLnkcpdd8nCGnHw5b/P+7bIMt84rEyg=;
        b=b+DABC1Cl8u/i3bH40q+K81TUkoJihTDoktza9jEKgsfuWK8Pbmuv33O6SZXq1QBgj
         r1We8O4Q3cZsofTvpkXNOUzEdW9DlLhmHkpkv18QkyZ0j800vFkGY2B3huWgUG8bOhDA
         WACh/D82ntiOyLvuOpKOOkAJbYKdwSI8LKQS+sYm73Pp9Mzp9UaabB7ZukbNBgP5usrb
         g8nAX07y01i8kUEP9Lbhaz0D1L6Y3eUzctU0B2pyiX8Ubehjb/CGwYOeEkBV8y6JlId2
         MBwtO8BZvpgFEYzFwm9xX4guxsQ518DiMJ3/yxMiPw05Jr9wFHaK/dya9X9M9N6PSJns
         Milg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190921; x=1793795721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slFFczqOpjhrvLnkcpdd8nCGnHw5b/P+7bIMt84rEyg=;
        b=lrfR7/kisyG4Or9RQb9uNVSPzRNawC+CgFpKqCyY5VVwBx5ZrfPprTonRtBpDeqgwO
         msPBQ/DqTECp6LeYD08oT66vpoCUGs2hxKZpyzbjRq2wAA5uQ/1Se2TdMQ/x6gWBS+oA
         oqwobxyyN95AJ0GPqKUwhkuTHmypLSfhh/5jro1HWvs6WDoI04XjDiTv/bfQS6/JtAkf
         zW5D+terbL5SG6tWV0lYfX342L8RTvOcc/SQShvbFFmc86STs0ERdFNPpXt+6i1G1DXj
         9xSDlVY9UyaUEx1yu0iNi0CnZ/PMlrKDb5cbAGJ5XFiVwx6CZcKz2w2b5EDeapLU/mqm
         iGEw==
X-Gm-Message-State: AFq9FYJhmTV9+7A/iRQtOBBB6qV+jq8nzJkPBDnEqz5Mfj8wnqtPRkhZ
	82zAp3pX4CELLE3aaqr+9qIX0J15YCcD4CVCSi2RVTIE3k+PIjgTkh/MfSMmDBbgiUOGk1LBSjh
	4BEiv5FNnzMAv0mcNoTqzqDz0Rfs58LlpQUE4hgjRo/aulMwtBEaeqVFGm4Iz+rny
X-Gm-Gg: AYBFou1LlpJfI7AweDelmkBQxELtUidUGrshnFYQqdUvo2UtUsA+0EWwzL1V6CmLCKb
	bK3eiH6vs8udRSWEkD77PkL+kw29KIED3OkXdhsG3svL/QuS4emx/3t+Hl1DdTQjfdQWyFR7NDq
	zXfocsLyc1NNNzL3KXeeOBNneX6DVLpennzb1TMfxYCh1cvz6nPxolCokELW6NuwPI8uhMCJxYZ
	uN1YuvPg7ou96qd8DpKeaZn0zNnAYHzOhZ2oU58QhgqRFg+lptse8NxOWSEeD0oUOZo+1PaiyaU
	RvtBk1hK23XtG50VA3wpZ1ja83cpzekZslH3pvJx0VEfRlkyP7iTjxkWF6HhoW2jWnuJLrZiZib
	bUvVrL5gYb/Sf18pL1CrSy/BK5Ftgs4+6hRqP+keFjdl0UJxMju/K5sEdA1wrbvOVBh1Gr6IL7k
	kuXAn3P/SpT194DI2oh919bzOV6/TmTtEv
X-Received: by 2002:a05:7300:f3c1:b0:369:f9c4:1fda with SMTP id 5a478bee46e88-36a203e2a45mr3377355eec.27.1793190920143;
        Wed, 28 Oct 2026 05:35:20 -0700 (PDT)
X-Received: by 2002:a05:7300:f3c1:b0:369:f9c4:1fda with SMTP id 5a478bee46e88-36a203e2a45mr3377316eec.27.1793190919487;
        Wed, 28 Oct 2026 05:35:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 1/4] gpio: shared-proxy: Fix race between concurrent first users
Date: Wed, 28 Oct 2026 20:34:45 +0800
Message-ID: <20261028123448.510401-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6KjlzKskQZwQUkyqBBtofA-v1a8iTHHT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXx1YXqoMeWC7C
 +gHpvXmS76FbgW67LkrxIOyXfoGhXzwO27sigSrJh53FaJaVAGNbVf5Euq5x0jfVqMxi/Jgm+ZX
 fSl2L3fku3zJJ445j3j5sgEMl50i3CQ=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1ec09 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 6KjlzKskQZwQUkyqBBtofA-v1a8iTHHT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX5fjis1kFPkpT
 NeezPsZrYYB9znefka545Tx97ztkb19USxaIhrOayibInaaUFsO3zu/ienGVb4/o3bArFtjxEoD
 eadFHnNQNn6031UjOYkIwwL/y600xqrc8D/yfhz7ndATD1m3Dyp5GKRpnH5OsO5ytRhNKPUIdJU
 EnXJI5Ocdd3Ye9WhUa4TTvLhKVw9qzdmiYtVisGEEhJ5b6ZwgCOnYMs6s/6iwkosCmAcQCh6zmL
 S9FvaYC5hQS7AM4Q+b5qx6V77Jn0XrhUEJx2rUWZPwyMm7C/hXL3fLukVKUnEyGTdZEV+xyjT9r
 gIZlTE33KkKLqVaBzQdR3ObQCmwCQda0o+Be5KC/opuE7eLtwWheGpQpQzSDVb9OWvO1T7mYwbQ
 svRWfTFzSbqWttPpPsDVKgyW6Es2RjwZOsFVb4dc1krM/W0DFlRdntyiNGDwDnllb47GzpgRHLr
 18MnKN/YlUbsaEE7NBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

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
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 78 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..2e9ccd8a8d83 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -21,9 +21,37 @@ struct gpio_shared_proxy_data {
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
+	lockdep_assert_held(&proxy->shared_desc->mutex);
+
+	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
+}
+
+static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
+{
+	lockdep_assert_held(&proxy->shared_desc->mutex);
+
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
@@ -117,6 +145,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	proxy->shared_desc->usecnt--;
 
+	if (proxy->configured) {
+		proxy->configured = false;
+		shared_desc->cfgcnt--;
+	}
+
 	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
 		proxy->shared_desc->usecnt);
 }
@@ -131,7 +164,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt > 1) {
+	if (!gpio_shared_proxy_may_init(proxy)) {
 		if (shared_desc->cfg != cfg) {
 			dev_dbg(proxy->dev,
 				"Shared GPIO's configuration already set, accepting changes but users may conflict!!\n");
@@ -155,15 +188,21 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
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
@@ -176,6 +215,8 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		return -EPERM;
 	}
 
+	gpio_shared_proxy_mark_configured(proxy);
+
 	return 0;
 }
 
@@ -189,18 +230,20 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 
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
@@ -215,7 +258,13 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
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
@@ -230,10 +279,21 @@ static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
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

