Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303E2501F4F
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896601; cv=none; b=CkXcZrFgh+dfakpKMBvU3X9mqlBjCsTJknO3dpYH18FJOqOasYWZ3KQuokj97nuTLycWVslY/3UbHgpQlknnMrb0yWuTAlsngwpH+ELmRvn5iNDHr+fJteu+tKQ2OBxN71MEprQUEMI3yCpdVDFHk3B0zBtDFxdq1c8CD2oyDEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896601; c=relaxed/simple;
	bh=uD7AOtVpGwXsFT9hIHLzf26z+GtdBWp6qXoftNk/XnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=unHU2fWbUNkneqszrLHhpgTat4ykSY4EyASaCrHMTl9TCTrRyjNdSd1sUs2+HQkLhIEFDwPAIbh3oaP6acSq4iP6Z/Y5qRFT8kUL7SAZ+Wnuewp3pq1XqnrB2kRTSPSNopBPfUaS5UWxUdv/G/VgOiHFulalzEiyy7s8JGqo6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nk7p1gAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQNUYj5V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nk7p1gAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQNUYj5V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D94AEi483146
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzZuYQ8tUFHfcS6jaCGuRhJX3/MtzCml963NwpX0FPE=; b=nk7p1gAZF3HYaOPH
	8jvEOAB4Qk6tyfxoQshAkCaasPLYZLMFxfxhvtsfAroUQosOcBQl1RZehuXNjph4
	GvFbITq8H/GTGilCPAiQF6OqANfaXdK1TJrQRn9n0BMPBxz2Hj1M5MMJXDYYSv6c
	8g4jcFVMwR2bQaUSrBaVE9cVeAYumBRUE05dfoSe+XVMSf6EDZ4HR6W5kUD93Xk4
	lsSuZU9s1nnZyKyoYRuIQR2mfNqjYdJ3OTOzuzdg4MZUDamfrNB0H9l5cUvxoWhV
	YVBYZYn0fyrBGu2SoIuLPzZadxS9x7qEKlVPFBy/fJzV5UuoYK8rl3eOOhIzq3CH
	6+9o9A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg8y3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:19 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d6d5ea0757so3617142e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896598; x=1792501398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzZuYQ8tUFHfcS6jaCGuRhJX3/MtzCml963NwpX0FPE=;
        b=CQNUYj5VF22lFTA4pfScX+27/nNnFIFTgVclEhtz/imkkKuFcex5kqyH2mR2Uac9sh
         0/t72yj+T+F8toT3n85ICR4WfMbzwqkarFVUMu9oZ5sK14pQY+d+6DfIB0r3O2+A3nOM
         4yAGMhD7+/LCPxhhStWI0U7RzYn1y2mZuRpsPrT2BSdcv5njiUufUVYPbzepvjUZP293
         VJVCdncsAlOPo+oYK9ZcH4l8faCTLsHGzuuFL8qaf4S+4FzG7j+P6Qb5KpOFumB6Qhu9
         coYS9SJyaJp2/mlgWHOdcMwsuuackgxPGLNowe2Xs3ihZt1gMMLiRhYPxar6uOiZjt2P
         HLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896598; x=1792501398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzZuYQ8tUFHfcS6jaCGuRhJX3/MtzCml963NwpX0FPE=;
        b=ZKwhB0i2fX3ZWc9/Bc+LqMqN8GhZVQOjNYgXWCGhuUn/yBlDjvjwf2TwW14DoAX7/Z
         dAXvHazV0Kk7Tsj5DRc40+OmZJItYOWAbbtg5E+YWzCUk5CXqlVsTgnej4ZGBs/Ia34o
         hshlOgsg/2XB5kzQWO62oBXmWMBIrVE4bjOh/TnYRnOaqmfCwLKXHwN40y/DH+QaIsMi
         qVzV4o4bzAALkzYr9rJOB7LSZxIngbRElUEusleEM/kebP2dwO/7VajQY28zE2Cadyjx
         8zPohSyPFH6etFcA6yomR/ugl1ur1eTDANTKvPuTH4Ib0i2tj89qFFVMdhMjAGC1SM5L
         hcvw==
X-Gm-Message-State: AFq9FYIZVYWw0ti9sZ6VSqlJQt1TUBjTDhw12x8flIkDEif7kqeqhUW9
	Qsn7/69ZlPPMBkUht1UnQkyxI7AoFeXXUx8V8mRfkTkExDjlhePPIZsIll1yCyQi8AlG8QmHDyL
	HubrntBYqsGY/YK78t/eKZXj1LldncKQl+IFnnLIgGlIWhHG0SEeECa96qLET3cm1
