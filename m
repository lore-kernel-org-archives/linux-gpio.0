Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506895;
	b=rlNuVqB2Ko5Wd0V1DdCKoUGNrmvcezf6gTTFggCBsu+n1k4ZzRf1oCrxv8+cRd3zvmcD
	 orBAqqwTYfgl07CdLyPlfgZwvl9ERdclts1HL72PHwiSYifZUCc/kK+AYqD04MXZ6DykI
	 xw4j3yTJbY66j2eqq7RgjVk9Ig3vBjqLxK35xk5wAnMed4ludR9PfVJKN38d7bkTLBHLs
	 RHOA0B0xy2r2qHin3dlGzCuyvbO6gF0IpRZfcHLJEqoxyPbuTd86A22wAjGuOK+dc2Chn
	 po9KkHlkcGsB3pAF5yPjOqFIwb4cca3L6HFl/9T+i1RU7YcGJN0FciCifo98VemO3Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1HwJOAwLfXH5xDyaOEBwJrXtM1VSmph9nKNxckOyvMU=;
	b=ZVmT7wEhhdWHr4S8vOcPhxWKA5FGeF/uMuN8XpKXGiQBOiiS67XagS/81paUU72heMAA
	 7Ryxuwr9608McGrBSuBo564rvFmgFkKWZf9wOIyCvJnx1klLPKOPRo7pPKuR0lRZWoiQB
	 OmoSc/004k8QNPyamFlh4kmQBdThdyO/MHLJcXz709Zi1NysZpOyoBE3snZ5qn9k5ltQc
	 wjLna1TqVkTWVhrNZ/D5G9O7BYf++4oxIlgGY2Kd+JNZaEggX1r+jTOswN4zs6BXup+60
	 yE6eB+Ub9BNzAi5+TLRpIOW0fakqwzH1rwX5VR7y/lg8oGzLotG2k+mFRyD/19acqJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FXNAuf95;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b1VF3CC6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0360A3804
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE0360A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FXNAuf95;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b1VF3CC6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KEB3m31864915
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1HwJOAwLfXH5xDyaOEBwJrXtM1VSmph9nKNxckOyvMU=; b=FXNAuf95Ifnzmcs+
	2kPJZHhWj58sPjYEPA37tuqIoBVvJRjCNAucWsvK2NAAPk784R2ohCdsYb9+KKdg
	t7UhLLtgPR4Lh8N1ytB/QMIBnuwDvMnezjBYv9dwxJNcOcBO+uOhPbTTqj+57Mdb
	MRWnXLIoWc1+tNNJHnCWpulagMbPLtUV9pBMmR8THSh330uC75v8iPdvJh0fc36t
	cxCR5c78OUarH045owFFggSNjpEGkXdW2ZmGsfjZDKAUV7jlYuttwn8vbQZFYpF/
	jfivdRSIKY6WiOaK/uZTA4rIXTy7Rd48wKr5O+6uSGrjIxOTWuGzFc2XhcEmDiE1
	MiFe1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2xbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:34:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a7c17166so71008946d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506893; x=1793111693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HwJOAwLfXH5xDyaOEBwJrXtM1VSmph9nKNxckOyvMU=;
        b=b1VF3CC6EaJhJBBixHl3OyU0ZBRHGILx2EiCb34XMB91z1wv49lWnZ67s/fdUN/dwk
         i0FlvsRffKoCef5enbiLStwKr8/TU9z3sUw1qk6/JybynC8xd/TnGuVWSXRmQPdwEUGO
         HAw3W5F4nFeyDzFeGlNEVre3UelwJQLykQjUTajSce8thl11aD/2a7+Q7kr+iV0QKEuc
         JW4QGXJAlDFEZuJfS+LWxxqN/yTO5ytvn4rAD6yKta3R/Nv0ffz3f/P/r6nynnuPeyW8
         KynCmEOlYpSsxUalHI6NDzhwnXBkWn68Xa+ZNTGrNm7iKJucXkvRnw4QkW0AsY/c0kpR
         nQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506893; x=1793111693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HwJOAwLfXH5xDyaOEBwJrXtM1VSmph9nKNxckOyvMU=;
        b=SD2zqY3YiooWgUEh2Jn1ZaUdYV88AXVe0zuWKnz7TgZ0r2UGdZG0IAoJGCrHZbRlf1
         gvdv54Qd/aLt4lzslQQbLRPfLY7oxihq/zr+Bv9o7aZz/D/Boy3Pf/iIm87YkK8eXebE
         rp2ANzKE+xW9p7/m8QssnS31T8V3Cxd8yfLGjackVw8/5+zUQBPFa/yi921lgM8B0vUM
         2g8nCjkdYXE8Vrob3fggDhnKfzDV2MXNed7dZhSnxQxgtLn1gGv8ph6yk7UIPp4Rg3uJ
         3J+TdsNfUG2/a6C7wxZngJ8eaiFvyowSJ1g/qNg3DdFcSbpiSnRhN2CsTPaoSDun3HX8
         KVsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzw9jAStjSMbNnJ+xGJx42DcYZBcNo7X8BO58RHYDozK8Ka4UonUsQRN6MaNsHPOPndZHZH9ClXk3o9@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7+pyhh8W1dpwtwqca+4Yy/223Dm0m/J4vNYKAtxsvO/yATLY+
	L2TVglhfWkndyPwjdlnS2ykM5MuZZjrVB+WR06oqMVj/o3NsXt7cpt4pooEiV65r6uoHRwyOBsZ
	wAEv6DAOFsQ8cVilLl4hFgSspWUCBVhK7dlFj+S8oTZ3cVJgXkr+wyfiV+NP/j7vI
