Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E89C4FDE48
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897127; cv=none; b=RFC/5En171EKwgoBBsrldQcGT18g2UybCaBESi6OquCGralrKN7OilLRy8iInT5BKbwiRUpnhR/30DscaI4lpXJO+psXLpso0a5z65x14W/dBYe/eNNpQ+K4oH8cyTo/8diwywYJT4NzmtXnpdwEnGXAp4eL41spncTHOfPYkzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897127; c=relaxed/simple;
	bh=Cb3ooT0XYjXT8M4yVS9wYyhOnVrHPHC7ZscdoT5exVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nc7EMSYPsCMtazsM3oq2s2MadA+Eg1lYwGWzZnVxgbdKmsmv6acojnLJMyxcxpntTJNGzvOkeptyXJe2UNsWjpvyGBOYrZXvhfEmw5qXavVDLRxHYTNJx1/oM/JFW3ucfi9yK5bL2DmoVDpJvygKcKese20ORGAun2kQn8DxR58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SctNXx+w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+ncyTsQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SctNXx+w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+ncyTsQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DD49ub310419
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNN20bT8JoxIifnao5/q4MfPMC0SdzUhHVKLMw7JvTM=; b=SctNXx+wFEFI9i5D
	48h8dPfE4tavFn+qyVfGrHww2o3af0MIPXR98xtk0zomvPCw72N8gj4dTQqsFmVT
	GHeu+7Jr7S1Emi+CSSdCP5zq+z8fQic/1Fnu/tBtMLM3GUnjXZLogJJ3M3vRjb3n
	K8jf0r+z/lKask5SZF2sspz1F2Z1Qu7RnpicCnQ1hVYaIp7jcWY0S+e+3dRwHX+e
	t4RLSuEZXVE8y7C4RTZ9guA87TpOzNmFJ9cY8wGDcCuxZ8qaqwKrLzo8S+jE73RK
	IakwoTEHFQUWJEEogusm6/h9lOoT5zDikySUW1FLemjowSosuU98k3nnxcEPj5r2
	jr5paw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71g177-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:12:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so372126137.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897124; x=1792501924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNN20bT8JoxIifnao5/q4MfPMC0SdzUhHVKLMw7JvTM=;
        b=f+ncyTsQ0ClCXZE/cruVONyu7SHnZkoQh8SV3/33mNbN+AeYDwdkk4WXI6OL+k/DKe
         cY7BRo3Il8POjZVcDrfgPJq0qiMic6x1ESHJQ/DuFhjD/UuNja2da9NKIMviHuZgZeHo
         CY+30xd3KwMIjxGtAyCGE0mngBMTKMevQ2HJAfpSwlb4oJXkiUc8q4H3a+yxls/x+hya
         +sCpKBbwmRbQ2wWQ0x1vbVmSHUDKY9E83SDMpZPzFONV2ZQSjMCyGpVFI7yZMpVVe8fJ
         vALv3k+NIluHG4or+KvT3CV5lU0PWab4/JLY+Jy0vf1QsYgQCioJAIHSCIxBtj5eUiZh
         QlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897124; x=1792501924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNN20bT8JoxIifnao5/q4MfPMC0SdzUhHVKLMw7JvTM=;
        b=DQ9ZTx34BokjBLBdBGtXdihzgVfMB04cyKeVJ8ENUL2c8ymHK/JbG3yrMy9toPN/nP
         fVFKGf7Jm+9aAaxHWEl05Z+TBHFGZUyjORb7FUimlrLK0SHqg4IDgj9d9C5P0xpmNx9p
         duVWkJH6Gf+RJye9KicmpTL9V0fLRRmCM0RJ9PclQeDOZhhyLpPPbtD4gZtLypPsXLsE
         x4paD0KLfFMICrdth/AueueeOPbYpmsgOeGqcHdjAnn+cRmh30+h5gczfJMVyofb5/Oe
         5belDjkJiqjCPkf4RrW/s6lT4l46i6sfR3KBewhM0/985c67PpLg+v9Ly69jCdndc8/E
         eByA==
