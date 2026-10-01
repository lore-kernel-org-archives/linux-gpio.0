Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57507499F10
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858486; cv=none; b=briqod4jC3jAscvFbGHkiL+HWtbZYSbpzfiLiey7FDkLpbyN3JEBuCc5rlAkRIQ+Knfbb/dFzwtbKZypnCH4Mi4mjWa8xhZ6GGxUNFi9/zF8829wTDRp7V3SBR/vL/CzBuNArTfpj6d3Sg+au7QPif5C6RubTNSPE2uU1Tr96bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858486; c=relaxed/simple;
	bh=xeFPd9gSPUnT5me7qsk2JkqlpWvW4NjnMwbYLeyc4jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eepCdLZctuVeT/JaAKZ4zxx/Vu5exDwTq/rjaelIdNQoD4NHgDvhEw3X9k21kouhlRa38VmG4BUXbfHtjhOCDe8aJPldLq01K2Qlfh4YyS6bEImcUKku0VL9XbEdU1rXtpzMhUpsPvgZY29h9PEWjiul9f+F1YfrrJyO/gPomWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaSszHP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bdye+Db9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaSszHP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bdye+Db9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CUhcR962445
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 12:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1P1BLu0CM5Nggmsns3W5UVApS+hXi8+FwmrX4InjHM=; b=kaSszHP/wcXA76hT
	M/o9OOUHM8VaMXKPmhg1Icv7D0McNy98KPtcHH5ucwaXGXy8c0YfwpMfLggFgEiR
	lrI+wYCZS6C8KNTK+gAp+BIeDhtSPLeXxrwfizb3PNiROQWjBu/y59PU3T07ggYN
	SzWlfcpR1apJPhp0xUBnHoYatvUtfQzsc98qL6ZO2Br95R9ZBumhS7XjN9tBe/DI
	t6gMDa8BqXszAdFIvNUIn1vJ0QWYCam2Swt6RhJAL6T5G752PE1pdIRe7x9xb5VU
	Ao4PYVRHUCjhsZwG2zHPPrZNv10D6gA+lgLmpaP2RkxMEoEpqdNoTk3B/0GsYDbu
	bVcWQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcv6yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 12:41:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso125067085a.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 05:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858480; x=1791463280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1P1BLu0CM5Nggmsns3W5UVApS+hXi8+FwmrX4InjHM=;
        b=Bdye+Db9p0cwhoJ8T8qtCTPzMQiFMo5I9M2rBfPGu3+3IiwJ4fV+sGnawBGRlhjP1s
         iiWeJIr64x1X/1NXWun1PCC/V9IZISdVB41jnWNWNZ22KzfAOHA2g8Y8CO1v+E+L4cxz
         37izgE9XtCyNYFrkfFwyM0fLa3R0ZH6BENMJqXHiukNGpglLDGNuPDUEgcwWg43+6xuZ
         iM3XWVJbFqKDZK7X33iuws5FXIeNzc+0yI54dei0LUV4E8Bn0JrS8vO2CynTUexAYeaO
         mnglKka//UNWS+XjqD3xxAl6GWNL/cf8hgSXZEL0NN6FfHwaJrPCxRg30xEA3YvVZODe
         /h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858480; x=1791463280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1P1BLu0CM5Nggmsns3W5UVApS+hXi8+FwmrX4InjHM=;
        b=qHcgjrlwqysdBInF7V62fDlH6EIjlxoSeZmX6ybEjCr+fmql2swLSS/poNTdWulFon
         j5rO6DGXxfzkjt05ngJ4Z6AwVY6fh8EWWeKpyZtptq0DPib1iavxmOJsf4uLGiSyKGrW
         w/vKi9mS3g4WRdkJioZ27GokO5PSXDjU43R50JE6/UFONFkjRxuYVQDjav6+Ig8iRcqI
         knMnnIaRDp67+LFlBtrkdeEWQYeD0ut4102CbJj8nbfeJjNukgmyNzGay/n4E+a6jT1P
         ZTBY2FEyZF0NOKFAL38P8J4M+rMLCyYEE9rs/M8azlcegVF1Rlc2MEsldx8Y7xRwFSte
         iSJQ==
X-Gm-Message-State: AFuF++lZb42D5V734QxY5CR1nJUSxlvt5I1iIRr3LcK++bpvkQLqugw2
	jLMojzEhH1mA1NKdZkxp1a4A8kPErfuK2WmPu19gC8+CC4XP47wz/jyt3iAw1MqGjAHvv3r1ERa
	6+HTl8YNTg2EslpBP2oqByisn4MfbnPHVUhgq3RqHGA8G+bDudOVklYMW1+//trl0bRB92aMq
