Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290972;
	b=lBIY6NGc/ur2sR5AfCFajsoLbaT/HA+MZg1IhdBq2c96mnOPrIRwdXB4Pt8+5r6nqd3E
	 q6ojMYk4j4Cf5tURT2XpzliKR9b4pDlrFO84kXLEjx14qsgFcXgCR1CMC2i5ad+YaKjEI
	 Zq/Lzx4X64g7JCS9+fi5YfjSNVzG+x1ArB8FwKCopO817EiAgIue7FmjNQVSDkRFcJU1E
	 yUAC4rxOXNJBSYEQlERyqQysLYVmib/NSiaYzVnFV4u4M3qbVwyfF7SvwVnQGlofdrdn6
	 alWapqQ8xbot4r/9vksudrzGyLtlAh3+xGozSHNCSjd2xoaZOojhyABmXurNpK99gtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TUDLgVYZTrokE6uy1MX7PGVBrBRfICz9mr9IEyKAh0o=;
	b=UJ12BaXGOA7ihh9OLfSmWrP+9NsrQQUPwTgZnBExY9EsDDMYqA52nQUJCFl8cTuZwxfu
	 z4gd162eAyCph89khWQFFL+5iMT44F2e63aoSq335uaf+0IBNO/28Jhz213ZHeTA/O/Fp
	 YTHYZDrKiGxilxdR8bX+GtCX+e6HPdrCGHRfzeoN++wZx0Xw0ca1lAJPibPdjgzmbFh1V
	 076L3V8uHGbzkoVav5fhdv0uNjBGVCVU9Yo85RcSGfpmSjLn0/9Y1SchlKzvhbzmWHqEo
	 s0yDFJGgUXm10JYeXIb9HuokJwhJcjSHmILu2f6lJLh/zhiretBgtwaEUkO7XUj/rAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MefGRz/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKfrTb9h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020EB60A380D
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020EB60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MefGRz/k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKfrTb9h
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDJNN1654956
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUDLgVYZTrokE6uy1MX7PGVBrBRfICz9mr9IEyKAh0o=; b=MefGRz/kFjTA7g0P
	E4bUHW2/D+W+QYb4aWGfIni2FlJZppMAfEi+8vTfFCPU0wEY/RS1Pv7kMYz5mYN5
	aSUyfMqJg89LicnT7dSGNX/cI9imxqmzF6FRz32mcqvUhWoxFR+6w2omtjCbxHS6
	so6n4OpWr6Jhuj3efIP3/Ztu85QVQUSBCFUhlvDLRTkiUG8owzWIipPYJikKML3j
	k0Oac22DymSR3Sq5oWMwbP2wkc8xD7UlULDJxQKfgQN1iSUvdOjknAaO6pyg58di
	Z0Tk1vAqEPPMFwrvsgasq7JckYKnBg7aeO9wg/6oBiLaFHa24wXDTGuOKvdvdrpR
	HSsrtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a21g0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so542263685a.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793290970; x=1793895770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUDLgVYZTrokE6uy1MX7PGVBrBRfICz9mr9IEyKAh0o=;
        b=EKfrTb9h1abJwfxuvV/v+H34NB8p1yNKsZqKPSQODMfT43DCHQKVfIoYjTwaM/QkIY
         SlnYzue21v0qDUY8XSGLd5uwgZPplefrWCwNmco3/pHD/0YZ16YaFJiQ22UW7PDO6wsw
         10uEvgoX78853dJU3f6N2UfNACaev81gx13bOMUti7qtKVlZAXIeqkRc5Dfbpii/eu2u
         7F+Dxk2qg8n9ccOsp4T/eT8Ux//MuzJ1r1GcII0EmSXAhfzk6wSDQbwJuB0a2/Yscbh1
         YY/q+q3vov/o3fUMn0CY1PpF4NVcd7n5aylKcAEI9ALEiXisen/ysgxMS2VTAQxUioX1
         VJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290970; x=1793895770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUDLgVYZTrokE6uy1MX7PGVBrBRfICz9mr9IEyKAh0o=;
        b=ZS7/cojjFmzkfYOGVyJqA7wtHQDDYFYMGSEZZPioODYA7zPGEhnx0jVGWabMtzlYUd
         4lBy8pJGoA7yYtitZp1/MJwLs69C1P0Fv7dv34olZN9EPxw7ZotHIcG+1+hlNJ2FYvPy
         y6dwefhxNkTtgmeIJpjdL2jyyGwIdLcMCxk+4amX449LPVARQ2SKLWkP5WGyDhkdatWj
         a3qvxcGq+25CJvjFNsVbuCIbMErr+hH2bzAv6mOaV/78w7zwu4Y/bHpqKEW6RkI0Xngs
         LfXVbJ9bjiITY8Wv6c6akGbX1T8IqSTIcopsLkhADCl6tnhazIBlNheV1t4K1mUi4DL4
         SEnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6SoLNfCfcZiJNvoSbkTvfDjWGcE1KZihcSyGwZRDUQP8NEqlk1AC2mWOcVEC3il+tAY8gpMKv+Tvw@vger.kernel.org
