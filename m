Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2F64FB9CE
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970729; cv=none; b=hzjHCvKqZ3GIKvd7wK7zqRVOcpWugyJybMdHE3JsMovrG+48bgotMws4HrvHtrOVh2hS7NMAUAEE8Jz4PCzhx5uOVJViyfg+FDY34mS7VVz4J/YiaeWGYtGlTJYfb3RGhd3lLltN++1MvqCQ/ZjIIL9d37TIHanSBvG5ZEGMTt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970729; c=relaxed/simple;
	bh=wxx33mbHAocw6OfeRFru/mTRHPPabfv9Mi3TkUFDJ94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lt3fXMOO2V49YDJFayShgrDbsQs9Ev+7BgSi5/0VnP/BjrqkFAKpSZnQXpripuxRPHz4FebPFWe7DYTFIzgdXKP0GQePAimLcFMXX1QaBb1sGynru58tn5AfrpQnAlJCr/dArdBERZptqNHabe8UB3H5da/PKPvN1IQYgAVLkKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ602C+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZYxY3Vn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ602C+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZYxY3Vn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4Nl4E806619
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uD+Y8zqy9qF2/F+qvk+d3eryZB2TLW67qA34KHqZjsA=; b=IJ602C+2Xc0Q4mBP
	D1l6jOkjhzgY0KAq7tcXgCfZ0IOFaKaXzv5gVdQ6CPtZkx9bZ+es+I0SIPcW0CAB
	N/0pgnou41caTHEeSYzPmC86Qs0TLTM68EY/xPpuZsGBvYgD5/e7U0iNqMZ9QYrR
	pcXzMUdqyUXIixmJKAwoHOoEuxydfjpANXnO3D6hT/xR5a2e6A2qfC0+MJ7X4/hh
	m9kFmIcviIyQ+Pb1CfkeEF8odgZCMWFbPdtuAofsvqXDaobwARKWhJw7OS6nv1hv
	AybmE+ZKwT8H60L2l4Vdd2HeFBv4fumqxCGXgx6ob7kUmGkRi2T5ezeqiqUu7Y5X
	d6uECQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6asj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:38:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf4c0af4eso140849585a.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791970725; x=1792575525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uD+Y8zqy9qF2/F+qvk+d3eryZB2TLW67qA34KHqZjsA=;
        b=CZYxY3Vng/9W1ngERpSUanbUtstjUzVmOdR4INkUrT0/3KAa+QkaD5J4ueN6jApO3g
         ueKoN7cnUOyzy3atZnUBnxbnThpt0gA4IhbeF5eGQCdgIIlqPKwRXH7qiMqpO9yyE94z
         es3Y+DQKliiItK+6Qmc3E6DF/eBCr96F8TD1GtgwkAaK68CpuuIIZgwFisVnz8CSs8BA
         9CpgeuIxEdFi+ZIm8SU7BbEreaKkRN2TQJFlEQqsIJ1VaC7eRgqiRrLVThP9f+0rYxTg
         +LbfBP4YPABCeK8N8+37KKUNoYvsmg/qDSWuvcdbwfcBn02GXsGkyZQhQmUPEYDDp+Yg
         W1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970725; x=1792575525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uD+Y8zqy9qF2/F+qvk+d3eryZB2TLW67qA34KHqZjsA=;
        b=A/0TvNSkceQrIxuxrHOWbh8XhhN20M7N+KHzZ7BTgwG453pQv2s9eoMrF0H6QD4k5v
         KHl/09cMEP0KCfIBockHpY8EVzKBzyamXea0gcYo2s0jYRo8iRO1d1GB0j39g+PnAhdW
         /nF0bqcMw+24+yYTRXI3HOlkAkMf8y4D41d9EobKszAQhaOIeMJ38i4/hWnMksHKL0jy
         rrOsBXPpSx9qjOrucEh+czz8Fw65UTtJrDeyz7gUAcPxT7h3vjsmnpajPh8PSD4JSw9W
         W0Q+zsyM2cwc+ljpH1q5v+YwSr1LMDHNvYAb4xcDOGx+fC81Q7VbKz4fBdVd6TuT270p
         Pyeg==
