Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBD4908D1
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815960; cv=none; b=TbqdPPfxgVdA46kCbT5DFtQYx//Qzcx5nDXxBgsal7g8vuKaEjSIu+VjHkOU5dbWND7sqkrZvkYvs9OY5ZJmteuMMDOdikIrfoZJr9Zi3fEVEY2qG62P5Nowijl7bcJ4/aaH6E1/R9JR/+EzmZPgjqtWfcC7dH8nMkYFEEqMqIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815960; c=relaxed/simple;
	bh=uD7AOtVpGwXsFT9hIHLzf26z+GtdBWp6qXoftNk/XnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEeIz1a384abZ71D+WVKLe4gayI6yRYqkmUFR34hEtTIPzYt5T7HZ4B8B7V3YF6qwR+7fjLLVyzzZAyK1GIE3qQRA8+qIWdHuAvF/5m92NzyfAhoMLJQSseZQNzZposgjlrL1m8jsV03GXOItql2vDE2GL+UkIRYwtEce1jdXGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ruhq+etX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jN3KGIw3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ruhq+etX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jN3KGIw3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC05EB2786873
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzZuYQ8tUFHfcS6jaCGuRhJX3/MtzCml963NwpX0FPE=; b=Ruhq+etXh3qO59FW
	32vDCoX5bcw6hpH+Jjde7jffH0NpzBV8uLRGsZCK+wop5BO9WLFiaozois218yoT
	2gyxpq+7CqK89Nkd2WFlB6XtC3KNz/E1f1LwvlsGvtV7uWfVcD62aKC6imWqsXMb
	KRbhdG955YOukfBVwcoqCCSjHH5zg/BQ3INgQCqwBOfvPA+8vsVXY5jw+I4J1I69
	yse1uP+WBeQAiO8MJA8ZW94iidQ+FLcN4fF1V0anAknLR4gSjfObV4mqT8FsdR2p
	sEcrlLc0KFCsrXqC1P7iW3GffUFqDzsMIro1bZRSQSbJqkeEEcZ0uJnRsOXiyA0V
	ooQs3g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffh5pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917bab67568so67819716d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815957; x=1792420757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzZuYQ8tUFHfcS6jaCGuRhJX3/MtzCml963NwpX0FPE=;
        b=jN3KGIw3f1JeFtd8Yq1ue5yddz/uJ8LYZKcP0BpUYLKyjVmrxZXU6HvNmjrICcFjaM
         12DN7y4gUmvPo7wFaB9FFTeHr8nwTUt4BMOoF8RoY8ZZTuLOpHY/wfuNNHCNSqYbDjkV
         gf7MTR791rjsdC6A95vNWcHpyr0qS9ur365GpSwyhqTqT8a9Wrwo8CwuvHsnnSyxeGxX
         2Zs9gkqLLK0vxYgnBsBrjcgIBHQBlLbbEIOWAVcdEIVAE2rsUvTXZdN8pgc8aiBz6qxg
         M+XmE5PoY2O7orPL+bzqtKvJeD6uHlkGU9hn0nd1dB9W0jBanfnVDU2yCAzNjGEXqjcM
         e2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815957; x=1792420757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzZuYQ8tUFHfcS6jaCGuRhJX3/MtzCml963NwpX0FPE=;
        b=ZsA5fRpJMTncB42qnJfSPQo5qKvFjJnHSfB3ma1jNgg41ENHE46DOWG5E/arwMiIIN
         5u8G8kgjhdmthubAp2umIsIppSCLhqJEsjGxIT66hhkpTiBYm2SygtplOboJWaNE+CdP
         i7/5ajFeGAtDpbxeJz8QUrqFTuoBujYRrIjA/4JizvTK+E9lXMvzZTudis5zou4e8bg4
         qmAdfLSD7vkViZiDCaxsX0Mkj5ZFlxPvR7JbJ9YGL64RNfKjvvWQhaG+XeJlANh+yjby
         xgo9cBqxRS0EZDG/V3mNrEXt6h252SofwFLGIPaQwjSc3Qejf+cUMKFqRFxwWcoksXIh
         ea4w==
X-Gm-Message-State: AFq9FYJkyy6xacfRieO3G9w2cuUvO3pRKOFE2HK9oImxKghOtWjHXNKr
	Le1j+YbHWtCLForBaA57UV6WXOhHe68FMkRlHo67k+fqFuRqJj4KJPr52qXLsXVNohLMj1YOkZ6
	ZpEuJwuY3NyYDwjc0MB/SwMnHDvEcEeY9WfK/DlwJTFQ2eEqmSSNSOlgc1KKhafR+
