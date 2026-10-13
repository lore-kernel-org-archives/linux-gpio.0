Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223AF39061C
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897121; cv=none; b=LCU6210D00qyvE2E6uMKbGXo/uoJm4peqp/em4il9Rb2+9pFnBQVWWIY+SO0gNd8OYHAKhuA3c2NATwxbr1hTzAIhrOgswtZEgmCqxASLKuiILu/yi7BvAez2NOzpQtm6QEvC63Mi7xqACR3lelQDxT9NHQd/qQ91B3RV02zkww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897121; c=relaxed/simple;
	bh=wxx33mbHAocw6OfeRFru/mTRHPPabfv9Mi3TkUFDJ94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMZgWoaqnyp04dcH3+1ekwuDX9Jy833PYCqsq7ivkNRq9vU3FyF9whJ2CjMdlJB8yfUjOEaFvulmqeKe5Z1rpqseNcypSF0LfwVBJlbs8KSuZjQu+jy0oHTHfYJ/Hyznp7t7Re457XTO5CTgRBgqscCTCEQ6TWGAZ/dSphTYHQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdyny1VY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8v/Vkih; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdyny1VY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8v/Vkih"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D947PP483091
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uD+Y8zqy9qF2/F+qvk+d3eryZB2TLW67qA34KHqZjsA=; b=gdyny1VYt9fgctrC
	L/1BXBieRo6bm/LH/qS0vhA+xPJMbsRcYeldDT77RnE/1TchewY1ypnJ8Aw2cr32
	BoTsA2me/Hr8skf9FlItDkINDSxjXYst+hilf1cqF4tYpiAN6WQVWWMwzGhnfSLL
	LyeQ0ycw4LgZaSDaiYBXi75/lmWWyMYCb7QAZmQX9prPT9/nFx6FpfqbddL4hoPF
	gH3uRXbLlKsW1wqAihJcAwWnQikzL22/901Y/D4nOShTHjmkp2BgJ83pbEZBGQYg
	LONy2dGEr7+UupMtOBir22sdG2ijZps9Mr6QuWRL3zjgavQf3eLvLHCQhE3Vadkz
	zI37yQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg90cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:11:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf4c0af4eso990165185a.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897118; x=1792501918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uD+Y8zqy9qF2/F+qvk+d3eryZB2TLW67qA34KHqZjsA=;
        b=U8v/VkihJt2WEL4x6HoMp11J9oCM5R1tRzAFW0i7dcYWMSATvECp1WUznq+yGBFNhe
         Zi/BP6NYv5sM35/5QKaInBuuBFquQGYtMyKYghe6/NO6U4RYsaYCHa9F39VxjcYMwBBl
         +ycCM5bYJ0+Kp/9FrgAklX5W1czxtaLfcXvj2tRcIHcROc9bYDIot5S+yTO8MwO7Jlrs
         aIFoF21Jpl5Qja/0dLQHpYdjQ+csv+DAZ1xFmdwkA/kV9Vr0RL0QMmmEWwsgmcL8Fnsk
         PZqz7v+cDoiO0Iq7BsayThmE11geL8yh6sF2fjUZF1vnpeIHFZjeoSp++gw60hhfHHJg
         wkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897118; x=1792501918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uD+Y8zqy9qF2/F+qvk+d3eryZB2TLW67qA34KHqZjsA=;
        b=gL4Pn+yIvvKGpHAaXpAk6Zx7oYCbxxTzwWvTcvyZKsptXtNlZYcvKlr2jxtsYC6Cdc
         ukRnqyX64SWlg1x6gN9ZyJ7rA/dT4EzAjTDGsm7ImxDSpo6mlG7VRLZbyfTtPiPw7WJs
         fNXbkOesMTxgJ97EytmcR65XTTn7WM/0APVplZJ2joz4O4LbvycVoE80z5dAP796SpQL
         pnhHga52MqW0b7Pdb5Gn2YVFPBLfp8WmYc489oUm/GGu6HgIq/yG6m2yKlzm1AorAFDH
         MMX/YrvRZBfTgUDV0EFdTBC+O3/eny3crJFEHoda00/sN9W/jL8rONRdKZrFjqOnH8R2
         QcHw==
