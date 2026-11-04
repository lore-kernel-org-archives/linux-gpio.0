Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788704;
	b=KEejlAMlBlkU7xrDddWYX14I7XgQ+lB24M3HRZD163mhAE9vLLCgLYdkFU9/7YcXEn4f
	 vxCRLZm8W6HJT+vRqcv07k8VmhMkAzRIA84morY7rcLGR2QYJDoGWQl639nincDigmMlH
	 a9WfH7jG/LRjINOQfTLK+Hc6Bm1P/ufxqk6wcAz1stpdxJSrpznHV+N8CBabr+VwT6B6Q
	 X9eESBXFRShnAbGEne0wu8dFBJzRTWCIW5ghJPDyWvotr2+/h1EXORXXYbJ0f3eEH4UPi
	 bHiVy0OTPklHto9yvIxwuKonzLQFhB14bqKiMSXY8AxNhIS3i3999E0ip2gKLrsrBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7jmLaa2Ndelru6cWeVd5V82e24xRVMrLml2FV29QRFE=;
	b=sxqnCikg5rY/iTArdNnCMF0LjjXb+biXhvTSwI5ELTc1ttL1RsxjOdK/CRkF2dIr/zGf
	 rq0ay6T8vMIHMlP1qntjdC5ZrezH89A5d0wtMtyrG/5oPQSf1cv7Y5rMVcEoa8nWvroLS
	 1BxCF42c0gsRaB7rymZhNlMwaZGD/G7BuFBJ9ZIPp57ZkyclQ90QZzcc2KoLv2zvYb09l
	 SAbKX/aey0OQrNPhbZCZSkefYKq1GNZtNKUk6AbBA233hJS6aqSDl/k/AY/Q+izcLNCMd
	 3Z2eOjn/gLUahBOeOfAGsQ8XQRLndMR8M7O2Tv4D1Uv3bXeEA9vTOPVH9UxORf5z+/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bls0judm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kplOW5Nd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CA6606EE92
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 10:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5CA6606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bls0judm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kplOW5Nd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A49bS3B2022269
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 10:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jmLaa2Ndelru6cWeVd5V82e24xRVMrLml2FV29QRFE=; b=bls0judmASkZ8409
	TRfcUw/jNnwXhwf4YZVlPCAcgxuT3g1r8+Lm5NjyGmzWd/E683i4b7DqFgqLgKCS
	xkeJNEpCHTAwnqrGyPOusWcDuDILbhPvfIOGJElHxvH9GkQe7qEIIsGWdu822dHF
	xJ3uVLuiI9rkwttwDRuRDpHFXRDGqPKEKgIo/NPsSxN+4IEgIQAXvACSTBcCs+pS
	+2RmW2Yv+ujLvv6tK3NG29iU+VGOewjLmDmV/52uSede+x60EzxlX6ekc4GN953z
	1PxAiNDFziB2ARaFwn736fOFcROFMSyPe+QNXPoQzxchcMiX1/IIq4TDjO1KcEem
	nG0eow==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284r7nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 10:38:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc3a482af7so434822137.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 02:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788702; x=1794393502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jmLaa2Ndelru6cWeVd5V82e24xRVMrLml2FV29QRFE=;
        b=kplOW5NdaahtWWhDAm5IilpMStJTPQTJcuZviLDLTyALdl6522mWngri408unVNH0C
         9cMHiSx9YfzE+Bqr/59TtLrb6VLzb3b9e0V/aXZyWrRBaNB3KCjNXNl458ozRfzCJ+FE
         EcJKh0h3VlSwoHErPDk3gs9T1r6HSiMnh1t5+2+NSQ2cPwxKiUvZGSNAbITgeYpuw+ga
         jQ1mC5Rhtx0FLfL+0V/ShPaI8zWAgZTE0NT8isQzKue7Kx3t4FIbXsmr0GW2CrxzxlU8
         WJv83x731Jii1OYp7lnfF4ZXXz5ssV1B1BytBH1YC2MVUPHXIfJ62eJiXCPa5QnH/m4V
         YeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788702; x=1794393502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jmLaa2Ndelru6cWeVd5V82e24xRVMrLml2FV29QRFE=;
        b=gfDgyo21Lzihqw/Z2XWP+dWwqBViVN8od8JkHfHGgIxApuxutxwLmmZoLdAQWmgmxB
         yScOwn8f6/LLASU7ZN7hpivNwFYZ90KsSVoydKK0E61INL6DJcYNDvPT9Sr3NJC97fud
         KTowQkghleIx4ileQHgPtOnrLSwbt/Wh/ThWOgFrXN8E9hFt2haL0Bk6WI/FGq7fVICT
         O+o4BEDp21R5+wIyajsGx9oz/Rz8hFurpWjYuIjp8TUUxsa3iuBB8boJHJ5B73dJ4Qpx
         d7xDYYtfW5R9k8YWYNBuY/Wd+oLyD0z11LHAUBo6PZwGCR4Feda9j6StwA+yOOpLDc2Z
         Pm4g==
