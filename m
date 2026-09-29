Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A0345725
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685141; cv=none; b=tOXPJm9P9GNEKo+JY2Jg8reA8gzaQybr3VsVrBj6DOtAAFr1WzNTOSRnnWSzSO37UeirHG18EkIwwUkCuaRsPC+kep0WfsVSog+csdY4/yOyxCQ62yL6mT4CnJemhsKbnZ2x/OxoBUz+uOfTJuBRmAG+a7yGuu+wKFO9HIv7UPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685141; c=relaxed/simple;
	bh=yy7Pib9Ot3rjpbb81T81P2yualDkr9btrCVtiyjdhb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gufZHYgcOheFyI9D/c2O149Q92fIo1X+GeDhII9Jtz2IZz7+BKmlV7Igy8tSbYwM68E6+HeAzMmtpOuoD9C4+LNUVu59B/RygcM3rq2DaXb1UUznus46u6mG9pZjq9GEiv4hxWzs0MUbjNm3llNbdoAcq9TBLRD1J7VeDLOmLJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGVW64ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDn0usw5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGVW64ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDn0usw5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCEnk44066684
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1l6qHI+GEmzSB7BiAtUswOtZV3l54Q989xT5IOSPZw=; b=ZGVW64ha53PsZJNi
	qKe2cJLotDwLrYtKP6cvmEgSlBnX7U+VbRUb4orvJYilEt0HraIfrT9pZHhwZw1J
	AyS6xAjAg5q6oF1w2BskOLdB8PY+PAR2f6gJ/DE5/MvEYdk668sDonaVy5S0IIBR
	cjOvRxJCl8dHZDWtrV0PcNzLaG0XEmFm1cu8Bo7+227QoKRGkO6p6vkI9GUHdVd/
	Ykkotng+6O/7Ttk0frm8ri3ARAUW8rY+rEd8QxrmR2SLFJGZV5LyhwUKDiqdEbPG
	fbz/6SyfLKWYnhyVnVj3yzIW3T5Zt2ad71aMEUVjEaHGZ13TupGCWHV7/bQSRwJ7
	o/2qfg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc0ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:32:18 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988be118d98so154138241.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790685137; x=1791289937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1l6qHI+GEmzSB7BiAtUswOtZV3l54Q989xT5IOSPZw=;
        b=cDn0usw5lTB4dXvWrfed3YuSnu/+Z3HMR9/70gGJ6SK7EoY3do8/Nx2OOlPFy2Ibc3
         obSKHUQV4TEXGcUSGA0AIAFNEf5sq64AVNS83gYJwK8Jr6S6LmnlRx1lg/gXcY9JiJfu
         XVTaLxRFIT+hqylB+LXdQmtSbtmWMxK+RtcHMMWIOhuXXSSyzEUSZY/QTUMkLtQBbqq5
         NKl5uBInlZnvs720YyFRLqRRu7mELQ1VfX0zQsTm+JQko7eCNHF0fZMuuoCDdGaODjrl
         Qx5SIYyxXKVAbYgAEibTaN/0qIqH/UKHWIGO9C6P3S1a82/AP7u7ukvkZ1nanG64xgvD
         1EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685137; x=1791289937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1l6qHI+GEmzSB7BiAtUswOtZV3l54Q989xT5IOSPZw=;
        b=PjzIqZR6c4nNFNnT89yHjNv9syhHoGCaDePBAUpw8C69Jtc1CRwjsoZ2BRn9C3fBoM
         e95EDr3GJ49Xj5E75ROYzsYk6Ap3QP6CY5iwQ9qNxzJ+YrMjLAw17jTixPP+wPCQdLf4
         LJkG0zVtkSeqHfw0fyDfCfEzePIHHvA+Q1q58koYpCmLlZZimx/JNyBDuRRjIJJ/nQZL
         HRlQsAPYl+VWDDUMPWadNQujv+p8kr1QMyjQ7niHwV+1rzsnQ9ih9nUGEMfxRy+SaTVk
         lsQFNFvZQcpdAzRBADZCtUdbUyqqJ0yreKzbND4neOHeiDCpl5B7GbOWYnq2yk16JVRS
         U6Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzjl3YNY9OdcIp/mxRnMyLsPbOO15os90azJQrkXJS7Hi8aAdSD0n/4v+xeAyfFDozF9Nel81zG5jS3@vger.kernel.org
X-Gm-Message-State: AFq9FYLquPO4zV/3gPxnwEBvnrRbgd0DsGnWVgIg1BL9M6sQSXj8QD4G
	t2dlUkwvqRwfz+uVLwNxUFmKQMDPGUU+amy5uQz3WWFTmnNE+PPv7/pMiAiLkfP/KYNOf8pHRLI
	KoHYccXsvW1ufhcYq/47n7/n6TGjyRCecP6BrANqpzcCrSsRuW/UQLRcdfiyGHPzQ