X-Forwarded-Encrypted: i=1; AKwUvBxjD06+lCxNXdaM6q1RtJ/kL2yv8NoH2SCHhpnUHu9yaX929WAqFAE8t4ZuDoCvMBevqDNfVvqTVZ32@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8I2Ql+5K7/LtyP5SaLymhOjX1+k2SiGuTAA3rhoe+emm1D9q0
	n8PkcOct6P4eloUIptQe9zmUsfkQCtgh1yRaXzNySpFxTUKzxAL8siaNM+ZFmmRSgjKntaAHhJv
	v7aREas6RMJZEZuKNxIN62O+Z4albH+6IG0gMWn1UVaUVpPSZNhWzkDmFrkrUMZOA
X-Gm-Gg: AYBFou2y5547yxwcq5Dr68w1Hkmxalhvn2ArjqY0KJupB4Hxlrlkl7SdL2QmdSJB36K
	CkZIJqGw4Lhto5rpTujChjoDA41yXepoxPBBDfVTACaL8jXAWTwsB5aMjuQVKe9BHmaVOILcEz/
	4EpxBGJcHdHYT+ktXPdH1HaqgoPX6eCU4AqZ7ZSOfqG4uQGZJQctSfwTUo1+N4O6pw9yAdjgisn
	kXJN8JZcdVbqFYwpy5KlBDHHDpns+QLsj9NZqOsZCuw14ocszQ1kW+tyB3dwusw4POvCTK0UNt7
	M21oSO1RQf3GX21MzRiauZlJPYSK7dOaTZ3KM5RqXgqBPq/YRWcaenAm3+LhDzrA1/r5dqo1gHD
	a/GTHKxzhF9ks6XqTEmtaSnNB179H
X-Received: by 2002:a05:620a:44c3:b0:93c:3863:ff7f with SMTP id af79cd13be357-93eb923d20bmr2040010185a.0.1791897118239;
        Tue, 13 Oct 2026 06:11:58 -0700 (PDT)
X-Received: by 2002:a05:620a:44c3:b0:93c:3863:ff7f with SMTP id af79cd13be357-93eb923d20bmr2040006385a.0.1791897117726;
        Tue, 13 Oct 2026 06:11:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm371862945e9.15.2026.10.13.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:11:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:11:44 +0200
Subject: [PATCH v3 1/4] gpio: shared: fix use-after-free bug when adding
 shared proxies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-shared-fwnode-lookup-v3-1-4553c1a7d80f@oss.qualcomm.com>
References: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2161;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wxx33mbHAocw6OfeRFru/mTRHPPabfv9Mi3TkUFDJ94=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzi4SHSu+Ft6k2cEiYw4NsGmFH87WqOERmnxqs
 LV80y8aMT2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4uEgAKCRAFnS7L/zaE
 wzamD/9oRMKMYVCTbLbH09WbAVVV8RhiW7fugeNxgBVshrgkZK6o8LKkgxtgQ1IZ7R0Ownz8J9Z
 q1bjZSw9jIZLP/7RfIcXaYX+JUuGj6d1AWk4JAqeNbEKzeSGyO9Sf/2ql0yVDop7IhrOImixKz4
 7PA7rn8ln+FdJjsM/zfM1BDdIE3ePzmWqF7Vy5c1whsw/gvjSW3715qMgyrXYwnZrWSAS4DZRsm
 UHfW38PR9bk6yhB7/9KQWdNjFodFYWPWQxp5bH+9xWYOhxNW6gpqdnBDpbgZ6fgZ0eRfSAMvo3G
 MoN45VLa/iR42u1nkbu70vCc/GKkXeXCuALMPNz+hWoGIOB7tYa94ShkWclBcclERyNTtGvPne0
 /x9I7Y9t1hGL96J/hohyRQqr3+IL4OHp4Zrxunrood36sGbtgqkX50hh9HnqFCHWeW9rbkzGREG
 BsCbGIyNq+OS2WKR3KJiVn6sSuOTiXWjyE3jU7YS4Qb8TF7fmjp022CI95hZ5+kWmttnes8bqRY
 1ILvDxOLrHeioldEtVn+moyzC738mk82VeXyFQp7YDi4QwXQfElfdXw8pCgOFL5H4PAw1yJutac
 eNF914keAZk9FFRdydbKghZmzQegJImbJZjcf2GwEMacKQ7RhbKaymEQRk8ajThnydeoOU7SCLR
 aK4FVwEkM2Jli7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: wEDKAfRZ8kM6f_-qCsDQbiVWxeXZv-tk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX7sIQqDF/DLpv
 Wn8VBkBw7Il/22NJg7YH3qLaQPutoWE4o8dHEXS5lDJ9WqHK4bTOQnZg5lLn9FAFk9vLu7aA2sw
 RvuSKVz+1JQjgl8pLbL2SPD77Caqr7w=
