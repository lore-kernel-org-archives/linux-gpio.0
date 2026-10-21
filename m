Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592657;
	b=DIQcG03dUseKh9uBkNxgX2IPjKdShJm9qE1956fxJtvAYwwaV4jj08ZLIE2yvzKvEAwZ
	 eBS5gLTbU3OS7RgfIPd2w2OkXKpAIQyl+w53CCYy0ybgOh1YP+j3ax5LbauD46wLNXi8/
	 +hlxGxkS6ZUAUHKpveDFQ2JbwZZVPt8rcLmyUSOjOngMisjM1ByZXbnAZ0F+2ovs1+M27
	 eJqBIXyZEUZ+FQ/JTcIlQesDx0r9tyFxLIGislfuVEeInVzYC0tpJ9Xkp9cioRa1HyS/L
	 VY/iMne3OMIcgM5zrDgo9jS04626ntqYdzTTQL96BkG79AL9vYTFZweXWwww6DLKbzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
	b=QwoA0xvKbSkb7Cjf3VEWR8e/rEqqrCnP7ecx+amhZ34mMYWzOg8teRX1fuHqqaJvRcTO
	 qSptBY5m2VYuLgfem/oXG+gsB5qG9PGgzIjPuEGXeygBSMrp3n7N6K+m0J0TLKCKHm/kM
	 iADvOjGfU0kM4Q7QK7FlbD90eR35dxgyyMnSohFRbOrM0unhFedgqgy2Xvt4OaEozciU/
	 Ij8o/fQ2Q/RD6eGarlGnlK1tXJbwqFs2QkcqwHE6WMtCINnTYSL47kFZoq0t4tdVV6xoE
	 yoOH9YLHAa6efbJ9UTjFArwsBSN92jVOosSLj236qm0nGW3F+wqpO+JolFu0TcnCuTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KV9IkI6a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJg1RWkt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92557606A323
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92557606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KV9IkI6a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJg1RWkt
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEEwai657186
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=; b=KV9IkI6aZGbWwOcF
	p2Dfo6ODV0xohNyFrAaisrUphelpn/odxb76U1BU6WY1KUi8JQrVgnf2PWINsotC
	V4jn7D57H1bJkz+Fh82WB5ZWzjMNNDDeaRWzLgcsDbry/39yCmJjVJzssKdVNjxL
	Yw1cjQMviC1lve5/s1wUz0z1R8Y4GkSDLWPDWso8M2RzPdF2qZxr8Q7pKeZQmOeP
	rZZzZ2qf6Fgq3s3nbH0f9yBDCKi4WaQZNo3pzabLKy5O3cj0cvjuOdjebUORiSBI
	0R73CqFZy6UfFUv8nMSU9zBvG6gQYzqysGNYynY10H3JubszleL/IVrCfOdp4kOt
	HKKs9Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4cq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:24:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso189899137.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592655; x=1793197455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=AJg1RWkteH82Aay65Nys6pUDjEXT+8rscchdyNg3sR/a9qrIgB6MOhLJGeA39eQQwS
         kSvt5DLduMXAIQrA6MvT8tJCdnNNwlU/EHJGMgu6P31jyJ3qhpIPWVkf8b9oHRhbyUF1
         coFpzfkXOBD90n1SbhHglNsyPUh9bKh5aSUa508pA4IlOjjYztoxp7Z6tuaWQQP6kxqG
         n5ntcNrofAepvHoW6mssXzqj6+g9QUVfowcDBslVa7UuZeXuHfYs3tCFtIkaWTy8rL6s
         lbKODFoAh+8n6SzWIutAQJImuqr7sQIc6Q332UjQZchzwIr5oV7+uQ5FVkr1ooKEiFVn
         N9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592655; x=1793197455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=R+q4p25ZvwbiE7R29QeKaflYRX6/Yq6HuE68PBeXksZaBhE5CIWLSOBkSIufzhcjEU
         vwsjGvVH3ALgKfJjskijlu2zTskngYDyKPKw2eBFOQiNsHxpcFi15Z+Gy3URYhpfYlGY
         BUmboE0lfPSpOmQhBpADFykfE8NZFKr565K+MQsKUfucflobk699Qj49hYY/oE5Isein
         bOj5dchxutbF6JXSW7IwHt0ql1SFO9i7HAtVUmf37sVRisz4Mjym9pVQ3wTHYcO90k5w
         ayN9nzH/TS2BRVvuduoKxFURg2Uv4mjKxS11MTd6FE2Ol+N67yaAyD+lxVfEI4uFrqRk
         3U7g==
