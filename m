Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D1C3C0A0C
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815956; cv=none; b=BGzPQDoXoVP7KTupnEnzWCmwRc3B/WGqACtWr0xavEw2dqqqyizA7yQ2bqtJEpy0ukDsSuBcgue6o9bxxbkBlmK7L1PzcJJmcVd5hZeg2bjfOYAOsevGBstxEW8wCOMSOli39DsSZKecHsV0OgVYIWQZfXMCZWDkaJZydgX+Prw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815956; c=relaxed/simple;
	bh=kTDaibgKumxVGlsCbiu3TRWBakZ0+s7Crv45Xhu20cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5toY+VGrFeNMcfGuTrsqabH4QEgGv5I1t1kY99rUCAa/nUteuPpYDKNuVv5xsVER8e4rdpyXzShh3stE5fWqqY6VjHpOod3sGNuMfnk0OhvRaqs9NQtloT8zmtR9668XXomuQ3aNaqroxIsTd1MvczOuNF10Vbp8HWFJz43tYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTMFQQIH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O21fYKAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTMFQQIH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O21fYKAw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03xQ2786787
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=; b=KTMFQQIHhAIRKTgM
	zHGqAkVR7+fYCAN09QSjwt8sTHYairdarHarxDfyn7hlR8IAPh0aAWMGt3Yn9ZiW
	N0umhdRYz2uDsl96aRcS/oxpxaOSoXIVDlk5WWUdRWTSEg2EP4u2ii4YgQLPjzmS
	FmhoZayMXuPTJrlN9dLWeiE2etKg0UqS1EfsAGnfRwhjqISmiWH1PcVo0XwW0jxS
	L3YXDCqdHnK0Ain8A/ANbhP6CtI+IFC+/F6KEOOCaHVmrAy6RJLa5ZUFN9excQMf
	IlrFKoYRWd/Nu9z8fgWChJBhS1M6ELBz2yyRt7Fy52dSUGqJxIFm9O7h1QIu1AE0
	gLR/KQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffh5p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so217544085a.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815953; x=1792420753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=;
        b=O21fYKAwz9Mr926o8u2ForxWn+DuApz/dT11oxR79zQw1g4av9ma/mGynPkH161GTu
         YEYESjcS4Ssjh5SYsUTzdSebRtKnUHlUInrgopnyo60J3bxnUbRoVtcwhh/J2gqVyVan
         0CI/qqW8kLWmCT6M6aJ4BFmImy4Tw795MW67igz05KhjBHTQsYXaGw5APGPeoGIAJVGa
         NDl13W/VxSL74GtcLvap7QjpF2Fer6qfVoLsKHk8SgeCUbquOHR6yX3X6rnzUuLdPMmO
         F2ajaV51vWmJt6SUrXx8pogODTHxce5r5a8QXMOf/6P6ECf+/b8R4f/+tt2EJy5NHkUZ
         KLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815953; x=1792420753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=;
        b=Y55dMtW/FSTM4a+YfD3nVrJWLQjpTQzm6I+FQHjZ3TJTANGSfV5C3q5Y0XqmHEftqs
         8yBnbeKVUYudYLcJAnnrdKPjYb+Pb1iZDoRLpg6oGp2ux7lZSYi6uV5xvn4SjL8/udf+
         No/MEjQWHVD1ZVXYCMsZ4LABrJxrsR1+UTAPGcknN/7DGHSjNQ4J2lVjBb+ovMjLGHcL
         WUOQ+hRU4qXMq8dL7KHCAKscOX30Fexc9nCZIikMiVT1APckXYft7TZkkKfxIC3Qck7Q
         t19a8HMc2m/jx9IZaRzZfoI3/RBubcTPB+72mCwEG2U6/Op4PrdzLOG/dsMTp6zJKesf
         Z9sg==
X-Gm-Message-State: AFq9FYJKl+/sQ6D78FDXmqhd0tnu3v41AzUA3A4Y/y0vRF125J4UUQRW
	CB/EtMCyyp6lAA0QYlPl8MiVCg8HqaStMaZnb/H3Tb35DIdNYwkMksMDgkDJufHD5ZGk+fa0ldi
	w1OR1pzoK7RKiMgSUwhC5eetx6vz42CqYgxcc4MxfGx4SgrA406Mu0XajtckIQQ4W
X-Gm-Gg: AYBFou1JhYG1FirOPof/dzUjGVnGf2yOxPbz2dRsuI1VteZy67u22rRedwavPA7tuQZ
	pNYDs7CgEW4RyuY3WpjWen29Y9BPm0pMguOZRR6iUpQk8CHfRqvhgjcEOwH2v9MpKQHg2nmdnJV
	irhNHWb4uV4rjHe9Tw0JMtk6S1CsUmHuX/TI/z1hH746jyO4J5b7LxeNbPzR+VfGTRG5J/GU5gc
	ljamRSAfje5UhVkRT35vbKqslLWsdz6DDxr0Y1/0tcjMjXSaXSCR0p49evcSJfe0kj1LkCcrbS2
	VfaeiMMfvCaEWl/kjsv6Fk6n3tGmwLcV7BD5UgLAGBSYbhgcUpbM7ATH/MBzVkoytkMe307z0UH
	bbuyq/8RXZ9H4Se+RD6kEz/0Vfd/p
X-Received: by 2002:a05:620a:278f:b0:93e:c12c:fbcb with SMTP id af79cd13be357-93ec12d06e8mr1414971285a.71.1791815953076;
        Mon, 12 Oct 2026 07:39:13 -0700 (PDT)
