Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806631;
	b=hHBOhCbaB95ZRp7RTrWqcnKIHA6UR0LpNfjoQ/jNSiScWCxNhVhfRRjPw7h/snsifDiG
	 pWGPJismT+HA19ywrXqUFFLOEqZ2M0FvuLKEeC/Mrr4S1eVKL3px0ciBnhmTP7m+XC2G9
	 jJBCigGcTKMYKiZh/cLvGLS8CYoNwjSs8GfOG+D99eikn8A3GkW7ene0yXfDkw9UfTMbD
	 39KKy9bnqpZQ8mMAZtYi07fjSS9OhnbZRiLYfLZ08dB6P9/CiiHFJWDvAert2ClivqVkj
	 5k/NGZrRmAB9UKuhGAyjnbgXzHZcI1q4o8IQd89ZXlYN6AvMV6hLHYHlIUc/T9MaqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zXzTtaOCtLwpMu2nfLPEBmFlSmy77XKHrQHcJsbYxxA=;
	b=5K1FYe+LWp8l4l+L+D4R92e/pz9H4aSWn6rtHmM9dVrVuuJUqocvBDaOxVQFKAKpjC0O
	 zK5vK2gPQP8yWRloz0vSxWFNpkF77VzAGCxDQ4mgkluMq3wGIt1is1F141Ci9mby1sw71
	 TrPYK0AduTZB2zOxPhd4ViHve97x6urDP1896Z0sNHSUgppbiVyjszcRPKGEVxOMZKF8Z
	 zJWOYEdnPod222knv2rqMuolMGj4jK1MIq98Hd99IdcO1gZBVLurg+SblBb2TnCi0e7xd
	 l106MIzGZkHnbxWqU687AwgbRFHA0CbA4o+3uYtlHlyOYkWA1M38RztuV+1XIk2XoRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erQUU0Hx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="B/y2wEnF";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFC36083628
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 15:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCFC36083628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erQUU0Hx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B/y2wEnF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZvfA2310192
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 15:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zXzTtaOCtLwpMu2nfLPEBmFlSmy77XKHrQHcJsbYxxA=; b=erQUU0HxwSJ+wfTB
	Qb8UeVAdx5TvYgIaJtYJKY32GU45UEhFs23/NDrnCeQmwwi7/chRSXSUkRv49czJ
	9OKLbSnFSDAYkhzRnuXdTSx5WJof4JwYvThWxBa3M0e8qyK1SoghwSXRUNfkrM7o
	xsWNvsDb9bcAEsvthWc1Kmw6UD+/36Jk9Q5Fz9dyos6ZYUmVOMZetLpehexm4TVg
	CK5SyhnGXcTpEpIpapqSSB5LkNk2OgVzcg8rpx1Vq4JRyG3ArjBooLBiJMT56Akd
	V733e30gykILt98wZJGRct6dFFSQAx1g/ptmYMdSKM5CJ8klx34hayipf7JXtL/m
	rbaKeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mvjat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 15:37:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9440b27c1feso182859485a.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 07:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806628; x=1794411428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zXzTtaOCtLwpMu2nfLPEBmFlSmy77XKHrQHcJsbYxxA=;
        b=B/y2wEnFYo1/QvOXp9MQm/BWsuvqggoPwMCdpfS7OlZVGENX4RiEwUcpojUzPfSr7a
         UNixYNFHjH/hSeAqRASOavv9Nf4ozB8xHZV9XDjA+CWdGBrDYQp3OUHyETnQnbXqAk7B
         S19ZGFpqnYC0nbTt0eTDf41hd0aE7vzEECvV2zKrCbTlYZDT+j+dNvNOLagLWBAvvNru
         hijKPYQlSKr3PlVVWdGYgyHG3K6J7JITbhdFhtJFUQ4sUGk826TZpRblGISJCs5KNVHb
         7y4LneVMVtw3BT7fKGxsqUEF1966zKgoWZfLZH+Rqzx+0dN7esVWuDQSsmUQRBci7ZCP
         EmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806628; x=1794411428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXzTtaOCtLwpMu2nfLPEBmFlSmy77XKHrQHcJsbYxxA=;
        b=AKcaP5LlC4tr84IAFVKCIcJ2DEMOkNnwJavrdBm2QptovXgMo2EBG1cDD4g8sBXXOR
         752fDNRXHsr8JtxDcHmRN7aX5ZMcbyHo7UPl2edMgk1/2yH40UaPwAFQqTH4XuzmbPgE
         KhhChIPhFfs4v7XPcmT77TycbV8hPCxr4AYoByl884UqgZ392cJHviO4fWqKikT63GvK
         5WWEMKjiKv9JLulCHfLLc0F5qEAdrZk7WGOvW5+olTOymdLItnbqhV9h6IzW6ikBNI+z
         hjFnUQeA8MvLLptS661NaezfFdCKusxTRE4Mwa8ZZvZ01ATcAVRXPqdumHLwhxKWwkVX
         vZBQ==
