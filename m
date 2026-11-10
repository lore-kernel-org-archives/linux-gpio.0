Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318435;
	b=j5YNayGyvD8HPGSQunl2jx/RnWNS5N2u6xO37XPTzcnH0l+JLSqWkQwjdvtM7PY/MVV/
	 qbyJxQbBbjKSXxwyLGVuHRnghW8uX1nOFlc5cTGr0NWySZYVm69XvuOFBgXEXG1RtxJwZ
	 ulq/1uJCZMT/R438f0MQjEdYXG1wty0Vh/y+W3LIPYGKGYe36tU0NsRwY8VhcTpq9pSXT
	 W0EvfWr4oWRBnheSS1BBZk0hiorz83Ynwj+tfR9ci7Cs0n2Y/PrfPd7ptZAGA//1q1DOz
	 Md075EuyCHP/FBjU5ZF7KoYRQ220lFVjXp4miMc6JEcKqkjikxdSq3CQ4T/a6KsGURw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=l7bXKhfrbBlXJKf7wq9aR9JbITecsmYDAQOYKFv+gFs=;
	b=paDB5DbrdJz/zCpqy/hdx6nAvdzbHsPohB5FAwtByZ+9qfxnfaGzbO7U0syAj6fBIK49
	 uIp+q2PFtqTvdC7+PxKSEaLcScMjxh9+e0QH6uXsE2z7FRC4Gumm/FpMfY5F7hW/etFcG
	 XjuDNV0m4EWxaruwWi75Nq6rFUDIKaDUWDJhpRXRSwjTC5bCD1oPtRG5cIwnDez/5NhD8
	 HYnQDikWC0njC8OTRNUh3420R/X721VOuTejYvNh94vJAJ7KGuzUpREvzByUTypRG5eh9
	 5YCGf6/KCy74crlasljhL4Gr7bqe4WEQzzjdVb/v2//S/f9+Eib9UagEphvGMxXXN1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRhzBFgN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cNv/25sC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B1D60A2635
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B1D60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRhzBFgN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cNv/25sC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA5uE4186865
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7bXKhfrbBlXJKf7wq9aR9JbITecsmYDAQOYKFv+gFs=; b=nRhzBFgNikXfHnTn
	v5UjdDdu+9Xa+L1HSOoexBXzZaU73r4IKGy16trtKjYtA5ta9B7z+mAYP50H9wbl
	AybP6edwYHNC5GIKuCt3cuIURF7VlmO5AdFEE0kxs3HUfH5IltOU931yiut+KJpy
	7YDxbMUMxRAS2o72qlmAm0++iaEcjHzSIevOlMNWKnv7kEm85Kn3/ye4Gx7JbhP/
	FWLORf8TI8GIeE39IVEFABwv4Y1svuQ0Afu6r3SgIP3JYBZmayMbGaO5MnerWVxj
	YNkAEeFwrV0eqZAra+D/iMvGsq20uKu1u5nJGqC3tvVNhbTT0+P5ywM4KNhw/JGM
	4IEO2A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwh109-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99089f9591aso423284241.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 05:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318432; x=1794923232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7bXKhfrbBlXJKf7wq9aR9JbITecsmYDAQOYKFv+gFs=;
        b=cNv/25sCxDcaRAHhWgtaOCQgBvvBIBTlEQ3op4vTjq9qdKcejoN4U3y6YtxUlmGNoc
         7iUAiK/+HaFSSH1TzAKuEZ4tMMfiHu965EaeuVTSk+aG/uZxBXmrfmT5qNP7XzSyCZ3G
         fcC18srHLic7HEtWkuAhT0/c83N9HLdUQjheIYKiOjA3GuVDQdDW4A1EZGjyFp7YTQ8g
         67jTygMXiK64/0f4ihM9P9KE8JDWm9qS+0qumBAo547p0VX5nta4QIk2eaYjiIWO6zoQ
         zEStPlj2/+B8FcTNNhufBi8p2hDMbFRRGdRcSdjpQ8kPWgaMIwKsTAIp0PTDKbVYg4x1
         ViYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318432; x=1794923232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7bXKhfrbBlXJKf7wq9aR9JbITecsmYDAQOYKFv+gFs=;
        b=BwfsqVDcAtFTj7WBlPbcC6ulBUxKjCzdshMz5Lvkewo7DBmEMVvigVFbQdNVa4tdh4
         LkjgLPb60bpGRtl2ywnJFqG1mSsSVTCktBJpTpQD4l0ENtv50B0AJPDmJe03TtKVrGBt
         taa1oXRJi9cNKVaaSMUXNX7OjdYPCbKx98SpsHM3dAbFmNSPSRBa4mp+0aAuIKs0gE2u
         HFgM4j4+Abzno8KZ3lZjd+D+mRbwbi85EYITNakbUdQDZY7l2tSMWb2VWUHLL+rECrDY
         i4AtOLBnj82LuqeCXNvffQQMJLK82OgQhHyoSbg0xy+Fp3lvOJLok/73iTVuUQNtWbZ1
         arMw==
