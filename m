Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6413DD85C
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211807; cv=none; b=Pxj3ycum8F028IWNq6bJxzknf+AYImsgCqkqf7LlEapdEOC/wmlKlHctcLyoZ+dyIaSUKV/Ke5qhJYs9mt4dnHtQpejBJdiU1GlglB2UPeCwvyPgOgqGej6+c6wZUoDyWght5YEuveVbvXwrPlZ9r5tIFi8pCYjVbsJHQ8HFVbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211807; c=relaxed/simple;
	bh=vjJSwaWsYnkxq3tEubwmtFVGN+XvrRZe3/PK7ZMnRV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZS1RoGtq75QWBVqQ3EQM1fOgL8NdD/tbcIMDyHRTsH38lo+WTXM7k27ZPt+THzCF7U7fnRZpmGbNV+lhFE9eu2bMtOaVnMu4Plo07a4npAd1hdS46oMeA12/4nx3I2a/JPaofd2oDLKyqqWJRX6I68udbe0L83i6IfYs9L3X2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tqdh8jiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QklM5Zsy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tqdh8jiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QklM5Zsy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H4CFqR3683234
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t6TZbpPblNa
	ZUeBPiksbD6ZdKQB61AuoJhc/GsXviKQ=; b=Tqdh8jiT98DD01VVVaQV1vdUyrp
	XEqx9OMtdBQbx3SZwNEDIKLbZQPyaWzDIyzmJltDIDH4IpGJsW+lboXa2lo1KR4E
	KwxxBAEw2nv4MNEyT3e6xnjgvxmNzKNCfzL87EsXIRg+XzrcerraXlMaYss/liaF
	Wn5oT+shUmaPzrwo/ObbfYbgNf8Dp/i3bsv4/L5D4xZv5pnWvCv+NLQkB21lV+ug
	rhZI0se8c2c1sTtteFk+RMndWGYDP5YThQzwSM5+5k4T+/UfJRd+XsTlp+XQPxiT
	Ivvibrt+fzkxC3nWkLoAWtx0gy8mNiVWKgRaLEhGZCsMCh56c8nd+SfAR7g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se01be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:36:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so725576eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 21:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211804; x=1792816604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6TZbpPblNaZUeBPiksbD6ZdKQB61AuoJhc/GsXviKQ=;
        b=QklM5ZsyGKjxfP/NQTjeFSM49ba3x8wBzyt0JhfLGC0PaWW1ucZNUJph94Yzr0d/XD
         T4Unwtj5cVfM08rPsPpy6pLu38j1VtlbfyA47tURD7bPvN2imYaTB5wrnDpYaBXykN85
         zUUFYgufVRkHCYfSDhlQ+0b5GtSC+AcLajB4sgEqVkSWOiH8gpRjgOmHJRyVJscoyDIX
         yhY3xp5TrmHYZ26LHk8Fzpbcc+l1yqYb4Zd+ZR6VcGOT0GPB/UI7Oehy1giygxqeGoY4
         pyNWqAG5fZoOrEamfzUhYTOFraYxuvChQRrhqD5Kuf5JHCWvlqY1CG7Nm1IjP0WtsUVL
         Udjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211804; x=1792816604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6TZbpPblNaZUeBPiksbD6ZdKQB61AuoJhc/GsXviKQ=;
        b=bhQlxIXI/VSe0hWnU9Cqs2Qk1BZwQe9Z0id6lBI/F+vKzjsp//qRzYNxux2YLYQ5eW
         roZcAo9lKxddYRu+vRZO6oyclHEwa9YJZFvg1tIs7BVfaZ8E5YN9utBmYqPdkdx17mZp
         ZAqiQn2kSu+h62RZ3VGi3NFAA8ApanMTfB74RmrXeMFwSPYiZ0sEj5jCMs0UF71jVjR/
         prr/5ii4SGiqHflWF71I+G6z00/20pq0tqpLtqScYY3Ecut6Af8SD/h0NhDcS7A0eVN/
         SUxETRxfeVlHxB+P8qV1C7UU6tn1we28Vv6ewUqBUME67i/Q6PFQ3nt/m81zyn9GOohu
         NE/A==