X-Forwarded-Encrypted: i=1; AKwUvBysZpUIS0f/LTsQewuwbdpF6irvMuhFRF02Q+v8+lvqI/CoIso+Gm4ueS3jx+IZ5q4AkOEH9IkJr8wA@vger.kernel.org
X-Gm-Message-State: AFq9FYIZV5XWe/Watsj8PMWGBfAdwelhBQugywB0RzrwQfdoSo95gV3o
	9Nx9MJfB3XszxJuTZ7UXxozXxvpJ1nOAVyQu5RaRbHuNPjfddNFdTxVPfXygZB2i2vkdPSPJhNl
	NiaEgCA5Xduxa7WppQKq8PyS9YvvjeMzKEHEELwUkpsI+4Qojd4PlHWY6ukqPjX/jEExdACA9
X-Gm-Gg: AYBFou0AGxgkYDAVlG+g+hGenAh+JFwTLqYveBhWrLhmry7aHL+P8rtJtunCRbCt0po
	WuaxVOPtbOCY1vZrLhks/+wDmj0ht2QIDb+knC108tDxp+xTNdfgCC1Oa+JrPksFO89HIKJ5F0C
	nW+J08/c9v1GZtwQf26kGrmObznjEW3SxluLe7aXHh0wjs08MQ04Vz3umGULiQ/wkjm8XhyatbE
	80Dk9uK876Ib+l/v51mFLV8ZM18QXMZ0Lsun5JnRBTmpkfIDzoRmggF8naCN8CTN9OFN/bJ8vRY
	1TbAhmWLA6MCvwt54iZEeuQrBB0pU9TxAOCfPoL2Nx0guouU2DOkaPLi3yTIvbAnAqaoLE3OfOB
	ryZI11Ri+tw3ZpTHjq3VY9lO+ViA2
X-Received: by 2002:a67:e105:0:b0:7cc:9f01:1378 with SMTP id ada2fe7eead31-7cc9f01138cmr353467137.1.1792592654722;
        Wed, 21 Oct 2026 07:24:14 -0700 (PDT)
X-Received: by 2002:a67:e105:0:b0:7cc:9f01:1378 with SMTP id ada2fe7eead31-7cc9f01138cmr353451137.1.1792592654080;
        Wed, 21 Oct 2026 07:24:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:24:01 +0200
Subject: [PATCH v6 3/5] gpio: shared: unwind partial failures in
 gpiochip_setup_shared()
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
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-3-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YPpWiepHmt10IMBzkn/r5B4TQufGQN9PhXoJtFoPXFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsGlu81L5Y1DM/aprxNqDhwnqEGyxmnPX6ty
 0rTU3eK2QSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLBgAKCRAFnS7L/zaE
 w1uoD/9PNlt/C97cUGxf3g+4k2zPmBqF/MvPhB5PPvI8HVJDMzT8U0mzy/1XCfjfUCOGnbKGi6s
 v75al8f6LB9ad7rmQ22QpJUUsul4R4X+IIK8MI/7RpPo6UOFM+ldw8xeoIo5W+GBYrLyKKSZqXD
 npZj11XjrQ9e89892RMn2gW/e60nxOLCAOw9L+Hhhy+S0BakqQNy0g7USKvYiDjX/FyhSTpl68p
 4aUF7JdtzgqpxL8yz88jgHwscigkna/RrsD213AxjDaIctXhcqo5ha7hrR1Yu/PkpoEKZkdZP3B
 DVy9UMtmEpFG18XEAJpjzNCTEP4mrfMt+LBShJZMljE2kZQZAQ6IqxhvNHkn0Q46W2UE1LCnajv
 fmcmbh6ef7JAZ2/IMB1ngfoasQA+YRAcBolHwnTaZuh4uNWSfkenw4gYg7QWUdpBPMbjlK6aOjo
 S6XXtL9i0sfyZPxfDjkDenlmBoszh0NtMjdg9Kq9B2bSQ9XKGDVkjadBOnfo7LIASkkyisBR6Xg
 lSow+jz3FRw1TzHZZdhHoJO+BGoKwGjBZ5al8szRJGhjphWnObwLYWcy5C3oWgKKKsqUYZ4OGzh
 o7xJ0FD30LJWi+GmGpoOWfENy6HhfNB1LE73GW5ne4PczXvjUP+2ze5z0mzyFyJlEe8kSQXiTYE
 lDk7aYo5eEnXedQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXxx9dfcmbJhcz
 tdYhmdpSPq0hCXvti4CrpDLRzFB27shr3uT+LrZc5y4TWa3nehYYAXe5z/aq3FwIoktW3LQInDm
 KnTesVLutdpHibHI1dV+ddyi8vyl2z0=
