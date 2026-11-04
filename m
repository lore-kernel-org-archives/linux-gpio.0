Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788697;
	b=tCnhBVMbWXfd+z+GxHKBdDIe31M5XWtjIlhSe3L+7SLVd6N6/8Kno+sY4+7dT/xZQxMW
	 HlQ7f7+L6llKG6iPkKZi+3eGH54ow4yS+QWZ9Em0Sv+OtOYszxHP7oE+wp39bMs1Xd8Bs
	 2WvUaafwys84n75cB1gFJMALroqr3RMAGOG7FPc/7eSmVrw7/r/KezdbTqmkdp2ayC/vB
	 /5q7/oL2xF5WOsk9oV3KDTiyRizT4ErLEWalPvr4b9TwV0fBMkQHIT3tihq1Uk9uyIkIq
	 byLHpviGsR1Q1et28to70rCQARfSlPUO0f4xH8qVk09KnfGOzm+HsniFs32lzH3xVfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=DZ8g7XJtG4V4VzElasHCMoVdjTXRkE7s6mQSvwWtapJZMpgndXTbYmROrzjLUwb2+GPC
	 UF/nwYFHdejC1c/RmpbUqT2GkFA8TCAiQ28DQpRJbqoq7FRL4jDe3YsJlrPsoZU+DmJXS
	 wjjiavl0gGys34Cj55wWARn3dTGdCbDSKk8YGVfHoAoda+/uHQ+eGfEsTn6QGyn6lEqqK
	 HUT10q19o5ldc42zuOE+/oiR1imPRxuDuIeVvc1OnAFVoa9RDwjvc+8BhIZjXnOHvZ9XI
	 3aL9z8OUfj3KS99KuG900zzMw7u7DNgNRVJM6ekgwgmIwhybhBqgXjgNCv453a5Tp2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIAKT3p0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fCpgCmzX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E68A606D809
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 10:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E68A606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIAKT3p0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fCpgCmzX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48OnVD309849
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 10:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=KIAKT3p0JgbizLPl
	KeNnVMorCDKUb27upVBlhan5k+GCzI7KK9OJDpOx79wqWbu3SNAfq4/lKJGqXBn2
	oPYqnPgbD0Ody4D/V3Arytd0ho6+3hX9tC0DMad0d+YL7poek3GwE74+7aZFklYg
	gFqsxBmh0OzV7Ow4zaO5mrrdB88jhjNpyc03BhSkNiqvM2wCPN6+z5GisjZ0ahEN
	jszIcpaorErxrx4dQ03moZBjcEMyaDMHoay56T4ELr6Qtlfc2Qw24dnIbIWkGKN2
	wXZbo96G7hOV6LcBKkm00+MZrqzFKrSZWLC0GOIRT/4Gi2pDnOKg8TQjP5orjhP+
	w0l/xQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163gj0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 10:38:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9907539aff7so395149241.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788695; x=1794393495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=fCpgCmzXVohKWONXWjlSvUAKFlvu76MbAHo2hcALTBOd8M2cjghn9xYZcbN5c12wEl
         /ty2mZMgdScvQkZBYJW6z7EFlgCGpLaErJ/9BPUMhQ0VmkrXhawlnrwdPIg1o3PVv1Pb
         eS3salKphrLcARJkQKPJY1RO4QtfKIyW3iILXulS1zNwn7gsADmbVIpbQ5Lbx4X6peBo
         OoM1VaLFloyE+0rstYVUQVbfG7IjWwsbEBGTgzilLUzj39ei0DseQPV9PQrkR9kT8LOe
         Ih4n6NzFih5Bnb+dBao9Mw1EcaTJoAktoQbXkm0YFXK9AbAsKX5fkJBMairWKRVfU9PG
         XJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788695; x=1794393495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=OAxKPrW0WWYOBuW6t3RsJ+ZlRLl11T3hF2kXP590dTco/ogIl455Aiqv98AGJ+CO5a
         kEq3U2W4NwJ0zguTsdrKm1whNOgh2rFF+kuEwTc4gh0Z8zLXGfp9fPhOTtCXqiX7VMuZ
         TprSnsxv7bkCCLAPzrRdZfovzb3vSSna6K0wYDtYpTE5fnQ3X2Qnxo03jbzubXAC73yF
         PFrE22aJEqHb9eGeiXUNpzm0EiOE9c59BHYfi3Ru7MJXXi5qBMdxde0gRaUZNQ1+Jopy
         UKkXzmDmt7CEpjvO2GZpn7346NqaSC00y2SsshKdd6My/lOtmazwTjdsIoOKwc6XwNHL
         yxPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+oNzTYFrhOUvMK4+eQSMr7LZ94QR/ehLULFtpbGw0xjXApgUhQAdQtPh/Ixx71adLCifRR1qyf4Kg@vger.kernel.org