X-Forwarded-Encrypted: i=1; AKwUvBwp/FUzlsBzbcnlBnscqGSkLPv9rhZLeRigiCsQHnZv+QRus85fgg08a1TOBAjlCYUMpifwLH/OAnZL@vger.kernel.org
X-Gm-Message-State: AFq9FYKbXpcUFUR92NQN1DE4HtMkEpaJahEWQ2jf+89paWoChJ7SX3Kd
	y06SwJwkW66Lf9DhghOYR0PpUow+WkOk/qWHUkOXkY3htYiiuHMI8PNBKiDiHfXVI7neks4nUXh
	gsA2gtQt4fmrH/DM+BcYnLX0xsVy5yD1R5vFMmmH//QA3aA5c9BJme+WR7BmkGdsS
X-Gm-Gg: AYBFou1Av2/ZAovQNMLvIBe7ulhrrFIsrfxHlWLaUwAoS+goeN0EMjEUz6/wBSB+FTk
	7m7ZuOGoGg20BN8SRVaiXfsgqaZoYjYVxd5k6EWygWahjNLFP8OqsmUIoaqlYi/PM+qyaq/H6Uf
	rR2oD2/F5FZcBY1qWQLacI9Yjy1E9BURR0L1yJewCouYmyyoMWs4ad+IXKC/z52O1ZAV8jDD0Wm
	jahhKrqVk5xcD64SkT5Fj4b1Mi0fA+6467IjgdDURo3391qZXboZyf59mv/DnPwV8CrtoAkDqPL
	AdnopJhb0ZerR7se/1okzoVmGciogEZAV2mccQCbmr/Y3OA8LQLW8sAxrpS8ATT0WxMRNhIn4YD
	Cq7LpI8OUMP/d6+kYFLFoyh1xhbfM
X-Received: by 2002:a05:620a:8810:b0:93e:787e:bd72 with SMTP id af79cd13be357-93eb969fafdmr2394630885a.35.1791970725022;
        Wed, 14 Oct 2026 02:38:45 -0700 (PDT)
X-Received: by 2002:a05:620a:8810:b0:93e:787e:bd72 with SMTP id af79cd13be357-93eb969fafdmr2394628985a.35.1791970724607;
        Wed, 14 Oct 2026 02:38:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4b9ea1csm19510655e9.3.2026.10.14.02.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:38:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:38:25 +0200
Subject: [PATCH v4 1/4] gpio: shared: fix use-after-free bug when adding
 shared proxies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-gpio-shared-fwnode-lookup-v4-1-2253ad645fd6@oss.qualcomm.com>