X-Forwarded-Encrypted: i=1; AKwUvByxoj5rXw//4ZfZz41KrLYsbGgjePI/aVGHxqM4bcUWSEN3xKIWTg4mXek5Q/AhQvV3JWFmT7qH5hh1@vger.kernel.org
X-Gm-Message-State: APuU4Z+IOaGcte1L/xS2TDr18xewaYkELXT8wd6ljXye304dALhg4ZIk
	LCIwgLnMSbCYl0DUup0L/YmW5Z4kOjWUIrFCfpogUA73InDeBrynw4dNL31aoZ3FR7iBht6hYUU
	sDM6ektc4ef0pH3gGnFHJc9Nog1Fa8BF8cbP4UbJzUrk2EzrMMuUmKVLObedMp2P4
X-Gm-Gg: AYBFou06j80DHrqsGfDI+hM07CsPd0DWajbo4BRy/2e/6tZ3ioCh11FefBfqDp9Z8MV
	7zoBivSh3G/BOhxCE5yT4nsyY4NrdRsndxvqdwdAmpJyyer1jmgxLG/BNyzraMaJFWgaZMpDjPG
	KCcYvP646venflu4qILici6FwmJxSTm+DDQEXzItpcB6mEZFPsL6G8z+9OfFqcnrjMG52uoKyxU
	RyJ9PbH4gxIc3g28TjdZ5OIuqwrwS30b85eoeQyE/L3tXFsO3AvjRyVQwlrh8uPc0LMHEh2bSqH
	b4jn7xOG/p5pgsXGhzRHEvsVrlu0TQ1BWbGSVSscLmcEkZOlmkMrgi8jPdNXTFjYD0qkC6GG4PR
	hlY1Aibkyw0aVx6xYOFzrSzaD+EAVd735dSwPuBSlv5s3Hez6KT3ebMLsV6CTcRAqHpVwxjZ5It
	PS8A==
X-Received: by 2002:a05:6102:e09:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d07279aec4mr6832148137.35.1793788701891;
        Wed, 04 Nov 2026 02:38:21 -0800 (PST)
X-Received: by 2002:a05:6102:e09:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d07279aec4mr6832139137.35.1793788701298;
        Wed, 04 Nov 2026 02:38:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:12 +0100
