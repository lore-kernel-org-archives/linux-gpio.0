Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885878;
	b=EpZPxfdGCmO4Fj85uiEy8nMpNu15Kn7Tc3fYskD9FB4IQGsTrzbxjDtaYZPjNZSYzXQ5
	 GAOuzv4dPClodH4XLEkZR+x1s+tEQKvmMTWlpyVQl9KHj6Pux4GNrgiNeRtLD8Aahrs4m
	 eSGYGvA/xwiJBZ/9mTtDoaOxy18m2EEJZNuSeo+V3Ix8J9Ud2+0mpgV+B9IKndhmU0RyB
	 RikXML/wi5MQ6+7eSlEhIx81xJNvmL2wHfyW163fTQpTdHbH0Ciwz9NDGgssW9CZvVXu5
	 NLT5g8tl3/0vTLTyBezXqaNt2WT5XK8HwlkW/Mdei1fwkTXJAP/EG6xzDXaOhyhSwhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nBYAXaQCU5l+uQzIVTFnmiRDO5n3/EOCy+3rVyXrJ2A=;
	b=5kipbn1tB7h/mOpFMz5ZqwZvch1eXPbLNI/ofqnDM8QSzequlM8KTUx5ujBNLWlV4NSi
	 J8eMUbJZRILhIbVtGx+Z4vVj7SUg4kRb6onH2x6luDZV6hU+Ws6q/29Ekj1PfiLYwbPGq
	 S1n8MGT13g648M8a7koKUx6pkJm4CDV/Gr0/BMAcCHpRHGb2jwZx8inbo5ckrzsOn4K16
	 wJZaJB1lacUJJt9O6br8ibSjoJXqoCA+u4F0yPXLPoFR1SItE3hYih9OmCZtuB+cGoZsD
	 uy0WdcXNyCXLHO49y8zmN/G10N4zMF/SLoB10XLTqhXBQ/VkJama8hh56/bt9T7/1XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OfzZAkKU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZudnfUNk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461D3606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 13:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461D3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OfzZAkKU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZudnfUNk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tKUl4084474
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 13:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nBYAXaQCU5l+uQzIVTFnmi
	RDO5n3/EOCy+3rVyXrJ2A=; b=OfzZAkKUfD1eEmEaFTGr5lSyftY4+Uy9As+tC7
	zpawJRl1vVRjm/7pLMV1QW7s2FMN7T1miiqme/4eUS2GyLft4V70JzizNVyZHpAW
	a2tgcKkPkbGi4Kt0tPDgje3wiw4V6u/elpP0SzArFlAw3jk07UScv9bxNO24uE7Q
	ETDyKKaPusLXkFD2gIg3d7z+d1Gl+az6iXwBpyY7z26iM9KR8gCPg/tw2I3SvaFz
	+TqjAK4w61O3ng4CRES9ROUVHMKW2iJFRVkPjgkFYUHVsfPKs9/ZBfLl0uua7zVK
	F+mKKXVQ+NchuSPaMDrFNGz3A3Btf8tgaKiJAB8Z0ZaD1+kA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkrw8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 13:37:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so363815985a.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 05:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885876; x=1794490676; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nBYAXaQCU5l+uQzIVTFnmiRDO5n3/EOCy+3rVyXrJ2A=;
        b=ZudnfUNkP/gPANkCONqRm+qkO6Egf/iY7QCS2UJAsc0g3jEHLVTHUdg7cU+SDb12Io
         BaGSRZTtOyQy4v4v7/bKsY2PiTQW8ZUAOCCRbYUAQRMGVP1zHSvs5LlcB709eV4z0sAt
         cahTVUvpiIth13JlJAko6k5ct8Gq8wvoKpTSa+BzUDUCG6ZQt9Hn3w/o8TCDeFBz/U9w
         mbialWRNGFh8zgnh6bt9qJJO3MmXLBOUDoQlpiEIz86269biB64IBwoQ8AEXD4YsHn+y
         lXzBYcWnrDizl8zLnjxDhfGLII0oWbQl4Svj8sVn3HC6Oa2Fk9GU/OMr4a+q7gJTYtvE
         Exzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885877; x=1794490677;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nBYAXaQCU5l+uQzIVTFnmiRDO5n3/EOCy+3rVyXrJ2A=;
        b=kHKH8qc/6AOFLu4LU7hBwewNO9WCIlgORJ9u0rVsRsrHAiP7xrbvj4C/J+nNRLNRH4
         5cXJRAQAQwKOBhSl74D/Lgk2Vd4RdTlEsDblwB0JnoJgmA36uv5m1cPdfkvD/r/urpFq
         CVH+Z0z8q7pkDzXRmSvsGfIFsxynkPeZ+OelSwt6JI6XgqoMoaTN5i+MjFipOpI9+pFq
         hWOpRj2ARKp/kYzN9g3NiXvCEkLKugB643UlvDxfGcA+4QsnyM4ruXu94AcYlFGUhqOz
         7+FNumKNqlwjrkopr9qgNrnF/ICFD2fHg8JW82v0y6SE4T2PNegN2xBxALsTpOOFCPKX
         hsCw==
