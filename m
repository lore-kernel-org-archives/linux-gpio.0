Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885032;
	b=QNhxyqDyGFLekWbxmM9j9c0L3++iecB3UaNN/4siNZgqhnC2ghINCZgfB/BiH5I8rqOg
	 49bnHKacySLQCnwKsEWXFEMLuVIUIExkg4C+hI/yIBI12hFs6e0rnMkr3hCAw/JEVZC/e
	 UbH2BYyHOzMsSDRfbYMghT353psI6PywyJM4p33hwlQRW85DBooVICNvoCRclC+O+VZP3
	 XTEsRy7MVHZ4iLWHNN9rec6ugUFG0U35g/z/xO8hlvYYlPf2dRoo1tkV6IToogwdUVSQC
	 Vrrz5pGNUUSRQbgIjuSVPvxLiY0m+/O6iDd9hTtd4ibJunCTgmnNrseqJMPnuQYbV0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TRdxMZNVjHvNy5Du8W+cgRIYuVrbLC7KA1TotGIZa8I=;
	b=lFra1mdUEU7taGQ9nTErffHUcc+WFgElmmaHhwpEvxYDWr2tufF+K1njwdpuk6+SLLV7
	 n2KAARUTS3tv4wy8E0t6rZySPyxQsnsLgJsWud3HyQ5xA9R28EgKrl60KqQsDtmP2xCm8
	 /XBPkD0t+Ph83jltCF65/Xerbu/EDnG3O9Uqa4HT96/XWV0CEWsZW62V6DEdb+KObggCU
	 d/FcmDnzfbgCUsjx9nilySp76MCBZdKhmgOHch3Q1X3xZM2H0Yo+IRKBu/X/o6FcdE3b8
	 vkO1e4+oAWQaMwJdRBv0N0bXryhMA7PtyvMK4rAmTZvHTSXcdTZL9Qrke9KWnrZUckA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFgFUCiQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYXYWVLr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0FE606D83C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 13:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0FE606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFgFUCiQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYXYWVLr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tPHo433303
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 13:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TRdxMZNVjHvNy5Du8W+cgR
	IYuVrbLC7KA1TotGIZa8I=; b=VFgFUCiQj1DACVLVZoF5SJI2CqdXt6wFCTtkmX
	A+td797+6XNXi9fmnsEOE0sm3n4K+Cz5A4nKtgK2/VTCTpqsIvZA0upmCpO/dcj/
	AMaKHE7mxFk8nbDHIYIqtY90vji7q9jtroiJtwtf4TjybHLCEfSryKre0O0Vgyco
	1tosd/c8VCHrZadjEuH277v/Uc6liwTLTM4uc1qCToM+SuMvdWSXkY57FRXqKRC2
	v9P89rG1dXliOSc6NFezCR3pAEzVfeeijTnZsssumB0e+A1RmXhSiUPSMCchtrM9
	yj3N1NJQD7UKLkXbNfB9+OsmvvrNuGBE5zDphSbNl3U8d+pQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd9qy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 13:23:50 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eadfb67611so365857e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 05:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885030; x=1794489830; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRdxMZNVjHvNy5Du8W+cgRIYuVrbLC7KA1TotGIZa8I=;
        b=FYXYWVLrCWH+QW/3bYsrKYe5Rs/CIO2vkbNwDamT7243Ypkbq0vdrhu5r425nzcaNq
         Xgrnc8AeBpAtF5wI75iyERjaADdbrNouTyWJSo25Ob4uwbkeyxnIR28CXwoC6+zfv6iJ
         6p7FcqJ6ckPSZOy89U+P1z93l3Xzwoy4TA+aQ1aNil5srJZjNBA60boTSqmLjM4rBt31
         X9A3S1wyvgBXVbfbnCEA3gZzvRBQaobjzyYWaWPMjLhVbV9b4QP8LXnaWGGH2OS2v5Td
         nsam7ynCpZI6z6rv67AkGDyy+m0LDwkIgXvSkkbQWWQG5j4N7OL2fj4GKF9hyx7LyGy+
         BNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885030; x=1794489830;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TRdxMZNVjHvNy5Du8W+cgRIYuVrbLC7KA1TotGIZa8I=;
        b=m7EYKM5v0dv+6fxjwRMjRmaxgssJgkDVazDKspjqzM9K01RQ/Rfy8xbZh+K37PJsYp
         uG7c1K/JNREJWnkxPzPBmol4dyWt9Y1NQ7f2NIbDQ4cqHXZ3YvIujBN6J6drxRFueuTa
         0K6LxIk8UoMbmqw3jlqo8nGNlENgpm1Ln0M47+nPub4/jM7yW8NyE+G8F9asBORDXLoe
         c//5fmJFcsc5jekKxBWKQuQe3rI5EUcJHQfe5jd1LHjGgpyCQiX1DBa4RtqotZgu35Wj
         IQH2OQw1Ipy1qOnXdZb4eLYJBXuywrhMo3pVg0jMbQ5Qlq7tE1C0c+9PDqs8gRq85Kwh
         ZXfQ==
