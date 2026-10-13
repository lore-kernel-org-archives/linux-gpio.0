Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B30501F2F
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896600; cv=none; b=JJXuw4RijOgLqxHFbvlh1dhXOR/IvZGeMBd66KMWxR/+tKLTq17XtRwThJLg/LNATYsxdtOzr5xVmCfU1IcrsQqyGMwGE2INRwNbsySkuk1MVwpnEo2NFQISe/AOvGiGzqX698oNECU0tDI/IgE5+9aBZuJv/iC8GzKx4Zy7A24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896600; c=relaxed/simple;
	bh=UVkNK/zxDQjE6j7JSjCbFOz9XUxp7R0Ya/CjNimBc0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jto/2uBSeH/xOIsuDSCS51i/XdYQPfO7jjzW5OkJISG2kFUW+2K2sy6MlIIZ5PfxuNqd8+lamozYgj+Z+VJEEq3dX13B9On7wopyr7T36JjV8tDDQ+5cgkxv6nZ7OSON07gi+xX4dvVmC1zQ85MofyTRCkL8fb3MSBmmCDNBeqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTvRudQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WO/w7wYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTvRudQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WO/w7wYF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D902jN791439
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gpLVL06T2YTDxPC4mdvxK87Ifsdtuv3HVr5hoiqdTY=; b=cTvRudQVA/7zBf+x
	JcKZOFZ5NhvK+4CXBa/R8FLCeKdBQJehi+TJBZbL75T+xF6XBYfXGsnvjKlryIoX
	mj9bCBhzjHGOVmJ3IETCFXUi876ikY6UoQDDZDzyMbnmC8ceMLreLOJbuT7XQoiU
	OndES7i9+IaC1xsCNG+CfhZ060+NUtQTfD/z1rc6VB/CrMxngGvehVTHe88kNXql
	BykX5vcEWwXsrb5Pp9Xd4krPLKt2e3oNz7AUJ/A3xvDzqtdx+sJI6UUEU9RlJVch
	nou9K8FRViLOd5w/gu985D9fN52XrXfjYRSpKai+WDbr/CyB4WYF960c0FjlCSu3
	Twjatg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjryat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e5a0ad2e81so3708327e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896597; x=1792501397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gpLVL06T2YTDxPC4mdvxK87Ifsdtuv3HVr5hoiqdTY=;
        b=WO/w7wYFmp4WW6zsZqKk/THcLAubCDeuxht/KOmullGWwtD0j9Wa4DRIMT5oIZRpWN
         Th9Y40NVcIV/o5t8BEwDLvRVVNjZ+yS+aJ5bO+pK2U007xzSC48pXI3NmrrfjReuOXnj
         CdVN/4SGvcAVxLgRUascRai7pr4Dww3V1frKd6qTQDzEmJ/PmmaxXScgPv4N9Xfm9093
         Cd47pIg+oekZdmrAB7gqIqEcgac84JPgVvt1iwT6ZjSS6MavaRpHHZMhqof6QMneAkQY
         44GqA0/9p0Q+nwGg0dhgcpNKv57FuTevuBg8BuydNQXh0KkKa5zwOXIPZe3ECbXYwTpb
         28oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896597; x=1792501397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gpLVL06T2YTDxPC4mdvxK87Ifsdtuv3HVr5hoiqdTY=;
        b=RfqZhHsNEkvX0jeO4jTqbX3yND2FeVpI2Ne4csKT1nQJCkK4SflMIdqhzmiFSRBF4h
         cu3joxxFqwQZgSsuFp/SXoVUTfXlXXQ/hZeh5Wow4BrI4iJ+UyuLtKNwwLBE0/3zQE8k
         QXNjU4it4f5bhwlgClL/7ai/pWCnPmWoX0pGv46ou0VfARsSzhbJBm+gt6ahOMPa7RcS
         PRKbEb7ItP0eWo7CjVkY5MXjWiSW5rLZv4pxrBvgmpucTJt3lj4Xk8DLCxW21q6ircnL
         MHETwQBm3ntka3IKV+1ay1EGRDG43FV7KPRGe35FQyBM7tqB8h5nil/bPvL16lCHBTfC
         icHg==
