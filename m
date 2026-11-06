Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942935;
	b=BGeTSQrGCaLCdeCLOhO8ONMI6YsEPA8crSHNqV4inQM80/bePk01hkyHowbjF4rQK25b
	 jTroEdwjqtTvfdqclW4K7j0frMiAT3ELU3ceM/gGAVXyzcoMW1bhtSQo5S/m1eFvkslsi
	 9O3XPfpWNkJhXC3gvY2nNUr7PyU/CWRUjfTf7AHaIqiORJq1mIInHi1xxvmdxJyVeeizC
	 hv02kmWj8o8Txxc1I1foubsAli1j+jKWoUMwgCyXqeu6jSb6/I86ngdk3IoJ1cpBN47+H
	 1V5DYEp3aaHb4NC/akQ4AP2xsgpeK6MPatvQMeVmCaV3Zz5XeF+LqDy8d6FE0wUTXJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qNTx4etPaEhvGUcB4SmE/6iw99RDwa/608+1RwEVzo4=;
	b=PQGwYtModOiKKIqB/ohQqmLcuW/XX63jU5Xvc7LDMR7Q4FDj7BMyy/8iW9Rxf2hGUExZ
	 ygVIYo0xj+mDLxUJ3sFxliEwyZqKwNp1IewNAkybqsYESVuw9/gHemOjxcDUeDvfg5S7j
	 wQSd6NI7q8M41t1DT4hncC1j2QDCZLaNWUzhk3p+5u3hgr+zE3x9BLID/Zw/e6ThfJpcb
	 K0aF5Hvhu1OQlPlnko0nYD5Lowj7gjLBu6mLEAZIVulr+NpIDToOkAUXM+d3SC/NOh54+
	 /ej+Zr1R+uAwGy9i7szewpBVlvDUP6wfOVuvhQepuIKxe3+ZfPHC+vXA6IXU9XvnSQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVflznw+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/qerhsx";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E70606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 05:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E70606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVflznw+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/qerhsx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6409Sa2817606
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 05:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qNTx4etPaEhvGUcB4SmE/6iw99RDwa/608+
	1RwEVzo4=; b=WVflznw+6zv2/im0jXwmEAoahuZz7wzaQdN39eKFWnSvDNKFNtX
	bek9DV43UfAp5fVpDyfWjuPmKMiFJLQYE6YFn/CB26Zree/1sNqzv9tCp4ZUwsXJ
	2wixA8ydE7bZxsd/zoSEoaaviaSelNbiPfqBY25HiBl1LdaxymvQN4C7zxGhGDCb
	OCDn0HHhSz11Logi734Xa6ldSgl7KWce3C305u0rQfr/cKHw5CkoldJJKDuSxoYA
	sYJH1YXsdxrEpwSaEUGSRyXWEoCeDv2NOZ1K5VLmaNcA168n/a6an/ZBPNWtMJM/
	ykAwUomWdgvG6uruS0C5ZZx3CDWH1TfRp4g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa11u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:28:54 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-86c3a053d9bso3138657b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 21:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942933; x=1794547733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNTx4etPaEhvGUcB4SmE/6iw99RDwa/608+1RwEVzo4=;
        b=R/qerhsx3Z6QIckZJNB1Xs5tkJ/Pce5kPR7KUuhBXzJYH1PWWNn1Chs9hqQMvo42vb
         ubCZ+v+h6z/5HzeCxjc5pSImfpsOPifPZ0Gw2fO7jGVyj/ULooYZMb98pw3HuiNko/rt
         OuDx9DGE1zV3HqUrwg91eQTFyWvCVFY8em5g/1jQQekVyIMk1jJo3HU6cga+0/CfIzje
         2kZWfJRu83mp9OXKL2spjKHvVWZNyTL7J86C2kKDBmJqZDZJE/LuQzD93z+Cm5l/emqq
         N6XNnbMaz8nmYGede1751sa+zMqiCocwHNe6nuKQIR7WrGe3oYfNZKODhC0uk1rScm1e
         DXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942933; x=1794547733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNTx4etPaEhvGUcB4SmE/6iw99RDwa/608+1RwEVzo4=;
        b=XM6XOrYCZHzPI1DM8BYk3vGO6PcmRyxJ9R9rTACX7d3oKZ6rXZGJWGEUUp0CFP4P00
         bFKivTVYsAP3QDoeHwT9s62WuNdUvRhvoqGnKr363ne2YD+OMsXA4EGDyLifPH9IHtx2
         qrvLNxIc8P1l/WHgLTMb6JKDAmkD7N+0RCLw+Hso/uxQJ30lbGZqjfaNw33mbG8q+kzu
         IQntPlYODRuib+5OsO0HymMk3QE8JI1y7A6T+gqXSOl4o7jIMTuJox3J5QkeixNJM4T2
         his/ThduNXQk9wDCNdIz7NBAZz3xw34dSNqQrIUdyYtTvEM/T89znQ4neYie1Lr9aq7V
         /7pA==
X-Forwarded-Encrypted: i=1; AL+hErFiTVexPCnhhyg/myXvd/OxtC11WHUxJtJl2A9he6Z80sZ0D4fL4wsTy2LJzyx3IFyeSavBPAvvBg9E@vger.kernel.org
X-Gm-Message-State: APuU4Z/TO/LvOXHHYtFVslXNwDPGUnUCRnMfME4JSPHuMQgfm3Dlvr/E
	BdZcsk9YrM5RCnvmkbe6VPhq1jJZYIQe0bYRt1CHcrh55ogsoVugCbaV66CjggJTxe6r1kJ9QQk
	bPUVEdx2Jvo77PmlE/+FqIkQxWXzKSx+KZzPmWrCdct7QyABFFOYXsVvs46Pc+VGj
