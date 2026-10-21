Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585479;
	b=dp8AYB3kc7QLyJcEZ85VfD1MyDF/6dhoTVaJ2MBMon/IuuQIIXb2MBYE20oD7KDdi8q9
	 zS1/W0OYR5nuRFzoLOS6QRY4dZfhbCKPKnU+tQnHQ8cZw3iYbRaPDMiDQUCdSbcBtV4hm
	 f8W4mJ/JWTM2QYjcLoYbZ/W+ClzrbExJXybBF3jV/vv2IrwUEw/DkpUtG5Vj435VPxTMj
	 jAJJ8grFA0AjOZKYgjRF08Kig4eXZ75OpMD0IE8Bp7yjBBdtrOV/ggzMKl40fqvncs5CK
	 O5Fs+KGkhmiqDE3Xuxn1o2mldxTQxZ5cIbY3XBZCVbJDsrjJ+qL2oYgnltnsRoJcI5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585479;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NNzfE8E+HIVrmfub6HmwGi2K/UFS+cXxulUqMdHzE+I=;
	b=nHm0qktmei3OuyX5hFjRXdVCOdCdv2xknIfojqhYdJNst37QFOz426yWLUeXd4xOgz4K
	 YtjQ0GdtkF8jEUgupBOkDd22dGJDgnpM8QwMUBAidz9ePjliyN2ZIRNgooYwXOLGLzwww
	 ywjFUR/tJLKH4D/Y8rQnkCoWMDT5UKxJkfYqXzz7VFuqpRMGww+3fgHhzPwn7fxnvHzx8
	 ZlyYy7UWn+ntx4ryZu7AguQGiZEV+ZT1pbAqw91XHRamhbfpDD2RNufxtBMGGAWjX4vg3
	 BU5UXIF7juQyVQesuLwBVUEhoLxbZr+iBeyOSVMKGQLJe33QcDpIKzWUlIKKd8ytt2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AzNlW8oV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrNMCp6o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CFD606A327
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CFD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AzNlW8oV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrNMCp6o
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfxEh1599796
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NNzfE8E+HIVrmfub6HmwGi
	2K/UFS+cXxulUqMdHzE+I=; b=AzNlW8oV1alNfwIjwjwW+EAgNjGVhtnr8wLVfQ
	0eeNPwt+tiZPAwT+ONRiIPVnxjHcBg1vlYygG2mE3206FcdWHuy71JFeQQ9D5SvK
	9zdkaaqT3Sj+9PKrqnYPTJmXNKHh0hz96Bsa2WEvSBV48sqgvqSFEQCgGMbh2I+z
	aJjgPuJGwPngsd5LmLoT7YzSnMcAb9jBS7EgMJt5pTDslLNDytV5Tx4ZVw+GukQI
	OzGX/7qetQhRaBb+GAsfP46U5jctRT+XlndtV32poqgKHSOO4i82sy2AuIRkm7Wu
	VQ/wIdWSJlEyRUtEksz0miVJ9HsaEi7n0XD3t3t6vlbzUBBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugd1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:24:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso316245585a.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585477; x=1793190277; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NNzfE8E+HIVrmfub6HmwGi2K/UFS+cXxulUqMdHzE+I=;
        b=NrNMCp6ooE8yOgLuCUbyXNQq9sowcTlcG9ZoQ5MBR0eq0PX8kvCGw6yQdTkoSZ07xD
         lxsFwggE/vdrsIQJd6teTXe0LnoXw+8DXW9IyseZBe+ksGCFP+SLC11U2KAiByL+AN85
         gP+YYGTz834MW5FmSamHGEO1dc8raMRmu3xslgiW0IS7vpHLEyRl+ZoHDDRDXtJ00Z7s
         Cg1N91s6jPTj26RgSUYlPoekvz7cl7OCPP7xcdfzyIh1d+RXOIcivBNYgEg4JG0UBF1w
         pkU4dXaEgOV96W38BisXNhtHJn6EfsaI1YHxT0UkoYIhNiOoFq4k/pfMEvAAHwd9xFY1
         0GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585477; x=1793190277;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NNzfE8E+HIVrmfub6HmwGi2K/UFS+cXxulUqMdHzE+I=;
        b=swkxg3V533/rACMS+Wi+1w4UueliHTVCF8VHJ1Ac9uCLqR4u0DBrUqgajQ0mTbovnR
         9adc+nqkZuy2IujbdCHvpMSg7lOhJyDncnOLJjigyQtbwugM22xekeb4vuyh9R+Ml6XL
         hRqj1milSN1cOX3eKEHitMcAVTKVfn8d8g8rHQfa4PXX7W9AEQT2F6qb1hUZI+8Py1lR
         SVlOaQOF5eFhWcWQccpDw9YpeGZrQXbV6D5dabGT7tcw5WORElBDhEW+IKBIEUm2d/co
         6cQs3P2zaPtUKvbyg+wK9hr+JQJElTFyfAIBMk/9AGQg9AZK5z5I2f0zkvVpaX+39ig4
         /kkw==
