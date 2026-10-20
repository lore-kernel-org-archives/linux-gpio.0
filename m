Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506897;
	b=GE1568KOP/q6gXJajymTUMPaBPZClXMj9xbWv39KmnxmpRKXFI3XW4T09l5sDCF/Ki0R
	 29D6OfjK6pjOZrUcHlZ23Ktx6nj7XuABHP0xv3SUkivJh87XldIfSQjOHQUc5lzv/vBL7
	 lx/f7/EdfMawx/sCcM2seShKZY3OxaV0rxwZa4vP6D03F2JoPzt9RB/3oawGjjye2uCrp
	 AQRvROw+l1+gNI8s6ql7+G6/PhlhfmcstsUPuDs5uc/qIC1O+rZkkaXOeuo7LtutsnqHl
	 eCzRaRko/9l5iCXnQaWjCyui/7ss9vsnCtWWmCSxR+zbWqDJOsaAdmGHF6FW5BxI9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HTT+4/D0rwxJ0Nf4euadE74Qe9xGROJiwObXaEgVB9E=;
	b=N05sT8eYeQ/ckHDpJ2OzzMh+p7mbNKzHVEobanekuGNdP2R9OgOwkteml1NBhoXU9Mv1
	 DfSXGZfSYKUe2WC7yu6VSGT8v3jcrvdPeWReIgvYbAfrYMXIB9BOz1mrWsDGraVY63lbJ
	 JjcQDolB+Enf7GV3uyY3MejPoLYzTnXFq9Mi4o0kvr5bpJVOlpPKR6pwXrNcd5dmn/2gi
	 x1Bdx03hX/qI89FoBVz5a4YlG884WP/QfwuLcv/JB0uZVUVijfiJy4Mcw0KsQmQ/uGjan
	 xL02f3uqeVWKxnUuMb0U/Zk5hr0o+euBLiHFw4Gwbq1YwXK2uagddMGZTVYUmMOon4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pItRh4aY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IJdB952T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A660A380C
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5A660A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pItRh4aY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IJdB952T
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA54m1731699
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTT+4/D0rwxJ0Nf4euadE74Qe9xGROJiwObXaEgVB9E=; b=pItRh4aY8BpfhMnf
	cJAxt1S/mxY2NIgcUam+Cf/Jlr05mpuPUey4EuMhXZGi/CG6klzAdMzDh0FFAJgo
	P5YVMXJwr59Y+FPlKytXyoHVwONQMrBG33owKdK30gNk+YICs9gyto2tVNlc+QoE
	34CONvPCHP9FQ8dC/Ss7GNkHoEyL5VpS2Ee0yELgbgadXwZJqcU/d68KJKmXqmuR
	Ls8NBdXiKbxF/8X7ye13exOqaGv5jjjixhhytNswC6KK5QoyiRbAfRutavEQWucZ
	D/hemAOEYG+nH0hUFvSqv5CArL/P9ayfTl+Lq9o8XlNBJ0yRKdu9TU7XPyixrgTa
	tuP5PQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2xc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:34:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so1099119885a.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 07:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506895; x=1793111695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTT+4/D0rwxJ0Nf4euadE74Qe9xGROJiwObXaEgVB9E=;
        b=IJdB952T+86JPvhGnxLJoC7uFmrlslZrwjvagvVS2y1leZBVvjUvtZHbbhSoKy0k5P
         RJSOqrtkVKgkJEEF0JC6Ky0vaBHHE/OADL3/SZ+OPIt5gRHZbtg+j5Tvno3I/mYM+Bgn
         pvnZdUYHsUyKkS9O7fTLvBTzm/THuQ2uhSMhUAk4nyQOvoEjl/ssV6whbdkylBYjMfsm
         lop6A6DEb6Hwzw9AGBn8Ul8SzzYGNCrnbc/igmvMVT/yrJCk2HkOhXX7WCgdCawyls0J
         Ojt6xIFmqmJYt3FryUqP+hqNy1h0HE7peotZSkp+V3jH/q/BHpykctU4YBGQeYukO29g
         Q5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506895; x=1793111695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTT+4/D0rwxJ0Nf4euadE74Qe9xGROJiwObXaEgVB9E=;
        b=lHm8i1WSVycUQFjNSUmdQgbj+Mlq27AbJpbGgUsP6PyILipGXDWCfS1SPOgb3jmOY/
         IQ7wRBsT2CNvDMdiLI3f6NbaNOsVJEmUi8GVzc85FfrpiaqoPWilMV8bdiQhqavXcZ9j
         vEoT/F2fYRoC5DGqulxV3VZ2qcIUmHUivOAsm2aRHtUQGBnVtnNxeKlj27isW3i9q2/8
         QTxW98epGMhWKT4KCSOyAaqLYql87BC/QgkKwjfmcoXQjT3turOnBlZ5gXax+c+o7dYp
         qgdzwos1fyVMNWwwOrCgVLkWKGUkEcZy4+M37IeXaMvdyzLA18DjQoIu9Rqd+vp72ZXL
         DyWg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ0GK4C6hQmpCFI3OuhVFqiNyN/ZTcpDsupteDGwBPNy1vFmr4x6LrtjkTnc5/F+Wj3FjVYw1oxk1W@vger.kernel.org
