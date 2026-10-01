Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C769B5218A9
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865137; cv=none; b=bJyPYXZGSOQ7HnqfATHrVOIIOk6zabQ8E3iywoEM8A2cECm0gGC62pCPh6F/H9fBc9SlHuO3G2YG6IRgt3rP//V1t9xciwm2cQQl/cQk4xGp5qDjGQ53fivTnmAGLEZ8VuMdkAxlC6cCGv9aah/MQbtNWvN9DJfnE4B6MELuSdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865137; c=relaxed/simple;
	bh=JeHKhNF5PnRxkK8/Z0HhRd4bZm+qVDr2xtb8QB/p0F8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rv9uPeU3ocT/bYBC9OA5nZV35JdFmkj+OG9BGL9e5e0rBe9MoXToUtXQPuHU5JLR+P+0RHY+Rd14SRJBaJHD+R/xhUMCzaWzrKA3jmjXd66EmjUqRVH6IolUXYAXjYAQNSvDrefghCQt+6HZYAiH12s48vzJHlkhaZK91/zDj8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIdf6CDu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uye9x+Dr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIdf6CDu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uye9x+Dr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DwrHh2008493
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 14:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVzvK1U5MgddJzAY7T4RKQ7YO6Lxqbkndb8ClnylMC0=; b=RIdf6CDu3VObUaRV
	nQy2Cn54cIk4PrPLBjxtz2fJ5rbZDNUaaibXuxWZW9Kduq6UulmGI2A0foEY/eUj
	iSiGCOw52XApOtkQNDgbV3efBhATm1POQjy0h5NxxvoGIYJxtWIIbcvXGhJHSonY
	6APIkSLatc1LcVanwZOlZkfyWq4jOett5++I2gaBU8HUtCjh+V/EM2Pg6y0rHZ3h
	OkvkIsXH/3MO3C0TzXIt1jawkv4F0yMz2BS4KkqAI4lCj0kCKVQf7CgwXSZR8g0N
	sQqAeo9eyKK2iGpBeJBNc0NdVsJgcSSRX5tjTgh9c8LXGdaZ4sXrk4f+uvMdajGj
	IZWdAg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvq85t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 14:32:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso2648948241.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 07:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790865129; x=1791469929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVzvK1U5MgddJzAY7T4RKQ7YO6Lxqbkndb8ClnylMC0=;
        b=Uye9x+DrkwzplF45v/P2lNjXoZ8s6dWIU9WkTqNNYym1QQ3tJEJT4WidM8Kg9qIWqt
         U8iEUhdijmdK/KUnHejcCQlL2o0i9iUQ0cUrH+6hARG1kADSRTKt9L8DbAnMo0irjOVx
         cGXpsP1OJRm4s92KYj44FUHBsk/XIflz4ly4CbD6QT3aVA6RWYlhCy5xwmXvTa2jMcwy
         qLLV5hUsLPvOZvLv2WCSIjMr4byR/XWZb5hCRLXFVCnT3441Q0gP0QZZUxVo71w48T68
         mDNrMcXAg6r1BtSSJ1OhuYzAR9n8OjFVMIHd+EcVp9wuFKOxjiJLY1NHHKxbyjA2lrP8
         YMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865129; x=1791469929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVzvK1U5MgddJzAY7T4RKQ7YO6Lxqbkndb8ClnylMC0=;
        b=lr46O0xJHBbMEJCLmgXlPhQUbNfJRAuH8OQWta8wBQvNemMBlZXbmJ0bFiHQjvcPhz
         ZqY4bfNQT6S5v2+ZmJ6c0LLrcz+TM8tbKjGJ49gcxfQOw9vgzpxT5hYexmgieiyD4crc
         u4b3L9zqQemoNGgXwrJ7vNX/nC0bHlZOqi5ifqvcfbi4Ewq6QLbwBeVC1tZKey42PoMJ
         L+gRfMj3UBQyoy9qptWu0TpPUcpR4BFZt7w8/vBBk53Oysf/iqG3AARTZVlRqfO9zuoT
         PpvokSONdVhlMTG14aTmEc3+xq0SEd4ABUPEDRs/ZYROy9Zynn8DPBAzq30wUDPDiLBw
         HnwQ==