X-Gm-Message-State: AFq9FYIdY0EFHxevwdVQKtGlKj3di8d0BzYla8p7G0lMwr4shNRSuUAg
	PghwRpsCZbldlkrfr0chclEGKW37sBLbqSROVO1dv60r6oiEkUM0mmRW+ysyp4aoOoHN643ncOj
	xT2Olo7mrS14us8Lh34eisfPvUN9Iv6KYUSSY3CoV5ugR1IHE3NlvXuPiGPbkmlE0
X-Gm-Gg: AYBFou2Sa03fYUD5bQTCbnOwDxFYwyuwjSt/wLHBimeWNprAetltxZHaz2GO/ohytnq
	8letEZc2Fm6OiYLT4/QTa1AnEgL+lzAEfAs++gzIlaQJq6c1w/lChwzfKDXmNAT5Xk25medor9p
	2GuyCAlNuCHXoQeEx8QGnD8iZyLshBUIuzydV3Hu3wswXPvexrMDe0Grnw9sTOIrvA6A/xm4IPr
	2JSpPIcUHpOkWdFRl1mVe4d14VxavS/nv2IJcIZ7SiCk3+sWcdGEQFEE2HlVpKudidNESlqtYoa
	c8BakFUn9V3/Dejwiecva6Lf8OB5wd7uxQOJalIZI4SSW58YsWTkrFAhA78eAEJr6HCzfcgoB1x
	k/Q6qNoTXb5yS2HNf5ZE9vo/k+YnX
X-Received: by 2002:a05:620a:4493:b0:93f:4498:603a with SMTP id af79cd13be357-93f4c993775mr771859885a.35.1792585476854;
        Wed, 21 Oct 2026 05:24:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:93f:4498:603a with SMTP id af79cd13be357-93f4c993775mr771856685a.35.1792585476312;
        Wed, 21 Oct 2026 05:24:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583ffa8sm5403940f8f.51.2026.10.21.05.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:24:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:24:29 +0200
Subject: [PATCH] gpio: virtuser: constify struct configfs_attribute
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
Message-Id: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPyu2GoC/x2NSwrDMAwFrxK0rsA2aT69SskiOLKrjR0kNwSC7
 x63m4FZzHsXKAmTwqu7QOhg5Zya2EcH/rOmSMhbc3DGDdY4i3HnjAdL+bYSfU5afgwcg+Jaiih
 6E54jbfMwTT20oV0o8Pk/eS+13oOTHvd0AAAA
X-Change-ID: 20261021-gpio-virtuser-const-configfs-attrs-c0f57ed96884
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7bLb7fLTC06kg6yZomaW8t7+VtRnOZNaDgAV0I8jEl4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2K7/pYllIlsfoRxi+gsUuPC1odAdTq3a7VqNG
 Gw9RHQBjjWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatiu/wAKCRAFnS7L/zaE
 w+IJD/4sBjUhI0qo2MwnfCTudQQhfBdXxSiX4EYSjAbWXJA/3R+cq87GrJ96COhkplio3Eam7Gg
 EDdbitNRH1QzrTk/FiP31S/IiqvZoYHpol1UbvCJ7NJqSRkLyIQQIOfEb9KzlY2295ZNiVXvCXr
 sBJ9eI4QV9mszeF8YFm6Hnet+s+XBKtGBegG4nS/Z6b16ky+v8OyX/9P1MXqAFRz7HwelkA/AYa
 7Vbwkf9LRTHOBFAak94Ph8f5/aBwCVIMJ9f1+yZsQDzfAi+XEwPMC3S0vQj1/uRwp4to7BHwEyb
 CxKXQwehgHQFCs/TWg/Y8YubqzscV1M0mf+CngZO9yFegqb4R2JDFHsr13B1ti4mZvTmhuyD+YI
 csG94mI9WPrwvEtzKvQi9+4XjOaOIuiotciIX9dxBANWKwPYp3QSDd5KnkX/m0Dcce/PUZUJzRz
 Uybfrfk5wHUo7fzaULFL8o11H918U1s8+xEvVVzDbM0dbwHq8xGcPRp5f0r+hLk1Ma5VSFhieEr
 NagzF4k5opAJCjr7e1D5o9mzt5AUrz17FmQFWpq+pbokrK4qSrwyFzR0nBVc7hbniSnrWciKgzJ
 G+OyM3tdMybpAcc9z3WyRjf1xUxVINnx3qQ7DYOb5FnbWRmRYtNkz738O8YgDDOhFoLwUZgIF74
 xfG2gXswCztCQLg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8af05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LLimkM0tROmH98zYQz4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX9z/P+cJzt7ax
 +0nWd4kIE6kJRs+ioor1XnOUNvnh3Jfch+O1YCrYMTyPwdeMlAgXKQxDKLzO6qnB8j096sOJ4Zy
 mSlJPUe0yPrF4tJykxXmkGFdP1/Ch3M=
