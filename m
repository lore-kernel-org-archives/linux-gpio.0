Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198694;
	b=17Cmn6eE9aZyCxwiGeTQwhKJapXdrmRr4k82m5oyHGXoHGKBEqbJ4KJ6McyNhRgIiSPJ
	 g+LxMgPjLAlmtDPr8amdCF1n3fSKu+gl9t42im7Qe3J8vYMsD6Lwz7iLYZANILYuW9yD1
	 nv8bYKrEDBEQjZyasTUmM3F1M8IemJVBN+j4LADDgpETyuO5is5BiMobo3oV1DESu/LFt
	 eDttpJIlYbP89qNAXASgNY+IILDsnzRfViKtEl2d0VbOO5lfQ6X4plVkrQoSze7L+SBao
	 skZOlSTiunEIYIq+hfv0SwMSEPLwxa7c0XgiK/1QX0OgfUM96g1Rxjtg63Lq4+TtKBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
	b=N2YJ3k8Q4OoI8OKrS8MVA8+bW5qC+ctLDD/G+8dVnmAyOdqsHeWQ/hgkBOLA9K/Gw962
	 bjcantG7DmeZ6o7MAUSg1r+p5t+NGbiP+cN71eS2UWTPr5Jty4EPVmwn/F3ulWlt/KV8K
	 cBWERt4BHGsnpjS99XsKomh2XfjgV2GlixdC354PxCgTRnqyQX0R9D5T6jYmD00yUSQLX
	 dqHC4coBY0zbq0+miG3X+KMWXvSLA13RHvBo/uW7/E81eWKrt5zYnQ22MW6g5ojgR9uM/
	 q5/EUTxlwOU4tVtfdf3RNHlTFrOG6PL0dC8TGpOX/YxFt/1kTJVINCm0L+tgWRR4Lzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUXSoEXk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAiW+Ef2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F2560A2633
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94F2560A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUXSoEXk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAiW+Ef2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIDGo718251
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=; b=SUXSoEXk+AQ4hcxA
	5xBltn4jfdrM1kfjECKYRAfrUNPNqs6g7VnSTVh3eMx67EdjPolxXBYklJe3iREk
	l3SN6451AEqT1tDo83ktTnM9yu+7Xm3AUIsS/LnoN+FSiN2R5m4+7gjnUNwh/p1A
	3t4TFyeDFPgdNVhBQ13NHwm/l9bskAtamsqzUBiH6kF79raXbKdqxb2SwOEZ3vaB
	29Ln0Alh/KumIRMbKEHw7SCXd/EVwG7o5TBWtIwi03dQP3ZfhxTCwWQdaEIuaM+W
	9iMVyP36X9iBYikqVEPUlZn7upSChNNriySE3lQFMAwghkvLwimR970j8dz7mvzq
	1xIzvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgc8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso186757785a.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198692; x=1793803492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
        b=IAiW+Ef2g5ywuswuFIyWo3Q8xqHhikYmVIrL7Jjc++6of1aJDq07ZOf9sq6WZTEWFp
         QgzKp4Ltcw965PrDI0nIips0Dw7nFYbRrrJj9CFIeS5odwPrHOODf0MCStWGeFqfCfbf
         RCEisyXB033Ul0CoSpln8uyra6/trrzxhe5jvW1u8Twfd1V3BKHDhF3mwAc986XTMPE9
         VvQORv68VPwc6pd/wGUrzvvz7m86u6AJA5mj/0TmENE8Uzxa6AA8qurmx5GAZKZxNeM8
         Oe65emowCEczYDUZDywbcsBrj05JDrld+lI7XZXoboZ5mG+oVribz7Nhbx753deiIT2e
         rT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198692; x=1793803492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
        b=w/lwvwJjAXYjwzL6pbgPsiHHeEl87YPHU+6yeNXPIIr0XvQ6kJZDpErWA6+P7xhrlt
         clfP2w6rksaqmTmIa9XXzstXPYwdzDaCgwO5ORogJhQ2vVOxSMNYzT+gClNPpsKLGx5y
         s6LAyNupmjZ8YxfC+Ul8F778IrdzhoiCUkhrYgiDOKwPesH46SRyCgTaeF6Fy2qlAtQf
         FmIK43AObDxH7KEJMwXmm418f87debecWbawIhvSVlgCSGkWwmztmVARc3GNmycwW40K
         cfw6CXF45lH8ADHrt6dp5qyUotaNn9PNDN6CM72kXrMeSl4+K0uc2rZ7wWPNKlkVMeE2
         Yvrw==
X-Forwarded-Encrypted: i=1; AKwUvBx3oVoY/E++OYE/ynahopKAsnp5hQZrbipaKIDhEE6iQXntrbc2J6Mg1VeoO1qjsFL5+WGapX/voEPw@vger.kernel.org
X-Gm-Message-State: AFq9FYI+DofXeg/e5uwcSoZ3V9ZLdR6dRwGQQgZUIl15ivdLgAE2x0lw
	C5d7kmNbArLTaB2Km5EXE9mPfkVJCuoppviABTdBKpQBGeBAWdgt8ROSJ7yddI2TUWZS52VKBg1
	eO1SaV5RJfIyJQ7u0chsFKlTBpyDntWfJkcwWraL206Me2d6qtiqiQOjVX6p5a7Pq
