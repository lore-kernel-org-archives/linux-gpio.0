Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220039;
	b=IJU1fAMDaDqTTS/WJ4YegvGB33f3YOastzhJY88c2R/TGfS9UvWOelh0kKw/5Z/UDP3S
	 spRVs7ZGS7iyhuI8KYhfQz7envhvmEAypr5UB4/Sw7Jgl5/iTyAWe+4xOATPAsMQgRfgy
	 85tmFEilFCMyDkL0OfOCKQ3uru3uASp5YsYuSeERPiyywh46k8aXZ8WwtwTCs6dQnISUz
	 hig+XACWNhYK8yvZuDZOzjBSn05+SZ4LSgVsCdz5tEiWFe9ivGfriUHkgC9ULI7YEJmM3
	 BBTjR15Jz1vIQZxOlA5W/WUM4KXLh6uUaOjgK/sGKmuI1LEPyj1AgQq7Mz3ixRA5Aeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vxIqLlqHQBIFPLmScv9Sxb0MBD7maGPGOlcFyAlmpvE=;
	b=1az4KTbJoc+YAP7gAMGYrrch/MBqfLugHR+jRRQm1ssoHwGt5bgyPwNsb8SBPLG3R8nS
	 5aAfNBsgP3SrZqiT1KskFTyfEfx4CTIM4pcvw1ZOE82PS4qcA3oWaxQHkWxNdDcJR7/K7
	 ZzMmimMUs2cmekehC7DE4cuKGfvp6+KqY2shjtlrjerh9JKrlAzpF4uRsxBjZTNzLeJGJ
	 aMpP7LIIUfQC/Wkk5ccpi/w4uqCi6jYz4wjQYl7TjncuqaagSKevVAyRp9oHZVm6EmGSD
	 q1JnWLuAtQAEydtKCHyGAtDg/suF9hYQw77wl1l+ByCzRjI39IztqTiZNVouMfhz6qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m171uR2c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHdODxl9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8E0606D837
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 10:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC8E0606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m171uR2c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHdODxl9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uuuk3792014
	for <linux-gpio@vger.kernel.org>; Mon, 9 Nov 2026 10:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxIqLlqHQBIFPLmScv9Sxb0MBD7maGPGOlcFyAlmpvE=; b=m171uR2ca1CIs4SN
	xcafXoyqukjRLI6SD/NAZ/g8zvLKvXx2YIXg6KBDXSyGHedk5OigdW/BtH/lvO4i
	KxxJxMGZc8cgLajkZOfGVbIDSct68GMXK8W/5e8qTROsFX2gBlYbHGsDhK7CfDFO
	85j3xeA8B6VF4z3jJCQZ9FI0OMfZP9j5nQRuM3qXdreisx+ffb8EjEsRqQWFudH7
	6YfWxqPLn8GQw88D0HUVsBKV5sxm9yOiV4NG8+lk+OMHg5el9G9bi9aEeTv/Abrz
	6g2VYI6u5V0A8ZrkfQi7+ayvlbCdX2roANFc/CwWJUT5Bp2kbZxkCdU6EJdveXrj
	mTKK/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwy6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 10:27:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so136232685a.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 02:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794220037; x=1794824837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxIqLlqHQBIFPLmScv9Sxb0MBD7maGPGOlcFyAlmpvE=;
        b=LHdODxl9qIq3IXvYNQuJFNj8bJwlgEJW384iEea7qw2+16wrPLlJZnV94hrNWFwdPD
         gYBHI9FQ0A0vOt2kpzrFcdE7rZ/li+BAToxmtSJoff+AMY58xYDTGeU85Voe4zxAYkRU
         B8o/NyJM9u914NCKnwOlCvdkDwaTHYh6BtLV9AUqr1Fp6RGjFtXpgYN3kd3AQj+aVHRC
         4mQWZysWGoCtboACuTYG1B/J/AMz241o/eoP6lrMbhR5YfeujkNWcVZUhmuXj8zI/v4O
         L6Dk1OM4GY4k/J+ZTZ7xbsUiFFdoLudKdjrqwKzKI0Mb1og7e67tWPTZeL3vuXfysinL
         T3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220037; x=1794824837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxIqLlqHQBIFPLmScv9Sxb0MBD7maGPGOlcFyAlmpvE=;
        b=PKLT79j9pPC4z8hE4HBAwXC1hZFkKtipn4aLmKs6z7/+3Dsianp45gEAgwidwc/y/u
         NeBBZI0U6tPLWN46PVZsJJXWNcE3+avYc9krDf3Ndv0srN9QE3Q0uPG2JRr3SAyWEsd9
         NrtIseRcgmFm0Ly8fInNh/vB5ifd4Rom1Qxl6zHvghlmObyGysHpKau/c24tjLMNNdQ6
         dqG1reVMNd9TI4aOqD7HSewe4ggThsZGjtKMu44YILiTcrukjHcOE2obj/oCWIIl0aoc
         UFEk64LDVqD7NCXtUX8SRABk5Opo9vPa8y25U7z0zkky3OaVZzF7asGuazlZ6huYDrHZ
         w73w==