X-Gm-Gg: AYBFou1rZdr1+jf3pyuRXV7UE9/KnxXj8eZ3LD+2HTRe3Mw4bbzbV48Jz2+jOhBciqT
	ZHVue9d6nWUMtPlQP3sqIilI8mVbHySPl9tKPbDD2hDcJDfaPxCFX4DtweEsSBTVHdGXdFLm8ru
	ivo1kezaseeyc6h72rvMhxw5KGRphRgBdwSMFl+wnbUa4HdXwLF+JH/iF1MW92Xj5VhmYHyO3wD
	l5yI6ewGt4JcSlOBgZLlYfyI3eT3UOlDhF95lWixnEQRHPKRII4jcnPwaYC0bhCYFTeHtjnELmw
	7drbSRXzWyzj/+k+NowWdkjjm76DbG75ImvMKcSKRjy8fNLUD+iDp+hw/eFuvfexClk62De95cN
	YHCa+p6ieAt7rb+xJBt4NFl6adHFh
X-Received: by 2002:a05:6122:1d52:b0:5d5:8ac0:17e6 with SMTP id 71dfb90a1353d-5e91f240827mr4158030e0c.3.1791896598317;
        Tue, 13 Oct 2026 06:03:18 -0700 (PDT)
X-Received: by 2002:a05:6122:1d52:b0:5d5:8ac0:17e6 with SMTP id 71dfb90a1353d-5e91f240827mr4158001e0c.3.1791896597814;
        Tue, 13 Oct 2026 06:03:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm401795085e9.0.2026.10.13.06.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:03:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:03:02 +0200
Subject: [PATCH v3 3/4] gpio: kunit: rename the swnode consumer to a more
 generic test consumer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-kunit-plat-lookup-v3-3-3907f913e964@oss.qualcomm.com>
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6096;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uD7AOtVpGwXsFT9hIHLzf26z+GtdBWp6qXoftNk/XnE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqziwNcEIyTLT2n5o9DmuNQZw7nCpiqmh/UpPbm
 WWlR8ifQqyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4sDQAKCRAFnS7L/zaE
 w/+lD/94LhuWWEZ9zWqoA33yoZL4xth6EVO+pIXwwDIdRM5O73OF78lh48fRd78KuwFILUgWXlT
 y9cXBlCCPcociKvcufuZgJWySe6aidP8NhI2PoRBVCOvdcPrW904D+zWXCtYrb+tMpMQk54f07i
 jhB7nss+ZgOw9z71mRRR/UCPi0kaV6zZ102hb3M6AKDm/SD6dke573DswjfSs1a62KmPukMUTLo
 XSbhuqWg3TnlhFkQS5O5+owehsOViuOG0e/SV7jyUTLSbB8laER2HC38CYmnK0MB8nbiK7CIe2t
 sHzTwKiJ8X1v6p3UKN6ljH//HdDxwsrQztebxJ1btcQ4vIgXrseX0fQHklgm0ctrphqwRhASvuo
 WSWcJoEvYAh4ObMDpt1b/jr8R/qBTbx7HlhcY7A86ipWm0EAA8RS2i0adaTwAnFQM9obxB3Mp5s
 Bnfbqs4MVCYTxpEU9wXXgtKP+JmjYQQ4L2nk0xnqHIRvKe1u6bZqKQv2f86CiJgZV37Lp1YePbp
 R/C/AhC7yJleRNEmJqYoLgAFolZU+pkYiXIUsdId6tKi5LE+0iHD56C0OxqLpAps0XKUHCEGeY7
 NKgF5O9rtaok8ZFehQZJ2PKr24AGIz0HShG/1a78AhISlgzOqzgE37CtqWodAq9CoPYVtq6/C05
 oIfiszUPOJ5pQhw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Fj9C29QOAMc3bx75f24odfib5IEg4dcq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX0KlWH/PjxZEz
 /1X5fcTXOMGQbOLMqMc8Jbj8WzYBy1XqIyYLX927TNk5uynfhnKAO1HlOpeczBtXl2cYKrJShoz
 wRiL4H7HC6IvlSYczZHSTzI4mZvzZ/c=
X-Proofpoint-ORIG-GUID: Fj9C29QOAMc3bx75f24odfib5IEg4dcq
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace2c17 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ZYxMm2tPHDp-qjSs8_8A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX0WmxHKOStroG
 LBG3GTR6B9c/WY5Flrq/RjomMU7IqL3NvUmQF9vqrnUb+BHGjxXH6f/q+akBRvIjCBdEGTu1J44
 6+SHoxQGbJ++rogPhoRbVbs0sTlBdOXXtPDBO21cMZGBIX4Uv0cRzFqAdLIXy1yPqMsYGuna0TF
 2OPsBnX9xu89+uYb0hvuMfd/xJQoalAcjxsujnk4++RZ0ut19TV/sk5NgxOj5RXK64l6M1+UO0Q
 JQBfsOWIeMLcVnVPusnyUzW7M1Gjlo8s7c3AcPDLnRrHihK2xnaZ/u8IPhtnLxws9df1ynnL+IN
 dnf54YjYQObMoZvOaeEj6R+AeFBsku1pPglEnVN5iI1LjKyJXm7Qoi3kTKpuKNsvQlebKpGcA6p
 Huojq8grmuShhpLfMXAwt7eRpUIFLaq2SMNlxwIjIZEvbF4I/oHHJcAcLUKSIz76PBGAeTGJxlr
 8yHM6H+pS9lStbir+sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130051

