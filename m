Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190930;
	b=2StE7PE8ZNgsmi4KAj8mzAhAfgs3p+DF6JDCiGIj45k2Gl1gFTVAS1uPFPgVVENSEFy1
	 64rzyNJoAzbXto+/sp1CpV9S8LLGby++3VSldyrxYpICt/SpdQHDtWk73w22eBEWEG3Xy
	 FSpKBf586z4d4Q8e3KN5QZU8AE9hXxpFt4sb6ZEP7PzSOZDqOZGUQsQHivyUdHBHRmWoN
	 Sh06kDSWMOxVilBvVtwZzWLjFyb/sw4UsNX3vmNBZL+LOQrrNN5x59dqRF4udVazKfelH
	 jLRg85Q5BlRRG3vkqEAC1WHsQ9VZcOcwTTg4UmNHuZ0PK3MdA2Da1fnTTiWAlZONIOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8dZBtwoDTbdVakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=;
	b=DzaUrsX5VgfBSrdboux/KjQk0Cj9g9RZlt+LuKyI4SLDRYF2NAEQDAwllMEnmytLmyvt
	 8U4Hvj3tqfq9+s0DrTyRtd1gvVKEyeOOxl3gcmV3l09oiwy6alwEGeoKgeSZv5HQikvjA
	 tq9/EJA7APosmjEExntFNiZigRdgecXtIl/EKLzlao/7eDmJO5Wyj4s3V/KB8KpPq6S9Q
	 A+4mw63A6PJH/4aFoEHZWkRqWw31zZqurrM2qExUOps54ChDJZ5zaLCdR2Sn9I6KkySr1
	 sKQt4j8U11ObUbdmV4fPHGvYK/BUf2Ve5MMYps7Aqyu/MiE3L4A4d+3MKqORLeMYwWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/fwmexY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMfzDT3S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2825C60A2601
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2825C60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/fwmexY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMfzDT3S
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeVE22083948
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8dZBtwoDTbd
	VakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=; b=N/fwmexYAOajBjAkEkq/HeTf2tS
	wGfIct+N/AhRJ7bO1rNXIHGKx0xHm2ON4K597rGlmhAOJHvRcfatyhdB/U1tL5ab
	r2zkx2tnbCECd5xcR/1e9v3XK003peuZ/KamPED2cZ1cPnNTL+pcwXMIN/JKLqH7
	UVhUrvrB3YPo1dlOHYJHduOWY3tjM/lYaipCLEma5l4KaN/OtCtpYwQbkSYzZH46
	Rp6jBJyhk18+8P8jt0DKSD0onpMP16M72Y5Rjg5RIOUusYXidEiakVBqCrfjBiH7
	GJMLagFjQdlVm1iS2JgCajfnLOfE/yn4U+GrQywc4vz48FvWe1H+1u0iVBA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpuywb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so1082268eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 05:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190928; x=1793795728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dZBtwoDTbdVakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=;
        b=FMfzDT3SmbT660gnhD+pIZkahKlw4QYjtgc6H3a/y8H22xDqyLk4q8shWASbg69XSe
         DToJZBnve6+lEtFPBegmQpzxokYfphPQY+P9z8f9YTwMwTZKsTVthQItczicnX88nXef
         aC5Jq+DfrynzyJ66XvT4zceNUiFsMMvmlbb+mhZ8uy7kJ53Q/g2pi2CZ1uufaRRHfMJE
         4xXYgkdU5SO8fvOo4PQTnlKprT2qEZ7gXlOpcqVEoigNq/D+i2e9pff1OI90VMOVZPR7
         TCX7FXYBvG1W6hojyzw2rrNBjq96wMwuCxHQpN/cGyHgsDkE9DyoNaiimvygijbKwqKK
         UDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190928; x=1793795728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dZBtwoDTbdVakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=;
        b=AMCf4ytAPGur42mYz0uUubLXKqejqRI8NTWvmN+QCAjbia26FHYXmxFzgwv9R6IvN0
         mK+UMjqhsPHRNtlklZN9LbDB+xuhAUGUs2D7CsoM6z95ADJ8l7CD4M2uyRssmuwAbihS
         O2xakigZih+Hh+I5y15rKLtuuPWDtpUxRQRV8bJ7pBBnTYdyLt9O4JjQ3j0vfiSB0waU
         lFIT4wM2k4DlUg0cr4nvrtW+7EW22ytT3/e1B/5YNkygjkF0YJ7I81ztmXusQLS+Ezyc
         iKBSoSrfgV3BK4ASdI/FOEChE6FmO42GUlOSM703kkOXF5OrfkIM7+K2PHxby6ETAqcn
         dYAQ==
X-Gm-Message-State: AFq9FYIuHAyBepeOntE+etqB+wBHIyRC2qxZO1o2Pf4SA91+3HPkib+f
	4VfQUG5YbIhwihmEG9scCLESVcGqMd3dqnMDGnA4lvq+Ax/GpM7ccn+KHof8BSJgQC8cc0jeyEo
	J9agUGUEh6MIHBx59OZ9gxBkcUtDULXHQ9Fq50wMJNfoWNQ3X3I9qfvWh9Ny0nWJF