X-Gm-Message-State: AFq9FYI4jvPeFbuXuBeW6qIFOkyfMfaLfwBF+F4bkrn84cwg7+Fem78+
	mSYfqsqBlwHHCFgBRVTRZ+tEbTv0zTxPCcwQKshAUFKRN5yvWbsjga0s6kNiqq2iyEwBDK8duIL
	wenCXcKUZqKco249O0bgudkKCXhLiHiR4rop6SySI4qZ0mtc8yd4Cswz9E5jZy1Ki
X-Gm-Gg: AYBFou1BjUitU/9jL3XmI4NaZ4jPX6sFWI2OpMX6FCyWqpWEmwbWrvKo3jU56YTEPvw
	ZtG006Xlgu/ksHq4tHIE53QMJRtip4yZRWEFGF7QK4TmI3Cidrj1haAwQkhcMvXX5ROKrCm/hix
	ktTBL/PtKyiz9hatsy1MQrIFgZTpVTlgGZ+HK93cwT5JJA/pistePZDtQUulSYhZNbwnN6RV10Y
	KIgfdGUC2tQLOyN1vkWs05a6Sr1s4La7GxOf8wxet6dcbU8SOB5VKvVtEWi5KHYUyR0Z0tdGDx+
	LqjIcW1n8KyKBS2jc+Tx4MEQOG196+PSqcpWwjbdvdHwhovnhhZhWklHrj0NO11UeRDxS/7g0Qn
	WkmsH/tShYFYF4XRFManJC8en5eMN
X-Received: by 2002:a05:6122:3128:b0:5e3:315:b62e with SMTP id 71dfb90a1353d-5e91f492667mr4026730e0c.15.1791896596906;
        Tue, 13 Oct 2026 06:03:16 -0700 (PDT)
X-Received: by 2002:a05:6122:3128:b0:5e3:315:b62e with SMTP id 71dfb90a1353d-5e91f492667mr4026685e0c.15.1791896596025;
        Tue, 13 Oct 2026 06:03:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm401795085e9.0.2026.10.13.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:03:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:03:01 +0200