X-Gm-Gg: AYBFou2N6wJVuRRyNbBTF7v0V6PEAOui7Wj3XWC0vBnnGTInLFQRku7P21WjbPhTyhR
	fzRZ3m9LDKTpTg19l3KJXd9OXmoFpxorcWA2H46QTg+TAZIqBMPaeenPHp889C684jsoEy9Q14y
	9EPzZfC4pe3XzV/iNne4UV9b+higKrkql6SgVGKHNjkvu4TrJRl8lNug33Mw0GfOBWBAxJquwU4
	n/dgc7P+m4CXJgbZ3jOUjYS7puiFLC6o1p+IfC+izJzYsXpYg4l8LNozvCzSvoPMEsVtl6NSUyt
	Oe/BuaxkwVHohfCgQCUbrdx0a0llAMVwgp4hTeN9c/3OQZGhMJiZ3P0069cAoutvWPmyp2qb/NQ
	RoEX09hibC3XvKggfVON9jEWM229q
X-Received: by 2002:a05:620a:2612:b0:93c:80d8:57ec with SMTP id af79cd13be357-93ebd2a69b4mr1469032385a.64.1791815957289;
        Mon, 12 Oct 2026 07:39:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2612:b0:93c:80d8:57ec with SMTP id af79cd13be357-93ebd2a69b4mr1469029585a.64.1791815956883;
        Mon, 12 Oct 2026 07:39:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm340396725e9.12.2026.10.12.07.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:39:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:38:59 +0200
Subject: [PATCH v2 3/4] gpio: kunit: rename the swnode consumer to a more
 generic test consumer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-gpio-kunit-plat-lookup-v2-3-553b0d6446b9@oss.qualcomm.com>
References: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
In-Reply-To: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6096;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uD7AOtVpGwXsFT9hIHLzf26z+GtdBWp6qXoftNk/XnE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzPELlr0hXUoZe/W1IAPKmYCUYNX5ErLDLw9w2
 2Dd8LPQkxSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaszxCwAKCRAFnS7L/zaE
 wz6JD/4i+vttt1JvUu8udZ4+zbdtiQkZDRK8htky9tTeMlyJ7ktJqyWfgR+JdM7P35LIUV5vJtb
 G6/WbYruZhs3Leps7XXs80suZKqfeT4HnmpRcjyU6wpo2IeTRnedJVnw3I/nxCM88L9zOuhe3Py
 zU9DWJSZNtKI4dX/A3SeTZtWb8VQYXBCPRI583o0LKnuHnRRFdNOgh3vDk1SpRHdtAx+64j35dk
 RvDPsmwzqQzAx4rEFQ8Ch3jIjsP+fHAxEFmlSB9WKWGFVPX9imZEcvDleO7+qFsB/IhaCMdtwbM
 0PzQjz3kcDeiCfATlY93E2ApnvU5o7IcziXsmBJh8Avk5NIok1Ohn5GdW5i8aRR1dwsM5A3/wWO
 U8ZV0/jIQCWI1Nvu+jUuSKHjSG1RTyOLZcTaTKMNxOBlnCYgdPqgjyVSFTKBV2dS0I5I9R4Chrx
 07U60gsXxtefYTmvJuDoqcCuhirK2DNSc8qG0gi2EVYF0C172ysmYDnvUn2ACNWzo3mwuILOoQc
 Z96bUKiD+DqB6OeZTGP1NqFcarTjWGunjz/6E0g+6+BCKs61M1GMRp6oWAT9nLuRvxreUCgKCdw
 dgsCbLe9QQz6BF6j3TbI+uG2yur5pG1w+7PzrEBijH1ILsSae26Emdcgh6jVDrEBRw16LKQX5Oo
 PKoYtzQAxf8kMLQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX5zxRfp6sFn6B
 ilRTcig1w1vTNa4akY5ei5FFz4wojkKAse2k+nn4/CobcxqZqJqfexNGf3/3hyJRMFP7n3MVQ+q
 bqvfe8H8ncmo3/7pSu5tRn50uBiiz+0JdLxoK8f8r5NF0NufbuG3J1Gmi4rUd3P5lv+oHO88ehP
 cY8winnKPW5IAeEDkjPbgYQv35HHLfG+h8Z4rzKtWPytq002y/TyXpXjP8Y9y5NIEIKCPwgdomB
 f8sHwIrlN9twTGDzeD3ORNm45dIycHviyK0QXMdCFSFxntzmdz1alFZ8CEkwfLI8W7a7bcdS7q0
 DK0ZLioJJ34E/weomJxiNxCQo1XXcf/+4syx8qN9397qWVZ2YGYdDfQuwEWL8K3cmD8S7rASZ6W
 aN/Q/3LtW8a2lJOgGx1+081WUTEa2+tqhSVld4rfx8ZSW4Hs/Jrs05AQtxo1ruJKIio5bHPX/Js
 NsroziNnaKBBmY0Agng==
X-Proofpoint-GUID: n5WBbFmwhGgZbKtOPy0PYeDhxm7vsStw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfXyMVjPnrF25zT
 Py2mIlrCRhUn0Xnf7/oTxDsPWnHSXo+rBGh2wqLivjEiPlH96CBun5IYPa0Fy/VNXu3MGE67Oim
 KSg7QOmvAp2E5X8bYDjaJmZcSzUTGLU=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accf116 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ZYxMm2tPHDp-qjSs8_8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: n5WBbFmwhGgZbKtOPy0PYeDhxm7vsStw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120058

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