X-Forwarded-Encrypted: i=1; AKwUvBwgaVzysct63ub11czgzu9vSkxMlbRJXnyfeiSWnglZbsVq5HCi5T2yKRFg23vFoV6EkDg8Ek+Kw0y/@vger.kernel.org
X-Gm-Message-State: AFq9FYKs6C2YcaNP4ic5G+Ac+QYsfWvXjWtdUdlWHJuh6ACbFEXgOGED
	VDE5lEjW3DHVr5ugyejA1MBjVeIT3/uAJ0VmpHjYZfPA9fHb7d7Js9H26s9oEPPtT0WKuXH25P9
	F8lE8W9kx4+mGgbl8yxVseKm8M5wCZt0D2qHIh+9VLIm44JaVuxaVKItiiiTNtvGH
X-Gm-Gg: AYBFou2ixzoQIhGF7mgp3VkTYRBDvdHhHDucdDk9npMhfueebr1yFzZWOoSi84qrUAF
	6G4ptwgEoa5Itpz+46iRz6BuSsGkzsneX4goNMmC38uN2EGboeT3o0daahVlKUZz3w6xu30mMi4
	ktJy0h91xXrWwPYIFV6ox5n5NTnFnyMl9g8rvejSykTekyNI4ZKxy9A91+jajCg0+38EFHAY8OH
	SvCN6QiXRTU82CMgdpWBHKXiSmNKoSwA/vL0Q/ajAHWl7PY+ExbiOdgxRRvYnjn3oLsuKcI5Qqp
	/BYvWaG0bOjajd5YRxuoCU1jSU8rYiSBG9YtO6r4KQBUcUGcASM+ND0AWAFktmzKl+zVpcC+7ZJ
	bAKXXsNMQuWW1JtP25/mEg7HZzeuM
X-Received: by 2002:a05:6102:38c6:b0:7b5:4700:3a6a with SMTP id ada2fe7eead31-7cb37381bdfmr3209430137.26.1791897123780;
        Tue, 13 Oct 2026 06:12:03 -0700 (PDT)
X-Received: by 2002:a05:6102:38c6:b0:7b5:4700:3a6a with SMTP id ada2fe7eead31-7cb37381bdfmr3209419137.26.1791897123185;
        Tue, 13 Oct 2026 06:12:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm371862945e9.15.2026.10.13.06.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:12:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:11:47 +0200
Subject: [PATCH v3 4/4] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-shared-fwnode-lookup-v3-4-4553c1a7d80f@oss.qualcomm.com>
References: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9610;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Cb3ooT0XYjXT8M4yVS9wYyhOnVrHPHC7ZscdoT5exVw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzi4VtWMS7lZPLMjUc1EGuiORjUBSMyHMfv9GS
 yXs4freM9iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4uFQAKCRAFnS7L/zaE
 w3NjD/9GsDJ2moyQNyW1wCCTuA8csg/7KyorqBa5T3mnDMzxMhN4Y50ATFAuA9VkmOgGAER1tmH
 f9i0n0vSjQzMeyBLa60qDgvp+fsUQ80Ly1rOQop9fUptP0jcEmFdEsj95H9lTdEAg/o2gRFWARw
 0mC8Ua/v7AJCqmduRiGiufP+GQwQrkUyhW5OIDg/zWOGAsVePsSnbTGhK/jtKohLPhjl3ynkvRS
 +cQWTTXdaNJBkQtfkyJDaxYi4kK/gw1Ti1CwZXeUHfCoNxKX3AojLQoKzwMOeAKaxG3UyCUItD4
 KXHb6jGf7sIzJq+jwbLkYMswyA3mAM+0FObUZGf0VQLqu8B3BMC1/h8+04DLeZSd0llMc9qTgdt
 DlIrWD29qPeWVDtUrd/nPBbTBtzTy+9Vc9Izt/XQKMKMAmHvtl1oodCPui3y9E71d1E8/EAzK4T
 TADXO6ijaORGJeco5KEOAKEXm5LTXFa3TUN4wQaT7SCcyd9Iap4q89VoIRcFiWtjGFADn41sI3+
 QLtUbptExK0Lz0/Gb0cH7dwK64k46MMJftFUxRft9W17WjBxwr2k9LxoblLHTJ7vQWdvNtZ2Wn4
 CxEJcKRMvqbV5/U69naGiGR04uOtDtf2rTHFWKzfu5iCrLWXT9x1hkRCjgtgFaMYBMQh9CUEWlM
 PBvnCZGcFL/Pi7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6ace2e24 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-KlJ1dLh0LyCFQG1QjkA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ljtMArpgR2PwRra2tgIvq2o564V9Qm-s