X-Forwarded-Encrypted: i=1; AKwUvByO3PQgN5w5JNjuVbma+FK0Cl8FBNclHnuyBSMzCLtcTWtOxKhC49ge7ObekwXz01Qpxf7bmGaRILCg@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Of79JVY/jBHTWAG0kyE1yb5/o2UcW06XUmqvlBQWsnlh49be
	zRFwHAK4F1ntKqmP2jkWqT8JyZcZOu5w7IT2Jnp3hGDzBi1OMItKb98vXOSlPpAbZSlixhodHrz
	gOVsM5WviKXZNdNjmapizwV5Sl1rPkQWpCLu2tHHPP4C9JOSvSbzQ+rdclkyf+x7CXBcms1iH
X-Gm-Gg: AYBFou3oxEKpEul0xOG4lVfoFmJNhsdg5WTyEvYXuUUFvsnhB0qNxovPQF21Cf6jDgU
	HxU7CWRQsqrz07EmoNRtNxEx2ect6Yuee7bYLL42wq5s8AQ7RnT1DxOssjS7+ar5sIIf8jsnDUx
	PG13kCGModJDnkomacpwqSDvS7PPAIAwNM29jQ4jzY+mx+Lwvzm1VeG6KApOzCYTM1omEwNjEe2
	HccQEfE8H0T8di/g92psnl8SfbMbbdcOHXQCB2qcypL6WXkkNYU/wYaY9IxKaQ9QyeDNymc5Fdy
	WBDsj5xXX80K1v/7cgbeg0YofAJA1WWiSmyaYYvRTJnIMEX6MB3eI5Y/DJ6oQ7WvNLbOPeZ1deM
	M5hmgbnLi1OpvcrF/+7yMxT8tuGiL
X-Received: by 2002:a05:6102:b11:b0:7a7:198a:c2b7 with SMTP id ada2fe7eead31-7be73c8a392mr1586310137.31.1790865128864;
        Thu, 01 Oct 2026 07:32:08 -0700 (PDT)
X-Received: by 2002:a05:6102:b11:b0:7a7:198a:c2b7 with SMTP id ada2fe7eead31-7be73c8a392mr1586291137.31.1790865128263;
        Thu, 01 Oct 2026 07:32:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027276b6fsm321855e9.6.2026.10.01.07.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:31:50 +0200
Subject: [PATCH v2 4/4] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-shared-fwnode-lookup-v2-4-9a40681713cc@oss.qualcomm.com>
References: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JeHKhNF5PnRxkK8/Z0HhRd4bZm+qVDr2xtb8QB/p0F8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvm7eOx+TRR/wW/hgQA4gvsvgwD4dyB5l1L7gk
 PapjEyjkEyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5u3gAKCRAFnS7L/zaE
 w3u9D/9yalu3OuZKHONdZV612/rkQWLC9URaKMvaCghIUHtV4sULRxhmQpCnazgUxG4PwED9XlF
 7DQRBrk4qqXoFZVf2B/kHr+OZyTGZ00juiAhu66NDAlfleNYcBbYtv0St/56XYiDg3reTT4W5L/
 zIxsZk1Rm6Bk8OhYTWXsnAEZsHpUPHM94nmTQoejMXa3OzJLgEZ0/nkIIYBjsih1q9SsfcqI/Y4
 5Fq58bQ+Q6bApb9y6ImyjOVcbb8w0/J2UaAvPglUJcmpNW8z02uxIGhgZEFo6SSOnxlZBr6ReM2
 HglO/GScIdjsh5zdX/Mqml6AE/YTGzeZWKdHDZKwjsj+GWlWQCX9lPWIGp55L0iI/iIRRTgqxN7
 ltoG3kPs7894STcElX6Yp37gFoRKC1x5T9D9ep+NoQ8CvBFHPPG6ZEL6/o8BMaY+1pWzBHWFxTD
 KfW5r5ncs8uTbsmFO0IfVCbOnnG7TuHov65cKULD0fQCvRea4c0f/jfIlC+frLCyg5clYx/hjuU
 ro0kjALCoRPrgxamcrBuVqcD6HAAlabZTzq3fPKp0PxqrFLR8mG3pM8PO4+hTrwlwaXE3KIwqTX
 cl+3d+ahSvyyWDLkEAYFW4CknD4olJomgNfNNx+ymXhjRZbPgngUWfd5PSo3EeRWgEidYkDYoYE
 rKT99kQ/3/FWWXg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX/7830L92X5z6
 V5eggw3ZKAw+zAojNWGpZP872Lws8PzQCS65de9vnYe0hI+Dufp0TBVHXoOcF8gcbjEKbr87IFJ
 G6/mvgFAthqqoM6QPrv8xYncBxIU1KejL3NAuy+SRY+HePxkPr/Bi44i9Gt1rRSfWIxHRq/hW7w
 dk0Oq08o3U+LYHdmuvlm04E/QbscD/GXzuN0UKIX7sFqu3wCgaLIl5MwtS7PWF1HKG9kyZE12lG
 soqQo+IN2KMfc5l7Vx0RGZLT+efMhtwilFnVnHZKyrxPCNEv8eTbo+IuUh4/vtzFhc7qCWrNQQE
 RXGP4jwkynZ1WqBdRsmM5GmQECW1X+2B9+oNewA4xjEpoXdv6XpyUBHAWcnBShh+sgrh9Jo25GZ
 y45RrOSPXH3/SMUbc2g55nFzNsEweV7SZ6K1n/L2iB+tIQ/Q6vDBuQxTxAKSdcrGtnahy1VZx9O
 MSZcwuB8Jf9DsQovyTQ==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abe6eea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=nXFshbbQUfh3okYZYowA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: ki5FnivFYppDvll7XXo4XWhNeyiESMYM