Subject: [PATCH v11 5/5] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-5-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10463;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vfpt8vKe1i7wgPJEPc6hSex7r3YX4WW18es7Af3sNRg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsSMXSqTVxNEZZ3KG4nknm+Lp9xvrRdDSbEn
 R9b8dX+VASJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 wwvsEACg4hgWMKnEXYIV0sNiEvsqBKdhJ8/qg+yDn0ULFSyUZ0glJWriZs24ODGP1MG3syeQZXi
 iPWp538HPKeFrTdQTFrLcF7y7by9Aaxj/imZ/Xd1AoaTGyvhObjlwTLVBQU5tDIxN8Rf/8HyySB
 T6zFLTh78C6ZwmJGFQlzL/vgT6up4RS/Z+PRZtFrYHAMVRr84ALgFoG9oOlzri9CG1cXtLhEmK8
 hPZb4sCztoh82qGeSbUxcrECwSQCZEGeNkyVtByEgQLvwimDPf88hU/HE7gypV8UC38mTWQlbrV
 A8AapWLqpwT9CSw6IuodMYYcBHvf6OMLxgFIYGBXvUeezF8nmj/3XUOgLgr2BKh4PRSoXZUqvJb
 SMlUNY5uctKLtMDxBM/JntaUueLFjjNrSw4yZJDkqgeRYWLYfNLCGRwQ62CquyLoclMEHCSk96S
 G68ocsVF+NtOda+iz5sCaq75D4172e7i8PV1Lmv1koW5uQSO1OoaPhJA2F4kER0DW+eIwffEnml
 X1qxwz7XfU+d6ImmNg/Q8kb4sb72hOi5jLKVkpFbfnWbQlKOkZ4H6f3S4F6NDXKnABV75k7vnZ/
 h7uvhpedqw1/VjLMWPIfTs0ewQukx8ZM1Bip+GVPXbICW71XfOxa7pkvRA0ygjmf2mIRtGhSf9O
 3ffer21HR+U7mBw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb0b1e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Kgpy9_VVMJhbcq1J-EAA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: n1p-3KHXIUgEUOIx2_JerGHsp9BWRNm5
X-Proofpoint-GUID: n1p-3KHXIUgEUOIx2_JerGHsp9BWRNm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX1mtpSh2PdC6O
 t2V/znWCIKL1dnvt634KGm3qigiC1OxbGxqAaHs0Q1lh614O7F9FN+ymuw+hxViGd4awSZo5PPk
 CBfvT7bVcozXWALk0gp+FgiSZ3AOnG6GskpZt5vncsEuTqSPh4PDw7uNvCakk44qPJoXsprIXzN
 bSXKWA8fv53tgBZ0b0HKMePEQpe2lI16PYOjFZ7wPUBB6k5kGRpT5wBIutwdWva1P5VUrbG09Pw
 0cGpUbxcFWH9dJkyQncgDU1QjI083EW21lqkeN0/hvLh9zVhK9pwO0bJizhIeprSA1X61ghPKg1
 6E8FphAccA2wn9ecz9x9ncfrYF9HAND5mZna+x0hA/oGqeM2sd+jOOBOJH0aFSzmlmSlMRe3yGf
 JOZXw3IQDiVeYiXveAvQFc1l7CAYVelSnFEkdXw757qt3wykmB4UwZcR2LlXgkwF58MzNJKtMrk
 PINvEYJlxAhgigCU3ZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX2LeMF7Qj8b8P
 EZ0r/G213mQkmov1adHURwkrjKUTsM2pA9lYlXHKjzjMxrLRB0Tdcgqe0exabJ6idrn+/Dlqmc4
 nUfaYuTd3ozY+j5iZiFzzK3Fz6zWCKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040042

Automated management of shared GPIOs only allows to request shared pins
when they're assigned to a real struct device. Firmware node, no-device
lookup currently isn't supported and can't be because we're using
platform lookup tables to point the callers to the shared proxy GPIO
controllers.

Rework the GPIO sharing by using dummy software nodes assigned to the
proxy devices which allow us - once the correct struct gpio_shared_ref
is found - to find the target GPIO device by its firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 145 +++++++++++++++++++++---------------------
 drivers/gpio/gpiolib-shared.h |  15 ++---
 drivers/gpio/gpiolib.c        |  20 +-----
 3 files changed, 82 insertions(+), 98 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 7270a861bb5d787d41b7e2f055d707415774256f..cc13ec1e674282bf26e5a59fe110b5334a72f79f 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,11 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	/* Protects the auxiliary device struct and the lookup table. */
+	/* Protects the auxiliary device struct and fwnode. */
 	struct mutex lock;
-	struct lock_class_key lock_key;
 	struct auxiliary_device *proxy_dev;
-	struct gpiod_lookup_table *lookup;
+	struct fwnode_handle *proxy_fwnode;
+	struct lock_class_key lock_key;
 	bool is_reset_gpio;
 };
 