X-Proofpoint-ORIG-GUID: ljtMArpgR2PwRra2tgIvq2o564V9Qm-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfXwbJd8JiG1kVL
 HoJNhcnjhqh4VqDdptE+Hb6cCbfQO1Eom0DMPiOP68bJ/igI0d2lw8GatYMsVUbrBNaUichSLv4
 lQMXehw0z4XB0iqZDPko6r5/Ao9FvRqrxM3XlmIBaxya1ZVlqAwA1LXSyCdHOYjpaVw3/dvBkqw
 CpIoFUukRVj2dJpgpSupuS9BycL8z2IwvbdjCc5lfzr1cdPmoBaK/rBPZ1s5GLuZidIXxFjauCu
 yL3qKASGq99rvdNFyAGC6N0hnREp7EQ2luXi4BftnSNHQm+yda5E2pBe1w1+pI0hFH/TIsf0vK8
 4xvGL6oOywe0IIRTV3TUWR5C+zaB21UURF3IVw3Md1Iaw8GZmMvWpoCRKTih/1JdI5qs7GvNLWn
 gknyGdjEm2AoheekRQ/q22XL5R3zPrUZS94wU/ZCrQAx0bkJKZaUHkeijQSmyyGGX4tS34LgvZU
 H1kehlBD9ge7UZ82nGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX7+i0KNdoukT9
 7IJSLD30TQJB0qoXe5fcB931ZRq+bYdwTiATNJf7twz9oSUmZpGmZWVdAeWySEpE4vWnVA6UJW1
 Rn1YUAOcuLfO2s+qlMcowrMB6hWObbQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130051

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
 drivers/gpio/gpiolib-shared.c | 126 +++++++++++++++++++-----------------------
 drivers/gpio/gpiolib-shared.h |  15 +++--
 drivers/gpio/gpiolib.c        |  20 +------
 3 files changed, 66 insertions(+), 95 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index a57a2dd5ca00eead40dc79198c94862b5a3d1ee9..c0b1713cdab171dfc1ac16393dde3dd8db12d8a8 100644
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
 
@@ -313,38 +314,53 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
+	struct software_node *swnode = &ref->proxy_swnode;
 	struct auxiliary_device *adev;
+	struct device *dev;
 	int ret, id;
 
 	adev = kzalloc_obj(*adev);
 	if (!adev)
 		return -ENOMEM;
 
+
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
 		kfree(adev);
 		return id;
 	}
 
-	adev->id = id;
-	adev->name = "proxy";
-	adev->dev.parent = gdev->dev.parent;
-	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_proxy_dev_release;
-
-	ret = auxiliary_device_init(adev);
+	ret = software_node_register(swnode);
 	if (ret) {
-		ida_free(&gpio_shared_ida, id);
+		ida_free(&gpio_shared_ida, GFP_KERNEL);
 		kfree(adev);
 		return ret;
 	}
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
+	ref->proxy_fwnode = software_node_fwnode(swnode);
+	if (!ref->proxy_fwnode) {
+		ida_free(&gpio_shared_ida, GFP_KERNEL);
+		kfree(adev);
+		goto err_swnode_unreg;
 	}
 
+	dev = &adev->dev;
+	adev->id = id;
+	adev->name = "proxy";
+	dev->parent = gdev->dev.parent;
+	dev->platform_data = entry;
+	dev->release = gpio_shared_proxy_dev_release;
+
+	device_set_node(dev, software_node_fwnode(swnode));
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto err_swnode_unreg;
+
+	ret = auxiliary_device_add(adev);
+	if (ret)
+		goto err_dev_uninit;
+
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
 		 dev_name(&adev->dev), gpio_device_get_label(gdev));
 
@@ -353,6 +369,13 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 	}
 
 	return 0;
+
+err_dev_uninit:
+	auxiliary_device_uninit(adev);
+err_swnode_unreg:
+	software_node_unregister(swnode);
+
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_RESET_GPIO)
@@ -457,23 +480,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
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
@@ -484,49 +503,22 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
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
@@ -628,15 +620,11 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
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
index f9173560812d00020f41a745f8a67e0a3a6bbf76..253da538aa98674aeaa488b3ed0317faab5e5a4b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4824,24 +4824,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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