X-Proofpoint-GUID: xNBn_nEJ9cpp2UVS4-EbGpX2Fj9o3dTW
X-Proofpoint-ORIG-GUID: xNBn_nEJ9cpp2UVS4-EbGpX2Fj9o3dTW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX0ZGz/Hn48610
 +n7cHpoNwNnLfy6imF3R94uQhcKwH7fDuYe1kbpLritl/RReJMLuuE2uOxdQqjC/Jv2eiu0yhEj
 ZzoieHwXIuW4sgF/M3JOh9UoHfD5eo/Bzrmkc1mMRO7mK9GA6BB82m5kGnxz5NI826yPXsN3jfy
 rviLdRWCXsb3XXt0UhgsQJtnup3AiZY8+2UQ54EGsJZr79suHjSByg/TGyBDMm/wyQTrDA7lSY3
 L8eF3doDVi5zl95xbAHBFXbNezc8poNBG5yIdSOA9JJEYNEGF/Ep3H+ltTQMsRStgQ6ZdsSPCQ1
 vTkleszIGzTB/LMun5PK5MhhavkFD+TrzvJp/1TtmHExxkKgpOLTXD/uuZOg0Ih2o527bzliiXn
 i1EzdVGfsSs41RqByqfrme4y/ebtfzZEY7wNG7gIne4RTywJLLa8NAaFBVAapaB8k5XdaYZ2cwL
 1Qx7SC9/rRrZMMPhDXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210049

In preparation for the constification of configfs attributes, make the
existing instances of struct configfs_attribute in gpio-virtuser const
and use the new st_attrs_const field of struct config_item_type.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-virtuser.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 70ddccccc1c4064fa92d57e460c4d3a3e0e93725..bbf42b9d45957175ec06d47533888350890191d4 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1321,7 +1321,7 @@ gpio_virtuser_lookup_entry_config_transitory_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_virtuser_lookup_entry_config_, transitory);
 
-static struct configfs_attribute *gpio_virtuser_lookup_entry_config_attrs[] = {
+static const struct configfs_attribute *const gpio_virtuser_lookup_entry_config_attrs[] = {
 	&gpio_virtuser_lookup_entry_config_attr_key,
 	&gpio_virtuser_lookup_entry_config_attr_offset,
 	&gpio_virtuser_lookup_entry_config_attr_drive,
@@ -1571,7 +1571,7 @@ gpio_virtuser_device_config_live_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_virtuser_device_config_, live);
 
-static struct configfs_attribute *gpio_virtuser_device_config_attrs[] = {
+static const struct configfs_attribute *const gpio_virtuser_device_config_attrs[] = {
 	&gpio_virtuser_device_config_attr_dev_name,
 	&gpio_virtuser_device_config_attr_live,
 	NULL
@@ -1600,7 +1600,7 @@ configfs_item_operations gpio_virtuser_lookup_entry_config_item_ops = {
 static const struct
 config_item_type gpio_virtuser_lookup_entry_config_group_type = {
 	.ct_item_ops	= &gpio_virtuser_lookup_entry_config_item_ops,
-	.ct_attrs	= gpio_virtuser_lookup_entry_config_attrs,
+	.ct_attrs_const	= gpio_virtuser_lookup_entry_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1716,7 +1716,7 @@ static const struct configfs_group_operations gpio_virtuser_device_config_group_
 static const struct config_item_type gpio_virtuser_device_config_group_type = {
 	.ct_group_ops	= &gpio_virtuser_device_config_group_ops,
 	.ct_item_ops	= &gpio_virtuser_device_config_item_ops,
-	.ct_attrs	= gpio_virtuser_device_config_attrs,
+	.ct_attrs_const	= gpio_virtuser_device_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-gpio-virtuser-const-configfs-attrs-c0f57ed96884

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