X-Proofpoint-ORIG-GUID: wEDKAfRZ8kM6f_-qCsDQbiVWxeXZv-tk
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace2e1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KwuEG1lCUIphvGhCtYAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX3O31jpQOrMgg
 hXZVhot9uyZy5nEWMSz4kw/aUFgvmVcoA5NEXQrv+Z/pQ0yY74ZxnbRdbViiIS4Yv67eMUOypqI
 JT/8qq+UpO8usPtLvEcbZJrWqu1rU6KfAmBDFjNNnsIizHmddgwxh8G8wKU5uXvbiXehQ+FqxyL
 CkdEYKS3reJnbGq+O0Wafq2MMBpfYkJdGVK5QzDrrDN0EquMKYv44eD3uzac+IKx2eCyeEI7W9C
 OgGM4J8cZyxvUZTGN8t8MsnTqMXN8dPGz6NoXAP5L2ULsNjBLdhxBTW/dEfO0vnEjC78BO4cpiK
 P+R26IfD3k7uwFDjeod8WZgduY0Tqgk7gaITrJwZ9DZSS5/Rd0C5OpCcunAuSzn4SryCuuHowob
 Hx+3peNWEkXDPj6/DEW/3O/ae2g0cgCJRVTQB3YO3+rSLhh9ir0sFF+J4Jaw+yWgeZFgvWXVZqq
 4eERIK2Nm61koN5L0fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130052

The GPIO lookup table can stay alive for longer than the kobject whose
name string's address we're assigning to lookup->dev_id. Fix a potential
UAF by duplicating the string.

Cc: stable@vger.kernel.org
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 5f9623e40b0fbebcf318fcfb2e75768cf6e3f313..6acfec73b73477245c7e4c593f2925efbc8980c6 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -450,7 +450,6 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 				 const char *con_id, unsigned long lflags)
 {
 	const char *dev_id = dev_name(consumer);
-	struct gpiod_lookup_table *lookup;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 
@@ -480,18 +479,22 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			if (!key)
 				return -ENOMEM;
 
-			lookup = kzalloc_flex(*lookup, table, 2);
+			struct gpiod_lookup_table *lookup __free(kfree) =
+				kzalloc_flex(*lookup, table, 2);
 			if (!lookup)
 				return -ENOMEM;
 
 			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
 				 dev_id, key, ref->con_id ?: "none");
 
-			lookup->dev_id = dev_id;
+			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
+			if (!lookup->dev_id)
+				return -ENOMEM;
+
 			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
 						       ref->con_id, lflags);
 
-			ref->lookup = lookup;
+			ref->lookup = no_free_ptr(lookup);
 			gpiod_add_lookup_table(ref->lookup);
 
 			return 0;
@@ -611,6 +614,7 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 			if (ref->lookup) {
 				gpiod_remove_lookup_table(ref->lookup);
 				kfree(ref->lookup->table[0].key);
+				kfree(ref->lookup->dev_id);
 				kfree(ref->lookup);
 				ref->lookup = NULL;
 			}

-- 
2.47.3

