Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB4E524AE6
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685144; cv=none; b=sZRbhumkFWLQdAuljJ3HJ7hvMgnIhq4hlc1Cr7j46CP6A6KlOYdobvT95lYTjT0fbpkMz1Et2Ypn2hHtNHfvwj2ZT25+Y22K+B3b1uB/MzDd7Ysupja9RpP7xDilWB929qEHtqjBKbMbIFimOslcBfxHX/R1ZwlezOdiLWEA4ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685144; c=relaxed/simple;
	bh=ToYpGBC12hzJhRDzJNwcgUv7r5Jiuiuajg4VXkHeTd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfmPavuFJtcfDEfe7BL41SA3KH7VgvsixT9MWLrTYWLlfCtzMvV8Vs29U05+Fg3ttr2u+gk00zwkCdFMidAsYeWKSUPvx3OOgBCkV7W3OaQKjs/94xCNxoywnmnj+GGK7VbkZsZF4mWhvgQwR0Wo6RjM7NhI2jVYW8AZk/3JFLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQG2xYl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzgF1BHy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQG2xYl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzgF1BHy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCEM4r119164
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	raJcTzmr5s/EvuNwPUGO8MAZeKAxKXT47iLaGrEQTTw=; b=fQG2xYl727KoyxLp
	EOeFYRBJvqGpI9jpk7uSIpK7yNT9gQi0/G+CaRI9kVksPo6t0S3Q3fuPXA9whmmT
	Xr0dHocg2JvbNcypT00c/gG6shf2DbKvLOPxME4rCFCUI2XyOK56Dp1GrPipuO30
	QVhsctco4q1wLTM4ez340OiQJkWrg0G6Hoa+AjuDRv946mYwjW/nwRTQVCNoxudb
	zT3KOLaUOTPf0XPhDZ6V9omoRg25Xlyx8LHqG1xhCKWgEivjspcimuPMpC9rI3sL
	n5SbgvqKWJfJH7bExbYKAYG3o2L6UQmZybXhT33VK0mVlhmTKwiBBO3tj7htRNYW
	OhJhTA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144txdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:32:21 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a77961b860so713988137.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790685141; x=1791289941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=raJcTzmr5s/EvuNwPUGO8MAZeKAxKXT47iLaGrEQTTw=;
        b=RzgF1BHyMUCwH7X+m9rJfKmzOc4OFR8rgjpeNdUVf66tDWEFTwMSvumBl2sgqb1YOH
         m4k+drhuHGsenuIHH1IkvzaoQ29G1VvnovVFuWxB0HLYDcRJr3BQOLjB0DMkb/V4aqMn
         aLdfyfJ+CVAQ7Mj63Me2chHeiQ0z8Kiwej1cfW1e9vmXknZvlXbk+R3ixQ+Zwlre2FPC
         V5yCrnOcY81m0ON672Aof3s/kmgLiwDcj42VDVhkdEhyHDS2OJ4y++q5+JsfRX+08pZ3
         NsfoWEFCCyZXA6ovJ57VaPIS7XTfWSzrzgALPooBVKNcV1IGL9bZpvXyDAYI1IOSux6e
         II0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685141; x=1791289941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=raJcTzmr5s/EvuNwPUGO8MAZeKAxKXT47iLaGrEQTTw=;
        b=OdT9YU5S0ETZNsbu580QKxALs1lXhWlPKlxQHl4Rakv9f5KSGwL5GcKCstGU6lYb5S
         28YyuQCJsfGsaHSr8TAAUXM2RLZrsGYI/FQw56+4M9N2v0e3eJdwK3WV4HTFxXBfvf7B
         BTqWA24+Wo/8aFawDECJil22SLXxyXkTlbm9AHkwt8HK/VayveHiSJXQ7VpdtmQ+TZn0
         35mXaxVsUZow0NlBzHfrYy3YxLzS0F9QnY00H1aSqKVbFICPOcnpoYQVmethZsOd1+fK
         SuSuXb+1j5lWlm2cKIICLtUxIqBf6Z3uu2IQFmA2YYT69tNO9HC5GuePhMqimfaiJzFw
         o1TA==
X-Forwarded-Encrypted: i=1; AKwUvBxxw7q5QkOcWIvPuj0xAJXkl92BAaqnpQ/m6vzOIkjsZRmfUHv1N9rZTPH6pulHjIn/wm5efFNoZXoY@vger.kernel.org
X-Gm-Message-State: AFq9FYIUMFw2H6dQ+Lb2DD5jOEZ8p+aU67vbUPDotcipyqFjlu+XMjNG
	rbt/y/7wi7k4F7jShH+29FLZuWJ10ZUZZuSGYpwhwFbWOkMPALx+n9YnbkddlO333qMm7nwuHyw
	cAhJZxpAFLF5FtYfo3ztJ8+89jn32+n4goR0ENjjo/Dwsy6Bff1HYpS70HD1SEXUj
X-Gm-Gg: AYBFou0hjtH7nncq0764LCEFDWOzxl6WqOlQhR8nu0+/WObzWYfEg4iPpHOp2hLAWFN
	URkvexb6ZN+QeTPin/OWp7Tb/IbIaIypKkuHTvHo6NRTHafH0vHYt8es07GjgUrFRXptEm9gzfV
	4YusQWHFw8CtUzu7Pu2ERqZ1lYrVQfhf/KRSK6k35ys8O2PChkdnYXBNVi6dMHZNl9oYgpwJZ0F
	NOQ5sCqKbxXgsRwoz/5Tej56xH1E6db8pKUObUKOBlh0THR06f12bZRflOCY9/M36fldn5YVt7l
	0HTlPsZ7v7LmCN1N70eS4wHwauymC3aXEYYRuMet34QwY9Lux7uZj/ZV4gAwbFS95pKChyz43ub
	eMJtsrZ4s4+tYwfa3zdXQNyzmDdPn/Q==
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr4955723137.27.1790685139354;
        Tue, 29 Sep 2026 05:32:19 -0700 (PDT)
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr4955713137.27.1790685138812;
        Tue, 29 Sep 2026 05:32:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1e:67:47fe:12a5:a874:db1a:dab9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm79190355e9.11.2026.09.29.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:32:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:32:04 +0200
