Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6036606B
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896613; cv=none; b=X7G7XECObAbuMyfxyUZvW6gPTViKRXx6A3ZP8hJd6H7DA9NHT18LC7T1oF2m8s19va9RjQl7XK06qDdzlzvqRS/+1xxi674X4YtGSwG7Jc04LzdOeFOBxGq6T/M7mZXdo9A9kB+n1J0XvxrdTOt58tIgPc/UjLXXcoA3wNJSMeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896613; c=relaxed/simple;
	bh=kTDaibgKumxVGlsCbiu3TRWBakZ0+s7Crv45Xhu20cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sfmChghdKb42KFsyf1SLytGD9P390fz60yXxXQcc2cxXM9fHWDQx9PZwe/19We+Dc8i7weq0EgoiuQUCUxJxLddvxndPhEEhPWL7pJo5oOCBFZ4qeKmjfHz0fQNEL7lAU7lrWXre3QDO4eYJ9SL86GFpIdyi0wy95iskCE/hHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuYVNSAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/UPiJUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuYVNSAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/UPiJUJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8PCHG3054908
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=; b=WuYVNSALyJGEcLCP
	E8eXr6UGubVj2TuB8KzDjoZclJ4JXjLKrj3og1n/4rSNr8dx1Lgf9z1dbGy/ygm/
	bgCxnB9dyirsU1nmgbMYyiGSgof8Q5Zn7OQF2HGVqXEhBAYKhGVCi9J0yX4VcU/J
	+K87UK7m8ZM6WHj1r1YRaVH+OO3U7JFJIXO3moh+l7HmCwJgAc92Wg5paFky0ip3
	KZS+3496aTN5TTfIlleN317F2uL5fCdPXllMJGk1uW0mfzBXIkoYTikfn5RaeEBZ
	gLB4SavokBqcv1McxUjp1P0MccRFmX/t2dLHX5QLeyjhEYoLZ2iZ2kc1B2sd0T2s
	mv5iHg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aevdjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e93fab204bso2904145e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896604; x=1792501404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=;
        b=g/UPiJUJL6riXGRbu16U7zFh+yNWsNCJOaIxF0w442awm99XamIP6pLsHMH29ydvCx
         2V+ulFBSQZz080fz7cHpd5iGxPDQNMuaLoAwbEm/W/JhJpQ+OF5jpn98hPZre4gqKRCE
         a/xC7caHrB6NncoS2TLcNB3QoPMzEI+VtYgg8CXqn8ex3aPyQ1OFZ/stgO0uur1g+vlO
         IGkvJUch2KcpHaz8y8SVJSYq9Bm6Cb10uW7BohZksBpqBbrST9bTf7x/GWicspbdG7E8
         XsaQPtoBnjbviaQeLvWhvokQRnQtxAjY0nnASViErs8H9+OIGpO/G5qa5E+3Kv7fbhM2
         Mxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896604; x=1792501404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=;
        b=1PGIevDLRncu8wt9eGQfUruaMie3od4JSK2lIK5+Ny1f+lYRcs6VNB8JUmQGo9pQwn
         vjSMEjXXZwa8k4dcZvCU2y3fbYrwSi6aHnnFQhnDI3fGMVnLU+m1Wge4GOfG65Nq7ImY
         8zTQmK4VbEf+WNCOuoOJhhPYQg0zisqD6U9YDdNQGLyyQBbWQhgM/OVkYQPF3fAsCodw
         LRuS7ERqNfMjC8DE2oY+MysYYwKVf8XihZny6Sg1N9mpD3WhKt71g8uHjPH8Wus70YHn
         cXzSonoK/94VJQnSTdhnVcK4bSm/t5Y2BfMyyT31VE7zzMPKJ9xjmya+aP9TqWsbqnkD
         yHGA==
X-Gm-Message-State: AFq9FYKWAio4j1BcJqGSJ2PH5a9uV7n9qluc1I5HdhHhX+VQRVf2p7Ik
	xChvhnxVg/zUeNDqSQqrvIUcq2Mbtyo8bo9u81YV0VXvMVFJOK3LDoD+o4ms8xlLcURfUdb+Xml
	oM46Du3BUAKkBH8Mp4ZKUOHusuLB9LNgeTT3arbtWeLAEylEeIrVqnbu0MqlNllpR
X-Gm-Gg: AYBFou2fRGn74t58wuViyebaZHCIi3pzuZtnT44A/6RKJTe2Eu91pnaiOYSTTNup48Q
	cUwOqh+/aZ1qjeACPkUHu6+WtlNL1114dWuUgbn8jiUrs8KQtFaPmdkeTgbZqE+5l6aL/oM9hjd
	8QOGjlM0GWrf54Uq7J0fN9fQ4+93FZdAUHgW9qocVBIjbGgEE8QmJbpCzCOt1B3/O3zAp/ojOIm
	Mj/1xjFzIxtmfUpOQhqUseD5YHN/4kTUYzPFFH3OfqIF/olZCbgps2P28vF2F/IP72nDEgtKNbz
	R1mjlhRaNFydvOquhVchEEyxYv8UCaWG0lGaSIla03t2mtdgGoa4Dh8XYf+OlgbZ+t+czXaRs43
	nlohfhCzYiE3pigTKi9kvGsPvkS+m