X-Gm-Gg: AYBFou3y8PgtAbbfuEqvmEjtsdfsYedhISAyyyfJZp0+RBftQfi9G9Ft9hKcazJXCop
	gdeimiMmxb1mf5RapgPmwnLmqmssNEjnpdiGGWVYW12qqSfOFTVWd9pH/cpt9ImHJl/7/Bpnr8G
	TgpWupnMiBiAOENTePfml+KQWx5vinkSCkCpCXbo6GMhrOsF5+Y2Ht/yg6f1kGpSYOdMQP3Z0OO
	cRfX0grr7qXJz3JABdmUJfRKwaG9r+xj3si4D8fcb8rdXaNhFb8tSk2VrNAEVdHjWhQnT8/B78n
	eyBRx2Szl0i0HFvjFH7dYlrGcteGelffoCCLFGtJSB1WHwDKP7jQTMzd0Um/cmVSx6AugoHHNyf
	0hGJOnPJeFXHbTyQsxngg5HSWr1J1/sOG9RatdWVf39EkZBMYnWwqIm5hm+fAxJeZpWunaKDSXn
	gpR+tFVrOnW+gBc9Te//yOwiJIuPLfFfv6
X-Received: by 2002:a05:7300:f40c:b0:341:c383:9afb with SMTP id 5a478bee46e88-36a0f8a9ea6mr6840625eec.20.1793190927657;
        Wed, 28 Oct 2026 05:35:27 -0700 (PDT)
X-Received: by 2002:a05:7300:f40c:b0:341:c383:9afb with SMTP id 5a478bee46e88-36a0f8a9ea6mr6840593eec.20.1793190927094;
        Wed, 28 Oct 2026 05:35:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 4/4] gpio: shared-proxy: Drop the vote when switching to input
Date: Wed, 28 Oct 2026 20:34:48 +0800
Message-ID: <20261028123448.510401-5-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX7BV2nFqvALBv
 7sXAP4swea0EUKHYJMNWziSTSI2F2Ov3/rc9lzz4TNvgBjhB16w+wKQsScU6z71ICazwOfD1TgD
 0TeexrO7EZS2p0BpAAWUbJdYmEpxvIx3ga0MRvNdSo5HUOjOGS8QTbAqpS1lBXQp2rp3kQCxwLd
 nsG9mdYiPRuYN2YwOx57yRJu/GthmkuIgOS0qRHVUXpvSCMpt7NSQF5dKfQLrsGvCsssy6YaEMa
 FetfWDePArXqWg5Rpo5/irjzYCaIfbufR9g7QEXJi/wxafMqht4Y0rbAQcuqCQUIcxMJFPXR2HK
 p5XmtTlvP8m+S3es2TSismhmTGZBmiK8Gq+MufmsC3F/ilU/oFr5fkalbW4r4TJ+k/VIIX8yfrB
 mD66ubqe20ZEVMWT47c5ZEjCovT1/ECmJ0HZ6CWaRs6D2riMKA7iKi5C06gxRTa4ZKmxI1w4Vyb
 JlK3wk/Oc770NdYopyg==
X-Proofpoint-ORIG-GUID: rWv--fCSUCDK3oXusKUGSzXFkfAvR-VV
X-Proofpoint-GUID: rWv--fCSUCDK3oXusKUGSzXFkfAvR-VV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX7v0aKygObySE
 VaS2GiBNplKAqimWt3yfWGkb3yAVT5Hqhvi3leLCjD3wkLz5YNn9ABwVps75ayux/xKO57sLReb
 3PC0MRw/UJQZrR+K6aZMDHgBThsM4gM=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1ec10 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ZGWLMo5Seu997gzVtjEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

A proxy that is the only one to have configured a shared line may
reinitialize it. When it sets the direction to output, the proxy
resets the vote tally, but when it sets the direction to input, it
leaves any vote it cast in place, although an input line carries no
value.

That vote outlives its meaning. When the consumer releases the line,
gpio_shared_proxy_free() tries to withdraw it by writing the default
value, which gpiolib refuses on an input line:

  Failed to unset the shared GPIO value on release: -1

This happens, for instance, when a consumer votes for a change with
gpiod_set_value() after setting the line to output and then switches
it to input.

Clear the vote when the proxy reinitializes the line as input, as
the output path already does. No other proxy can hold a vote at that
point: voting marks a proxy configured, and a proxy that frees the
line drops its vote.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 75d0d617941f..b2f2301e9e64 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -211,6 +211,9 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		if (ret)
 			return ret;
 
+		/* An input carries no value, drop any vote this proxy cast */
+		shared_desc->votecnt = 0;
+		proxy->voted_change = false;
 		gpio_shared_proxy_mark_configured(proxy);
 
 		return 0;
-- 
2.43.0