Subject: [PATCH v3 2/4] gpio: kunit: factor out common code for waiting for
 device probe
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-kunit-plat-lookup-v3-2-3907f913e964@oss.qualcomm.com>
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7417;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UVkNK/zxDQjE6j7JSjCbFOz9XUxp7R0Ya/CjNimBc0s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqziwM8iJM39kOP58sQNwCC5Oxh45+/0HREP0vz
 h9pT1rqY2yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4sDAAKCRAFnS7L/zaE
 w5OJD/9YsAxzIjK1Gk6/d+fjC6cP1uSve5Mu6o6895VAks2RPkAD134DiXufxfNG/87VqDeSKtO
 XyCLQToiVa8jnScyv0+fR3oj3jHZHG7twC08ePkI5jtOxL0CWN8cMxu6qkS6kmLaEL5+H1+psGH
 Xv5mXIHU8ASnuCX/L7tiIeQm2kVExM5hpMqPZ/LwYYMEXApp4DONXRbejQriTFNY1j2TPy4edee
 V40JVPbqpKfxkGoaimKkdBFQHzzdW7FoaCqPyAOWDF0QULuweEZuATxR5wM4AgEALlKSHw8Dch3
 iDBc3ADJBj6P1Z9vH8mpid9McJj1JtOHYbq0UBKEt8DuSsle3+y4Ai+V0T6qbwxoQVDmfHcssK6
 KCblYb3n7v6z5Uyis+uVuy5sXTfow9ev1Trd3I+4oSf/n215pT6DpS0392oOSapgVtkcCx3XrYn
 KpLDI8dh6BAUPaNfb70xSX1tNzLV3pQkToGIXXQXYGGSfdQPzVl7ST7Uiwl8C9Zxex7oXz0SpyR
 LnRltSAjC3FbeVHlvALqBHPQbJ3sl1l2AgE3cPscj08o7xraLazUcU42pKRLa1aKYKbcLpz/CRa
 swkxvZjpNYvAetImo5ixb+n8qv6jtLT9aF0HBqtgw3ZgkzQQwE4V/nltREn0YCGohL4DqUMC5S0
 zzaE1VfTCJTjXAQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX2NoU0pPnyyNq
 Y1OlNM5hBqprhusOUdpTTmbGHQiDgk28JRC+20uCxMQBowFAw1SKOdHoIZNdNQ8thM/e9nHXTeR
 FGreW+EjHw5AoBh9T6JfOHjEP4SbL48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX8FkDE3gcH61+
 FAQ9wU2uVYAI9Wh/yZrPBsBjGKZmeAorvJ5H+Jz9sX+s/d7oUSUx7zpO5iIlZO9Ae4f96ce0aZE
 dBtO7+uAUOcsOptkb6qXVSbeZ1s6crLTVBecrtmY/+qtE+yMlFrKeDinl3+cJI0AntFWJfYbdOO
 qDvNFPX1xQ1RM9YGfa79bmRpKGss0ElSQ7U3SpCK2EAFrjfY2GFxDp8fZCtOjkfw8PThWHgjw3T
 SONURYIRWF1fzZR1qdCgoH5ZwMXjIxwPYXzmyHcz2OYNw4Rkgo2Gq3SsKMF3/tL/mRgK8J6eNJY
 C4gsS9fe4zCcO5PaRdBLLyu2XRny5NQO1Yfj2EPwe6JYxHOnTPoeIfT+8qY41svM1KZ86BWSB6r
 Yk+s2vB9u7YxLTkHX50NwkDc9TjkwFL+7SPJhYxHvihczYXAUwTAKgZNy8tW5kzIgmW7po6RGYJ
 EGV6ovy+nY9ED/KvYvQ==
X-Proofpoint-ORIG-GUID: 4Xey3ZSR4_0UT-6PGbgCsK9gG3Zi724P
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace2c15 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MJvs68b5CPX-SHL3dikA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 4Xey3ZSR4_0UT-6PGbgCsK9gG3Zi724P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130051

We repeat the same sequence of function calls when waiting synchronously
for a device to probe. Put them into a dedicated helper function and
shrink the test-case code in the process.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 80 ++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 54 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 66095c7a3d4277c6cf6c5a39ba292b67ecc990e3..f5f1e3627bf0084dc87f4a4dad8ac7e003c3945c 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
@@ -27,6 +28,21 @@
 
 #define GPIO_TEST_PROVIDER_NGPIO	4
 