X-Gm-Message-State: APuU4Z8/KryNcOOc9ZnAF2LB09RCbTQ5K313sHuyd+nAlqaJg9PjLnxY
	DOpdIc01b3lpS3r2pes/tHUD59tp/rQwIlvPscA7KjQSGOBAHWM+6gf9bCdoQWHoCDXQtDYjz2i
	7Ud4taH7TGSLu1N3duk5Ki8vejadiKNDEJ5L19ui5OLehYs1tIDTuRhHaU/jn/ODv
X-Gm-Gg: AYBFou0to2otzc9B5c8gBKgwosCnRcKxE+6Nm1F+fXw03MIiuKPheubbyDPGXDEtZHB
	MK53PbXReXof0SqNPUeSQn0xS4igL/ohEr9QqrKlgBSI0raH0yjSjWM0YJn6OF2/K5Tc2xWRfYi
	XOMsuCNrhKEKdwQTwpYyqNxH9bAjRRJ0QFrcb/ua4G1jhUb4JnbKQCnO2sLFMGDxX1n/l2TxhPI
	vK3JIvaQWGAdKmzOlibznFu9l9+xXvsrDdbeS6lgB4LjeSLJbYU4ihpGVC7jXoTYNa0ampGn9TE
	DCeSTRMPAgEEwPoDiVSeWjykkzWxeNYpQrBS45I60nSoc7utnjvHz1VRuGEEgPU9KmZqEVhvhjj
	km4b+AkiEzweMgTS6Sn+tHXNzIvvwL0PwIL/gGEm2o6ZY6/Nu+OiC3OaeMjimGFwWiGQkK6FLjk
	3V5tWh5CxNHutOEyO+84Irq9kDVwXi7RRXfvbUdGvdqEvYd2cndGlmXlt6ReEY5Qk=
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr732420137.11.1794318432107;
        Tue, 10 Nov 2026 05:47:12 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr732410137.11.1794318431576;
        Tue, 10 Nov 2026 05:47:11 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ad9sm75913445e9.5.2026.11.10.05.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:47:03 +0100
