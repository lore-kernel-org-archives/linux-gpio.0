Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198695;
	b=vTcXmsY3im2d46uup5mQ9JujEGmPhdn7t4t9Ga2+XKpMBV9UIPkvWwwXY52loZq+4yBG
	 hvdvZPcpkmj1Z2RXFVCuT2r94mdmKB7uOTAlUzgkYeZg0RjHOKXtc99h1ToHllrKPkc/5
	 Zbk4hA6d+cLy0lM8UWHAiEUhNM2gD5JrPEXamoHOHHigTSFrfU23qyBHdi7BKTr3F9bOO
	 YlT06CLilMXdX080ht9vDNuvNGWuhXqqzqtWpLrweuQL4JqeqZRCNs6xJ3/ofRui95RHN
	 0usNHcXkgbzAHGFmis2T6cRl/T2otJgEF0g7QKe2MFyGK/vB1HiIzdXzsghZ3Ch1gfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=;
	b=T+I2fakQT/Si9IaHswTq8ciV74purnX7GPcNr/21LQz2TiQh34xdNSNbvZeWEg24oAFB
	 ScryGRTFZibsCiEkOM74nxB2OceQlFvyRLSbbKF6Md7WijrRMR/uPia4ajM11AAEp8Tj2
	 uL456H4q6WoTv8DRQtXY/43AZaKVhwEu7sMu9h805yZAVu440Gf5MCJVQ156X7yl87X55
	 KQAwnsk4ze85WSVwbyqAsSJDYVgF1Eqxt7H56g9GwHBQFq23DbrvAgq+CS32aB1FLgo9p
	 NKRg6tsQ+slpEtj6OqFfAYhDiYI2JP8N9lyb3zj8Cd6L8K+8QRp2GB4Rkv+6q8XJ0/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSSiKmVm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2h1dE36;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE8560A260C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE8560A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSSiKmVm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2h1dE36
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe5tI2105969
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=; b=NSSiKmVmog0ICnvW
	yUGUsNFU9N3zvMgqpqJgS6qaDBPbkcRj31zGNjpDlkpbPYlxgWvYu3hNmPoQTy8K
	ys//JvJnepI18fii2bLjVBLWXSgCTEUzV8cEVwR4DfkmstFMVk11R/2mVuEt/9eg
	8EjVtghwXkMrU5vch8uGV2n9kuj2MYU6cImu4DDWDQQ6WJl7LCJYmlJqXloXuTnX
	4Bw2p1w2PlNz82smojAY5O3e67sPHeAQHzCvyD7bPnn9QyFDbXg0tPqfA2JhBVwy
	v+Hrq+fgqPkaK98rejYFUapeIkO8ZBLWy3YOLVMrbgxqE20+QTubk2uY6UtNq7Ul
	ABfkLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pv3gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so188140785a.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198693; x=1793803493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=;
        b=L2h1dE36Ebh/RwecejL8jssrSoTtVj5yaAwtc2vmGLUP2R/sk4MEjQ9iI7oUpFL6NJ
         xaNok4VmifjqONKQYrZlNaYIcmHMDv3ZMoTXCa5xaOzX+GW9FZkfu/V3bY/r4v2kQB9V
         ZYTVxa3l++Pxou20991jr3Fuq09oC/DtX2Twq9ctg9q8DIrKoQs6Pq3HymlY5ALhdNx8
         C6QG6Ra0g3YeoCPZsr+nnqmDrwEHN6SdFRXETZMKhjO3Z6WxHMbn/8ApZmwuqUF3HzAH
         FfDBEWG84ibc2oI+04IVxb/aT4MvdMQppnez11t26Ah2G4pEdd28bhWCC22qz6x5jng1
         TlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198693; x=1793803493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=;
        b=uLLI1SgG4oWP4vE/E03EDhOm034+Fvotcqw+jU1SNGLRhZFzpUOBbOrwCZDQbBiXrO
         Gyl+DDZcsqw0BiotPVryIbyQXFmN4DFDydac9LNjRIf+QlxeL0ciV4Pw4+R766uiP4ej
         qtu8T8JYzcOXb59ZQGqmh7dqVUOHOR0bqiU8tDTikgawMy2WixFJ8EPR9MumcxKUz1ny
         nGA2ePFngHJyWoiQBQR6SBomGoVLPv7hHtTKvXsQRL4hoewD4LpEC+YuNEol+YmiTPOY
         mBTscO4bhJrytxT38HOqrnrwLT0B/tF2HcRjx3n32Ro4qxx+gQbwN1kggW3yJqG73LAA
         F3DQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/zXQN21eS2HQeTRMoVKbbGjsU768gue5eDvBg4sTPd1erfTmJpHguijxq+OSLVFxXymCA65JbKzwZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2v72MSrAhQ9w9hNfsehlCenJxu9HHrr0IA5SBiNvmGueRTIKt
	/QON4r4XAmPEKpPpHn1+gVx21fRQpjkA55ADMUeqXheF7OAJUyiV4Myti9val42yqJ5Eb9I0Cj4
	iw5BTSXT7cwPY471g4L1fWv5wsqdkTtioPxXtQEFacxtZCL9q1CTljDMs+fqAg5nB