+static void gpio_test_device_check_bound(struct kunit *test,
+					 struct device *dev, bool expected)
+{
+	bool bound = false;
+
+	wait_for_device_probe();
+	scoped_guard(device, dev)
+		bound = device_is_bound(dev);
+
+	if (expected)
+		KUNIT_ASSERT_TRUE(test, bound);
+	else
+		KUNIT_ASSERT_FALSE(test, bound);
+}
+
 /*
  * The test provider tracks per-line direction and value so that lines can be
  * driven as both inputs and outputs - this is needed to exercise input as well
@@ -177,7 +193,6 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *pdev;
-	bool bound = false;
 
 	pdevinfo = (struct platform_device_info){
 		.name = GPIO_TEST_PROVIDER,
@@ -204,11 +219,7 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 	pdev = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
-	wait_for_device_probe();
-	scoped_guard(device, &pdev->dev)
-		bound = device_is_bound(&pdev->dev);
-
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &pdev->dev, true);
 
 	pdata = dev_get_platdata(&pdev->dev);
 	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
@@ -221,7 +232,6 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	struct property_entry properties[2];
 	struct fwnode_handle *primary;
 	struct platform_device *pdev;
-	bool bound = false;
 
 	/*
 	 * Can't live on the stack as it will still get referenced in cleanup
@@ -258,11 +268,7 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	pdev = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
-	wait_for_device_probe();
-	scoped_guard(device, &pdev->dev)
-		bound = device_is_bound(&pdev->dev);
-
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &pdev->dev, true);
 
 	pdata = dev_get_platdata(&pdev->dev);
 	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
@@ -332,7 +338,6 @@ static void gpio_swnode_probe_order(struct kunit *test)
 	struct gpio_probe_order_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct platform_device *prvd, *cons;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -363,11 +368,7 @@ static void gpio_swnode_probe_order(struct kunit *test)
 	cons = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
 
-	wait_for_device_probe();
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-
-	KUNIT_ASSERT_FALSE(test, bound);
+	gpio_test_device_check_bound(test, &cons->dev, false);
 
 	pdata = dev_get_platdata(&cons->dev);
 	KUNIT_ASSERT_EQ(test, pdata->probe_count, 0);
@@ -382,15 +383,8 @@ static void gpio_swnode_probe_order(struct kunit *test)
 	prvd = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
 
-	wait_for_device_probe();
-
-	scoped_guard(device, &prvd->dev)
-		bound = device_is_bound(&prvd->dev);
-	KUNIT_ASSERT_TRUE(test, bound);
-
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &prvd->dev, true);
+	gpio_test_device_check_bound(test, &cons->dev, true);
 
 	pdata = dev_get_platdata(&cons->dev);
 	KUNIT_ASSERT_EQ(test, pdata->probe_count, 1);
@@ -452,7 +446,6 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
 	struct platform_device_info pdevinfo;
 	struct platform_device *prvd, *cons;
 	struct fwnode_handle *fwnode;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -476,11 +469,7 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
 	cons = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
 
-	wait_for_device_probe();
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-
-	KUNIT_ASSERT_FALSE(test, bound);
+	gpio_test_device_check_bound(test, &cons->dev, false);
 
 	pdata = dev_get_platdata(&cons->dev);
 	KUNIT_ASSERT_GT(test, pdata->probe_count, 0);
@@ -498,15 +487,8 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
 	prvd = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
 
-	wait_for_device_probe();
-
-	scoped_guard(device, &prvd->dev)
-		bound = device_is_bound(&prvd->dev);
-	KUNIT_ASSERT_TRUE(test, bound);
-
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &cons->dev, true);
+	gpio_test_device_check_bound(test, &prvd->dev, true);
 
 	pdata = dev_get_platdata(&cons->dev);
 	KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
@@ -603,7 +585,6 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *prvd, *cons;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -644,11 +625,7 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 	ret = kunit_platform_device_add(test, cons);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	wait_for_device_probe();
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &cons->dev, true);
 
 	kunit_platform_device_unregister(test, prvd);
 
@@ -760,7 +737,6 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	struct platform_device *pdev;
 	struct fwnode_handle *fwnode;
 	struct gpio_desc *desc;
-	bool bound = true;
 	int ret;
 
 	fwnode = software_node_fwnode(&gpio_test_provider_swnode);
@@ -805,11 +781,7 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	pdev = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
-	wait_for_device_probe();
-	scoped_guard(device, &pdev->dev)
-		bound = device_is_bound(&pdev->dev);
-
-	KUNIT_ASSERT_FALSE(test, bound);
+	gpio_test_device_check_bound(test, &pdev->dev, false);
 
 	pdata = dev_get_platdata(&pdev->dev);
 	KUNIT_ASSERT_FALSE(test, pdata->gpio_ok);

-- 
2.47.3

