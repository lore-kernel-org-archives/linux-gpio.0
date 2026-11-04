Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806627;
	b=b6zYq75DfcxM0E7x/K6keF/BuZtZ1nCF3fIpD+1ubQ9FJjGfNFQbwdWCg8LGUxtyGIDU
	 F6t3hzB5xVDi1Se0vAbGM87nR1wI9BToOrTNhHWciWvMhZVSuxZ0Pu4jGgrVZWNvmxgdH
	 qDu5KXuwkz+dSfvVmT+GIsxaltZ5JgOeuA4AK79s5GkxNt0Xb/TvPaEqCtcKjFbOIKtRy
	 9cZwp5gOhrsVnmtyFgCH8lSct8LAFpqNZGqqJH0KKXYAdZZAIPUD+TMKtvjtNbJMBNHnN
	 D5cG5CrdtYVxemEzPnuY7yavgflaewJagoqDpyjxENQohA3mHmkxWLyHwZTKGccUhxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=;
	b=0PmBh3favS+Pe102VWAXEC59511EyMqdID/nAZnjpWWGe0IVCWytylAwM7Uizk7fpbeO
	 SNf1W2VZYKFM5j0kzqdRpnbe+qH6Nkeb3WKM7fP3y4TSwtQS0KeTpRM0oA5fM6Q+K390z
	 q1xiTVPWxJmEm/F/NMTXgII1rUwrEX5dblVAZl6W3fKyW2DeEgHFyLJGxVzy4lbKk8ZX0
	 LVvvCere0drXRjWpW9tFGZxF44pQ8pE9SHN+maHr4GBOQViiuFreP3K1GoTVYPCT6UieS
	 rmqo1VYghKgB+8Zx4vB/bKoiflm632UkwBVcQNCs21kNjUxja9aFZfm8a2eKwpfPcYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NReqiMPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q2/yXPSi";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71686082BD7
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 15:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71686082BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NReqiMPk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q2/yXPSi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bo0aL1387561
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 15:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=; b=NReqiMPk1nrl9oR/
	jprGixl394gSRVV0EDX9mAImS8lZmyupSE9k0SjyfOZPj97Dp5XVkqhjF6Os+GZm
	AHTd9m9E4OQ74OyOSrDkK3v2MUXKBYg7P4DYhojGSVXl1cIyzLy8tH1dEsVgNmd6
	QN6ihMwCebWtQFGvVX9WXH+QaZOYBV41FKjAUmkXx4DdAeCiygdq2StTodqVO+tf
	zTrWEe1SjGn6XKa7ouGws8oSPB//D/p+VZ9OxCpHpL+zlt5DkuYzAgFIdaIUpgyW
	uFuVoYzjH8eHriMWGz1pouRRX1nkazjbHaj/mT1Rrl6cUfpsNQJPMW6yEx71hTP2
	CmQ0Hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsgathq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 15:37:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so171436085a.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 07:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806625; x=1794411425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=;
        b=Q2/yXPSiYh8RgBANaBtaR9NtCARbFjXm4e69Hyv3cAKKLfy65co44XEU1ZnbprHCgt
         8TvvPbUNazkKSsG5Czksi9NeUlq+qOqzSXb1ThhagLhkahWttPpzBgi/WG6RlDsoCt2k
         xWEEJA+U+EwCLFqoNpLX2ic3NgjnI23auiuPPIRTMZgZH43g1VPF/P9MZHO/8jrT1/p8
         Lv2f5IRNJI0m6Gb0FnqvJMbNYviA+VmGCCTfS4Oke+zn4qDRsAVPoi2jS5prRZyQJhJz
         yBEQgwGOE8oHHWoHxxqn8gmhK8sKOhFNAdzmTeG6VBP69roT27lREvXEy+J+AkhBuOpw
         NFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806625; x=1794411425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=;
        b=RrIzoEG6+UqEKFc5N15eRZW3Wo3lpbQ9J3xHGJQM6evYcWXwu87/tkfmAbKsUiFGlk
         iVsdaFQp4tcnp9gfRIaMGo32dYaKlrc9yeipvmIrISZucTGL04rleARKjaulyTi9AeCt
         ov93z4AnGL1r12LQb2oEzXIlXPSQ50LDXlYeJAOyZ+4FsosC1ZmMQ5WOatSm1bE0JvFQ
         X/U2qTJz6cAHnXLup3BSJkBmIQVyCo/ppRk8AIc6AixggS3ZJBiA4k7gGr8nAl1E83Md
         vhHm0uxaWSpZIFZ69FetE6ZOaBto9zdYyt+4FQt5x7ZrQ20Xu2hc/FTOQryeOUUS8P97
         ofUg==