X-Gm-Message-State: APuU4Z8WONjqu81d3acLI3Fyp/mHyveWB7jt9a8mydD6990gr3l/jAMU
	Nn+nGubV9cjE6QFlWsGR+6y749RWfK7574mxBYaidUq/lWHTRmHo0PQYXZMsi5RME1DfXm7XvNM
	JSzuzQwU+yhcFmqiNFcgL8tAR1fpdvEZ3Mpd+wM6ZUnOhbLqJ17QNVLvvUQR77YOGYyhIxxHH
X-Gm-Gg: AYBFou1kp54EiAIfMaah8IJ5gzphYHPgXlEORSUoxi5hvb1xybO9MT6d1iuG2eu4x0u
	LO7TrMgWGfwnvZdfB3+UzKf2pJfqmHGehSA8sZF0QWT7fLHjoQ6wBgte2zxzXJ/kKa/REXBbib/
	5mely3U+oBthyILpKlQ00Yx5N40rHDYQ8JbFY87+PJHRKyc9KgEuIRkxQuFV27VIvS/IQI1bKXe
	9CXVyxA8NJcGH391CFc7cmPA7T4VOmGskfBa5GwgVI/+MD08fnDRPR8v39wAp3RvP9SSk6H0/xy
	TDIKJKQHpKkVWv15T0nvpI/mWzzVDZx7zMSiovF/KdDk5czRBDC9IlJWCeapAiubVf6+XKhzGZk
	KO+WiqZdGrscMyaSsGp0ZuxzD3jn0QkeagdLIVVJyzkkyw2bH0cs8NQNFLXjsGrJll6tvLkq1Mp
	tKDQ==
X-Received: by 2002:a05:620a:461e:b0:93f:34c9:925e with SMTP id af79cd13be357-944217196d3mr2861392985a.19.1793806627716;
        Wed, 04 Nov 2026 07:37:07 -0800 (PST)
X-Received: by 2002:a05:620a:461e:b0:93f:34c9:925e with SMTP id af79cd13be357-944217196d3mr2861385885a.19.1793806627029;
        Wed, 04 Nov 2026 07:37:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 16:36:58 +0100
Subject: [PATCH 3/5] gpiolib: provide gpiod_update_flags()
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-gpio-desc-flags-atomic-v1-3-e23cedf619ba@oss.qualcomm.com>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gMaar67/Jp8JT14Swvsq/07I0D7mbru8BTz3VlwrS9Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61Ebil7c+OCZ0mKRDoJ6P4GXDNcHFhRecUbY8
 CmxIyweQcqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGwAKCRAFnS7L/zaE
 wzl8D/4la3DvdX0Kf0+iDQ8elVg5vFPSevySeKyLcBNf+/4U373SAslEK8RKWtiUuQMhl2G9flZ
 8j6wWk5uOk60rWwY1JGBwJ1wjucvvftUpCaydzTM/rTLjPQkQlrd6+ydqxRcYuS2nNBqpJQgrZv
 Tc7ws/nXAvJl2PcQMB2vowjo8aWdhINB2NuLVF0WU20E35Sj6VK4HqcAnfx6Hkm85hSYh8lRCUu
 w+oQ1ayrl5LrpwrbNbzfutUkDLdi1jvl4S1H+f/rdRNyDoojnFU3UAx8w959SKt5dMMivT1gyyz
 zA1jI2gIIit+TQ9dgUJsOWFegAfuf5FfBzxagrO90iILDTVDOvaPTu3Td4kQdyM3wxois07UtkU
 fF1TjJ1JEQFMoEGB5plLOWlZeh2FJ8Jts02M8WQLn40EnldpSmCnZulgxFITlg4eM3vyIBc0pWe
 0DjvEZpCdO5n3sU0o19rbiph5A30ZMn08OUpSlIDNS5HbZteBPu9Glb1MQ4t3gPh1Qwga0uyR4Q
 TM3NmhWvyQEPbhO6QKNpbv+r6ft6Q+mc2Y1EGHVdXh2Xhc/qSdpQJr3FCHa42KMF6+ETAJ0cXJl
 cFZJTh+Mfm4aoXYQz1WwjduBOJBR5InaGLX+hg1SqFPei57iZcDWueFNNNL1KcWo9y5XO7u4udW
 WUi4w49YOht5yXA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: W0ZvM8d_Y_bPf56solGeNV6N60VhxLLD