X-Gm-Gg: AYBFou1gAEyVyckLNEqvCIBFuOjl55B7nePGeISeamno+JLJUTP5QW4IkZoijUc6PZI
	AXZ3uaDWXN4jEAC2WHZUdeQC6LDiD09Sypi3GGxHTR0m7rJxnVt/C4b/TZ/iR/RSfrD9N4kY9U6
	sLB8coWb4Q4eiMIGzz/8hd87rmKMBJ6kjL90Kb+bZC8J3Dxc65SP4Zn1Rrjlx7/ovRs04bKZ0xU
	Dr9Lb3BviXuRmZNb6gmXkgVdVXDVM64cHP9BdhvW8MMD1vSYTVgnibg/2Lq5EtNzliargqLxHL/
	yjUq3RZwtPMKvnJ6Xyl3eoxXcC+vrF27XjdA42HJZDNtq57kwPuUSMDJpejonbbIT2PWJgO9RWY
	4RewC2CdoLyj+ZfbxSy7Z5qfFopFjyg==
X-Received: by 2002:a05:6102:4b10:b0:7a8:15ba:c509 with SMTP id ada2fe7eead31-7af1c99c07dmr5073496137.1.1790685137444;
        Tue, 29 Sep 2026 05:32:17 -0700 (PDT)
X-Received: by 2002:a05:6102:4b10:b0:7a8:15ba:c509 with SMTP id ada2fe7eead31-7af1c99c07dmr5073484137.1.1790685136650;
        Tue, 29 Sep 2026 05:32:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1e:67:47fe:12a5:a874:db1a:dab9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm79190355e9.11.2026.09.29.05.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:32:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:32:03 +0200
Subject: [PATCH 1/2] gpio: shared: fix use-after-free bug when adding
 shared proxies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-gpio-shared-fwnode-lookup-v1-1-57d54811de1a@oss.qualcomm.com>
References: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
In-Reply-To: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yy7Pib9Ot3rjpbb81T81P2yualDkr9btrCVtiyjdhb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqu6/KKPm878XNDCTnNFpGOUUcZmHlaf3N1KVe7
 BedR6oLWbeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaruvygAKCRAFnS7L/zaE
 wxc/D/4xy/R6QzFl7eS8c/Ql2wjUwJmyWNPvYnfVtWKQEwHFkaqGWZQqf4hD8o4xBrRSz2K4tZk
 WHTmslLUkGYffNz8daJ4w7opK47PHgI9LF4EwNBLIV1+Gch513ELwO+NOKyPOOlhc1jKW71zwef
 AYhn0jCxpIGzXMWqqznn/g82O/z9cgTFiEKaelWvkbZoK4ilfD3WeZfd94hH5mUYUDFjC9pmZcf
 AVzAhnzaIHwNfuPwekvwbwTlNIr0RZ6BpuQ1RVW3QNOxv3zhuLgg5ZiExfgpXXcQCBeOUlhn5DJ
 7MR+7eMUADf1g4+8L4JR4PfEMeNL2HDp5XvD+cTJP0l6bnnhhXAsKNFAbHzaRJnNI0pqaeT3got
 HFolREEHUgT9PZ2WA8UAMd16KeflXCKih6rDQ2xH48sKQmx+mPWfZ+Edw1dHIb5Pooxq7/wjXcz
 h2ZpvrGP75VoLkAwJ5yBUJkutcTSzTayBIGVN4+7hZUF6MJif5A2QE0NjJHtg+b/nOsesGPboB1
 hTkcFPEdCJrdWfCDkkVM9B6IVMiBp+WiM0BNHYSp7vM1E+o5EFBTc/rfm2v1sHtCpiIAQ4pxAZu
 qvdpagWJQWfzvXEuTpPIpQdd6+FY5Vv1jGdFZvfoeUHe9yW1PwnjRXad8zaizFsyDHyCeDnmGMG
 96TnPeRfFt9z3fA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: sP9pfTHLbwp8AJcHm3lbv8kHLZ-uO4jY
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbafd3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KwuEG1lCUIphvGhCtYAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX7zi0nA1Rq/bX
 RxZxUJfcg8itPe5DrOOCN76JbKvUyQAh9rQSVJMizVXUFvCjMB5aXqn5wIEkhwtdIwxxX0XuEGO
 RRv7k45itepOi0PmmrsygEHJ/GrKBTbpD/0bklFf0bvKYu88pjFSqJPze/XFLyYwASNiTCpRnw8
 yF63Sq2MMpHbOrnzQ9adFthEsfme5VGOhUH7BV+5obDHEgcughDHiroRQXT6JMsvBmPJmV6IvLR
 fDPILsJEff185cUlvjGO89/djA8Q4vdkk5loiLYZX/G6kP7LzlIbnQyRm6bx1QP1JUvVHcpxCQn
 BtQtqB9+XwxGRrnkhCuxlObCsusKoEbY4bHRVsuXywuUCqzDK/K+BS49fRHojgDCD2OQubd/xRi
 wAGAjpKhxy0GjRJxjV7KV3w574yBo6FPOL88lg62+EIpFuOUQCdWukIJSLo6bsLt9w+V2gswkg6
 Uwg/QhCvFbwQ4uLZmjQ==
X-Proofpoint-GUID: sP9pfTHLbwp8AJcHm3lbv8kHLZ-uO4jY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX7D5Qz1u4QbDa
 kuf1Tt3PAHMRBOU4URqaRVY8P3iZQ81fk2BmIeWOuZe/x/N8A25BnH1iSV35Ev/UFuQEYm5AWRr
 +rQ75yRq0xl1vf8w2Q0/ZTZCwcNk7jw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049

The GPIO lookup table can stay alive for longer than the kobject whose
name string's address we're assigning to lookup->dev_id. Fix a potential
UAF by duplicating the string.

Assisted-by: LLM
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