X-Gm-Message-State: APuU4Z9d/SBWxlboULsnhY+DI7o0dqWcigV6qhv5XAYcz7mYfZX5n8xt
	O44uuDU0XAewkNcmHV0oEOYA4dU++CtbFlrzrnF/SALmPNweff/XkWTQvq6hTDKyoPb68Sh4ppD
	Wmx4rKcx9v5CWSVtORz2zmzUTP35s+XpySnu70jh7fqjrSqwr6cWz+ry0QWdEyfOtHwczTrRo
X-Gm-Gg: AYBFou2AhGnDadJMTikVxID9EbbHlOX1E1yP6LSbJDr45Ng74fgAc5O5chkwzqizY43
	e4X5ePSEPGco0350fpb+yZ3BIV7jjh/7HAoOe+Bv/3isNhMyAGWOxpXy6fvBCdrSiqTHnNFXypl
	zwy/6Y6AZwh0Zzb8xtB4J0QmJGZTwEOETJiW/2yJyBT/GiatMb67mYELDSx/DM8YwjHJewv60Sd
	sP++WewZLqerdmZC2etQE87yYx8raAgOGlkvrl2cJ4LT6NWC3rFHrjTYVH4vMQ47C+Ml5eZ9+rx
	gUK3GXypnY7QSUbdIKm714c2IKiog+QwO12YAVdmHPZ+gy7d5GYVQrsuye0okO0oNzOlWzWlDSX
	zN5NNmpMvIyS0CoN8rXqTs59j1/ypmUdsL8g8N5EpbQl42cZZV5PIIy7izwx8hPXbT63HyTAm2/
	djJQ==
X-Received: by 2002:a05:6102:3910:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d0728e5ca0mr6759297137.37.1793885029896;
        Thu, 05 Nov 2026 05:23:49 -0800 (PST)
X-Received: by 2002:a05:6102:3910:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d0728e5ca0mr6759267137.37.1793885029286;
        Thu, 05 Nov 2026 05:23:49 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20521sm10347207f8f.53.2026.11.05.05.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:23:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 14:23:45 +0100
Subject: [PATCH] gpiolib: synchronize updates of descriptor labels
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
Message-Id: <20261105-gpiolib-set-desc-label-corruption-v1-1-fa84726ceac0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGCD7GoC/x2NywqDMBAAf0X23IUkxIL+Sukhj61dCCbsWhHEf
 zf0OIeZOUFJmBTm4QShnZXr2sE+BkjfsC6EnDuDM+5prRlxaVwLR1TaMJMmLCFSwVRFfm3rNmb
 jfMzWh8mP0DtN6MPH//F6X9cNDZyeQ3MAAAA=
X-Change-ID: 20261105-gpiolib-set-desc-label-corruption-d024bd14a945
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S9dGRxbbLvzUONk3VoDctp97Hfpf//G89PtLXYijNqM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7INj5nfHiFIa+0yq4PcA0EtllMol9ctLKBAt8
 guB6XpYl26JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyDYwAKCRAFnS7L/zaE
 wwMREACcQVzemlc3w+9MfHvBXrli9QMVPeW/sAJjjUMW/Ki0E7bc1BapWc45DRPZWMpYE1sYicC
 Ige4xacg3nhq5ckbbNkMu/7j9GXCX72fZ8T0/o4qN4GdbS2/wATcuj+SRKtRnJI13c7lglrAu05
 D5BKrhI/Ut6laKyKfmgKPoJnEijlyvE2SoaX2vQbx2TPiLXQkoshwtOMXEIBQVb7+lyTGfypTEs
 7gKk+SE8SShuw98O6vtZBsBVCdu7UIio4NrfeKqdE5BmpGFol9w6WWuffOssVnof1yevfYgytV8
 pZD4jqL/onveJJPzwr/mhPfkW/s4L+qb9pyL6HyVHqQKVvHxp1oquCtJxX+bQamjpOl7KdSJok8
 OiqQYInokNVdOxh0+3DkoFS6MAXMch7DdWTDcOHTlKmWyBjT1lVu/fzxxe+lUKEF8pQdq9Wpt8g
 BA93cplfCjCRtiqi9ezqlEPOSkn85c7XfNUhKk0EXpeFbWn1onV+hbouG8wjE/FuFrN5TQZptFm
 lqQKHF1rqF44OKgqEvljL49lS8/Z/4bMDtpQU2E/bHvpmDTjRFXJFAZxhg3Vd/LEKAIEbFbUFST
 3kNkJt0c9xeF7dqrqGCSajrRiinMdekmNTwBZcoTR19QLGkVDcH0oROUXzon9KXMs0sjlCTU5BA
 LFFZeip8Sy5pDiQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec8366 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JaOSqjnWr-vPQE8BqLIA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: -lg8ZODJHhHZ_y3qLpNn-jqg_HOl9RkK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MyBTYWx0ZWRfX4SrOk4ZZRy0O
 l14JpRie2L+n6La+ZyRWITc2Jo0MI0+CClKHhkM9dg5pnsIf3BcvlQqZRy34FtFDlTo4Q33a8lP
 wGU9XKaQQ9ZP2smtQLBlqeZzUlD9rYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MyBTYWx0ZWRfX5Syv8eLAvR0Z
 QorjKW5WlZApCQVxl2kQDrqObSy226RYs2Gyu+R26s1jxhgMgs6be6La8XYF3a9KQlJZDT3ahpO
 pqRJoPfiN4UgI/TtEclyPSTStH8rFGmCPVaeuPmz1rtUQQSjBgLJNLZ0hHL76LB3KSWAIk4FWoz
 qG08LRBfO46ltDmwS9rJOJRLrT5cSnRkfY1i99iGjkTLBLE2M7luqu988k/Gn4Y25iWtAQ/f7hv
 0OM4YH7cAIKYMgLRQQy8wyWrURDmX+q/Rmeo2HeT7xJcbUlFHJ9yP5cm//Dhz5nTUzmfm56mOg1
 UY7s+5JKNtxt5hIvJ/vyG4jvLFHK4rcJN4w+GBCmQyDmGY5SUbfnU6fRUbG7p/65t+U0BxIdKzg
 1kqWw/EAPWgS8qoaEyCMmq87W8hZWe3G2VAM5p+CmM/hoqOxm+qY2RSSACv7zRHHyS11FCNL3Tv
 j6b8oX+DF54II6mlD1Q==