X-Gm-Message-State: AFq9FYI+aXzj/shcfNWat+w/4gY3BS0qIVnbqqBZRB3zEv2ISNcugdxT
	Ohu78gkbDGyakJYH/9t/pyVK4y9QyWCGTuJ1uFhiojUxAlryBb9hRU7re0SupaeV9/pU6W9Rkem
	5zA/PGO/VttsdlO3nLiMgonmxKWUZca7smonv2K9ZrzxlIB6GgPs5lZqupJTWlZ2N
X-Gm-Gg: AYBFou1nWzN4VxrDaHRxTRh+SWNrdT6w4i0eutsaqEhbJVAZysicI8wg3hMp9XFYXVm
	eXyXqUBkKXWsL3NY8sJXjR04RHF8NGeFMeSpP+/zBz9ftj3k7PQCoy+KM1JFU1TbuQyb+3bEnGy
	Eu0jQLo2dOduFVBGlBdfYI6y8xGuCnbc514ls+katTC5NmPBxgYdBGKlyrMk4Nh8E8eugiNBgwJ
	0RzXmvyQVCHrKZue0F1k+6TTgpz+1BgnmkPrgzNqrkfgicfz/n/mS05YkdT2caD7wCFbyTSJczc
	5/Y6icoWVbPZzd5cwaO0L5CEZigPTwyRpT8/K28fjvc3f8x4ByoLsNHIJFeoBLYg6hYEdefqoDm
	BAwlBXVJwRDaMQPM+grEDqeZX0Y4r
X-Received: by 2002:a05:620a:468f:b0:93e:9171:b83 with SMTP id af79cd13be357-93f29d4d599mr1870846785a.43.1792506895057;
        Tue, 20 Oct 2026 07:34:55 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93e:9171:b83 with SMTP id af79cd13be357-93f29d4d599mr1870841085a.43.1792506894505;
        Tue, 20 Oct 2026 07:34:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbbb0sm6766443f8f.5.2026.10.20.07.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:34:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:34:39 +0200