X-Gm-Gg: AYBFou3J1KD6rkUjV3c9iLtL8KA7fZpszSdEqYrr0Qw0dovUFfxQeCQrKz734tMSG1m
	X4NvHPZr9KzQvLl5v1lALtGf8a9Ckw90/MVIFd9kKxrdha44/rN911veWp4ybImMazuY74mxQlm
	6PzXtCFVX0dUgYQI6GNdGypP9WDIvJcYS37YqHVv4bTHj9QdfAeCOnJPNENBwAMiz2hzNKhxRAH
	+MtMrjmtH1BTYFBQEYEr5Oi20jLKr1/XF/u6qLq172WlqO3CbdwAwM44FEZjhnv9qvLqKfs57It
	/qulsHdROiaV0xK0hwZI/gCP0a90vMklt7txM2ejcoKOEdqY76KrI5lXkrl8biSlcnxGR55y9Ip
	2isP+ta1YZRZ2N3RBuXRoTDgO+XCyHeLpUU/0na3Dq/8BZ+lGEU/72euhr+4fabX3TKB6RH0gT9
	Dc/e+d8nq1CgZmkd0BjaIEKu1iKSN3KuUPfA==
X-Received: by 2002:a05:690c:c114:b0:8ae:b617:7138 with SMTP id 00721157ae682-8b3419b2f37mr6654397b3.49.1793942933580;
        Thu, 05 Nov 2026 21:28:53 -0800 (PST)
X-Received: by 2002:a05:690c:c114:b0:8ae:b617:7138 with SMTP id 00721157ae682-8b3419b2f37mr6654317b3.49.1793942933134;
        Thu, 05 Nov 2026 21:28:53 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f3c9730sm12366057b3.0.2026.11.05.21.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:28:52 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: shared: drop the parent check for reset-gpio devices
Date: Fri,  6 Nov 2026 00:28:50 -0500
Message-ID: <20261106052851.2741296-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-GUID: w7_xQSn9WP74LFgPtT2Ra6eejBx_NRra
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMSBTYWx0ZWRfX1Ul66P2B2jwW
 uyIZVZtehNVmerL8g8S6mYRkb5lKVY9hQMeDjkAvnEKklX1u/vKvPolvqO1+qczkzYOVeGYx7gU
 cAiCylyX2BAtyrH7un6FuZFvKobA5Ag=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed6596 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uwsICcM7I-BenEOJ4eAA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMSBTYWx0ZWRfXwJw5TX05ByB1
 ATKd5K6rU81+h+POz0MQyVyJmfhQTzqtGOCSWNlkNNWfaKDMOzWG6mzecW8O4cIXLyKUc62orZX
 HN826c76NNsKYnzGJB7/Kt/IMPE2EuXOPY8sy3d53JrPAtlr0m4UpVsDLHwBaL6M/32jBALXIHT
 2Wfj1phvkyIvaEt2zMBlGusxTuHZy8zkZXRCws4gD3F5X/fRFt9uU/pKytyY8nUR8YzsMNDTIg2
 e6UkQ9VGFmOTTT+8Eta/jiAt+CfkNR2lBXF3L4eoQ5XTlT5lVP0u37B3VshQ127vWmS4FrErkCL
 fRru2AyNDBmko3BM6E1bBsOoedgo7VamfoHshHg5IpcFvh2FpXOz+tgt/ddnLrBt/pN8CYdCILj
 f3iqz4j5+tPraI5AaB5S3IbfZB2fqOiwcpG3NYhgweqUUKaW03c/7swxjDfMm6fRTK6P6HWgwlI
 Z3VDcd3L/9e6KJznwvQ==
X-Proofpoint-ORIG-GUID: w7_xQSn9WP74LFgPtT2Ra6eejBx_NRra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060021

gpio_shared_dev_is_reset_gpio() requires the reset-gpio device's parent
to carry the GPIO chip's fwnode. Once the reset core parents that device
to the GPIO controller instead, this fails on controllers with a
gpio_chip and fwnode per bank, so their shared reset lines are no longer
matched.

The check is redundant: only devices compatible with "reset-gpio" get
here, and their reset-gpios reference must already name the chip's
fwnode. Drop it.

Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
On top of Abel's "reset: gpio: Parent the reset-gpio device to the GPIO
controller":
https://lore.kernel.org/r/20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com

 drivers/gpio/gpiolib-shared.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d933049..91d91c78fe55d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -362,22 +362,13 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 {
 	struct fwnode_handle *reset_fwnode = dev_fwnode(consumer);
 	struct fwnode_reference_args ref_args, aux_args;
-	struct device *parent = consumer->parent;
 	struct gpio_shared_ref *real_ref;
 	bool match;
 	int ret;
 
 	lockdep_assert_held(&ref->lock);
 
-	/* The reset-gpio device must have a parent AND a firmware node. */
-	if (!parent || !reset_fwnode)
-		return false;
-
-	/*
-	 * Parent of the reset-gpio auxiliary device is the GPIO chip whose
-	 * fwnode we stored in the entry structure.
-	 */
-	if (!device_match_fwnode(parent, entry->fwnode))
+	if (!reset_fwnode)
 		return false;
 
 	/*
-- 
2.47.3