X-Gm-Message-State: AFq9FYKOTZs3PRmJlC35crfVlquhzSd8XEQp380YquEJWKGE/GVTDesY
	XbAwE+aJ4GT/73PBpiehaK3f6QbE/OqJJsY7KcG3to223rQJ2be16AzGmZvhZT507dvrvq+HYY5
	MDGCjJ69RohcpHcaG3pocu03AOsIdVPsbhBgb2CY3LrGsz7mV1MZG8nXkMtUb9+lMZU77+6rz
X-Gm-Gg: AYBFou2kQNVxT1Xda37XmMQd+Gx9LPBsZj6rDOcJCfANSUaTOk9zKNZFqyY0FGtF8lN
	j8xcmgPzYuNaFoXO1n+K8KBgP8ysTFIpl5wjO/AkeMUqpuOOtG93hk9psaRfpRLws2Pc7iikAsg
	nXaBubrrJvWEr9qSk1sNElmLqZGeFfRfJgH0cQPVBZfhFFtiJtkZlB9vDcyud9/RF/DsQgqPNVH
	F+3rdgeKFrW7jEvprhVUfGVh6iW3sD55nu297wHjCJZGm1/aMSDRhxBjkRCjlBoq5vERguLMbnd
	sywuu6i8V6eN2snPh8L4/mrCPFW1ZspXHhez/RAv2wme/+ZAxASrI8v/fnysFTEJDged7axYcPZ
	U2pX2UparJmcIDrbI4pzxuNwgm81c4vQDtEhUc7EukhXsGGV9BFHAP8qeIbx2qG5dbmvqVOkx/M
	20tw==
X-Received: by 2002:a05:620a:2906:b0:93e:f931:a886 with SMTP id af79cd13be357-94408d07cabmr866760485a.57.1793290969887;
        Thu, 29 Oct 2026 09:22:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2906:b0:93e:f931:a886 with SMTP id af79cd13be357-94408d07cabmr866756185a.57.1793290969165;
        Thu, 29 Oct 2026 09:22:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm93868605e9.2.2026.10.29.09.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:22:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:22:36 +0100