Subject: [PATCH v5 2/2] gpio: shared: convert to using software nodes for
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
Message-Id: <20261020-gpio-shared-fwnode-lookup-v5-2-f4a2dfc059d7@oss.qualcomm.com>
References: <20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com>
In-Reply-To: <20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9331;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=m451994+JFSmO1zl7Lkr78s/KM3jzR6ZBlC4wATiZuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq13wHlszMcxCqkbauo/BGuYo3J+0Xx+W/8eN5n
 rvju48/bHiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatd8BwAKCRAFnS7L/zaE
 w58tEACvMAuwVygJ/o2iBbxLU4zOyimbwE/fKRv2PXaqc87+DT6OsaFAc7Bi3QX9C+IGmpyPHxJ
 N7NNjCSBr6F39nsXODkHKQLlybwEvPwfz+F134PwLcEIbokrug3ZJbn8naGmIxrRbcDLXvaslcC
 i9ZGFR2JTMyhp7CXe4+ic2oY0fTbsoLTN8fP8tecM9gNVrcMmXNevdzNqJcSAr37e+63mmkhaNB
 9Yzzsvl29ye1XZ7wuHputJcV06VrzcGmHRseIaXNi9UwprYhbERY1NyWhPF78JmC6qOPwsWTglH
 B5n8VyRRQe1QoGPWPT3SNdrS6zUZsKmJ96r79rzllfL69b3DSQvzVvo2xs9wEofcpzFhvJY3ryK
 8bxduOlMabaivGy5GFuk7V//U1d6mM+ahJb/l7UDAsh2M3YNMMDZXoIF85mkwwaJj3QONTXYJBD
 5UnVvrd6NkmK9VvAYgeZkOiwRq3E1JgWf3rR99eWsy+nNzx856iijoXw2pKsJijpc2C2RXCVcup
 D30by/k7BiJQaTPom52Q7VHjL+sU+YJmdFz89CKPrDZizFC9cP4zLYmfliN3/aXEJzYMPyGzpiX
 nJpRd5fkT/fwRWDi3K+EcvG3/+Djh2SUN8h8ZMjxTTzVeMqwrDpxX+pF+8nIRWXTJmHHJN6Btws
 G2srpkeZkdsNLjg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: faGhbr3TYM9yfl5z9O_tCSRwrZVwgRJG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfXwLBKCKhhToPS
 8bV789DlJBDmu8DZtfEED4AyK1xx/6Wsk7xW+N2tZ9TWc5m1Ui6hSk5eE1I2vCTpl/Lo6NoMd8j
 w3da/2Ya6r35WKDlMl75zq2RInHgL9g=
X-Proofpoint-ORIG-GUID: faGhbr3TYM9yfl5z9O_tCSRwrZVwgRJG
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad77c0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-KlJ1dLh0LyCFQG1QjkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfX6nwUAbxZLprp
 aXb/LLjCYJOfpIiLqSWTBUghbSrvPAy8JfqtqmY1tifu8i55aoIMBwJgpDM481uHAbWfOI1J8oV
 KPdnWDlWHQEnm+yVaeCSJDYKToAznoyryp3/+VRJ6Yg/djUCSs67ajZqVwqGxF/B2XL/S2CbANr
 Rci+B0TJ5FuRjhiCWa3C4scVlCXoAJNivKYrcIg2YuxfMpMbFyuNT/7NPNPBhyAXDLpVXk+u1vu
 xqXHH4jOwciS9GyEltL3w0noJIadN58cQLSE2H2hvyJ27YXwM4wQyVIJ1qbUBL5uX9hmTLcfUwt
 yVqPs9RmRFvgxbzScphUlt9Ej/koAT8YhnruKRfyDqM2JXhkY7sfVDI3tYnLtFiw14rLc7i2VIm
 NLrvk+x8XzSLJIK3Q5oWwZh6ec2mnnWo3wK2pJz+2OvY894rdXKia0YA+3EliWqGSV6M4TN0Bxr
 TxnLXoONBP0gvUBpTGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200058

Automated management of shared GPIOs only allows to request shared pins
when they're assigned to a real struct device. Firmware node, no-device
lookup currently isn't supported and can't be because we're using
platform lookup tables to point the callers to the shared proxy GPIO
controllers.

Rework the GPIO sharing by using dummy software nodes assigned to the
proxy devices and stored in the reference structures which allow us -
once the correct struct gpio_shared_ref is found - to find the correct
target GPIO device by its firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 125 ++++++++++++++++++++----------------------
 drivers/gpio/gpiolib-shared.h |  15 +++--
 drivers/gpio/gpiolib.c        |  20 +------
 3 files changed, 67 insertions(+), 93 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c7893a5ac80a6..2a6889a291bb9 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,12 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	/* Protects the auxiliary device struct and the lookup table. */
