Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198688;
	b=msE+y6ZbGi07aTKFbGsogP8Ejm4ywNRjo9UlaZRn2CMXwTBxbVJuLXKnZtAGJwGm+8aJ
	 2h9ooT6OOTVM4gqwN69hoZghUGnlOqJXetw5XBWbitzYDiaoDYloSmgiy0qFxIplPe9+F
	 X8yV68Y6QkOY4q7SGR73GQqfdCDhnv6eAz0UocxREjaivrwx1I1rlXVbaTmB5rIqSBsOb
	 KViHJJsqoi2LegJ0TAApiyRxC30LgGo+v5yteTbbSrc8q99PFJgtxOPswR0CyVpRSPml+
	 /lhKWHBN4O0DVH7OHLpyh5vq6qKo1mQ1D8G07e1Q4nrCKjrsxVYlz3kmGLTOg1TneUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=WGuQHYj/wNqQldpKsgZAWYBIGMNqaTHnBzA3Gp6gGICInH4m9vKUZ2xUPuOXYVwoNCMq
	 5cepFaKyPRimtW6/ra58dhTzrQuj5SF7fQ2UWz1FlaxNAO7Q062HSsuN5sQtw1Y/+I3ek
	 l7fd339pK9ZFa2lxuElBFcQkBG8mg1HkhMI2lkGWcDQVugB+ptZzUuHIk/8O2zpeEnGWM
	 a5NKi6ODY+FYV2kyMd+ltcFplJa0tXZ3pQTTJAN4bjGEYqKUGF9yBlRZUa0I0uBqnoAF/
	 xVVRSmcZ7vtIj5VB1bqk4/isd+n95GOTbnm/pyOkFT0g01qw7f5K645Ax1j3LhkxE4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WowuLDHK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Sf/mkQoJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BEA60A2601
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84BEA60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WowuLDHK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sf/mkQoJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI9Kx718174
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=WowuLDHKT94Fl2w1
	eCQgidIbCDVI6oqdlejTjHDTJEB5bHnGtu4kYOF1sE34Ojfilr+6g1USVXdxJPgc
	YYi+gXnHAQUaOe6Qmd/K1vEUqejNOhRGMCT6+4Yu8b/wHT4/9kQy98r6iV+uAegG
	emO9lPXAzUA/N0Vqu36k1e4ZrdSSZbmFpJS/Fw/XcB4I0iRFLbntaOnEI2vZdei0
	Vk5OWJO9dAw2cUERSjZ9DYOr4kGWVnnoYRIsgpwYWRPRc2/QTczU6aMq61oIpGnr
	uMDxVWqgcxqeDzo6Y2lpR5r7Z7HG5qo1p8qHKt7YiZ1smxE//jpzlxUL4+J/pC5G
	7bfSCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgc88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so220759085a.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198687; x=1793803487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=Sf/mkQoJPj4sKNI7MASTo9oouUa3Fu9fXfZ/MQpn3vKvXtDTylWJRjOcGsnh5eXJa+
         ngkzFDI3dA6KfTZMDARGJqOni/gxWY90mcVDY6IBDDGf5OqxuPNfIo9W0ovhtrnUdoYj
         LXqQQrjxBnfUttRBcE6M52X0tCnGzp3LUnT7i8GxPj5jXZr09bNb9Ydsbfd2H1Sf1121
         xQPc/mYumbWaPzKqu1WxWiQVh2MwyCa0O9cOl9c32CgGEe+nU5rGRand2nf0iEnaWfhK
         i5h0TRyXiVPPoDvofJ18ORsA7f2JESr66b6VAmhMb8G7C/guiIxowbMZ7e7xmP3dGZ3K
         gB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198687; x=1793803487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=J5i6PouAZ7S+Z2HMTMpgkwKSyzUR5N052sIQkuqTHBWHvFe9ocJ8mEb5R2684jEsyd
         3eSDscP2gzhZnmz+2kyl0Ly/MN1APslnOZSjSdTED6BXa8ZoKStPwS3ZLPlgE7WZL11V
         P77vDtb4bUWLmJOePsI04JUVABLu+7zm/jDHU/ZGw/16ftr1xXdyZX5RaM86rNcn+2rs
         JGa83Tx425eVLj2zYyfORGHqx7cn1Mki8zSyWcwfcW4pwtoz/Rk+09+4qsW+dAkkYY95
         U3C9NaYyJ3bs4fdQ3UCb38cJg6/eYUmudQdSQAS9OA09EG0qxHFHbMT9fVEeZwtleFgf
         fZTw==
X-Forwarded-Encrypted: i=1; AKwUvBzo51wu/ktYu/0SPRya5unNnzqhxy4ieDhMqINRbtdpdYYl2lIVxfHiNBzQZYJVx7Av87DjWaQL6QEe@vger.kernel.org
X-Gm-Message-State: AFq9FYInqT68qaQfSMGhYIiihLTX9xUQAOzGQ8lJw54jlay8dQcS71mf
	Wz8q4ipQsCqAlc4EU41VrxDMdSgbQavmJL0dQHWph95HD+dj62dE8FOq1MWPKEddoOfKVC4e5j8
	K7hf33F8J3S+CJ+erVDC806W8Wsu2c/5cjfmzKguraK8zLqeDPKFAL8yWzbvZLuFgHQy3LMwD