X-Gm-Message-State: APuU4Z83YQZkvtpBD7UNfzaaV8//X2zBNaE5EZZmgzph4OKF4Qb5qPjW
	frpYd9T493itC09/fxzPZCUTRxFN9Z03NK5D8gqXUJWneveYCzlR5xyI2juBOWdviO0RBV4vAfO
	CJlmvygjRnKdtroEkIkdmVkcBD4VX774+QXpTi4wDQELMcm3AGbhzS54rPoYZcdwZ
X-Gm-Gg: AYBFou0se0RQq2asxS75GlWHA8Smx7Epg18i9EmxrF3FBpRs0z6Kx9i8AuTFPdW3Q5C
	f7JpjcyNj1FF118q+VeMqGgVJ+bmsJiFoK3wkWAFcpEFBGSeJ7vrjakf7MgquxUY7Bt6wRBqBD7
	gL+v+eKhz9XA7acT/uHFHKz7klwdgufkGwypWqoRF3ZCg8vagTlbu2yI2O41yKSlH+BhQJouMee
	49nzhtalxdf1qMNbZOCt7VRo8d03VWGgUP2sjcso4D2lL5YArOaRbSGN7RRRuxV2QphE3hecUzs
	9Ndutmr6sPljRUFQGt6/jRywxWEXhF9Dg5v/jpNeRP+pRanWhUfLcgFWFVO+VlayFOsUQ3gwpRv
	dFCARwDARdl3Qzslpp6sNJZoKw0bZI1sjX5KVvT9arsQ9RIN4IXlmYtCPj4x29GCTxejRWc0gbA
	HCWw==
X-Received: by 2002:a05:6102:c01:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d072c596c4mr6323443137.20.1793788694591;
        Wed, 04 Nov 2026 02:38:14 -0800 (PST)
X-Received: by 2002:a05:6102:c01:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d072c596c4mr6323434137.20.1793788694170;
        Wed, 04 Nov 2026 02:38:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:08 +0100