X-Received: by 2002:a05:6122:20a2:b0:5cf:a94c:ca61 with SMTP id 71dfb90a1353d-5e91f4497cemr4326243e0c.7.1791896602639;
        Tue, 13 Oct 2026 06:03:22 -0700 (PDT)
X-Received: by 2002:a05:6122:20a2:b0:5cf:a94c:ca61 with SMTP id 71dfb90a1353d-5e91f4497cemr4326021e0c.7.1791896594435;
        Tue, 13 Oct 2026 06:03:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm401795085e9.0.2026.10.13.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:03:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:03:00 +0200
Subject: [PATCH v3 1/4] gpio: kunit: fix the label of the dummy GPIO chip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-kunit-plat-lookup-v3-1-3907f913e964@oss.qualcomm.com>
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kTDaibgKumxVGlsCbiu3TRWBakZ0+s7Crv45Xhu20cE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqziwLuEP5imBwBc9yJ+Es10PbS5UUJJ+m6vwyd
 yhveyTNh7OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4sCwAKCRAFnS7L/zaE
 w+MJD/4kj+e1kkIJAo4YFmYeFJKnw8thSbCUQN4xFvkdt590ikVDGZHbH9oHy0W9UT6X3TQ4C55
 GpitCAzS80xWcxURW/llZPgAK3wym6Adww6ihuyBfATZRwe4zXsyxu8QybjqG9lzRApOPLm0jCU
 mEox8zmy0ahs5iMSMX8G88YTUrMG71ij7h2YhEX5p5TXnmHTZ0oiksJ0uD0ADRY+4/xRIdBcTN1
 S8bbvQ0kDLI9gyJ6NFiEsQEKLJbyiNDfgKEsKSCCUpQLuRtauMAho1EEeh5CZ9CaxozcZImBTpp
 h7kjCT/xntCOsUxpRGIESb8ggiGhIiMubKyJbEmGNyb+pvHDizH8YOWpFzHlpy4OMSmPdfBerT8
 e0qkkx4frVraPtLE8ogW8N2qdVKqsFO6qT+NH1y/ZyLw1WJ16b6xj4zg82PNkH3j4BjSULaCY/I
 13euro1kJgH96Pz9raKPIBviE5qJLnJOy2NocDV5gY1hkg5QNZ0c8NpyP83XoBt1/Ags94Ze4JS
 0nL/7bt20/sOGWLJ4adwOEb7SQZ1COen+DnIoVOyJtb3MfhhKSuKx06jteCx0kgX3QEyrxcjWrn
 Ql2qy8DnGc1yffcDJNEjD4LoM+IR0ucSo9MOVRQzjumF3pNJ5XZ3hq1qjv3UBJMh5Uv5c9u04JK
 crzc1rToDkEx/xw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ytV4N3vRJnr52y_C1coJq7kWdRVLcSq0
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace2c22 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_6NsVwKH7hiaWHCS-UAA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfXwvIyNTBKhZHE
 vUCT//1QiblRAlkV7No/a/i3ehIkHUKXlO81jEA5OCt0gFj2loj8Bl9GijANoFlegrwP7/t09Xt
 t702tZeWvcpovHWJ213z/tfTNZ8tiR8=
X-Proofpoint-ORIG-GUID: ytV4N3vRJnr52y_C1coJq7kWdRVLcSq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX9ZEPauNp5I5G
 RKq1/RQpZLrzZM0v4/xJF32L495NCHvMnzC986zLpNZcpIux/LrOCF6hw213lNLsgC5Z58Lc+PU
 zPE/0AzfvK/FDz0hChV/tiDdAb6eGEDByEgZSvgYixrYqz8Gt1gpHewfVU2Zvca0g/pPBN/TdcL
 4+qWGmL2zXWZc0sjVp1OwnUYMJBPB3Y4oWf9f2yuHW4AXmnGuQIwM73OmkuOIy9NMmL+tBAkNpy
 hgi5rkHZt5zMO1ca762iQ/U6Qkbw7YFVgT8pNL2Mg5JSrVyDRN6lY/QbAZ4Rx5WOhG9Wzvcor3a
 VRgumAAgRqZLudgyskzVHGyXKpysRI4NJfa9b85Xth512isKtf5fqJZQId7A3FVnA4Ph1F1ikbj
 77i+UgOrFc0BEJdIDCHqkpkwmdFWkg4jkyH+xma82o58hWk8UEg4hPdrOBeVpU764Hr0Uw7BBs8
 4t4te01FXE9xJhjYglQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130051

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