References: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
In-Reply-To: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2161;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wxx33mbHAocw6OfeRFru/mTRHPPabfv9Mi3TkUFDJ94=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz02c4ki8ArSu2K42mMrGl6IpVTxg7yInVhMQX
 jiu66KOLfaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas9NnAAKCRAFnS7L/zaE
 w864D/4yMaU3Ah2I9Cl4p+rc8lt1hzrrii6M301OCyXVpu+2aNotF5TWiNz0rykwQ9B9uAIfnn7
 KdePLiqwCEkrAahXmvj+hZoXqvdOM6I337tcXLNp6aCAKYUdyHEtAptP0qOBGD7vi/L/zoU2HKz
 /Y6IOxZ9Hh2OgMqNx8KNtAffybicE8ULlw9sUNMh4D1fxsqgD6yN0dfAjbUyZbI3EmFMG+jgfID
 Au1Mz8GO1FEOY1SOzcCVT/70aFxINbDUaW+waIQshmNLLp6BaNB3QZIfraiEK6itty2+io1nNng
 c7LXG7W5m2gGcn0vmP5yIONOEQCJxV8D69kUw/ivJ41Z7Lw6YmKJaBE0CuMKxHTSE3LaVKi9fpS
 WW3Fkj7oFq8NV86JS7GmjDEa7zHLmuWWx80tQpeKylgGJt0sKK4x/EfqA6A9Hb09JQC5qQ5vcFx
 qVAo4ZNrKHuvN4k0B2B21+riEWIiNwBRVOstKs9H/hLe6nLpb4VnK1zeZOAjFA6NcLqjp/Fyl9T
 FyLLZcjJpng1gTrpSh+Qhzf8iCOvxQZ1I8S3VKUn15ruIRP6FZRxxC6EO/A+stwMumF1MWGCzEU
 7WOCNMbpOqfu6IYTXgaH1KLIKiqzShChRuM8fa0TGpNkODIm8i7yEq3siXHBr6w5q5KEfsBxFzq
 zyvvaTgYSWKtlsw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: pKrgjIqTH2BinDiV_4NujthLnsUBXZUJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX07co6J6wwc2f
 Qm9EGxGlmOa3lMc2idB66V7PndN8sPmT7X6rP9+DP5Zx5xakMBsPG1r3J4djCpiMUWn9aGrUrw0
 w75lcXW2sRPueLtFCOCA7rwCHPesKLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX/Nb1MJyug/30
 iYH89VT9HOZfHc+i4XIM+R0GGocXChVZcl5jxf2BnETS+cKs+tLa6pCHE6lfW6B4s2ZwTlS4sBZ
 BpAN2DCZBjNAHcFvxgauAsZnqx2hn9ugefTIJlD/O8H4o49r5IO6x8rp8kbov6N+UMoU2jaEd7t
 8KhkW36pvgI8wFH5m/JcXXGEHK4DQ85n+6xSmx3wA4FMbClwerw2ue/4GBuSPsf/5jRmwRGMJ3H
 oXQYzpnf2fY4DZreMw7Fw/g6W32vsOiUZDB4Nb0zjsZ8fZUK4wfGnsEyh6mGl6+Qohi+bxqdMEC
 TiCMyiNnPzhfSV7gXHzdL4bRUyfx09RS3ctejU1EvcOOWA9nImIkmG+LZb9s5qg1OP3cofbbd1B
 RoLJkQptISMlL1gybaZD5wc4BEJaY5SZppCYKszCM9LoiQ+mKOODYLI3y7w2Ah/PQZ4ZihQIu+U
 +XrEU8TTkBvknKsFAWg==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf4da7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KwuEG1lCUIphvGhCtYAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: pKrgjIqTH2BinDiV_4NujthLnsUBXZUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140038

The GPIO lookup table can stay alive for longer than the kobject whose
name string's address we're assigning to lookup->dev_id. Fix a potential
UAF by duplicating the string.

Cc: stable@vger.kernel.org
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 5f9623e40b0fbebcf318fcfb2e75768cf6e3f313..6acfec73b73477245c7e4c593f2925efbc8980c6 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -450,7 +450,6 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 				 const char *con_id, unsigned long lflags)
 {
 	const char *dev_id = dev_name(consumer);
-	struct gpiod_lookup_table *lookup;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 
@@ -480,18 +479,22 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			if (!key)
 				return -ENOMEM;
 
-			lookup = kzalloc_flex(*lookup, table, 2);
+			struct gpiod_lookup_table *lookup __free(kfree) =
+				kzalloc_flex(*lookup, table, 2);
 			if (!lookup)
 				return -ENOMEM;
 
 			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
 				 dev_id, key, ref->con_id ?: "none");
 
-			lookup->dev_id = dev_id;
+			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
+			if (!lookup->dev_id)
+				return -ENOMEM;
+
 			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
 						       ref->con_id, lflags);
 
-			ref->lookup = lookup;
+			ref->lookup = no_free_ptr(lookup);
 			gpiod_add_lookup_table(ref->lookup);
 
 			return 0;
@@ -611,6 +614,7 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 			if (ref->lookup) {
 				gpiod_remove_lookup_table(ref->lookup);
 				kfree(ref->lookup->table[0].key);
+				kfree(ref->lookup->dev_id);
 				kfree(ref->lookup);
 				ref->lookup = NULL;
 			}

-- 
2.47.3