Subject: [PATCH v8 5/5] gpio: shared: convert to using software nodes for
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
Message-Id: <20261029-gpio-shared-fwnode-lookup-v8-5-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11167;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j4XF6BUD0ert3clh+tyeAiPafnVtIoPst5bZ/nDmnV8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq43LMusbxixjMM95x+zoclw/9oWiO2ENNR3G4H
 RAEyF9kq6mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauNyzAAKCRAFnS7L/zaE
 wznmEACrZIO7aC8BnfprWGCIeb9jXOLJkKMyYgcWPt4NCU6rHWeNR6ZXmdQ74TJNJqg8cjPH+8K
 Qtc7ombGTIEhmS4H53KIE1tiu2gHLoJmNLDV06EHTkSpsCJHaZtkd/eXr2XxMYigacVggoMrEZ5
 uo4rKH/sy5+yrZTPu1uSEgSru7i1NKxvIt4vVT29d1PdEiuSvUNDREsUupv2vGq187VpjZtpG6S
 nr5FIzuWrSkOYrC3K6pF8G9Tue7qJNLlTcDo99dv/e98hq/beC+9U1Q6iptG9XK8WgzQWyNlg2F
 8pI4iinpItg3zmgO7Z0GHOyHgOfv51xJha2nKS10CnULUtZ+5UH+a2elrp5W1k/XSLhn0pzi2SB
 m9TvuhB6jsTcRkS++J5wWbKM6CwPrN+hyGCCbUzMbk1rmV/CHmN1v+jXM2O239eGoGYsSWtfFdG
 elTPmYfC5ZJdoxfBlzST9RclUr00y6zlQch47OzH0w6vMJGZhH1+wgq1avZUBuy4x91cu3D1LVs
 gAZRLidh0HUIb1Oer8QITY6kCK/kaMVvxlkTQEFVnm13a90Vfh/abdtStDHToZ93jqbPv0TUDkv
 n725xCz5F1EYbcxc1YPCAp2nIGRJEXwZGGmdnR3JQCGqaDxFkfI4JRZoAAz7yd11x8SxSUS4ToW
 SpHB/LenJsoVU3w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX3pebxhUVfohy
 zBCr48SE5d8euki1jmEgmIZq39g42Z26aEUmyvUBeht6dV9/y5H+mdxDi9sKAB0owhUw/102zQx
 u93Nu9GyGOJoqeQM4bOaOcjBrzixk+WiwjkJRJQpZ7+WjIo8h9T5BhH9Y3SlPYDgPrKXS/npQJn
 3kLNiLhZEaUiuwUppaij9CiYSj1ZOTJPSQxEEyYSDpJVMfDEWYkpaxoD9VQvkl8kpqxC+sJ6mZD
 CkByTRxSBxDg0L6lbZ3V3LzfbC+hvzi/pM+hsJ/f0eS3LCIW2mxxXWDEProKyah7LRf94qPl7a2
 /q1OAdNu2KvZlf/WpRgLaJXdcwmkr/tfgdJDgfM6QWJR5teby4GCjAJhobrtsl3GDW8uGQ/cynA
 0+gvVwycl3c3AppSO+0EctiNfO1DQqAiZ5vbw0dhYoFB5B8tDP94hLAmjVNsgsWpe9E56QPBAT+
 GxUwe215R3ONB64kBhQ==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae372db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PMCuaE9q9QrnffEWjcoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXzxS9wVc1xxu7
 A0QcRW1YRhFnQqFI0UaoTQrxsbU+riBwnzVvWE5UOD5R8/ygWCyGxKJ6igVs1m2/BoqyNOa3ddr
 NtUSBOJQPkqF+409FGMEm5B3F6OjLi4=
X-Proofpoint-ORIG-GUID: hPtRYhxWwoiCXPHKI4Zj9Qe57uL1gREr
X-Proofpoint-GUID: hPtRYhxWwoiCXPHKI4Zj9Qe57uL1gREr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290064

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
 drivers/gpio/gpiolib-shared.c | 152 ++++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.h |  15 ++---
 drivers/gpio/gpiolib.c        |  20 +-----
 3 files changed, 90 insertions(+), 97 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c0e2a1207cccf16fe9fcf998eaf6ef744fe93eae..75529336c6cd9c97210d6afed9180f686014da8c 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -27,6 +27,12 @@
 #include "gpiolib.h"
 #include "gpiolib-shared.h"
 
