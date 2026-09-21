Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD74973AE
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995433; cv=none; b=KYrOwsIp975kijqSw69nVgjMAUf+51IfTpMZ3hVGwnIU7tK9R4MwJ1iOaHx4/Ex/dR9HsiZw+I6EkBn9KQUJ6RkUah/99/0k+R2qnOBTa/Wif1fPfIxccK/LHcwnKptLNfPfJxK/3ay2ci0v4mDynPDMnq3GPyWWgR3Z2/8vFx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995433; c=relaxed/simple;
	bh=QfrTXcQngRNpU2ls/CDYcHleFEhM3JlCasK8Jr38Wlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q0nqXtEzi326DHb1OZGw5GrljNh1qHww+gnOk4S75rNM74MXDMP+7itXNRk+E0cBoAAB2uJ7CK2Oj9qu2vnhLs4xk0wq44lHbcSA8APECkSDkQDk9ErHtkWulFtDyK3bEzaj2zIgmlLHCyB4axTVOZcwlBGLGiCP5iU0Fk1YjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPkjx2pP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrQ8tVoa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPkjx2pP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrQ8tVoa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeEog838021
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 12:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FlIP4z8C1de8scGveD21RL
	JnymW8TYexlSqaE8cPhRQ=; b=DPkjx2pPlMtwuGX0QXt/PuWbu2cDhz8Gsf8O/Y
	mgAGv4zAkmHj7f+CtZUyDYsC3PryFRLrClfrnCHcOnFt9PT4t1QKGKI2cBK04LFd
	+JGhYZIzg9U87c7Zp3JFVQlQyjjxUIXqZEHlRHIj3A5E/RbRELOTAINqzdH0L1a6
	gs3ABp/Fxto1r8xXKpae8rXedxe71QYaM6+cSnsBY02sa/2dLCV7octzBribtJBG
	C2suBacywS7QCUxTv1xOKGPa1D3eP0l87zXMmNd+qn18wghXTVjlpS8sD2CM94Lv
	xHHPQICBEtu2ITk2ZnWLPQ7rb7abjSk6+9K/LHQ6Onyg21Tw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5hwc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 12:57:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9832d9be02fso1153072241.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995429; x=1790600229; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FlIP4z8C1de8scGveD21RLJnymW8TYexlSqaE8cPhRQ=;
        b=RrQ8tVoa/DAG45pNUX9OXUiT4Fzuu0BqVaeYg/F63E6xKtLwRkgyQvXxZanfxfvN8S
         vx/ip33KM/6S0SvKLumYFXy6j6WQylFAdjKMjXxJUv+OP2CeQxVNjEimFzH44lnMQZ0o
         XTtZ5XOWRENNCOgQQVIggywjCIqa7qHpSoLuDq/klZSdx+RVsGzfwRc2yl+9OjT9F8xk
         w7axz/jQPZLQiUk3uOuVA6VMFddh+g3HkDBq+vCHSux3EpuMyfplmoxzr3r0enAf2l6o
         hkdX0JPZnJDWCYRZ4BMaGjxZwRpWOCEc4eNs/nE8Sd3xYLfeGwG76NuaZdIqnuCgPreh
         5AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995429; x=1790600229;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FlIP4z8C1de8scGveD21RLJnymW8TYexlSqaE8cPhRQ=;
        b=hiJu2wPME2iGbpHkWHxEzVHWFaOU1XUQrGchd5w117/L6FRI12jTa+12Vj/Y6be/b7
         9YZ8rmw4hc3Ir2yXjWGP1PpSCjeaF1y1mKqoebvHkSPqMG1gqpGqLUnbyszU6LRcVdhV
         fpaUq9YGb6wsRFaOw+k6U5R3i7O0NG7irhYaNbWLcHtxgIBvLjQfjP9qEOy8RwBqDulb
         ih09Dh790AciI2GC29lEpjagfcy28NLTQ5BK5tGG/LNRRHmidJOiLoDNEMLfYxsqzOrW
         I8LrCWvl6lO5sLshGAGKyzg9sd7DVgr9kf3WG1LiFTompmnt22pxkyAbbxE79DUgCKxB
         TpAw==
X-Gm-Message-State: AFuF++kH9UQ6Xdv2GD/4SfPF1YSQSxEwApkJNALX+e0VCiCCgpELwWzU
	RsgitAjJf7zovAcTZCec4rQGa4DRJNXwSN76EEdCmT5HH3dboacdyt74JLcZFWVzMLppgeDTmLr
	meffbhfDZrV4z0WH1nxZGtlSeI3e9FNdEu6ARXdh1hCjSwjJ3klQyuJ19n/O5u64R