X-Proofpoint-ORIG-GUID: ki5FnivFYppDvll7XXo4XWhNeyiESMYM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX1gSxnPyGVtBg
 zsx3sylQDudpf6bE/ILlsHuvJVfFRlgPCg23DzZE6lY4JmX5rrgqJyr6ONZAvNBZMgHAJ/oAl3c
 u2CGiIPk5y/ktHAf79Ze6PPM09U2FVM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010057

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
 drivers/gpio/gpiolib-shared.c | 111 ++++++++++++++++++------------------------
 drivers/gpio/gpiolib-shared.h |  15 +++---
 drivers/gpio/gpiolib.c        |  20 +-------
 3 files changed, 56 insertions(+), 90 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 604777f252bebb1c3e6b471b5a55e1be7beb0f71..b9ed9c1a913ab58aa00a46eee87362651b863533 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -36,11 +36,12 @@ struct gpio_shared_ref {
 	enum gpiod_flags flags;
 	char *con_id;
 	int dev_id;
-	/* Protects the auxiliary device struct and the lookup table. */
+	/* Protects the auxiliary device struct and fwnode. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
 	struct auxiliary_device proxy_dev;
-	struct gpiod_lookup_table *lookup;
+	struct software_node proxy_swnode;
+	struct fwnode_handle *proxy_fwnode;
 	bool is_reset_gpio;
 };
 
@@ -315,33 +316,51 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
+	struct software_node *swnode = &ref->proxy_swnode;
 	struct auxiliary_device *adev = &ref->proxy_dev;
+	struct device *dev = &adev->dev;
 	int ret;
 
 	guard(mutex)(&ref->lock);
 
 	memset(adev, 0, sizeof(*adev));
+	memset(swnode, 0, sizeof(*swnode));
+
+	ret = software_node_register(swnode);
+	if (ret)
+		return ret;
+
+	ref->proxy_fwnode = software_node_fwnode(swnode);
+	if (!ref->proxy_fwnode)
+		goto err_swnode_unreg;
 
 	adev->id = ref->dev_id;
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
 	if (ret)
-		return ret;
+		goto err_swnode_unreg;
 
 	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+	if (ret)
+		goto err_dev_uninit;
 
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
 		 dev_name(&adev->dev), gpio_device_get_label(gdev));
 
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
@@ -446,23 +465,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
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
@@ -473,48 +488,22 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) != 0))
 				continue;
 
-			/* We've already done that on a previous request. */
-			if (ref->lookup)
-				return 0;
-
-			char *key __free(kfree) =
-				kasprintf(GFP_KERNEL,
-					  KBUILD_MODNAME ".proxy.%u",
-					  ref->proxy_dev.id);
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
-static void gpio_shared_remove_proxy_dev(struct auxiliary_device *adev)
-{
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	return ERR_PTR(-ENOENT);
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -616,15 +605,9 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
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
-			gpio_shared_remove_proxy_dev(&ref->proxy_dev);
+			auxiliary_device_delete(&ref->proxy_dev);
+			auxiliary_device_uninit(&ref->proxy_dev);
+			software_node_unregister(&ref->proxy_swnode);
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