Ahead of reusing the existing code in machine lookup test cases, rename
the swnode consumer variables and functions to a more generic "test
consumer".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 48 ++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index f5f1e3627bf0084dc87f4a4dad8ac7e003c3945c..b662be88a08711380f938852d84809f36a8d62d0 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -21,7 +21,7 @@
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
-#define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
+#define GPIO_BASE_TEST_CONSUMER		"gpio-base-test-consumer"
 #define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
 #define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
@@ -140,20 +140,20 @@ static const struct software_node gpio_test_provider_swnode = {
 	.name = "gpio-test-provider-primary",
 };
 
-struct gpio_swnode_consumer_pdata {
+struct gpio_test_consumer_pdata {
 	bool gpio_ok;
 	int errno;
 };
 
-static const struct gpio_swnode_consumer_pdata gpio_swnode_pdata_template = {
+static const struct gpio_test_consumer_pdata gpio_test_pdata_template = {
 	.gpio_ok = false,
 	.errno = 0,
 };
 
-static int gpio_swnode_consumer_probe(struct platform_device *pdev)
+static int gpio_test_consumer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct gpio_swnode_consumer_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_test_consumer_pdata *pdata = dev_get_platdata(dev);
 	struct gpio_desc *desc;
 
 	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
@@ -167,21 +167,21 @@ static int gpio_swnode_consumer_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver gpio_swnode_consumer_driver = {
-	.probe = gpio_swnode_consumer_probe,
+static struct platform_driver gpio_test_consumer_driver = {
+	.probe = gpio_test_consumer_probe,
 	.driver = {
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 	},
 };
 
-static int gpio_swnode_register_drivers(struct kunit *test)
+static int gpio_test_register_drivers(struct kunit *test)
 {
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
+	ret = kunit_platform_driver_register(test, &gpio_test_consumer_driver);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	return 0;
@@ -189,7 +189,7 @@ static int gpio_swnode_register_drivers(struct kunit *test)
 
 static void gpio_swnode_lookup_by_primary(struct kunit *test)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
+	struct gpio_test_consumer_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *pdev;
@@ -209,10 +209,10 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 	properties[1] = (struct property_entry){ };
 
 	pdevinfo = (struct platform_device_info){
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 		.id = PLATFORM_DEVID_NONE,
-		.data = &gpio_swnode_pdata_template,
-		.size_data = sizeof(gpio_swnode_pdata_template),
+		.data = &gpio_test_pdata_template,
+		.size_data = sizeof(gpio_test_pdata_template),
 		.properties = properties,
 	};
 
@@ -227,7 +227,7 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 
 static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
+	struct gpio_test_consumer_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct fwnode_handle *primary;
@@ -258,10 +258,10 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	properties[1] = (struct property_entry){ };
 
 	pdevinfo = (struct platform_device_info){
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 		.id = PLATFORM_DEVID_NONE,
-		.data = &gpio_swnode_pdata_template,
-		.size_data = sizeof(gpio_swnode_pdata_template),
+		.data = &gpio_test_pdata_template,
+		.size_data = sizeof(gpio_test_pdata_template),
 		.properties = properties,
 	};
 
@@ -283,7 +283,7 @@ static struct kunit_case gpio_swnode_lookup_tests[] = {
 static struct kunit_suite gpio_swnode_lookup_test_suite = {
 	.name = "gpio-swnode-lookup",
 	.test_cases = gpio_swnode_lookup_tests,
-	.init = gpio_swnode_register_drivers,
+	.init = gpio_test_register_drivers,
 };
 
 static void gpio_swnode_unregister_swnode(void *data)
@@ -731,7 +731,7 @@ static const struct software_node *const gpio_hog_swnodes[] = {
 static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 			    int expected_direction)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
+	struct gpio_test_consumer_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *pdev;
@@ -771,10 +771,10 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	properties[1] = (struct property_entry){ };
 
 	pdevinfo = (struct platform_device_info){
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 		.id = PLATFORM_DEVID_NONE,
-		.data = &gpio_swnode_pdata_template,
-		.size_data = sizeof(gpio_swnode_pdata_template),
+		.data = &gpio_test_pdata_template,
+		.size_data = sizeof(gpio_test_pdata_template),
 		.properties = properties,
 	};
 
@@ -825,7 +825,7 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
 	.test_cases = gpio_swnode_hog_tests,
 	.suite_init = gpio_hog_suite_init,
 	.suite_exit = gpio_hog_suite_exit,
-	.init = gpio_swnode_register_drivers,
+	.init = gpio_test_register_drivers,
 };
 
 kunit_test_suites(

-- 
2.47.3