@@ -303,56 +303,76 @@ static int gpio_shared_of_scan(void)
 
 static void gpio_shared_proxy_dev_release(struct device *dev)
 {
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct auxiliary_device *proxy = to_auxiliary_dev(dev);
 
-	ida_free(&gpio_shared_ida, adev->id);
-	kfree(adev);
+	ida_free(&gpio_shared_ida, proxy->id);
+	kfree(proxy);
 }
 
 static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev;
+	struct property_entry properties = { };
+	struct auxiliary_device *proxy;
+	struct fwnode_handle *swnode;
+	struct device *dev;
 	int ret, id;
 
-	adev = kzalloc_obj(*adev);
-	if (!adev)
+	proxy = kzalloc_obj(*proxy);
+	if (!proxy)
 		return -ENOMEM;
 
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
-		kfree(adev);
-		return id;
+		ret = id;
+		goto err_free_proxy;
 	}
 
-	adev->id = id;
-	adev->name = "proxy";
-	adev->dev.parent = gdev->dev.parent;
-	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_proxy_dev_release;
+	dev = &proxy->dev;
+	proxy->id = id;
+	proxy->name = "proxy";
+	dev->parent = gdev->dev.parent;
+	dev->platform_data = entry;
+	dev->release = gpio_shared_proxy_dev_release;
 
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		ida_free(&gpio_shared_ida, id);
-		kfree(adev);
+	ret = auxiliary_device_init(proxy);
+	if (ret)
+		goto err_free_ida;
+
+	swnode = fwnode_create_software_node(&properties, NULL);
+	if (IS_ERR(swnode)) {
+		ret = PTR_ERR(swnode);
+		auxiliary_device_uninit(proxy);
 		return ret;
 	}
 
-	ret = auxiliary_device_add(adev);
+	set_secondary_fwnode(dev, swnode);
+
+	ret = auxiliary_device_add(proxy);
 	if (ret) {
-		auxiliary_device_uninit(adev);
+		set_secondary_fwnode(dev, NULL);
+		fwnode_remove_software_node(swnode);
+		auxiliary_device_uninit(proxy);
 		return ret;
 	}
 
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
-		 dev_name(&adev->dev), gpio_device_get_label(gdev));
+		 dev_name(&proxy->dev), gpio_device_get_label(gdev));
 
 	scoped_guard(mutex, &ref->lock) {
-		ref->proxy_dev = adev;
+		ref->proxy_dev = proxy;
+		ref->proxy_fwnode = swnode;
 	}
 
 	return 0;
+
+err_free_ida:
+	ida_free(&gpio_shared_ida, id);
+err_free_proxy:
+	kfree(proxy);
+
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_RESET_GPIO)
@@ -457,23 +477,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 }
 #endif /* CONFIG_RESET_GPIO */
 
-int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags)
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	const char *dev_id;
-
-	if (!consumer)
-		return -EOPNOTSUPP;
-
-	dev_id = dev_name(consumer);
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
-			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
+			if (!ref->fwnode && consumer &&
+			    device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
 			} else if (fwnode != ref->fwnode) {
@@ -484,54 +500,48 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) != 0))
 				continue;
 
-			/* We've already done that on a previous request. */
-			if (ref->lookup)
-				return 0;
-
-			char *key __free(kfree) =
-				kasprintf(GFP_KERNEL,
-					  KBUILD_MODNAME ".proxy.%u",
-					  ref->proxy_dev->id);
-			if (!key)
-				return -ENOMEM;
-
-			struct gpiod_lookup_table *lookup __free(kfree) =
-				kzalloc_flex(*lookup, table, 2);
-			if (!lookup)
-				return -ENOMEM;
-
-			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
-				 dev_id, key, ref->con_id ?: "none");
-
-			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
-			if (!lookup->dev_id)
-				return -ENOMEM;
-
-			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
-						       ref->con_id, lflags);
+			if (!ref->proxy_fwnode)
+				/*
+				 * There's a matching shared reference but the
+				 * associated auxiliary device has not been
+				 * created yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			ref->lookup = no_free_ptr(lookup);
-			gpiod_add_lookup_table(ref->lookup);
+			struct gpio_device *gdev __free(gpio_device_put) =
+					gpio_device_find_by_fwnode(ref->proxy_fwnode);
+			if (!gdev)
+				/*
+				 * There's a matching shared reference but the
+				 * associated GPIO controller has not been
+				 * registered yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			return 0;
+			return gpio_device_get_desc(gdev, 0);
 		}
 	}
 
 	/* We warn here because this can only happen if the programmer borked. */
 	WARN_ON(1);