X-Gm-Message-State: APuU4Z+GvOD4wVtFIXPSVjPU7N+aUabg+ejwCBLYhWxdMD01vT0RPs93
	rcT/asXUKgUSD1v1i0+KGedZ8cDF790UpEWIXPjlOh+dpusQ9MvAQzPFguvDVCV9IS2ilnA0L5g
	dxlCVYUWF7ZeFRUa5q9DmQPlrFiTHqcnk/HoWS+oZ2N/2lAn47F6zUoxzC4YQQVFdAimqW8Uh
X-Gm-Gg: AYBFou2+vtZxSl3JIbjC06peZLVnvI0KwTgJzr6Tvnm+2KNqMrfvxD/qxmpdkcE90yz
	3ztXmtYnCeFZpqUTaJasVXhzfo3xSEIhoRZtT992fIHR9f4TC60f/lV75/JxQX9tWs+XlcwJymZ
	h1IPt52ziQulrQXGVWvembM/mwTXPhp3JD02reHll/353kkWWPfecGLxfWZ+T5qaA+CEkyACG2a
	ZiMa+Hl4vcYqAdqaytMU/kJ1tZ1foAx1uWjHjlsGzx88Up5o1WdTM6ltoHz5y9TX0P9udojArur
	m310sy9zEZTACbkDTPeR+P05sBUceWxTek5PrKMN8cgR+/xK78pNGLkSWc8OGphKlzXAK38nA3s
	nppBMC3CqnogChfNl1Dp4UvM7Z81AIKvgG/lP/spcIWBeIoKyQvm1yaVPVwP3+X5OXE0dnwQpRE
	g5mQ==
X-Received: by 2002:a05:620a:444f:b0:93f:2158:9c4a with SMTP id af79cd13be357-94421711b08mr2944063685a.15.1793885876601;
        Thu, 05 Nov 2026 05:37:56 -0800 (PST)
X-Received: by 2002:a05:620a:444f:b0:93f:2158:9c4a with SMTP id af79cd13be357-94421711b08mr2944060185a.15.1793885876196;
        Thu, 05 Nov 2026 05:37:56 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38c26eesm846167e87.55.2026.11.05.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:37:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 14:37:52 +0100
Subject: [PATCH] gpio: of: fix potential misconfiguration of hogged lines
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
Message-Id: <20261105-gpiolib-of-hog-uninitialized-v1-1-fcaeaccefab6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK+G7GoC/x3MQQqDMBAF0KvIrDuQES20VykuopnED5JIYkUU7
 97Q5du8i4pmaKF3c1HWHQUpVsijoWm2MSjDVVNr2qeI6TmsSAtGTp7nFPgbEbHBLjjVsZH+5W0
 npnOearFm9Tj+/We47x9yeiNnbgAAAA==