X-Gm-Message-State: APuU4Z/ulHFv9FeVuSeIhOwSScNlRHpe7vpqbmIpg4xQ7HY+wMQHjyy/
	U7KbC1FuoVrG4Rw3v/QY2oUNHyXavR0AR0cTnkCscvjDHQnpyi27yICD4Gh5R/SrBtv9iNoUmZF
	6iUvFZfVoJKLgCnAwC0XmO41MxUGKdeUG8Qr1h3mDTm67wCCQ7+HPdPDRjJhNYuWY
X-Gm-Gg: AYBFou3jPkgUN+1PK5f4Z9AgLNsyoayaLxx73Ut0p/tQiy3357U32xF5rcJHPnpPk5s
	TQ3d3dx5FOWxORsePmLOIKz6SgtGoq1tytepgVC1sK/5t9cuEvt81JE8rtXvVEEiB1kROr1IR/P
	KZ1De/Ek6wiMR5oiC6mr8MpozMZnqOFlVHt0rXG4A25ZWcLvfZpET2DGRxlppTS/kzrQVnrG2l1
	qhvv+AgkCWYeSZ9sKTkJB+sT7BhpDcHL/uTEfTTEaEg3/BTUNddydCHdPbCfEi/QdtAjjjMDa4Z
	Or/ggsTm37Mb/ZP/if0uBDNVGTBDWqOvZQczAYTDAswVRdCAwItFqEstCfXs7ZekCAYimnh9u5s
	uYFsVhbK2OdJr6YuKp3TR7rP2pABLpLg2QhmBeubh28BLBGd03lOvpvIFEfN9m61UY8F8HoRpJ6
	8HXaajA6/U4x/pppp35aQ4E4GWLHcooBoaA2foLHOs1miQ4raXjEOSDq5X/2nuKQI=
X-Received: by 2002:a05:620a:2b46:b0:93f:e52:40ec with SMTP id af79cd13be357-94784916c8emr463471285a.81.1794220037366;
        Mon, 09 Nov 2026 02:27:17 -0800 (PST)
X-Received: by 2002:a05:620a:2b46:b0:93f:e52:40ec with SMTP id af79cd13be357-94784916c8emr463468785a.81.1794220036886;
        Mon, 09 Nov 2026 02:27:16 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm237381545e9.5.2026.11.09.02.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:27:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:27:08 +0100
Subject: [PATCH v2 4/5] gpiolib: don't overwrite the entire flags field in
 gpiod_free_commit()
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
Message-Id: <20261109-gpio-desc-flags-atomic-v2-4-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eW7d6lPWl7JriaxL+uhRZPNurMSB5KL7r6fnnNoTZzc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8Z/7NZwQ0eloe0hUFedBEHfBkhMOZQUx7lAkp
 NvmON+qYaOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavGf+wAKCRAFnS7L/zaE
 wxR0D/47Vd+uhH4UtFj31MSdEIBL4QW9yNIK28Urt611VYkzrDhSvWvWheZ5dw0Vw5Useug87DE
 GeWTeqrPu0mUnCvYbfwe/LEsQP25WY7ADS4t6GggvUxfB03MEhzzN6+RFBQnsPJbVeUcCDSCeRV
 MtICCjMme08661JY70THwjgTHkquCXJH3wBFaZrRsQyh2YkTXck0OijP58PmZcXvicdWfAquFFG
 7Hpt3swV8EcbP/bQgRGo5/ZufyzA9rsbIv7pK1Qhln0VwXXHlu8YZtqPuf0a0h8BRSuLRom4Dkx
 DQDzqf0yQWdTN1gQWaofFGLHt3YUTrKOZoZe8A5clxkz4BqLNNxS/RWd707rX2N3aQl0vkuka5z
 KFnF7iEXbEcgDUJawtS9jurDP7eKXGNri65arJ0zi+6si4BTLOWJWM9Jz0oCyUMK6ln0zqeuDp5
 KLD/Sikzb5uJ6s2R35q3GSveTyI4r7kvn97edFOFyc8kSnzXdKkaeTOum28lQ/mPckn6odDrdY9
 4AMBvu8YPZnGK2oLdapMOQ7/mtHMhjZfeQUXUD6Z1JVw8KtGepQCMT5V84xL71MfskIwDNjEJSl
 rBnYLtijSxQ0guZlVKt1gYvvFNv4teZRs+ge/VjaXDIsPOODEtEnh/Vl+YuzI5NNudaSO1l4uqm
 No+4QwkmGC2uv2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX4F/kXkRnixrs
 ulL69/lsnOjH4Ue22BnnpkxLy3fkMf8BH5PB1bXPNpSUdzRg37pXBJS5a9sQTDA9zRMU41fNht5
 p4oRfZ0xKv8wBVgNMI6vvjVHQoVvAYatCGw5QbV4t7aly/zhiUOmFCj47/TmgJwvxduMRtWfL4K
 KdM9zI9mqR+smQobqRjCEoxlBzfkA0pqfTmtwujRvdV02kVvO+w+DuuuWMDGtBlMVHwBaW4Vk31
 bPDopGZHhE5LqMx1tH1DCmEDOWr9t4KRTQx16Ya/JEuMUshLyC1qx9jEfI7cv7yklrzhJ0ewnAa
 JujGYPOi+m8aj8AR3j7hVBmtngFjoO7yyezT1zH7BHhmp012+S3L9MRpLWxw6eyxAQkopXjHgTB
 1zwnp0BPMYrVJkmUDQbdPUV5MtIzmcaLB9SgJQf5/KoPvqWxobJdjMyY1tSDiGLFHt0qUbPNKri
 /hG2AaFTSgnYIZFEdhQ==