-	return -ENOENT;
+	return ERR_PTR(-ENOENT);
 }
 
 static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
 	struct auxiliary_device *proxy;
+	struct fwnode_handle *swnode;
 
 	scoped_guard(mutex, &ref->lock) {
 		proxy = ref->proxy_dev;
+		swnode = ref->proxy_fwnode;
 		ref->proxy_dev = NULL;
+		ref->proxy_fwnode = NULL;
 	}
 
 	auxiliary_device_delete(proxy);
+	set_secondary_fwnode(&proxy->dev, NULL);
+	fwnode_remove_software_node(swnode);
 	auxiliary_device_uninit(proxy);
 }
 
@@ -543,17 +553,8 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	scoped_guard(mutex, &entry->lock)
 		gpiod_free_commit(&gdev->descs[entry->offset]);
 
-	list_for_each_entry(ref, &entry->refs, list) {
-		if (ref->lookup) {
-			gpiod_remove_lookup_table(ref->lookup);
-			kfree(ref->lookup->table[0].key);
-			kfree(ref->lookup->dev_id);
-			kfree(ref->lookup);
-			ref->lookup = NULL;
-		}
-
+	list_for_each_entry(ref, &entry->refs, list)
 		gpio_shared_remove_proxy_dev(ref);
-	}
 }
 
 static int gpio_shared_setup_entry(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aafd087df267a4a32732ccc03af38e..27fd2a40c5cb77a19c258e3fbf429d3f6e7d4b32 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -14,9 +14,9 @@ struct fwnode_handle;
 
 int gpiochip_setup_shared(struct gpio_chip *gc);
 void gpio_device_teardown_shared(struct gpio_device *gdev);
-int gpio_shared_add_proxy_lookup(struct device *consumer,
-				 struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags);
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id);
 
 #else
 
@@ -27,12 +27,11 @@ static inline int gpiochip_setup_shared(struct gpio_chip *gc)
 
 static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
 
-static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
-					       struct fwnode_handle *fwnode,
-					       const char *con_id,
-					       unsigned long lflags)
+static inline struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
-	return 0;
+	return NULL;
 }
 
 #endif /* CONFIG_GPIO_SHARED */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..402de2e106f19fd110d67eeecd3c07794b7a5cdd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4841,24 +4841,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	scoped_guard(srcu, &gpio_devices_srcu) {
 		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
 					   &flags, &lookupflags);
-		if (!IS_ERR_OR_NULL(desc) &&
-		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
-			/*
-			 * We're dealing with a GPIO shared by multiple
-			 * consumers. This is the moment to add the machine
-			 * lookup table for the proxy device as previously
-			 * we only knew the consumer's fwnode.
-			 */
-			ret = gpio_shared_add_proxy_lookup(consumer, fwnode,
-							   con_id, lookupflags);
-			if (ret)
-				return ERR_PTR(ret);
-
-			/* Trigger platform lookup for shared GPIO proxy. */
-			desc = ERR_PTR(-ENOENT);
-			/* Trigger it even for fwnode-only gpiod_get(). */
-			platform_lookup_allowed = true;
-		}
+		if (!IS_ERR_OR_NULL(desc) && test_bit(GPIOD_FLAG_SHARED, &desc->flags))
+			desc = gpio_shared_get_proxy(consumer, fwnode, con_id);
 
 		if (gpiod_not_found(desc) && platform_lookup_allowed) {
 			/*

-- 
2.47.3