X-Gm-Gg: AYBFou1qAfKRmrnEC/4EEVCwDuMDtswVNJ32bVo71O/3aeSzM/S6KWFKq/VAJhpk51O
	vos4i0FecilX75WTd5IISttqx0emAKwgD0//VvFaR7SmqLXoT3vrNQV0GzFpsTiIWzyguuCgDZD
	VmJWd3ynUWxIluhrFjedMigf66bT74kBujxjJjEbuLMnScyrQ+nosG79CF3K/J5V0A0WWGfI4IQ
	j3/Qdr6CgL/dG3UKDMpKFcX3U0nqfNtfm+40PLLnmaiXbhJcVbVtj2MJQw8U0S33xFWSG26BOTh
	IgMhLkL3mLCWSABiaZCQJn9mUx8rr7/cAjtvwVOqcWJAWRgbg9KIFkmUkPzdzMLpz9RPzjbfdi4
	BuHakNZsdzjNHJ5tcqUZh/B0XJoNF
X-Received: by 2002:a05:620a:319d:b0:93e:71b8:584b with SMTP id af79cd13be357-93f29d03d40mr1878989485a.34.1792506892969;
        Tue, 20 Oct 2026 07:34:52 -0700 (PDT)
X-Received: by 2002:a05:620a:319d:b0:93e:71b8:584b with SMTP id af79cd13be357-93f29d03d40mr1878984685a.34.1792506892471;
        Tue, 20 Oct 2026 07:34:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbbb0sm6766443f8f.5.2026.10.20.07.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:34:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:34:38 +0200