X-Gm-Message-State: APuU4Z8n+7RV24Tss/hVU3v+KhXVxAvZeCPPoWt569w/g9+mv+g928te
	KcGXqLBtfmA2rnpdLeajpKqGFiPcpY6HZWkSel3iK6dKqzk/UOVBf16Q7gru2+H5sLgET8O1r7c
	bTk5HRSBOCqgMsZrmqs623+ORvtuxLdMrn4ZrdvQ/ebfh8Lql7i+/Qc+hstf0ahO6I0450zPF
X-Gm-Gg: AYBFou3vAhWXDAMm1MpCfsGOMnE7f1VHPeIzMTBriYFj+MBmhzOk3ZUENX5Jqi/dqOY
	0bDrL/HmucY/aZ/mjESH3JQxJTWBzhxWJPk4VLYRLNmV/3KkgpdPEjr+XyvDQw9ZPuN4YsPcdNT
	ibGMTd5zgQ5L/yJ5RKGpdxtOSNVJGqUC0v0N5xqSvIb/8tOlzBQm94IyN38ylKpnybSRHD3Z+Bb
	KSCDlfwnLNrur5VYdBzQh8Zm2WTwikVM8jjTcrOqMzvk6OLjvK5ItraeZQiU6DQLmhb3QKdMKsu
	CmDUpitN/bMjlCP0FIqfhKLrUCxQwTcKP3OaWBWQu2TMYmpdH5VKl5G/JvxOp9+zjxtGWsd4Yor
	AFXseF6+yslW0vJ6t9v8awYk35dcztUf5l9EQ15n3dvGgKcCXP49gMS5YnzQrHj++f/cp703WNi
	DUdw==
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr2673126085a.65.1793806625302;
        Wed, 04 Nov 2026 07:37:05 -0800 (PST)
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr2673121085a.65.1793806624817;
        Wed, 04 Nov 2026 07:37:04 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 16:36:57 +0100