X-Gm-Gg: AYBFou2eUZ9rnFCMRCQmUIVFkQwoCC9+O2f7TvziQcD08ARNlP41gns8rKUrg06/tbR
	8leZP74I6hTYuPGUXBl5eIp9pRUrPg9dkryHwlrEEU5SJoPG1gqj9APpR9uXw69/fFCE69b882n
	B4t7JpZ66YEE54d5sHEq6e8beKgPOKorUdzwg5/oevz1lcFI27Vf49KP9uPXaQH6inv4uw99Fv4
	MsF4sDaz/twNL+OhcCm81W+enUBJBNHTNPE5JFJwl+QhqW+oH1P+a7qQjNIBtqRiy79tUrduzLm
	ap/s4jBxJ+QaA4Zait4lGejZsU81XA4uYZsNOBQh4HwyXxqCbTJZctaiGyT22nKVqVsf3VGvJpb
	xMH5CjynyMEWYq7z9VQ/u4+Uo0/VR
X-Received: by 2002:a05:620a:c52:b0:93c:68f0:f098 with SMTP id af79cd13be357-93ca9779490mr822868485a.20.1790858480018;
        Thu, 01 Oct 2026 05:41:20 -0700 (PDT)
X-Received: by 2002:a05:620a:c52:b0:93c:68f0:f098 with SMTP id af79cd13be357-93ca9779490mr822862385a.20.1790858479342;
        Thu, 01 Oct 2026 05:41:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm6978867f8f.22.2026.10.01.05.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:41:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 14:40:55 +0200
Subject: [PATCH 3/4] gpio: kunit: rename the swnode consumer to a more
 generic test consumer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-kunit-plat-lookup-v1-3-03bfa84c5dd1@oss.qualcomm.com>
References: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5697;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xeFPd9gSPUnT5me7qsk2JkqlpWvW4NjnMwbYLeyc4jc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvlTe3320T2XTkuE3pEYofMFzpda5Z3b/1sAs0
 QSnnMUarmSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5U3gAKCRAFnS7L/zaE
 w+DnD/4rGqkPypuipmC36i+35UxmV9EcvyNR+HtQiuZcI44qa5pcnudi0EALTG1nFeYGrlkM1j4
 d1Z6O1xMlh+Q29S8sDiub49WFN1dYpWf4UlJOcso8qXdgOBvPCctXZFlRFDW7z4/hkIofckPPYE
 yS5mlF5TzY/ocyeEoVhDDWtwkD4+AFhAWY4frWnLxIgN5p+c9rIl3efO1XBlxxCtxZBeTTebBLy
 UN9c7Q+a7vS251WUEWJMtwy9RHAYxFwGn2PC5pLlg0rrlfLg0VurZRGBYeU+r2j8mWk372Bup72
 IwMUXn/rQtRAyIkbtYq48mYTzi/u3UUSAmnH2NF2yRgqAd9keKifnTmzuYBxUKUY3sCsOLHYMNg
 gUBolu2OsjgAEnOszyHhH7YDCuGsAVj2obansbLCZvWkNXv7o2ftDaQVGzvmP0nS5uRwyXfRUtw
 Wo3VwT9xWFbwZCPvvvB4wGCWOX++/Q2Mw/5hwxE5+I0/71aAtIj6e2sMQS9SvGYf6ibNqO46MAR
 crsWJWMJoFkCHukw/sZzsflXeOY75vgSSsb+uNG4VhJBSwtI1kdUy4eLV+oLJ6FBSggCRshm5P2
 Pu6Ia/elFfieKweKfqOEVHT+KHHfLSd66Q1wm3V5kK9GJfvM/Dlf1hUcjxyKwvgM9iuaWBo7mAo
 cAE4KEFBUGqZbPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX1h2Tgz1hfO9N
 lGDLikpa/x5+BVIqmAXO6YvIWtfWauvk4rNLP2ECAoYEBZ2XjGym7qqj3HfUKxxdNh3PdTYtkUD
 MN3NZ4GxRi+UxRxKM+rxs1cwqgTWh81kSIzjTiE/rNXpmTB7yacy3hwxnrUEnZB9BplODQCJo/g
 6nGv9un6eLADvfbHpldP+oy6lCVnLUyzWBJIdQNo39dPFha0itMz8INr0/Rg8he9jmw729tOAV8
 Gj/VCAGNM8lvBnwvEnuyfQzv/6Jb/16MZzcPxS1ArGNwXxIDczCp3H+HGGMkKchlnc13Di8fBDf
 u/QXuE5MM8DME61MBw4ccjvMBhaAZEADFsaQC9e0FU8+Se5r00XKKDALMjFQgZeTCn8KLTU/SYH
 OongauLOQ4yQW7aWoAk4cUn6zFGMiBOhJzRHXZ+1rmI6JgT4jcKVD8WDimTB7qgGHtsMi2efvGI
 lv17vps3yfzaUdv51YA==