Subject: [PATCH v5 1/2] gpio: shared: detach the proxy device from struct
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
Message-Id: <20261020-gpio-shared-fwnode-lookup-v5-1-f4a2dfc059d7@oss.qualcomm.com>
References: <20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com>
In-Reply-To: <20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5907;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eCQXWocisnFjKQI0df6UbCxQaiLQ2hAAwVsHPdZiOTk=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGrXfAehBqbsgZbr2qjyL7qeYjhIMrvZgIXHQp9bUkJl8Uy+t
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJq13wHAAoJEAWdLsv/NoTDKdcP+gLH
 d+zDoD0gbGuTg/uEgDg7KcWHhzNeZlrKzMYBiyjsQkTSwWs1CyFrGg8UBdo1hcEje7xybjG6Dxv
 3CTMlV+hxMEk/9dQRVftlvfuMgCYa6su3/OM7Mkx2+cf0VyTrb0POs0QGVy82hxNDC2Xo02h4F7
 CuiWg3XjbZEv5uY1MjiWyY6Pu4k32V3MQ58MAoN0fVqruVGgbbdqICqwpcUiqG3iAJ2KOSYvAWc
 pO9cSA3mAh+JnANdDEpaE8WvAvwmXgCC06Bt7oM02ghwdk/0MP2mvErUdPrenFO5VALsedo2cND
 /pdF/NaeWbwHNdspLpWx3bYG3eiofybGdLL9HEZua3iFmsu+NTcNXPjcbzoQs0g1m/X20NBLQGc
 z9QivkHdw+jsUqvrdfr4nQlosQMuD5qq74KgRRg6EvmxFbZgQfq2OTKxy8ITyN4OESC8xAtryHy
 Cxn0WvEa6C4MRIDm8lzh+V72Ya802RpAx//tiKChF6xf++ZCVwWMSRDHdWHHZMaNvyY0XiUFurZ
 EN5BL3z02zYSfiDoiuE9jHcaTnLo7bbwOYcRtq15KIx4qvRRTkceZ3KIPqZgniE12EESNxex5I1
 N5qGtCoLMQtlnEB7PkcgA/brrdpOkCpbn6a4s0a44W4kgKlgOUmOD/2lqDa+jq10ycToiS/sMLG
 33RkS
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Kn--lMe7473LGF94XOadq9JNCZQL9SBv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfX0wBKt5r72hy1
 tR/Dk6XeP7Phmuwni6b0/NxpuLyOu7tDjw9RiP1FDM2fhMcTvwHo1ZveihqIY2lPQ1MtX9/WSLl
 y1T9N1f63BDMAQh1H7KOGA/OkVuVKfc=
X-Proofpoint-ORIG-GUID: Kn--lMe7473LGF94XOadq9JNCZQL9SBv
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad77c0d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7-zWc0oKUx6pH-XSlPsA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfX9zdWzMDVQ7x2
 t4rug0EaiycKafz9ITtQh45VHzVITu0Jy1S+sQWEk2lYxwic6YBHBWAh3q6TruzJHR+/TS3lFYQ
 qKMxOwo1chLxqJ2K4NTU+61F2SlY/3pJyA2CfwhmYjsdaicNRa7exBEb6CO5MMBabI1P2OckOHH
 aIITX9zHs8rYJ6G9EymE1CceyGLnw18m1J9XsOTx9h1jTlwdgSRtJsPSLca/2XAqGGPc5wcAMpN
 eK+ov8jx36h05RU+FksG5xv3sxxjgHstz0nmqEy0X/ec1HNgT+xMI+woC5PiKAWtmJrMIlxUsNP
 o0XS7OGKak9V97v8Hip2LNXtPRU7UbpLztuN3C1vKGYUAORAyCArCw/wzmRWnvIRARbWtynBVGW
 OpJb4GaTRHpTMtJwJkrMsImBOCfvndrYf1cG2Fq1ujgqErkNv7BF2xpLmAroSk/G54gT7087+zQ
 3Anr6mn/JMgvWoB25Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200058

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
 drivers/gpio/gpiolib-shared.c | 61 +++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d933049..c7893a5ac80a6 100644
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
 
@@ -511,10 +522,11 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	auxiliary_device_delete(ref->proxy_dev);
+	auxiliary_device_uninit(ref->proxy_dev);
+	ref->proxy_dev = NULL;
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -527,7 +539,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -592,7 +604,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 				 ref->con_id ?: "(none)");
 
-			ret = gpio_shared_make_adev(gdev, entry, ref);
+			ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 			if (ret) {
 				gpiod_free_commit(desc);
 				return ret;
@@ -624,7 +636,7 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 				ref->lookup = NULL;
 			}
 
-			gpio_shared_remove_adev(&ref->adev);
+			gpio_shared_remove_proxy_dev(ref);
 		}
 	}
 }
@@ -718,7 +730,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