X-Proofpoint-ORIG-GUID: rYsWXpSvBnSJ4dhUJRInn1hD5WleVJoq
X-Proofpoint-GUID: rYsWXpSvBnSJ4dhUJRInn1hD5WleVJoq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX5JCsin2QLkhh
 dTrVXAx4pfhKG8HveaL53kFvu7SgVnVo8Zc0S1WXskGFOmcIw1OUYHdKaWumhxxmSeAAqVwyqa+
 n+LBDrNJoTJ8yevY3H80m2qj0xir9cM=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1a005 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=obTuVQ2JAUH4m0gggDsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

Use gpiod_update_flags() to clear all request-related flags in one go
instead of risking racing with concurrent users and overwriting any
changes they could have done between READ_ONCE() and WRITE_ONCE().

Cc: stable@vger.kernel.org
Fixes: 35b545332b80 ("gpio: remove gpio_lock")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index af2d67d977f4925558ab77c34b37c3c29bd12a6f..4c9c524389ca13e422bca8c217b7f47477cc0dd4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3,6 +3,7 @@
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/bitmap.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/compat.h>
 #include <linux/debugfs.h>
@@ -2696,24 +2697,23 @@ void gpiod_free_commit(struct gpio_desc *desc)
 #ifdef CONFIG_GPIO_CDEV
 		WRITE_ONCE(desc->debounce_period_us, 0);
 #endif
-
-		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
-		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
-		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
-		clear_bit(GPIOD_FLAG_OPEN_SOURCE, &flags);
-		clear_bit(GPIOD_FLAG_PULL_UP, &flags);
-		clear_bit(GPIOD_FLAG_PULL_DOWN, &flags);
-		clear_bit(GPIOD_FLAG_BIAS_DISABLE, &flags);
-		clear_bit(GPIOD_FLAG_EDGE_RISING, &flags);
-		clear_bit(GPIOD_FLAG_EDGE_FALLING, &flags);
-		clear_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags);
-		clear_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags);
-		clear_bit(GPIOD_FLAG_IS_HOGGED, &flags);
 #ifdef CONFIG_OF_DYNAMIC
 		WRITE_ONCE(desc->hog, NULL);
 #endif
 		desc_set_label(desc, NULL);
-		WRITE_ONCE(desc->flags, flags);
+		set_mask_bits(&desc->flags,
+				   BIT(GPIOD_FLAG_ACTIVE_LOW) |
+				   BIT(GPIOD_FLAG_REQUESTED) |
+				   BIT(GPIOD_FLAG_OPEN_DRAIN) |
+				   BIT(GPIOD_FLAG_OPEN_SOURCE) |
+				   BIT(GPIOD_FLAG_PULL_UP) |
+				   BIT(GPIOD_FLAG_PULL_DOWN) |
+				   BIT(GPIOD_FLAG_BIAS_DISABLE) |
+				   BIT(GPIOD_FLAG_EDGE_RISING) |
+				   BIT(GPIOD_FLAG_EDGE_FALLING) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_REALTIME) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_HTE) |
+				   BIT(GPIOD_FLAG_IS_HOGGED), 0);
 		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
 	}
 }

-- 
2.47.3