Subject: [PATCH 2/5] gpio: shared: use atomic set_bit() for descriptor
 flags
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
Message-Id: <20261104-gpio-desc-flags-atomic-v1-2-e23cedf619ba@oss.qualcomm.com>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sMmWnya14YIAq0vwSErMArXF2T6bT5ovzCJ95r5ENFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61Ebhf0q5C3a8TYWNX2m3wEDzl1DfFdXy/QYM
 Uc3c12MwyWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGwAKCRAFnS7L/zaE
 wzcED/0WO1uAMKKGnyIlXKcueWgZ7lHWtYfTCFx66uukryBrJITMHy8+f6fTDEbV8kABF9vWNOk
 w3BhSDj8lL4Yb0/RuS4b1tCqLyjMQt63kup7Gh5h8KWNYzwkLrcZhRllGt1nUQfeeERmFvWpXBl
 2eyaV5pbmnH90iW+SKYhehkS5IzMu4UwH3SCvdsTf/FxUPGs9C9ZE9/bYD/eKtYPsQzibVLtJCz
 GFGsuPrZ56I6fq+G9TPRnVBvJqJAsUE6V+m93hVGSxBhXiiH7meziX88yT+uHnxy7rkHb94jsRx
 FCVO6ai7oqvANh/LCAzixbXKyPvLHcaRzYIDSTZugikWpkbWKrA2TwBdGiPBQPazC2ybp0pfMXD
 zZWUiW4+WV/mieoxu9s19Y+CKs24GRIgIp3H1bQ3lvL6eof/oVMsKUragftcx7J2uLR852Q9B1z
 qd7izYni6PdlYL0ZMw2cUea1dhnDs3fmIeGWjvGKLugF/M4W0YlQsLvYXMMylesl2lrkWVhlL/Z
 /oMK7BP3Oj236LzYPEhN+mx92x2lOUFJpncasU3dwXAYRcqD8XCmBk95O6VciimEAOjCYbv8okv
 TQZByt3KdgcJxbrPgBOmvkdN/sVXQsQHLoNUcJe5rgYJr1Lb0I3Sm3iTsHZcsBPC5f3OAzz0KTd
 E54ilmx+nQcmN3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb5121 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H6RLajfuJ0QrpAsTGAkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: WN4uhsu15iOQdeTuIIB3wTfKy2pyaBFw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX4ygfSvYVTxln
 sm96/hE+tVINw6RNuwARvIluIOposdxe7Oy967is0Rl3xxu0SU012Gj65l04Ogdk96BURmvvQYN
 QcCrRqKerOHAtpXUXmP+Vceg4ffimIehXMlxpDHvUSPNtWovIgmyMLYn8yaAi5tBM9L0CB9OE6P
 gIbZn2f8URrK+NyR8GoKlGNOMJ+w0vn8wPBjJosnDz9d2uAlm0Ju0REYysFubG3YvTz2DsoSG4a
 C5hP7snhJ6q2ZT6We7/xlzcQ6H0gLiXxo7OPDKLlYwCJi1OGcVRs0wufPkJAIwwEcGhsmfEgHmf
 8lIMuwqcnAimxUOaq1KMrud/Vui4bKrBwZd3mwgVotRyBtKAEluWVgp2EcRIMz9Vkr0ZjBsPcb8
 d1rAChXwDVdfY4lWG4x2q+l0o+m4fbdKMqBebUAB711K6K+bs6wOuwgg4TiJr0CXWFzuRWBEsil
 mmFO4L2Ps7EKgCFC/cw==
X-Proofpoint-GUID: WN4uhsu15iOQdeTuIIB3wTfKy2pyaBFw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX7ZGl+v+y0cGy
 4lMlrcUyfnbavax/vw/yAAz65zmY3QJTKC1TDKQIKnbmcgn4nBCda9uHeAc2tKVND6E8nDN5BBG
 Kqpe8qWabRmN0diECCPvspz84/Ou+5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040062

Use the atomic set_bit() instead of __set_bit() on desc->flags so that
every modification of the field uses atomic bitops. No functional change
as these run before any line of the chip can be requested.

Cc: stable@vger.kernel.org
Fixes: eb374f764a70 ("gpio: provide gpiod_is_shared()")
Fixes: 310a4a9cbb17 ("gpio: shared: shorten the critical section in gpiochip_setup_shared()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..d94fb94f31c2f487d2e45924e11c33570466a0f1 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -532,8 +532,8 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
 				 */
-				__set_bit(GPIOD_FLAG_SHARED_PROXY,
-					  &gdev->descs[0].flags);
+				set_bit(GPIOD_FLAG_SHARED_PROXY,
+					&gdev->descs[0].flags);
 				return 0;
 			}
 		}
@@ -573,7 +573,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 			desc = &gdev->descs[entry->offset];
 
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+			set_bit(GPIOD_FLAG_SHARED, &desc->flags);
 			/*
 			 * Shared GPIOs are not requested via the normal path. Make
 			 * them inaccessible to anyone even before we register the

-- 
2.47.3