X-Gm-Gg: AYBFou15Mnj+6Z/hQ7HVfJXmUJ4pRLJXA7SEt1G2adYnwqwYwQbtxg1IOS8oeYxhni3
	HWyLpsOV2ttyf0uN47J1KznvNct9vcA/a4OkHWIBX7yronXuGwJtmE9L9SYB8dc6ndhrXAwJZvK
	oNWNiIVFbYsvpuPT1+H9csX+hVO8xdKfCKL4x0E+HDcrjVFduZx95D6BjvC/o312dL3CSqFe6dD
	1WhFSokFHXmYmzhTDn0J8g7KDgfq9FhSLKzdaaitXVu0SnnQKqzFl6J5qoqaOGioEp52T9MPON9
	1f2fZppItK8T2U8zid9mqqcu6HP4bjxQl4ZMjvzRqKH2nWNEEBBb8Khf+zAbCgddPRg2YWximcC
	5/IKZD68kDCqSpSrNPJIi98Nw6npTQpHnn1alO+FFNGFz6ZNVwBUtQPIrXkCBH+5mWMqD7b61l+
	dbdg==
X-Received: by 2002:a05:620a:2995:b0:93e:e1fd:b87f with SMTP id af79cd13be357-94408e0f4f5mr340978685a.83.1793198686655;
        Wed, 28 Oct 2026 07:44:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2995:b0:93e:e1fd:b87f with SMTP id af79cd13be357-94408e0f4f5mr340975085a.83.1793198686185;
        Wed, 28 Oct 2026 07:44:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:37 +0100
Subject: [PATCH v7 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-1-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpaXHSqJc9SkCXonaZr2cM1k7K9B+WIJMary
 PcR4LIVnPmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWgAKCRAFnS7L/zaE
 w57EEACgDsPYly5YIzzDY8l15bnEQy5vaow1loPZngor3HUvd6CSl4PAD9INYBxHZ+LxjbTK8jh
 a5geXKNQqMflyE6oTMh4dtIetTUwTPOAeYib/z9TtLt4e14UEzB4D7r+x6WNjxdXzC+g5HMv10R
 GDDgW7jiK5Iz81pteVckhzX+WOvYIv4K50vdo0FF0zj4iss0FaqOgReJ5fB+f8wpTQtiaA0era6
 ZjANFN1owWPMJpK9QcFfO9ZNjJQAXs+LC+4MixWppfkl48N0J2vLlzpCi94uA6NpeyH7UpmdKaG
 GHArhPCS+D/NHtPVN/3VDEa7Yebizn5T+MiDeXsVDSsRb1OHdIkLbCLUYMc2r5YahVS/pHtQAof
 TPLPZCG9kOhQlpUuKt2VY99hwPAwXr3s9bZcwHh18vi24TX+FLLbE/QbwVeBCWsaiuAHW96lgRA
 cICsWIIHBMv+241HVbeZ6nPzF2pS00exaQ7wyfZ+HgObPVFcwEbuvlhM8bb/umJOWd8MtZJSTzn
 CMBRtw8ByxihzPp1U7+a9hrF/7yPR9SrFIoEuQ1vZXpGgWeAd4Meu0VWVDzzvautWtnEEJNt29A
 QD6SQvACQ/qOMIslLgkKQ9Vy3Haj9pBLa0YdmdL8DWXHtryyGdVEudpZaUcXSD1bvV669g7Xooe
 nVYogw58JOJ+KSw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX459i6s/NHUDe
 LFrGUdSQK8AerhIhhvcZtWvgZNkIckO9B0GgThj2baMBlXUi/yqONRerunTBCH2NVhfKWkM8DcF
 PGP+M+/0H6LSc9BUXkLrNWyizN7d0PpAI1SsHVHCmEXbwb5a9IBVQRLGZJdMLrpBDVPsAnJ3IFF
 PmajyKA0bD2bdRRCxsyHMp+d2Pj7O+SPgOf2qS/ZLMEP9k1bvHYbt3QxJWknaU/14RfXsJz/4JR
 jHpWjVxwwNxm14RoGRbwzTJQsAueeSE/GmN5dB2tJJ2zkdDP4MeEL2gS/VVm9DZzcp1Jdu2nl5P
 Cl9kbYTCbIPq3gvfTjCEAFwJhamDj86HzkYuw3DfCnPAAqUhYiio6bjffmSf53O99shFjkfOYQl
 jw92aqqLhTl+R1JL2YDEkBTe2cMPVzls9rEXcqSE8YaDRr9mtAs6rFfLosVL/5AiDUyaYeJj2mV
 vt2h2moHsbq0A4ygTDA==
X-Proofpoint-GUID: 9qzGDfsW0cBSOusWTAF8HZMJ4B5L3fDm
X-Proofpoint-ORIG-GUID: 9qzGDfsW0cBSOusWTAF8HZMJ4B5L3fDm
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae20a5f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX1KmiIAdb8VIf
 zProccLrnmzbPuy9TQC2vOpnk2U3MHaDSAOhEysphhQOKE+kopCCV2Zxi0PDpMD9dDkczpzvheL
 mrxCeLIvV0GZkqRMRO3uydsgMkWk2Kg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

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