Subject: [PATCH 2/2] gpio: shared: fix no-device, fwnode-based lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-gpio-shared-fwnode-lookup-v1-2-57d54811de1a@oss.qualcomm.com>
References: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
In-Reply-To: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ToYpGBC12hzJhRDzJNwcgUv7r5Jiuiuajg4VXkHeTd8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqu6/LzOv6mrMl5r7HjPnsgpGsJJ+ZPF2DuUvzH
 ru5c0lNJG6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaruvywAKCRAFnS7L/zaE
 w/WbD/wJ1bbK5xvV3eD2wcwN+qguprO9o3atp/MhYHrNvaJ5lWyX5Az3rh7yZkIVEEmFhUx/5aa
 vZk3FyeiF5ZVD454FZjbWsI/9ztR3iHfAdDyP6eB/u71hWgG0QQjWSr0VGpOQJuKtHMcpDrglfQ
 jxvG+aWZoctihJt+psY0OFibxens+3vf6rSPbQQFrzVwlkbDHyuYcnjLiisGTsUr6TU3ErUf66N
 P6RIiU77Ns7gvzDncX/ULaIpLEwhdB4oo8PlPkFcUH6dL3Y5f9ee63Q6uUlN982TmM1ZV/K4rMi
 9Lzne59vsyDY0Prl0WL+ULdnyP2CiIOGWN2IRThYDs1fmPdvTVFcDo5R8pcnXF4KtaXfW28eC4m
 uk/euBRFcSkqHebtsTldNvSUivUkHUpwxpbIZvCTJ7v2+BMQPfA2gTyAPkFV8FUhWgw3dHJFRGT
 wUIo3c0V9NmZmDHdjpxE6xKmHy0CkdqnuLnmClp0LPQp+nUNLXRzX7p0MV5sqlERvKrN7EQ++NQ
 HkTws8kWqN8GVPuQinidtYEKa4UzfbdynultZhPsmqYo/WDLaURRsrrZ5bys9j+EC/jGoG9dIai
 bYKsj40DS/U/c55b4lXgbt+l17DPGBO9f/PAz6FkHEAVzzrkjTTtMua2ttmgS7AaXtqZNvVSQO6
 PYt596xOZFOF7rQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX08pMUK1isG1v
 T+gJbvorXqsSd/aEM/14f/CjZodsralp84xO+BinZET3jdW8YrpcgeUYKvVQg0k3bEc7HJqO+gS
 vVEswHoxGzwaxcOCSp4VdGBbCVzxXs/SdB44tn8N95tu9seTs4b8fdVMGYVOwfP2LoUJmhjvQuo
 Coy1hZ5h4G5++WSMPJRlacOrN+KAZVD87nBZfihXRPjHKKszkUb/h+rIL8an8HKA6KeZOVUzWJ/
 sRbi97TfjrC60lBTn/D8Vd7NOjWYNciRYkVZCv5LSTVbFEy845kTAN6Pxn0fux0ZIiZiyLaUEgX
 +aUGWufYICZVMtzUetFDqI74U9Lv7jDb4q4sAw1T6jCiR5idkPQmFoEkgXxpLF9yapgsf3+UZrm
 9jk+RXcxNceV8bTBVD/2+VbGKUbqdliRCTgxY1hl96o9orTZYnyfCDZNr9PRrOd0kjY8u/VxbYP
 Efoba0RHWAfFyKLm+tA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbafd5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rks5i3XnzFQczMNaDf8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: etNbpws5NxaVX8dwmZu9QximvjQaVIag
X-Proofpoint-GUID: etNbpws5NxaVX8dwmZu9QximvjQaVIag
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX2rRk60/1zrNL
 bYlkMcfRzj85n5mbYeeerUAoUQ8Tj0IL8mT34tT03OdOSfVV9sDyAwzVXz82OLy/9c+OoDciA59
 7TVAFYsCsYKuZnPPXEaEH8Qfew53hLk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049

Fwnode-based GPIO lookup with no associated consumer struct device for
shared pins currently causes a NULL-pointer dereference in
gpio_shared_add_proxy_lookup(). Add necessary checks for the consumer
pointer.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Abel Vesa <abelvesa@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6acfec73b73477245c7e4c593f2925efbc8980c6..acb420d77d2f286c40888b2d2660eea15f79033b 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -449,7 +449,7 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
 				 const char *con_id, unsigned long lflags)
 {
-	const char *dev_id = dev_name(consumer);
+	const char *dev_id = consumer ? dev_name(consumer) : NULL;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 
@@ -457,7 +457,8 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
-			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
+			if (!ref->fwnode && consumer &&
+			    device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
 			} else if (fwnode != ref->fwnode) {
@@ -485,7 +486,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 				return -ENOMEM;
 
 			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
-				 dev_id, key, ref->con_id ?: "none");
+				 dev_id ?: "<no device>", key, ref->con_id ?: "none");
 
 			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
 			if (!lookup->dev_id)

-- 
2.47.3

