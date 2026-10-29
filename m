Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290970;
	b=n1OtTZAjGHICM65rRKxbzgpgjGPrt1fl+sFrZbTLN7tKrCezzxkPp23CfKqHEF6O2fFw
	 qPE0vjyySkTGH5b6gJUsJwjEO2vrSg+DM2LYqlh18pUrSiRlxUXQgzmH1OGXFrgnVkaue
	 5P2DKovrP8hQhM9Wu4iavhy4ANUYgFKeGZjrdBJiEUYvQsyhHr0ZhO1xhbVoUy8waEBca
	 hviiRwTSxaeuO6AU9n4sD6rP9X442togipNqYVUozwDWgmyaTxBpzFzB8Kp5XittZMH1X
	 J9/Vsk900tsq1dX+ggceIatQdjDUfY8TZBwnh7CqVOGS882Tfco7kFz6wK55bKNzgHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290970;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
	b=Pkdq9H+oXLSqWxkKvoKJGROxC4lReuF32CvoMubP9qDY8iy4LSzvPDowHbDrbnAzVN5e
	 UpdxvQEdKv2RkVWAZI4hwgRv/Fb5fNgkiSyKWBtAy/7g5sc4lw1JynpDlcD3aKtboCWQy
	 DqtEnzaiov9q88l26NGsPMLzfy6APuAJ0JVuE5CcQu3jJsDF2aaGSNemYw+6XdaUzS89S
	 CG7zrj05J/xQl9P7/MXhsXn3+tnjXfbkP0XO3khRbGHykEHH0MRWN3IBrwPZ4yUCSPt9c
	 eroTYGSKfslLMtdIMlnFlfbimtYD6r7hL463bxnYaFqTY4hKHLZn6Pxs7QaM6/36oIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B43ZXqqt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KemV+LPQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8A60A263B
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F8A60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B43ZXqqt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KemV+LPQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDE4p542754
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=; b=B43ZXqqtN/8LIAD7
	IoFfvDmgQUa8VXdr/PgqadbeWnSbxsL0y3avxwoWV1iM8QzK9YhX2Liua9Li8Hec
	w8nixR154LwBzT6pkTogC8I/wEyJLFYNwpK617SaqoOeFSB8/X3oe4Rfg8VzbZZ8
	4eiJnNTsTUYxDqg9yuOwyt0cIKa7HUyrL2NI+PZYGdzbEgnDX20LrzPWEpHW8jnu
	i+cGuXsJViNsnv1ZShGcZuskbLataPZxkkl0Jwi0i9QSX518tHsOP/S0GKmVaUNh
	lMjgPPniTadXSi8VrbkEKS9Sj1UxZPhcxJOWE0K98oqXrV/gJefNE4mZl7iABdwj
	/ItiMw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshttbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:48 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso1958140241.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 09:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793290968; x=1793895768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
        b=KemV+LPQVm2l9Prsy3PrDM/VhfditgNeXmeFpF3mM7qpzc9Jru2NJHNRpyoqVZFp6G
         qIlRrU3lPZNHip+apSPxRBTPgZRF6cwk9fxE7FUtKrljqmdrcP7sxCdreb9p2HQ1qUaP
         z++n7/RSAMuo06VhdGZkfQNXdQiwaljqCiEmH+wPQFfXQxR4O3DQWoDuw498KrvB9xvF
         GCWNuI+Wd+VROqY5+biY7DNVuUjpa+RHQaG6BEqvxlwVm+tOaDVjVFQg4nIQnj65Xjsn
         p7Ky+CIA7rhGQhBBJVh6VlWBKo3rLG4rCVoQIUdGh5bCc51hzHgSO9kM9RnYcHMGEjZe
         uiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290968; x=1793895768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
        b=uh4UQmJCRsgbSbHpFxPKqNfNVumh8zK+S2fq7Kl+zo/YX5NB5tZUE7RzUO7XqCpjfx
         Rm3WNQS5YHTl9On1kqkX7Ia8q1GFG8Mu0buTb6hSRhqop9nuv32R0EGB1J9U2dvEqZ20
         3hQ96YRl83lLAIXSFJDtjYcHIpJbBg1m25BAxHBUj3qXJujxCQNe1tncrLFaCWehS6En
         bgDFwPGtwqX8GbLe2wV9lPKGZVBFs9VPHYQk9aaxMlZvUMs0H4evJXGjGNnLCZTqmoLJ
         U3mBwEzhggewjsA8Zm9ThTXAAvIgwZ3kNNDqyAsQka1hHZuYTcjozWDp++fnyvn2ZSvs
         YaMQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0DdKbdDhpETIVUMA/7bktOMHvO7+QRWRvxFKmEsne8pLRCstuHPQp8JyWVWwR+meTuwOp9T724G4I@vger.kernel.org
X-Gm-Message-State: AFq9FYLzQsg/CyJqDxpuTeLmSgTEDsDA6/dxYoLCoeoQcOkJyfGr58zQ
	zdYnxjQbLUdOGVEwOB+WNYjws036M2mB7moeBtjzBVt+6QQpkyAykRSKFL/p9qNZTyAUXc3E7Jr
	3LtdM90/o0RziWoMiwMePxKGeRnNmy2A0PVv7gc+l7S9ljA7BDP2GcB8pmeQIFOi+