X-Gm-Gg: AYBFou26uEfktNl6kfQhqP4gKBbWVLNSBKsI8h1HNQ/alnAqvcB+QMENeQQ8IfB7D55
	RdkSAChEwkn9HqIH27bjaKPczcwOa5V7nkebIEYEfkBLjcXI8MBSbzXp9NLRbZkZPTZiiA7DQc9
	+Jph9L6eYlw/zQGaNS0+sli1KIcbA2n3M22QCNJMdtvO6UlUisjY7ZrSgsop7lhLrLLhUrMmhQr
	UfrAsQgDBfw6JaSXZ4gpIA2VO+OezHVTRb6k7cw4ZW+ZkWjaAeKwrNlgmu0WE/qNk1gITwkDkJZ
	wdomJAIiTm5Ia8NOkDCPm8SucTHvXg7BYzMQkJF/oxxJ7qG69aEmtmUe9vq5FeP4owSxl0zZozV
	rTJu6irVP9cQqaDKN90QTnpIYEDI=
X-Received: by 2002:a05:6102:38c7:b0:7a1:88cc:6787 with SMTP id ada2fe7eead31-7a55b951a9dmr4538094137.12.1789995429332;
        Mon, 21 Sep 2026 05:57:09 -0700 (PDT)
X-Received: by 2002:a05:6102:38c7:b0:7a1:88cc:6787 with SMTP id ada2fe7eead31-7a55b951a9dmr4538073137.12.1789995428850;
        Mon, 21 Sep 2026 05:57:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35239469sm302965966b.6.2026.09.21.05.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:57:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:56:58 +0200
Subject: [PATCH v2] gpio: cdev: fix kernel stack leak to user-space in
 error path
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-gpio-cdev-stack-leak-fixes-v2-1-3307c4320352@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJkpsWoC/42NzQ6CMBCEX8Xs2SW0QWg9+R6GQykrNPwUu9hoC
 O9u5Qm8TPLNZGY2YAqOGK6nDQJFx87PCeT5BLY3c0fo2sQgc1nmWlTYLc6jbSkir8YOOJIZ8OH
 exKgK0yotlCkphzSwBDqC1L/XiXvHqw+f4yuKn/vXbBQoUDbNRapKU6HtzTNnz5cZrZ+mLAnU+
 75/AfPHiSvLAAAA
X-Change-ID: 20260917-gpio-cdev-stack-leak-fixes-84ad8918a6e0
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4689;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QfrTXcQngRNpU2ls/CDYcHleFEhM3JlCasK8Jr38Wlw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSmecS6r35lxWm9qZdmzUGebrlA03CHEP7LNq
 PXeIomotgGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEpngAKCRAFnS7L/zaE
 w8khD/oCz/n0M85aRs/Ana1PyMSA+3HSQkKmDoWLAoI3Wo/s5TDr4cA2ZlyGkj/qKALfHRhf2Am
 g6fR9g24hH9aDQH1tVLUI3o1sL4GfXoJLGOoIALPn30X3i1qyMkK2pEbyE5ZO2C7Hf+WXCne/Kh
 XzHel5dy3J192Z4uOO2Nh0CASpxIib7hU1VMWPep3bZPBGgjzKVrotSB9EGBvouiO/tmrQa4R6B
 umNqhyTap4uvA6gEPzJS6iVwS6I4eO1NnM2i0Kv3cHw6SOgKwmLu50LaIju1dSz3mjM/RkWtpCK
 OILRe3ZvUqc4WA+JhBZBQrCit7lisY1Py1mQQCZ7NB3qT222ABNJf8tt7A/mh8KjQ5GeOvtjJjg
 sg4JneTJ8zUHVMLPbyKlgs5rL2kEllG3G3t7faGPOp5OeXPMbpbC4B9YRoV93Rd+LYsU8sn1kcR
 ZqC8K1ngqIIxIlND4xBKCYnXRrSyWOYoCXRgBbjTEuD/A/Jl0WoPQytn3d6IPUqZl87R2sfszED
 bS4y2QYWS4kzHbLZ7sA5LfLZ3e44tVbMZCcHB713JVHZKqqAOiNujn4JuGj2KiKL3HAt1XcWZ8b
 4AWc6uwSlN5irtQU6o8PfHpnMQx4WJqCdz+4YEUem8km6DV8BUuSkCTN4rmtg+r3Xlpjwcxxr4I
 9B1uevQ8LHc25HQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab129a5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=SbMoOReDAAAA:8
 a=1lYKK9CxXCv_yy53LZkA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=FO4_E8m0qiDe52t0p3_H:22 a=9N8DiX9at80mjW8aGMU2:22