X-Gm-Gg: AYBFou2kHBy1C6wpaxOwud3OG/+BQTMsPWvUr8km5puaFP/W6IHk5KzHuu9HEki3HF4
	1qF1zZmONM2UG5UQok9lUG6DXQPpAP10gtvkrCBvQaAYs8GRi/EzVfnH803NJou5vClZ4uEQiAX
	RyqbMZPK9RjmHSPSTnvR//14QBY8gbSXuA+q1g05B41A8La8DqEYsXqVpBdZ1ECeJKUsr9rq/bB
	1RmloJgxsTDMAGwlGMH0KyDlQngj7HGbjNPz4xMY/e5uXfIVBQuQgcEHmjLQgCErtwqWdUMCo3f
	AqGB7+f/JvcHrixNzv51cZcC43B/KjHXvBMAwwyF0pRO4dEo04N7u7F7M7ms46R9CaMGubPhLs7
	2o7+HzqOOuDWgjA4IfYDGwjlc1gR9mcL8+YgfxjKw7qyDs5YO/jkJbgH0m72NTQ988QGzttzN16
	ESrg==
X-Received: by 2002:a05:620a:444b:b0:93e:5daa:67a4 with SMTP id af79cd13be357-94408aa107cmr370132485a.29.1793198693238;
        Wed, 28 Oct 2026 07:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:93e:5daa:67a4 with SMTP id af79cd13be357-94408aa107cmr370128885a.29.1793198692792;
        Wed, 28 Oct 2026 07:44:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:41 +0100
Subject: [PATCH v7 5/5] gpio: shared: convert to using software nodes for
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-5-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9792;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VqQFAcdQslhA+FOM56xgGaartlvzl9PKEWzaLYMwuHU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpbqa6KuoznuPYwHA9SqJ36W4s2ps37G5yMY
 E+qbktKl56JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWwAKCRAFnS7L/zaE
 wxCCEACQqCuhhEkZx0awpTfHDjzI5KLTq/+hKu9cW2MD/ARs+BPPl9y4FwpqjjnQJo7WswYuFry
 DvElPrds6Wa2GXX5OfZewB7Q0vZQB+H81xq1NKEbsFCqRohfy4A8fAxi4kKSaZFW6BDpGZC7OLH
 u706a/PhklU+wv3DPOMJ4xa5peKl4bTHC3YrZem2PGQdiHgss2+4t/CUCfdYEGTO/9nc+at/p8V
 bXksj2mtUW5pc0LXw4uOiH6uOZ5cnyk9sqXweD65PB7Pozujmr2O1TJ/CVfJMkG6PBeXd5oi9wD
 CtB5ph4kSr+uZx2YgJiVcc62PvpLupaQjqo8cXuUfwQljGbSE12pS+Rz4hOM+pm+5M91Ym0XKeJ
 3NlIngOb/GUWAChsXKjrunGEIEM2LHhUs4TnkhpXsDidYyKtHDQIoWNvuIW8zKVeNHlOUdB5EDD
 BX2CCkpnAg5wmWlCH+DMYOfCJq+AKqtwYJqanGMFprmd2j08N7Z3z1bcbkpbalzLsterliSHshv
 8cthPKhCbF43WS5STRm60Uc8BKemOn3r0TVK847D4t0ogwMragQS4gTcmTI/RtJEufu7Y5aDsJF
 srG9x/0Q4t7Aiy3XokZ6Ny4R23bNyGhifuv5Q6Eas5l6xfpbd2IeTfa+9YnsxGkIBVprTjtijdT
 V0xWmlXHsoPiY2g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: aPhz_UjHFplg0QjzHORyoy4x6mQFf2eh
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae20a66 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=-KlJ1dLh0LyCFQG1QjkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXwQqKOVwWdMQu
 ivEaOn3ggKd3gB35Xzu7QAofWSSpdxwxqNYKbIsP5fTkOdNXZbHI/9Nggg9Spy1aolGnUBL+sj7
 A5mrgoMs97YL3L81pl1Ac+2gsDHy3pz9n/HW2/qMzqa0mmO+3iLG/1WSrq8IzTa/fkp/99LEVgl
 wNMc2Nd65CdgZBUvuuq7tndvSnKgOqTPWqCVIV1ngiz2yZ+LRi/nPY1LDi/hxfwQqTrbfmMT8o8
 UPBVpMOb+9kO2hB1MrRCLTqhiLgBjSfYF3NvUKC5fEAfjEn78PExOqGgJIwpC2oR2fgejOd8SB4
 PwZC6ZxCMp/dL8sEtcmVmxdwzXPic3NVFDn6j60OtNo9XX6K9v+5MR1p8NhcqpySuibgLkfpgCi
 h4SKSRWF74f3j0qpXmYWtHV1IOQtlGi2++HZ+rsoXZ6gPffJjUEuhxPaVzW5UPVuDI3wXXTm6iT
 0cyp4i27I7CxUNMKguA==
X-Proofpoint-GUID: aPhz_UjHFplg0QjzHORyoy4x6mQFf2eh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX4G+VlCoeHz0m
 VgqMS22CSxnM8lbsBhX+w3ar8FXAkJo2nmpauxgGTVtbIl3uUugLfmmQV2p7ADqhEzU2B7/ZfJ2
 FG5KEzo6SzFYcQ2iq/7l86c42fJ8yYI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

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
 drivers/gpio/gpiolib-shared.c | 124 ++++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.h |  15 +++--
 drivers/gpio/gpiolib.c        |  20 +------
 3 files changed, 73 insertions(+), 86 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c0e2a1207cccf16fe9fcf998eaf6ef744fe93eae..4f5ecdfcc63ac175b9c4fcc7044ba3ada83e6349 100644
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
@@ -484,42 +506,31 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
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
@@ -529,6 +540,8 @@ static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 	scoped_guard(mutex, &ref->lock) {
 		proxy = ref->proxy_dev;
 		ref->proxy_dev = NULL;
+		software_node_unregister(&ref->proxy_swnode);
+		ref->proxy_fwnode = NULL;
 	}
 
 	auxiliary_device_delete(proxy);
@@ -543,17 +556,8 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
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