X-Proofpoint-ORIG-GUID: 3ZzdUTOoqeo85n-sYPBg6ffcoRvwkPK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX86l7N/uCgif+
 nrVul2RAQfupfWytoqoI/KyNImrQ8Ap3hNVnSsFtafm39EY8VuPwYXtBUvYOvjCeoNR77JWMngk
 ltJKGZa4RkFG6IB9wZ98cXmN7Fp6z+WyEMaXOuaMOJ51gYXGZTLuUP1AVtaTIgt325or7swzWWQ
 tm5cWfv+h6BQbGL9fNBxiH6nISWEMP+JPzfI1auaVsseausZAbypc22Q79th93YsIii/Y6L3YKx
 g2L17qUNv9i1e2hyJJuH3MsAUyAEM7xToZJ2B9xw+z/le+omXIF//DUGdZ3jZu9lTqRC9rpiKyJ
 7Jzm4JFjpgcgBinNRgeKv16yQW8tkTdcgWkjBTScXG35AXWzcdIbNFJeAc51SQvvrMrqfM431gM
 AOJokmGn1MqMCsrCzav8/e7KP7/hKd4muwxkimTQmFdO1ggfGG0qp5JbiPnlk5AP+I2jl9ILjdt
 ZBUXInReaED4VvGqFtA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8cb0f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 3ZzdUTOoqeo85n-sYPBg6ffcoRvwkPK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

If gpio_shared_make_adev() fails for one of the references of a shared
GPIO entry, the auxiliary devices already registered for the preceding
references are never removed. Similarly, when setting up an entry fails,
the entries that were successfully set up before it keep their requested
descriptors and proxy devices, as the caller does not call
gpio_device_teardown_shared() when gpiochip_setup_shared() fails.

Make gpiochip_setup_shared() all-or-nothing. Have
gpio_shared_setup_entry() undo its own partial work: free the descriptor
and remove only the auxiliary devices of the references that precede the
failed one, so that no device is removed that was never registered. On
failure of an entry, tear down the previously completed entries in
reverse order using the same helper as the regular removal path.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 47b434db72f1ebd35ec36ebdb35f30809f4522f2..043d5daba7a73062151a089b3ee8ccdac726f221 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -589,13 +589,25 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 ref->con_id ?: "(none)");
 
 		ret = gpio_shared_make_adev(gdev, entry, ref);
-		if (ret) {
-			gpiod_free_commit(desc);
-			return ret;
-		}
+		if (ret)
+			goto err_out;
 	}
 
 	return 0;
+
+err_out:
+	gpiod_free_commit(desc);
+	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
+		gpio_shared_remove_adev(&ref->adev);
+
+	return ret;
+}
+
+static bool gpio_shared_entry_needs_setup(struct gpio_device *gdev,
+					  struct gpio_shared_entry *entry)
+{
+	return device_match_fwnode(&gdev->dev, entry->fwnode) &&
+	       list_count_nodes(&entry->refs) > 1;
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -624,18 +636,23 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
-			continue;
-
-		if (list_count_nodes(&entry->refs) <= 1)
+		if (!gpio_shared_entry_needs_setup(gdev, entry))
 			continue;
 
 		ret = gpio_shared_setup_entry(gc, entry);
 		if (ret)
-			return ret;
+			goto err_unwind;
 	}
 
 	return 0;
+
+err_unwind:
+	list_for_each_entry_continue_reverse(entry, &gpio_shared_list, list) {
+		if (gpio_shared_entry_needs_setup(gdev, entry))
+			gpio_shared_teardown_entry(gdev, entry);
+	}
+
+	return ret;
 }
 
 void gpio_device_teardown_shared(struct gpio_device *gdev)

-- 
2.47.3