Subject: [PATCH v3 3/5] gpiolib: clear debounce period before the
 "requested" flag
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
Message-Id: <20261110-gpio-desc-flags-atomic-v3-3-2f463bce8086@oss.qualcomm.com>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n5aU8hfTbQaTDD6CR2UvXQ7CGKlgeejUOYHOO+krLYw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8yBYSDlDmdcAXZ+enYVY/Ky13Ulm2wmGRT1xR
 0yM/9YUHNeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavMgWAAKCRAFnS7L/zaE
 w8q3D/4uVXif5jirTVOExGMU6FiqdU1om/mcyNQdOekd7sX7T1xpAD9UGjbqin23ESA2UfyOldi
 xV7yDu5WN/pfzQR2VzLdQhcbBvLOPp5c9lvsY+lhmroZuaiG0TxX3Ib+ddgEO1Nsv2CzmepqdeZ
 +aJIlHshADiJiOGpqSbVV+Iz7ibB+Zrz7SmOnLLdyiQqyjskUkjFIOkuMb8shnrKcYY1DSIS3lX
 Qqi36+vacxpOyKmzJgM8z3yA4KoLBhTGERuRVBrqJYACj89NFScSlql4/44e59udEw+cSgGtZG/
 ua8XZ/dur/XYJ5UQ1NfUud72Flx6Ls1nafouWp34RcNrveRiisCu4XzRCEmPuPLpoJQpuGon5mZ
 8R5A0J77+QlwqlruMhm49GD0Af6AUl7nYzuefo+q1qztoz4mH/9zUldRzaN3OhnJyuJHBC0Lzu5
 k50ommPzlq6DsrzIxSKWlmMpul0axO+ymFJOKNxNxUJ3QQbpaHcoyqnw1FetT4W+aqCoJVMh4f+
 SZ0tjMGkgkFz6l1ZNJM9oNMKCNIuyiqlMvQcK57nx+DN5jxUiyo2wIe3RYLy6KDkjsd4iy5VMDT
 1nrNFc01TksChRUqQ6czXjedoKEynMPf9HIbbMI+PegEeId3lfYsgGRon/Mov+omTmaXSc59moI
 vVY9VNm4/149epw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pzNyAj19mmWnNWkFri-unESmSoQ9ZNOs
X-Proofpoint-ORIG-GUID: pzNyAj19mmWnNWkFri-unESmSoQ9ZNOs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfXyShMfUpzNYLy
 Zne6lSrh8QtmBLuXC9W0KLKj61Gx1VspOszO82OjnhmbFEe8ZFjFt3gpxt0mLzhnhEx6Ua4NQFQ
 4eoXbw4kKgHIJ84mDxw0Uz/w40E2UH4=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af32061 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KlaQiORTA54Oakicw68A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfXzcKsbBLKxHI2
 LjUo0kLU3Sj95l6D4St8pTmriz/6S6h6XpwvVuC7QxsIR3pM7WqNVCSQIKbpokq4jCCURl4xs9E
 LdHOkrkEVRMaMuyIRtuZLoj4v5e/K5WypzAhklBK1vZBQrQHBhyRtYkbb4iYKm8CnTAkBB3tF7s
 EWD7pa1wpGS91qeg+NVG53HWqPgt0b0eDYXtrqruWiI8p1jXqFlT5Na3LMern01JKXjN4Zc9ao8
 XBkTXmmOCagMFwZnwTyJxhNpjXcoWz7gAY6HKY/Idi9YSCq0c24Ve8idaJT+0o+Niky3IwSJq4R
 g19o4STzjTvv/eRZGkcCN8Z5hDEaFRqtw82rzB732s2yqIQeZJEUQjbTqdNIa4ZzHJ/NqnwmX0n
 hr+D/w3M9OmJEpRqAAx7cn3wTPbxNQl8JmXi7m8YUpHUMYOCUHHLzm9gUbDXYW+7FUseKdOhjak
 8+VWn1r6npoiUMAeRKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100054

The debounce_period_us field is protected by the GPIOD_FLAG_REQUESTED
flag, so it should be cleared before the flag, else it could potentially
race with a new request.

Suggested-by: Kent Gibson <warthog618@gmail.com>
Closes: https://lore.kernel.org/all/20261105042905.GB8436@rigel/
Fixes: 81625f362497 ("gpio: cdev: go back to storing debounce period in the GPIO descriptor")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1285a993a1ceeff719142ad019451d2e9af6a520..ce8531a8e95dd3bdff7ca32f4e486b329a19afaf 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2699,6 +2699,10 @@ void gpiod_free_commit(struct gpio_desc *desc)
 		if (guard.gc->free)
 			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
 
+#ifdef CONFIG_GPIO_CDEV
+		WRITE_ONCE(desc->debounce_period_us, 0);
+#endif
+
 		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
 		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
@@ -2716,9 +2720,6 @@ void gpiod_free_commit(struct gpio_desc *desc)
 #endif
 		desc_set_label(desc, NULL);
 		WRITE_ONCE(desc->flags, flags);
-#ifdef CONFIG_GPIO_CDEV
-		WRITE_ONCE(desc->debounce_period_us, 0);
-#endif
 		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
 	}
 }

-- 
2.47.3