X-Received: by 2002:a05:620a:278f:b0:93e:c12c:fbcb with SMTP id af79cd13be357-93ec12d06e8mr1414967585a.71.1791815952608;
        Mon, 12 Oct 2026 07:39:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm340396725e9.12.2026.10.12.07.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:39:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:38:57 +0200
Subject: [PATCH v2 1/4] gpio: kunit: fix the label of the dummy GPIO chip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-gpio-kunit-plat-lookup-v2-1-553b0d6446b9@oss.qualcomm.com>
References: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
In-Reply-To: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kTDaibgKumxVGlsCbiu3TRWBakZ0+s7Crv45Xhu20cE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzPEJ7UfiBHZG/8x2ObXSdpiPMuAHzbs+eDKop
 g6XwZEZgTyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaszxCQAKCRAFnS7L/zaE
 w4niD/9iyRhGGvjXWXhkvv2glCH9GA8Ud1McPJMRNIsKJ49iaK+HZiuz/B3TgnWN5nTi8GZ5qZP
 esxI63mmR33zqfEu86WH+rUO1fswZTxJXECHD/yuAU9561DVao7rR9yQhboJWzBWgXFWf2HKq1W
 WACTrhcfODpOP1jd1zr0IWwL/IjYhkcGcT34gyct/dmNoCihClB6KjigdM/ZjjYsXfuOy3wnVci
 yDpgkEtdBzGQohd5oKyGFxQgXvxyslmUeKodORikeNESEfPO6QJCTeMTaIj0sz6ONDORQJWGoUn
 Hj38iIHDY5t+6aLYJP4AGuij1bjMCi74fZrgfd2JA3rrrmgkcPJZU9K55Sb6sU0/3kVd0Hh79nJ
 +uB6zm0yzCaI73drHOIfiqs+rMpWuA4QcuczUHvsj87JxXHt/tTZTJspV6LxE4W+7jyA7CaC6Bg
 05HkWosw3nCwK3uEqNpTit/wOOc4ENc+G+DTW+ZVWJiJ5yVtk+xF98dC9jbQlXAQnlaX7FYJyA+
 AuCeoXyhyrSsQ7r3u+yiXtYF27u4Jzt5tFBNVyVKQYhFFUy7ZfxVrz138c3pZCc3K0MwDRAMkng
 nzxWljnHu99iR+2njZbjzZrsdP1s/Km5cuk8v8AH0ppfOLfGBpnbCT5zEHR5yIYQQA0iqg7R320
 ZiQhX1wtlnSf1/w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX6n/MSyqJXCrH
 lT5RZT7hVWsKLMIH3IxZqZ7wdCcyWnO688q7c3i7bjwCJZQkMYs3bmp2rElr5Mmdbc3fc8KLb+P
 ieVH2c5X/EBTa/7TFjSfqufC5Xm/MzAZb/V4GQm0MmQf2h+UnWnNOtk69v6g08p5p/3Vd8md2xW
 X9WfIJHUwFvzMjBFUWo3V3ZhbOFbZcCHMJTIav5A8ZU9socZBnuGoMruXeu5VR4f0Oj/gO1rXgy
 gElFFJQj+iJ5AcwmsDZ9OV8gPEqGF7WPB4VGQV+haERAWmU4QExTg7astvwQ/026+wz3msptXae
 /VAh6m9P1UyOL9lWb5qYeKxZBQ4aztWoemTFenNf9hVM4IKcsLDx5rOP+zeoAOpZgu95T0u/ri/
 VfGafPVLe97Irm6oi6X3z5xJutuVwvb3nOOby67XtNdm7KHi4reyb6AVgp5w1BuWNzOEsjSuZf9
 gtQY1v4Y2+5qdecdcfg==
X-Proofpoint-GUID: 3E0NoS_IFAe98ciRaUZAiYi_rmT-y0TU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX88xKOI0vlUx4
 ug3QOyscD16x/xElhTv+OKUfXpUBUbOnBoqQJxi/dQmJb12BSQOiLQdCE3iy1cXar0Kg5PIuUMC
 7UiM2ZyvDxas3Tg+3MjCtu4KFAk0zmc=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accf111 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_6NsVwKH7hiaWHCS-UAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3E0NoS_IFAe98ciRaUZAiYi_rmT-y0TU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120058

The label of the test GPIO provider is currently set to the consumer
name. Use the provider name instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 90b7e77ef0b51f5115d8a3afe53060a8f33992d2..66095c7a3d4277c6cf6c5a39ba292b67ecc990e3 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -24,7 +24,6 @@
 #define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
 #define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
-#define GPIO_CONSUMER_NAME		"gpio-swnode-consumer-test-device"
 
 #define GPIO_TEST_PROVIDER_NGPIO	4
 
@@ -101,7 +100,7 @@ static int gpio_test_provider_probe(struct platform_device *pdev)
 
 	gc->base = -1;
 	gc->ngpio = GPIO_TEST_PROVIDER_NGPIO;
-	gc->label = GPIO_CONSUMER_NAME;
+	gc->label = GPIO_TEST_PROVIDER;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
@@ -780,7 +779,7 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 
 	/* The hog must have configured the line with the expected direction. */
 	struct gpio_device *gdev __free(gpio_device_put) =
-		gpio_device_find_by_label(GPIO_CONSUMER_NAME);
+			gpio_device_find_by_label(GPIO_TEST_PROVIDER);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
 
 	desc = gpio_device_get_desc(gdev, offset);

-- 
2.47.3