X-Gm-Gg: AYBFou2TPt/tIYObRZZpyoosJcyl0syXwkdpvbDgGfSBZ++o96V4AD6BIzPjikrpiBy
	YrUc5GOLiQEnjx2xdAWvPwmcyTPk0+eiIO0lXNwP7JCQmt3966ojdRF3ibOtKJf3RdtJHcMYzfS
	EJPMhGMc/Q1oD6WYcWIAXR5mIXZAaQieiUtayJIVGgKNtSLzufhf4hOnYjvI1xjO9pfbcfBFcpH
	2hGkswcxBlWwuRgBBNHkGz/KOY4cOovjQmczy83WxOToSId5J92Ncq9s7BAcg5zqP0uZTWKRP3J
	5hDO5fckqHCX1dVAz4C4fJBvqP/DjpMOKelvKAiAEc/47dIAZRTT9v78I+GxaeK9pWG79dAU1Ln
	oALnobsmsGS/CKD5B+iFf8uruohzNWvVwJnLD5+o5DzxTBZCQMeATNMh1Nq3yOeI2DQB2QOrhnt
	zisw==
X-Received: by 2002:a05:620a:444a:b0:93a:1b82:4962 with SMTP id af79cd13be357-94408cbfd49mr368342785a.47.1793198691689;
        Wed, 28 Oct 2026 07:44:51 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:93a:1b82:4962 with SMTP id af79cd13be357-94408cbfd49mr368337685a.47.1793198691145;
        Wed, 28 Oct 2026 07:44:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:40 +0100
Subject: [PATCH v7 4/5] gpio: shared: detach the proxy device from struct
 gpio_shared_ref
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-4-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6332;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AK3+tDXO+muQ4ZCcxhm/oDc0hzzPO4mlQf5U9mOOPuU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpagW7Ew6MtnX6EuHyMs782Syq52UJW0OTDz
 kZ3dDY04GyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWgAKCRAFnS7L/zaE
 w0v+D/4tKI5ddWhk2UPaWxw7CpNKqXge+dMm88JLniEoGQaiDcmzNejGr2c5Lq4hK2lvzZXiMQH
 3hTDfMSTALOK+sqmExT05BZcQ2VschC8EQfuPYp9pzuQANKSxNO9e+danc4FvlU89j5q9q+DwD8
 j1hmVYJxZqqeRSRotmGyT438sY0LD4kjWbkHzJx/644r0UqcqXQCON6NVJcN5mBw1BcIHU/mjb+
 6UoJD/e2weDDNkL6vhGs7M1Bpen8flkeVXS/dcuvWzyuGFjeFJEzGgT/8Ah4xFIZcU5tWD+UwGT
 +KVnuoNlvpdF2DXBSuhK/whpiHtFTx+QrN/ZICCt1AE+uOfBw2L2bcC+HD0yqeIU9aaj7x1sLVc
 mNkW0+wgWLNwf8Kb/Jn052sCqNYXu6F3907MquxCjOXbC5cgJae/F/i+3TcHDzw0xQLTQOruxAs
 oVqqg+E5iNHfoRWZ75AnIr7/SybdfKna0pOUNndQdg6S4hPAIN2ALplgzGMOGnRuPeoO5MHlO7y
 YQr7YRt5Ckot07RSbBzWfsc3vgpuVqIiTOvGyVJN0mRtKNU5qY0EtzATVPdmRcne8BhOw3OVXYE
 gZo+UXmFn0Cxs296TPc1QAvqeKWPmpAjjYIBzX3kD5r8K8do/uq2iYQYYwJNgU3XrPAYBz8r5gK
 +gTeFlezP4ZGBNg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX2Xci59fuc6P8
 GcueQTPdISUmxmMd0d4XuaE72fRRR17Ha1xPUtWMem2HJo0kQfHxQmPDb/c4JfBqkFpH75iMejt
 uPjQ8habaB9pk3SqAHhe2Mhs9O1jxuh37NmuakrWly7YEccYGtQqeOaPbDtqJMhCI+CySd+hQUc
 oEukrU7memd+8jQK5quATcPloAixFHARPAlUIYVhMgD8vk7gGxVJtmpqhvzY2xK4WPlINofLvQw
 rFMvvKqNq85hHxrq4sYTlxZL2TT4dNBar+3V5nZzwdaPBkVZlBCXWJszUS9S2bCEJFXrqR1GxdW
 qLtoN/i/J+HUroig7jBSbGlvcHsVOM5DM+rGM6l3bW8BhYKcSJaSJH4XMZZEB3bM0DZPEQkGW8Z
 +DFAevyxeZyViT9/JYP2CpwWghFD8nl9QEZ0cX5U6qKl2C1n57ExXjROcEyIbHatNcQAMAiaaEU
 BmuwlIZ+4g858lhiXpQ==