X-Change-ID: 20261105-gpiolib-of-hog-uninitialized-0159fa4104df
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1541;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bt5WAnktT/7z4dpWnfgI0LPlqoaHeMaSqU7OOV98urE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7IayGr6XLD2TmtYggAWFsuPVUX5xi9oBIRZoU
 m/TWN1Ci1SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyGsgAKCRAFnS7L/zaE
 wz8vD/9roQsE0oxTdin62mb4TKCj27aEGH4Zu66ck3gRawTNqF1d54P18f4PaM2hBp2mKKBQV2q
 W2nUcO3jXdtOhp8o5EACR9OoF3ajTJ8czJbRCcjg9v5uAN69hjn8a8PQL9+x/xMc6Mx3/FfeuuV
 G/eJQK4uCJgeZcQ8ef+XZ3of9ExJQQm3TsflmaYzuJg4p6U7hO4v7vds4RPdlPvWza1igVa/bha
 lmViSg9DpHxPP61M3nrwMDjMfSHJuyitu/TkL1cV4R1ADYkqPAeKwOKIzlClm9vqTs+E10XK83T
 oq/2Nd3HW4dltcJzDkDmSFMOTUOev5hnZL6o1eUujy2fy094H5lJqdE1WdnraVG2OkSfJEEuwyR
 Ad0oZPlogbWClqtKyTVMNRaupLKUcgF+KAG0M34zcGu+HK+cQ3LyWRNmAF94c31D1I3UFiFi2WZ
 TBt7HNFjwaPOUSY0bgD1pbPy9kvwUPUaDEGlJzDfNEBk4j3UzoW3DZvTzR8ywgxmtcx3PIBRFpR
 eUv6wQkAWt2RH4TKn58F5Qx/13CAyGXvcGg0MzN89L6PkdMh3rwI4l4b+dmu/FixlPqRrgYbmgb
 um+IdvCqe9mdUD8md5PBsDTbeJ5OmAMKcyjPpI/GNH1Yuvw0YNqs/nbXKstz7utcutB8mSs1e9s
 7aTgD55njnEOdGQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfXzLqECfjXvifN
 R9+ANeXY8kcFI5+0yg9X8WIt7Xt/Ln0q7gSQihw3JFLTA5Z+eF5FSIq0L1bmuAjxtc/WK4WkdiW
 6CcEPXjo8BJZK6uF2NGJzf4FF8sM23OkmXkMLrQ6YMl/BU60/l1B4RKNf9Bpd/TS1q0kBmmh8Pi
 foxUV8aIgoam3mXTKYKYzZ6osRzdhoJokYnVAW3lm3lykmSvrwz65DmlVxNx3csX0hTcD0xkYzk
 we2Vu1PY2LbZkYGPCit5RkWPi5kdniBqRawir+M/OVcA01oOB5IGNuMEMjScf5vzdjE9edBWchw
 VYCatFfWMcQxCC0KUIbgAfVfuErTR02xkz05LBA/Zya6yyL44NP6JeZPmUuEGFD+N8K5Xn6F7he
 vBedoGg5brJAsQZdNtJ3SwYhR83VD8BL0xtVoDhYA1mQ93+MR25Xkaa9cG0ZZWroQvJN0828AWk
 LfJPrRyaOfOW/8h4ygg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX3QXYbcqlB8az
 +omYEf8JJ104De5+mmMbXrFRzOlQaqp3abqLygRuCq+228RCXyp7aWtpsilto7xW+lKU3ySAm0w
 6/d3uqcYoYNtbSfjLeZ6bF9j7TnAqNE=
X-Proofpoint-ORIG-GUID: c0Y1e-rWTQLagWGCJ3opPm3xMShIycH0
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec86b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pdO2fDfkyHolN64SMbIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: c0Y1e-rWTQLagWGCJ3opPm3xMShIycH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050054

In of_gpiochip_get_lflags() the local variable xlate_flags is declared
without being initialized before its address is passed to
of_xlate_and_get_gpiod_flags() when processing a devicetree gpio-hog
child node. If a driver uses an of_xlate() callback that doesn't update
the flags argument (like gpiochip_fwd_delay_of_xlate()) we'll end up
passing that uninitialized value to of_convert_gpio_flags(), potentially
misconfiguring the hogged GPIO.

Initialize xlate_flags to 0.

Cc: stable@vger.kernel.org
Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Closes: https://sashiko.dev/#/bug/linux-2bb44847-fd6e-406c-878d-9739da2cb8b5
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 25b97109f97ea88c83c744e496e24263ee71b8bb..8bc4562608e1141983300132b90758ce68d7625d 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -753,7 +753,7 @@ int of_gpiochip_get_lflags(struct gpio_chip *chip,
 			   struct fwnode_reference_args *gpiospec,
 			   unsigned long *lflags)
 {
-	enum of_gpio_flags xlate_flags;
+	enum of_gpio_flags xlate_flags = 0;
 	struct of_phandle_args args;
 	struct gpio_desc *desc;
 

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpiolib-of-hog-uninitialized-0159fa4104df

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