X-Gm-Gg: AYBFou2FOADjWxjp/uWt/kzO4tHGXlydyzrtWH/A25rI/Da8f4JteF3TIWohdTtjSdg
	q1geQSvIn0pmoIVoI3EiEt8K5HxM1lb8wHWXJTYo8zPs8ToEhjN3UHEtHakCWakqL5qny9aVuAt
	I4fF4fZuDMM5iJ13XTgczlzFmb8v4hWCRCP7xEiB5Sjmo7PKVT4qtmYNBunIKALoqCr6NUv0W6h
	PV2jVFAPy0uMgEyu91fGr611UO6KnJRVnwdcrXgEkoUS3srMEpW/VCGMBeglIIAPv7VuHDrUsbF
	CPOem9uJz418NGXkq8bPSHoaRVG5U+ARs9I8aRLDShhyRtbWhDwnQ1P26jTZ+EiwAuxEWpxadBO
	vQIct9ORiYlL3EoLOtSw6Sd22bFRmFbOfKsodZlpRd8H3yeecOUU+gGQ6ygpjq2ujo/rRp9UUVQ
	pLag==
X-Received: by 2002:a05:6102:4b03:b0:7c3:ac79:9b09 with SMTP id ada2fe7eead31-7d03a5dd949mr3139964137.30.1793290967693;
        Thu, 29 Oct 2026 09:22:47 -0700 (PDT)
X-Received: by 2002:a05:6102:4b03:b0:7c3:ac79:9b09 with SMTP id ada2fe7eead31-7d03a5dd949mr3139941137.30.1793290966751;
        Thu, 29 Oct 2026 09:22:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm93868605e9.2.2026.10.29.09.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:22:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:22:35 +0100
Subject: [PATCH v8 4/5] gpio: shared: detach the proxy device from struct
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
Message-Id: <20261029-gpio-shared-fwnode-lookup-v8-4-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6332;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AK3+tDXO+muQ4ZCcxhm/oDc0hzzPO4mlQf5U9mOOPuU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq43LMqpDTnX0tgaNYU0SVq9D7iO5TLHEz00KO9
 Yc4DCOiBNGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauNyzAAKCRAFnS7L/zaE
 w8rID/9GDyZ6qrXFx4eF7TNlt3HBGkLqBZQ3DQEIq6fud4oygVcUaSI/6FXKG/Ig4DVlAD0oawM
 TDYrzgz0YlQDSd0pTsKLe4WLOq+jNvPBVCMMublPd/72PSweeKtlWjlDr4h56ux8hjFZhAFH5pU
 ySRdXRYXEjlKvSXuvktx0kevrvDws/21XYF7Iq2x1etn8pCmpBMxky3kZF/mnwvMNa6E557x1s8
 KLPnYTVtFwGIb6D3+BWivGwCRTlge2qH+3zjr5kf8joUPeWKyHdGTednqxvUHk2D9TanvWR/uox
 2tSUV6T+XX0cEMU6lirU1n60cSG+1khi2+vFHDvN9RqjQ5QsYOfXRL+fgh0wvKbTPB0cKh4P7VR
 hz07svAaHP83bR3RnkiAhGBYDSgexhDA4VP6Ci4dycGTaz55bJ6mvu5ASADC15mvzWMYEDVVZgk
 /L6odWaelYLURp6K5+u4T4t99Mf5JtTA6DviKqZnXIUzTD9eRKHMdcu5U8EEaGhJmnz8hY68kaN
 GRBbDhHu0i71WDp+XsTX+mNJtW3/dWKhAPgWylv9o2/yj+n/R233szaASolNZduEa6YAFQMXwiU
 e+mGtWU7+0PHn1soA9cPeDGf6zYtdsfPVc223acvRdCOG8Zp5NC5H79Pcv3/Wji+/k4Sd2AsEyV
 2HsAOn3NDhjbVjQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 43RH9y03UzxOVn7fv7WqWAQsN-VnnAq1
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae372d8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXwctONiF/LqXJ
 p1ddwvg5i11a21CLBfYB2eAoJLulUPMWBVGnX6LZ/fOWJdXwGpLP6Up0e/YwGRmHJRbPN/0VJiA
 6VGGw4lRO4Buhm2axzf3ETdHLmEkkpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXx1BXGAiNkiVl
 g8ZKp0zrRl6v7a54nH6PodrPxvlm8DeO+qyUsYfQPU4tR+RjMxvReSLd+BUZ7v3lkWcKFV9k2b3
 8WLuGqRpSue+THCBJ/mmBoE8FmXaUV4c5Fk7qIzWyhIv5zZ6Gjqa4hMwoduZ2L2vNQN026nQHN5
 XQQlPBpAvWeoqfqT/AvRzYCuiz++/6z/MjNcn9H6eBiwChDKEBBAJv4AolRA88JBA2N7H4li/gc
 ja34MRUhsxWkQe1nC66mLhrGBeFjNUMqb1Ug35Z+uVkE7MO+FZo9TiE9eZL7WnSqKZ5WxAekrx+
 ewh74qNHe/XdqiDF1NbsIZUJms3m69uCw1eM0p/qS2fFGWFgkm2LP23ekQncFnzPVZHq2qj5+a5
 klc0IssKWNAGHtWAUK0Rg7YGqnup7tKysRfSISxpXEN0gcSjjzYXXuj8+sty7mJUjiF9QPcXWbs
 aMjMWIpN5yhgXfiInZw==
X-Proofpoint-ORIG-GUID: 43RH9y03UzxOVn7fv7WqWAQsN-VnnAq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290064

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