X-Proofpoint-GUID: zZw5bw13F3Rfw4wa1bFaO5lHhf9A-yQS
X-Proofpoint-ORIG-GUID: zZw5bw13F3Rfw4wa1bFaO5lHhf9A-yQS
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae20a64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX8/0qrGuY3TWh
 GLzaRt4AzCzIqMrH1DAi3PtF0acxS1hsvLVpxQ5jk4NVBhRc9rqvBrOWO30nLwqJxP21jORxygY
 GoPL8/Br1tzRojbRzsb0Q6CsV+gq3A8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

Sashiko reported a pre-existing issue with the reference-counted
auxiliary device being embedded in struct gpio_shared_ref. We
unconditionally memset() the struct when setting up the GPIO shared
proxy parent while there may still be references to it held by users.

While in practice this would never happen and sashiko seems to have
confused the parent auxiliary device and the separately allocated struct
device embedded in struct gpio_device, it's still a bad pattern and
could lead to memory corruption if a user deliberately took reference to
the auxiliary device via one of the lookup functions and kept it over
the GPIO parent's teardown.

Move the auxiliary device struct out of the shared reference structure
and allocate its memory separately on proxy setup.

Since we're already touching that field: change the name to something
more meaningful: it's more important to point out this is the proxy
device instead of indicating its type in the name.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 69 +++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 043d5daba7a73062151a089b3ee8ccdac726f221..c0e2a1207cccf16fe9fcf998eaf6ef744fe93eae 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,10 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	int dev_id;
 	/* Protects the auxiliary device struct and the lookup table. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
-	struct auxiliary_device adev;
+	struct auxiliary_device *proxy_dev;
 	struct gpiod_lookup_table *lookup;
 	bool is_reset_gpio;
 };
@@ -94,10 +93,6 @@ static struct gpio_shared_ref *gpio_shared_make_ref(struct fwnode_handle *fwnode
 			return NULL;
 	}
 
-	ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
-	if (ref->dev_id < 0)
-		return NULL;
-
 	ref->flags = flags;
 	ref->con_id = no_free_ptr(con_id_cpy);
 	ref->fwnode = fwnode;
@@ -306,31 +301,43 @@ static int gpio_shared_of_scan(void)
 }
 #endif /* CONFIG_OF */
 
-static void gpio_shared_adev_release(struct device *dev)
+static void gpio_shared_proxy_dev_release(struct device *dev)
 {
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 
+	ida_free(&gpio_shared_ida, adev->id);
+	kfree(adev);
 }
 
-static int gpio_shared_make_adev(struct gpio_device *gdev,
-				 struct gpio_shared_entry *entry,
-				 struct gpio_shared_ref *ref)
+static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
+				      struct gpio_shared_entry *entry,
+				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev = &ref->adev;
-	int ret;
+	struct auxiliary_device *adev;
+	int ret, id;
 
-	guard(mutex)(&ref->lock);
+	adev = kzalloc_obj(*adev);
+	if (!adev)
+		return -ENOMEM;
 
-	memset(adev, 0, sizeof(*adev));
+	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(adev);
+		return id;
+	}
 
-	adev->id = ref->dev_id;
+	adev->id = id;
 	adev->name = "proxy";
 	adev->dev.parent = gdev->dev.parent;
 	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_adev_release;
+	adev->dev.release = gpio_shared_proxy_dev_release;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		ida_free(&gpio_shared_ida, id);
+		kfree(adev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
@@ -341,6 +348,10 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
 		 dev_name(&adev->dev), gpio_device_get_label(gdev));
 
+	scoped_guard(mutex, &ref->lock) {
+		ref->proxy_dev = adev;
+	}
+
 	return 0;
 }
 
@@ -480,7 +491,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			char *key __free(kfree) =
 				kasprintf(GFP_KERNEL,
 					  KBUILD_MODNAME ".proxy.%u",
-					  ref->adev.id);
+					  ref->proxy_dev->id);
 			if (!key)
 				return -ENOMEM;
 
@@ -511,10 +522,17 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	struct auxiliary_device *proxy;
+
+	scoped_guard(mutex, &ref->lock) {
+		proxy = ref->proxy_dev;
+		ref->proxy_dev = NULL;
+	}
+
+	auxiliary_device_delete(proxy);
+	auxiliary_device_uninit(proxy);
 }
 
 static void gpio_shared_teardown_entry(struct gpio_device *gdev,
@@ -534,7 +552,7 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 			ref->lookup = NULL;
 		}
 
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 	}
 }
 
@@ -588,7 +606,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 			 ref->con_id ?: "(none)");
 
-		ret = gpio_shared_make_adev(gdev, entry, ref);
+		ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 		if (ret)
 			goto err_out;
 	}
@@ -598,7 +616,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 err_out:
 	gpiod_free_commit(desc);
 	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 
 	return ret;
 }
@@ -619,7 +637,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -756,7 +774,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