X-Gm-Message-State: AFq9FYLYxy+kHgmSM48QWKuN5DQ+FKs5GFXtVDV3ZxJKb8yGg0Ux1D2x
	D/TI+lpg3+wA7fR5y7TmtWMSvvy8YUfetFoJ4qhxemscLypIhV9BDYPHm1kWkzvj7iGWPECT+qq
	/9tfS6NMUNqc2kOpzFbDy/f8U3vMqinRXFAddtcjsx1I9sBscRiKIwMi7C6KG92aJ
X-Gm-Gg: AYBFou3bP0/Y7j379DrKXj17c9PcIyih6i7SgArunv+uollIWglHvfLITN75vgmUc9J
	2Aee1E+hwr4t9Ox8OdfX3TiAXivJzybGfBiyAMXfVqMMwVMa7vPDmTTla3u5ix9YeCDCs8bbwio
	IstEoJA7bL8bfqi4MCZ9pTfCQCssNzGzgDBPX5Ud7BHEiYE3PyzenncPG0B65TlL6VdYSQBH5cF
	VB6xYRZjhHm7wdqVii7ArGHFWfcqjARrFnYNJXJMohBBGk58qLD+mlExf7B0fWFrUs8MV/yEvQT
	urhKJbS3oO2sbF4wUQd/k0zPjZQkFdyKnoFiWgfKfC5mrjhkuL9536jegPwPp1fSHdEkCHYH8SA
	BC8C6mG6BsSZAPfi6sxJOKN8a/S+iuvPnGMUjRdxmZBECesKthyw6UzS8mZU=
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr2471256c88.0.1792211804300;
        Fri, 16 Oct 2026 21:36:44 -0700 (PDT)
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr2471232c88.0.1792211803762;
        Fri, 16 Oct 2026 21:36:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 4/4] gpio: shared-proxy: Drop the vote when switching to input
Date: Sat, 17 Oct 2026 12:36:05 +0800
Message-ID: <20261017043605.1503563-5-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Uih0AuSfaa-tuh15S5v8PLxRqbxwBVlr
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad2fb5d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ZGWLMo5Seu997gzVtjEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Uih0AuSfaa-tuh15S5v8PLxRqbxwBVlr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX0R481FKLQDNd
 ftKtCJ1+2FsTfN4FrVgc4v7qQmmYsJfSOz0iVA75K1ZOqVA6ppJH2jwSKCHjpgSV21cI1RaeQm4
 5X4pePBirOMfqONuQ8IuP528uy9AXCs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX5nNl9ExjActZ
 5BjRdAIKlz0RU2XCjpzKIKk08xoQ7vUaGu/el06dEtm6kGKIak0QFWrNNp7TI2EMQB6gZ3vuxFD
 dsRvWvKPF8hJNXwLQad2y0AuughHFmcTVF9om6Bp4yvseBtMZyH0XeT9kOYQlhpB25DM6TQTDrn
 bqBAUx5ZWWPX4etYJg0ScgxFQ2Omaygzd6cC7CA/2t8Xc0xLXuMTMUmTeYrswnMYFIXtgfGZ0DM
 EvFMZCcdJ+hM/Ps/3k14DL5FyMRm9Dfkqde0XYSi97TRbzjL2aolukeQBdt4j7cfMQg86HVkM6Z
 1vMcLdVBsWWV6q07HAm5o+K4MbJ86WEpQTnrV2TosMfWTMrYugo4fFS/uNVbubjNORJriPy0bpb
 rzXWaOYda7uOft7BUf06jepNEj/KnZVc2/ZlAuexDp3uhqSgm8kU5wDPhsPZCTZwPS3IwfakWTP
 dyNYdRFCRO7dFQ4wiZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170018

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
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 456a3c3dbf71..d4680b35fac3 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -207,6 +207,9 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		if (ret)
 			return ret;
 
+		/* An input carries no value, drop any vote this proxy cast */
+		shared_desc->votecnt = 0;
+		proxy->voted_change = false;
 		gpio_shared_proxy_mark_configured(proxy);
 
 		return 0;
-- 
2.43.0