X-Proofpoint-GUID: P4aXCh99zwl1iBgOD-Dlz8nqOwjOVpPU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX0eCAMEyg8L58
 FAB7sQeO3aFZEnf1YEiwbv/pfWSCCDO4k0MSQKCJcSE9GdV35iRn8BLKAOiogKItMZGhfv2t5Fv
 LRb2LogKNt+6Ij+NvjnzzFYiKa7ODEk=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe54f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZYxMm2tPHDp-qjSs8_8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: P4aXCh99zwl1iBgOD-Dlz8nqOwjOVpPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

Ahead of reusing the existing code in machine lookup test cases, rename
the swnode consumer variables and functions to a more generic "test
consumer".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 2dc000c6201d9983b16aec3f1368509756fe7800..eb64e1f17d1337b5f371a4c39cd9a40704bd38f3 100644
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
@@ -141,20 +141,20 @@ static const struct software_node gpio_test_provider_swnode = {
 	.name = "gpio-test-provider-primary",
 };
 
-struct gpio_swnode_consumer_pdata {
+struct gpio_test_consumer_pdata {
 	bool gpio_ok;
 	int errno;
 };
 
-static const struct gpio_swnode_consumer_pdata gpio_swnode_pdata_template = {
+static const struct gpio_test_consumer_pdata gpio_swnode_pdata_template = {
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
@@ -168,21 +168,21 @@ static int gpio_swnode_consumer_probe(struct platform_device *pdev)
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
@@ -190,7 +190,7 @@ static int gpio_swnode_register_drivers(struct kunit *test)
 
 static void gpio_swnode_lookup_by_primary(struct kunit *test)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
+	struct gpio_test_consumer_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *pdev;
@@ -210,7 +210,7 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 	properties[1] = (struct property_entry){ };
 
 	pdevinfo = (struct platform_device_info){
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 		.id = PLATFORM_DEVID_NONE,
 		.data = &gpio_swnode_pdata_template,
 		.size_data = sizeof(gpio_swnode_pdata_template),
@@ -228,7 +228,7 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 
 static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
+	struct gpio_test_consumer_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct fwnode_handle *primary;
@@ -259,7 +259,7 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	properties[1] = (struct property_entry){ };
 
 	pdevinfo = (struct platform_device_info){
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 		.id = PLATFORM_DEVID_NONE,
 		.data = &gpio_swnode_pdata_template,
 		.size_data = sizeof(gpio_swnode_pdata_template),
@@ -284,7 +284,7 @@ static struct kunit_case gpio_swnode_lookup_tests[] = {
 static struct kunit_suite gpio_swnode_lookup_test_suite = {
 	.name = "gpio-swnode-lookup",
 	.test_cases = gpio_swnode_lookup_tests,
-	.init = gpio_swnode_register_drivers,
+	.init = gpio_test_register_drivers,
 };
 
 static void gpio_swnode_unregister_swnode(void *data)
@@ -732,7 +732,7 @@ static const struct software_node *const gpio_hog_swnodes[] = {
 static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 			    int expected_direction)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
+	struct gpio_test_consumer_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *pdev;
@@ -772,7 +772,7 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	properties[1] = (struct property_entry){ };
 
 	pdevinfo = (struct platform_device_info){
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 		.id = PLATFORM_DEVID_NONE,
 		.data = &gpio_swnode_pdata_template,
 		.size_data = sizeof(gpio_swnode_pdata_template),
@@ -826,7 +826,7 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
 	.test_cases = gpio_swnode_hog_tests,
 	.suite_init = gpio_hog_suite_init,
 	.suite_exit = gpio_hog_suite_exit,
-	.init = gpio_swnode_register_drivers,
+	.init = gpio_test_register_drivers,
 };
 
 kunit_test_suites(

-- 
2.47.3