+struct gpio_shared_proxy {
+	struct auxiliary_device aux;
+	struct software_node swnode;
+	struct fwnode_handle *fwnode;
+};
+
 /* Represents a single reference to a GPIO pin. */
 struct gpio_shared_ref {
 	struct list_head list;
@@ -35,11 +41,10 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	/* Protects the auxiliary device struct and the lookup table. */
+	/* Protects the auxiliary device struct and fwnode. */
 	struct mutex lock;
+	struct gpio_shared_proxy *proxy;
 	struct lock_class_key lock_key;
-	struct auxiliary_device *proxy_dev;
-	struct gpiod_lookup_table *lookup;
 	bool is_reset_gpio;
 };
 
@@ -304,43 +309,62 @@ static int gpio_shared_of_scan(void)
 static void gpio_shared_proxy_dev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct gpio_shared_proxy *proxy = container_of(adev,
+						struct gpio_shared_proxy, aux);
 
 	ida_free(&gpio_shared_ida, adev->id);
-	kfree(adev);
+	kfree(proxy);
 }
 
 static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
+	struct gpio_shared_proxy *proxy;
 	struct auxiliary_device *adev;
+	struct software_node *swnode;
+	struct device *dev;
 	int ret, id;
 
-	adev = kzalloc_obj(*adev);
-	if (!adev)
+	proxy = kzalloc_obj(*proxy);
+	if (!proxy)
 		return -ENOMEM;
 
+	adev = &proxy->aux;
+	swnode = &proxy->swnode;
+
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
-		kfree(adev);
-		return id;
+		ret = id;
+		goto err_free_proxy;
 	}
 
+	ret = software_node_register(swnode);
+	if (ret)
+		goto err_free_ida;
+
+	proxy->fwnode = software_node_fwnode(swnode);
+	if (!proxy->fwnode) {
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
+	device_set_node(dev, proxy->fwnode);
 
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
+		software_node_unregister(swnode);
 		auxiliary_device_uninit(adev);
 		return ret;
 	}
@@ -349,10 +373,19 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 		 dev_name(&adev->dev), gpio_device_get_label(gdev));
 
 	scoped_guard(mutex, &ref->lock) {
-		ref->proxy_dev = adev;
+		ref->proxy = proxy;
 	}
 
 	return 0;
+
+err_swnode_unreg:
+	software_node_unregister(swnode);
+err_free_ida:
+	ida_free(&gpio_shared_ida, id);
+err_free_proxy:
+	kfree(proxy);
+
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_RESET_GPIO)
@@ -457,23 +490,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
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
@@ -484,55 +513,45 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
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
+			if (!ref->proxy || !ref->proxy->fwnode)
+				/*
+				 * There's a matching shared reference but the
+				 * associated auxiliary device has not been
+				 * created yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			ref->lookup = no_free_ptr(lookup);
-			gpiod_add_lookup_table(ref->lookup);
+			struct gpio_device *gdev __free(gpio_device_put) =
+					gpio_device_find_by_fwnode(ref->proxy->fwnode);
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
-	struct auxiliary_device *proxy;
+	struct gpio_shared_proxy *proxy;
 
 	scoped_guard(mutex, &ref->lock) {
-		proxy = ref->proxy_dev;
-		ref->proxy_dev = NULL;
+		proxy = ref->proxy;
+		ref->proxy = NULL;
+		software_node_unregister(&proxy->swnode);
 	}
 
-	auxiliary_device_delete(proxy);
-	auxiliary_device_uninit(proxy);
+	auxiliary_device_delete(&proxy->aux);
+	auxiliary_device_uninit(&proxy->aux);
 }
 
 static void gpio_shared_teardown_entry(struct gpio_device *gdev,
@@ -543,17 +562,8 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
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
@@ -637,7 +647,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
+			if (ref->proxy && gdev->dev.parent == &ref->proxy->aux.dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
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