+	/* Protects the auxiliary device struct and fwnode. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
 	struct auxiliary_device *proxy_dev;
-	struct gpiod_lookup_table *lookup;
+	struct software_node proxy_swnode;
+	struct fwnode_handle *proxy_fwnode;
 	bool is_reset_gpio;
 };
 
@@ -313,35 +314,50 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
+	struct software_node *swnode = &ref->proxy_swnode;
 	struct auxiliary_device *adev;
+	struct fwnode_handle *fwnode;
+	struct device *dev;
 	int ret, id;
 
 	adev = kzalloc_obj(*adev);
 	if (!adev)
 		return -ENOMEM;
 
+
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
-		kfree(adev);
-		return id;
+		ret = id;
+		goto err_free_adev;
 	}
 
+	ret = software_node_register(swnode);
+	if (ret)
+		goto err_free_ida;
+
+	fwnode = software_node_fwnode(swnode);
+	if (!fwnode) {
+		ret = -ENODEV;
+		goto err_swnode_unreg;
+	}
+
+	dev = &adev->dev;
 	adev->id = id;
 	adev->name = "proxy";
-	adev->dev.parent = gdev->dev.parent;
-	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_proxy_dev_release;
+	dev->parent = gdev->dev.parent;
+	dev->platform_data = entry;
+	dev->release = gpio_shared_proxy_dev_release;
+
+	device_set_node(dev, software_node_fwnode(swnode));
 
 	ret = auxiliary_device_init(adev);
-	if (ret) {
-		ida_free(&gpio_shared_ida, id);
-		kfree(adev);
-		return ret;
-	}
+	if (ret)
+		goto err_swnode_unreg;
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
+		software_node_unregister(swnode);
 		return ret;
 	}
 
@@ -350,9 +366,19 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 
 	scoped_guard(mutex, &ref->lock) {
 		ref->proxy_dev = adev;
+		ref->proxy_fwnode = fwnode;
 	}
 
 	return 0;
+
+err_swnode_unreg:
+	software_node_unregister(swnode);
+err_free_ida:
+	ida_free(&gpio_shared_ida, id);
+err_free_adev:
+	kfree(adev);
+
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_RESET_GPIO)
@@ -457,23 +483,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
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
@@ -484,49 +506,22 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
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
-
-			ref->lookup = no_free_ptr(lookup);
-			gpiod_add_lookup_table(ref->lookup);
+			struct gpio_device *gdev __free(gpio_device_put) =
+					gpio_device_find_by_fwnode(ref->proxy_fwnode);
+			if (!gdev)
+				/*
+				 * A matching entry is there but the associated
+				 * controller has not been registered yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			return 0;
+			return gpio_device_get_desc(gdev, 0);
 		}
 	}
 
 	/* We warn here because this can only happen if the programmer borked. */
 	WARN_ON(1);
-	return -ENOENT;
-}
-
-static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
-{
-	auxiliary_device_delete(ref->proxy_dev);
-	auxiliary_device_uninit(ref->proxy_dev);
-	ref->proxy_dev = NULL;
+	return ERR_PTR(-ENOENT);
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -628,15 +623,11 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 			gpiod_free_commit(&gdev->descs[entry->offset]);
 
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (ref->lookup) {
-				gpiod_remove_lookup_table(ref->lookup);
-				kfree(ref->lookup->table[0].key);
-				kfree(ref->lookup->dev_id);
-				kfree(ref->lookup);
-				ref->lookup = NULL;
-			}
-
-			gpio_shared_remove_proxy_dev(ref);
+			auxiliary_device_delete(ref->proxy_dev);
+			auxiliary_device_uninit(ref->proxy_dev);
+			software_node_unregister(&ref->proxy_swnode);
+			ref->proxy_dev = NULL;
+			ref->proxy_fwnode = NULL;
 		}
 	}
 }
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aaf..27fd2a40c5cb7 100644
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
index 05f61092dd0d3..9f87c9ef42b5d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4829,24 +4829,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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