Subject: [PATCH v11 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-1-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsSdij8MwidL5YjreXSe2x/t7F1YjSi2702i
 2Ue5AlVbBuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 w6iLD/0Qnc30/hEW+C4AMO6KkDdtwTYy0Mnu84FJRZ8lkcG9jxso1Yb6sNokAKXPdivTOY1b5qA
 SzZx3ok6/Tv8EAxffEZd6Ot0Th+AeCje75lIwa5Qg6StH4uDRgbFC8B/S8XBQ/xq2vpQYELyj7x
 n3TnzU/WpveS3QZH37BMrqrFNuavU5j34sET+Zv+05wASgblseGSRIi7rfMZ/I8ItOa011S5AnE
 531NHfZSOL3oGllUyZI6tTXx6qjs4roprq9ckruGj+Xi35svZrlAAjE42Q6phXZULr+GdOSfnvF
 05h84/npTVb+c/4G98oXBea4ZjCguQMW7I2aTXYya8VH+Mww4YSpYxui1KV+u3q6zKO0wF5CG+2
 xSfEWyNsz8voTm3bufSa9n8zhCP0579p1NYs3lTXob48esDH1Zf6gL0HsbM6/7KJ3g1w6CYu/jM
 kB4djqL26gTe8UHZuNR39P1LWc1waenLDd96wnRSks10RM2FrVOkahCi2qEHCrHHdH4hkSy+RSN
 iNkOLElB+ZhZtSJDDuo6+kAKkrSvQcZJXl525wWnqUFE8uqxwzDI6+dR0gyuaOKiC9EhrLjZ52l
 egrBu54qeXkd/buod/hGnmpPGk52Vmze+0sNiCRs3WI+aVVhQj4Favtuz77QzpD6T4Gl2d9Gj3v
 WvB6/EVGL0kppzA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: VImY9tgAG8ejyEwJXzHNGO2eJb449jwv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfXw3bi0oMqRD8H
 cP6VZhgjrGU+BlEPfeFUwjWZVoFCRrLX2oVK5s+i8EAKsSXXhHyOStp5ga4s840KrIQGVYk5WSU
 woynyFnREMCroTrrPXh1J8cH4AmF/lg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX7zSf1M5oVGUr
 cpSwEkm0AU/PiIBT3hH2zDJhTDrBiRDWng1yuWEMId/SjgwZP4FLZC0SiALlIikj6sknw2QDFAw
 OcqlMV1tM5LeX6ZGDEOH0r5ds/V86RgVzhyhD0rWMjVfBRqaMtssVEKgIOm/rPfT85WDKFxkMct
 9Mx8wZGr7MqrtdqRaN3DrmutInyx1cCtvyuZM/0gAjq3NRH+G9e6ed7ALRHlz2r34w544L09N7q
 quJP4ObfEZBIW4Myk2TZRwxYm8T+FXNAwpxihMI4CVwZpbzEPmj5j3EiHcEXIuks3uLuXmvtLT0
 nX6DWv53jvVTPsdo3zgluloBg+0Y3awIOvtc0tXTaICf2VRAtOyUdKjrtCRyBDXUTHDAyw3UicC
 ThgZAdvNZTShW6GBDHSoW7pY6hZCHB1aJawzvRKqBvbvMUjR8p1+JgF9QVA0Vy0eTUQjTHE0RLu
 m72mDUWJSSkQ2QJ/ovQ==
X-Proofpoint-GUID: VImY9tgAG8ejyEwJXzHNGO2eJb449jwv
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb0b17 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040042

Move the body of the loop in gpio_device_teardown_shared() into
gpio_shared_teardown_entry(). This is a preparation for unwinding a
partially completed gpiochip_setup_shared(), which will need to tear
down individual entries. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..64bb450f0a8461d214a45aa97e2474ff0d1857ce 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -517,6 +517,27 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 	auxiliary_device_uninit(adev);
 }
 
+static void gpio_shared_teardown_entry(struct gpio_device *gdev,
+				       struct gpio_shared_entry *entry)
+{
+	struct gpio_shared_ref *ref;
+
+	scoped_guard(mutex, &entry->lock)
+		gpiod_free_commit(&gdev->descs[entry->offset]);
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		if (ref->lookup) {
+			gpiod_remove_lookup_table(ref->lookup);
+			kfree(ref->lookup->table[0].key);
+			kfree(ref->lookup->dev_id);
+			kfree(ref->lookup);
+			ref->lookup = NULL;
+		}
+
+		gpio_shared_remove_adev(&ref->adev);
+	}
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -606,26 +627,12 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 void gpio_device_teardown_shared(struct gpio_device *gdev)
 {
 	struct gpio_shared_entry *entry;
-	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
-		scoped_guard(mutex, &entry->lock)
-			gpiod_free_commit(&gdev->descs[entry->offset]);
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			if (ref->lookup) {
-				gpiod_remove_lookup_table(ref->lookup);
-				kfree(ref->lookup->table[0].key);
-				kfree(ref->lookup->dev_id);
-				kfree(ref->lookup);
-				ref->lookup = NULL;
-			}
-
-			gpio_shared_remove_adev(&ref->adev);
-		}
+		gpio_shared_teardown_entry(gdev, entry);
 	}
 }
 

-- 
2.47.3