X-Proofpoint-ORIG-GUID: W0ZvM8d_Y_bPf56solGeNV6N60VhxLLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX2uVrxQ5FKuP7
 NAgMjd6nko1EXChvT50G5gLe0zv95wraPp8nS7cHA9fMXKGHiaq0AOeqhQkqsqieSGOdgk/m2d0
 wADZ+HjXsIFRCuOHvMikJBqIvee+syc6XbecXWT7pCNC1t3F34cdgCVhx9mewoBet26LwxaDVcM
 22Mw7X7CcXHNZRHhaRXSbtCxNENz9oI9czrQV32RBzqU8P2PUOL5k3j6UfKqsMuPlCPn75LK1AG
 VARO//4zJIznoZy9yapw7dJnVUlI5427zu5tYJwdfOImNReqTvpS3LzB+FROXnmIK2drTfUXBkb
 hq3FCd9WQkVvFbIZ6tra9+CS2jaDEu3vLqDddpdAu09WRKp+GcxWJIfwvD7lqn06JPg5vNsS8a8
 gIb02dVGmuj5cbw6UQDA0uoJN5GhROsKs1HsYYUwTiXeeBH6wTgtGP5f+AGBGwZc1cIi+y54rU0
 GtEcmYFlXqxEhXwq8uQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfXwDaw/gi+H2QU
 AAHbWc+blEUBeoU0mjLB1J6q66V8+xRR3sGY3bx9ZHjOv2iD88m8Irdy7XyR8NLv2zN17VbVklj
 J4FqWB49IdoNbr2zu5q1GofSl3HQNDQ=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb5125 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=77EATsSd_-lqbsRuZBwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040062

We have several places in GPIO core where we copy the desc->flags field,
change several bits in the copy and write back the whole word with
WRITE_ONCE(). Concurrent updates of flags that modify other bits are
lost.

Add gpiod_update_flags() - it replaces a masked set of bits with
try_cmpxchg() loop. All bits are updated in one atomic step so no other
thread can observe it half-done. Unmasked bits are not rewritten with
stale values.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 650a702741dfb938fbdf11db65a46ac85b6af512..10659ffcf2baef9d4a7584858cda1849b26c12e8 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -9,6 +9,7 @@
 #ifndef GPIOLIB_H
 #define GPIOLIB_H
 
+#include <linux/atomic.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -223,6 +224,26 @@ struct gpio_desc {
 #endif
 };
 
+/**
+ * gpiod_update_flags() - Atomically update several descriptor flags at once
+ * @desc: GPIO descriptor to update.
+ * @mask: Bits (not bit numbers) to modify.
+ * @val: New values for the bits selected by @mask.
+ *
+ * Replace the bits in @mask with the corresponding bits of @val in a single
+ * atomic step, so that no other context can observe a half-updated state of
+ * these bits. Bits outside of @mask are never rewritten with stale values, so
+ * concurrent atomic bit operations on them are preserved.
+ */
+static inline void gpiod_update_flags(struct gpio_desc *desc,
+				      unsigned long mask, unsigned long val)
+{
+	unsigned long old = READ_ONCE(desc->flags);
+
+	while (!try_cmpxchg(&desc->flags, &old, (old & ~mask) | (val & mask)))
+		;
+}
+
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
 
 struct gpio_chip_guard {

-- 
2.47.3