X-Proofpoint-ORIG-GUID: -lg8ZODJHhHZ_y3qLpNn-jqg_HOl9RkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050053

desc_set_label() swaps desc->label with rcu_replace_pointer() but
without any synchronization of concurrent updates. The swap is a plain
read + write: two threads can observe the same old label and then call
call_scru() on the same SRCU head corrupting the state of the chain.

Add a spinlock to struct gpio_device - we're using a single spinlock for
all descriptors as using a per-descriptor lock would unnecessarily bloat
the size of the desc array with very little chance and no consequences of
contention - and use it to serialize the pointer update.

Cc: stable@vger.kernel.org
Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
Closes: https://sashiko.dev/#/bug/linux-2f7ac8b6-5034-4ff1-9afa-5700ff44e3e9
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 11 ++++++++---
 drivers/gpio/gpiolib.h |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..574f1b161d22c41e5f9248fe59efe25d7fcf5032 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -154,9 +154,12 @@ static int desc_set_label(struct gpio_desc *desc, const char *label)
 		memcpy(new->str, label, len);
 	}
 
-	old = rcu_replace_pointer(desc->label, new, 1);
-	if (old)
-		call_srcu(&desc->gdev->desc_srcu, &old->rh, desc_free_label);
+	scoped_guard(spinlock, &desc->gdev->desc_lock) {
+		old = rcu_replace_pointer(desc->label, new,
+					  lockdep_is_held(&desc->gdev->desc_lock));
+		if (old)
+			call_srcu(&desc->gdev->desc_srcu, &old->rh, desc_free_label);
+	}
 
 	return 0;
 }
@@ -1201,6 +1204,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_free_ida;
 	rcu_assign_pointer(gdev->chip, gc);
 
+	spin_lock_init(&gdev->desc_lock);
+
 	ret = init_srcu_struct(&gdev->desc_srcu);
 	if (ret)
 		goto err_cleanup_gdev_srcu;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 650a702741dfb938fbdf11db65a46ac85b6af512..8dd8ea747f8a907664ca334b29b6602661c3767d 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -37,6 +37,7 @@ struct fwnode_handle;
  * @valid_mask: If not %NULL, holds bitmask of GPIOs which are valid to be
  * used from the chip.
  * @desc_srcu: ensures consistent state of GPIO descriptors exposed to users
+ * @desc_lock: synchronizes the updates to descriptor labels
  * @ngpio: the number of GPIO lines on this GPIO device, equal to the size
  * of the @descs array.
  * @can_sleep: indicate whether the GPIO chip driver's callbacks can sleep
@@ -71,6 +72,7 @@ struct gpio_device {
 	struct gpio_desc	*descs;
 	unsigned long		*valid_mask;
 	struct srcu_struct	desc_srcu;
+	spinlock_t		desc_lock;
 	unsigned int		base;
 	u16			ngpio;
 	bool			can_sleep;

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpiolib-set-desc-label-corruption-d024bd14a945

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