X-Proofpoint-GUID: gqdLtCT0a0zWcb28En-uYGgUEcmEsLwJ
X-Proofpoint-ORIG-GUID: gqdLtCT0a0zWcb28En-uYGgUEcmEsLwJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXziNEMfgnXzji
 UyGYn20jNfzAO2eO3HCQvkCCcAe0Ua43m5TG8NNj9Y/COd8yGzauDhM3aEGTVGtXwyUSoWEC+jo
 zXPd2RxE2+alRO9X6AOM5mOmZq714fc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX2tw09X8CqqWS
 BP3KzXuF+6JTr1Dn0mCL2Ekfv7I3qAhidZ0dPEPlke3bVZ8VX/Dm3xOIIo1KOZOGhBytdSAn13V
 vkOI8gDuVHKp6cP64N+J9a6hawIIv8D3NyQgZKrFU2tBNjF/f0PRc9vCDWoLW6mUT1CpJyh+shP
 gmXTK68kz41meEHGomZPO5OkiAtSTS2i5dP5DGZRCb/BelEcq/xDkkN1jdTnMbzaYWiKQCRWmxu
 ILiPibaGloNRXC7DsgF5qw0ZVgHAlyU71h6D4szPiWpQfZ+5iOSNPJjFZ+1m0tkHDGRwGny5ACh
 8SYeAsq7LyOIGn24IUU5s919n83w+A5qxnnUl+vgiOt1R3BxCPa70c65mNzVqS/LRnFkypNevJ9
 CpqYnH/dG+7XAkuTDVR7qXzZ6z9s8EWJA+Y8Kb+uUScxernlsg8oNKss5cxU9AMi61PvdAkv5YC
 QXCskJjSKTbyLNLsChg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210187

If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
return immediately before zeroing the info struct we'll end up passing
to the user-space later in lineinfo_get_v1(). This may leak the kernel
stack contents. Make gpio_desc_to_lineinfo() return int so that the
-ENODEV returned on failure to acquire the guard can be propagated to
the callers.

While not strictly necessary: move the memset() before trying to acquire
the SRCU read lock too for good measure.

Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260912123529.7951-1-tzungbi%40kernel.org?part=3
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Make gpio_desc_to_lineinfo() return an integer return value so that
  the error code returned in case of a failure to acquire the guard can
  be propagated down the stack
- Link to v1: https://patch.msgid.link/20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com
---
 drivers/gpio/gpiolib-cdev.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b5da6e8566dcd777ef4e7784989b722416c07fd3..f8ef7367b8c856986237dcc3a425a7152fc2db20 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2174,18 +2174,19 @@ static void gpio_v2_line_info_changed_to_v1(
 
 #endif /* CONFIG_GPIO_CDEV_V1 */
 
-static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
-				  struct gpio_v2_line_info *info, bool atomic)
+static int gpio_desc_to_lineinfo(struct gpio_desc *desc,
+				 struct gpio_v2_line_info *info, bool atomic)
 {
 	u32 debounce_period_us;
 	unsigned long dflags;
 	const char *label;
 
+	memset(info, 0, sizeof(*info));
+
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
-		return;
+		return -ENODEV;
 
-	memset(info, 0, sizeof(*info));
 	info->offset = gpiod_hwgpio(desc);
 
 	if (desc->name)
@@ -2260,6 +2261,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 							debounce_period_us;
 		info->num_attrs++;
 	}
+
+	return 0;
 }
 
 struct gpio_chardev_data {
@@ -2311,6 +2314,7 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
 	struct gpio_desc *desc;
 	struct gpioline_info lineinfo;
 	struct gpio_v2_line_info lineinfo_v2;
+	int ret;
 
 	if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 		return -EFAULT;
@@ -2328,7 +2332,10 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
 			return -EBUSY;
 	}
 
-	gpio_desc_to_lineinfo(desc, &lineinfo_v2, false);
+	ret = gpio_desc_to_lineinfo(desc, &lineinfo_v2, false);
+	if (ret)
+		return ret;
+
 	gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
@@ -2346,6 +2353,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 {
 	struct gpio_desc *desc;
 	struct gpio_v2_line_info lineinfo;
+	int ret;
 
 	if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 		return -EFAULT;
@@ -2365,7 +2373,10 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 		if (test_and_set_bit(lineinfo.offset, cdev->watched_lines))
 			return -EBUSY;
 	}
-	gpio_desc_to_lineinfo(desc, &lineinfo, false);
+
+	ret = gpio_desc_to_lineinfo(desc, &lineinfo, false);
+	if (ret)
+		return ret;
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
 		if (watch)
@@ -2491,6 +2502,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	struct lineinfo_changed_ctx *ctx;
 	struct gpio_desc *desc = data;
 	struct file *fp;
+	int ret;
 
 	if (!test_bit(gpiod_hwgpio(desc), cdev->watched_lines))
 		return NOTIFY_DONE;
@@ -2521,7 +2533,14 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 
 	ctx->chg.event_type = action;
 	ctx->chg.timestamp_ns = ktime_get_ns();
-	gpio_desc_to_lineinfo(desc, &ctx->chg.info, true);
+
+	ret = gpio_desc_to_lineinfo(desc, &ctx->chg.info, true);
+	if (ret) {
+		fput(fp);
+		pr_err("GPIO controller that generated the line info notification was removed\n");
+		return NOTIFY_DONE;
+	}
+
 	/* Keep the GPIO device alive until we emit the event. */
 	ctx->gdev = gpio_device_get(desc->gdev);
 	ctx->cdev = cdev;

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-gpio-cdev-stack-leak-fixes-84ad8918a6e0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

