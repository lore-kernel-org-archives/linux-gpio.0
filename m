Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D15490BEA
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815962; cv=none; b=RZwt/e8ZuMsedgU0z/Y+ycwkYqWZWhKw3ZvIJqLZdTDxst0oIbXlpztiWu+fPm425L9vvSM9ce00707ugCMwviSc0y8xicgDY7BNdLCXQ1Rm3X9SIpOyT6Iga4PTQpzd1PSeAvgI3ETaDTGKt4Lmx9qUcmxhqZhIxyZKE9LyjOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815962; c=relaxed/simple;
	bh=D/BVKXe5Wb0E1ZjR1WthUttwdLCxdENSzb1RMi/OxYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuOBt2QV3phhkhZJ8iZUPeBSGW31iVKYh2pMAK5urAZQdB8nXJpW8qHZ3pqxOo9YdyOSKPPsDWbyNB59XnLpxFXAjiZxrQYt5ZgOB1Ko8FczDmU7CUWsPXilMxgLuUcOxdiDX6YUTMbHXU7uxpHLbA876On14nB4c9ipqKVzKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nMXDJu2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXljfvgG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMXDJu2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXljfvgG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0P502088498
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZtaKHzGZpXDbcsphDKquq7/u7rQ9pTLQpCkCGoLE0w=; b=nMXDJu2+yvhYATqY
	GfmBvdMCoTSP7TiF1PEvpUw460Of9IZuKxXyNiLfbHmaZ7fcelKXIESBOgGA8PTo
	uPwBERKCKI6DQH4kzrTwBBor6+bkc5qX0TlGum6VKAPWQ4l1x3OAW3xoLSbgZdv/
	uvGYJXleS38PBBKVt9cf005bthVTtA6EJxD7cRqhTgWs3QtDnjdpwvlb31M9Bceg
	Jg89bf8ihI1yWLpJBft+ktQ6P/NcqKOdHOFcXDdp04J7OccvrTahcljieBGBLY0h
	vCs330dKliGS3LvOV22z7jn1b/RdZsxv7fuu+m13v9OuywHAbAkbZ3Eu1CO4KOCg
	j2F7nA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2d70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso30111646d6.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815959; x=1792420759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZtaKHzGZpXDbcsphDKquq7/u7rQ9pTLQpCkCGoLE0w=;
        b=jXljfvgGZJQHRmsQQewKCiAsda30/KBlA6GHedPKpxk4p0jEZI2of2CE8PxtjsD7gW
         CFHhifJY1QWL+9uKX0COvgT4UA5rXeCNttn1A28RWHWsirUrl0T1fC4p9tcxGPcw+65K
         93j4sKKGbM79KyJIKilCrq7MUa0mHuyDIxA6CW/onBzMZSzSGChcUjb5Zx/MJf9z3lP0
         SuOTus+iCZjcpfF4nD6Yt6w/E9arHAllGgpxGtNru1pQsjRz+7pBjrZ8Vt6icePiWF4q
         0DgykAB58YMhLiRvwYESxGDSFGsRHV4RXtutVLgDpGmdcSmAqqAguTjqoHIhI3KtF7vC
         hwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815959; x=1792420759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZtaKHzGZpXDbcsphDKquq7/u7rQ9pTLQpCkCGoLE0w=;
        b=d3IGdlx91KGh3lW8HYWtu4sE/tF4BRL8wvzwwwvMmNNEXrBLv2Yd2JuLYuzI+lhS8I
         lRiNPcNsgl1yeUmI5cIexulKMJ0Ufrj6Fiy5y0Vdw8RKOPNtXtMy4xZDBqrsdUDUwykC
         zcLNjqpznUk8fvyHPYdRwcob6SNm/g3/Axd8MsfOVUUrjDEx+h2FrqUvlpiOqvfwFbrp
         k4iGvulqOH3ZYHrD+yLU8+BUXZUHDzx5FUjsOXOSa5pqk75ZFjARhewpVYibNKD2Wp/8
         P6ooK1Lb6e3rdI6MzOu0sfZQSWFXJfoiqHlDbfBmIPMh3yITKAaKrWMw8wY1E6Q6mw50
         CXoA==
X-Gm-Message-State: AFq9FYL1eJQEtMEXo1uYEW0HHPMAkKl1r0UcbVLLwEeSg3orMMffTvJc
	HaK9JlZJuXNPx87/lVwZEraE3RTmA5rBJcSxgHpfblpxd17r33Ng3PdLk1h8kCe64XY7hNxjeHR
	BwKV0puw6+x6SRGHT/jTK4bih1xeHbiK+cBGc2UE+OdctiOFCSUMSjCAb4AtD2WRf
X-Gm-Gg: AYBFou082BnlqdEgsMsV9VwO1UqnimS520zFEm6pIdf26mQjdM9tId9nrchq97EJEZH
	E+Zdgy6WsCDNnJjzHe0NuxZKAS/cxExBejCxeNiuk5SSserNcDYj6iioVS2Wj0QGHn5nCJu+Z39
	/LvSTuBStq+qrEqvdPrP9V1XMaWQtrjk5hpF07Vlg0wpANHyUCJ5neOnQ7NGyAaK2DMNXtAngbG
	3/MCWS5lz85TICsSCM+53haxLRTjL9s3bus0vcJIkBzERSmdWFT2oaDN/T2J51H4a7HWILsa3aE
	1lSOfTgAtnzsOxk7kPM05DnJ/BEFTevOntLceBB+rBuKUCRjQk1ON+v0iyOfkytUMNHXmAGH0bt
	Rc3SCTlKlvWe5JAQFeoRwetwX2afF
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr1581101485a.42.1791815958768;
        Mon, 12 Oct 2026 07:39:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr1581095785a.42.1791815958237;
        Mon, 12 Oct 2026 07:39:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm340396725e9.12.2026.10.12.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:39:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:39:00 +0200
Subject: [PATCH v2 4/4] gpio: kunit: add a test case for platform lookup
 tables
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-gpio-kunit-plat-lookup-v2-4-553b0d6446b9@oss.qualcomm.com>
References: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
In-Reply-To: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3918;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D/BVKXe5Wb0E1ZjR1WthUttwdLCxdENSzb1RMi/OxYw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzPEMU0uNVpSaH7Z7vqEKvTwlD8+Qo6mKbHGq+
 97iFMczBp6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaszxDAAKCRAFnS7L/zaE
 wzW9EACkL3HWu7niVhagayjLzs76WhVfuQaUJh0hx5WGmU/CaLAyx+gJ3A7kLOb7toI+f8wmKv/
 t9SgGtySTHMmgfmKe2IoOidT5DULu+a11q0FxHQWYqdtmyBRCBmKYwqD+EJWb8GuhpSF1ots5Nd
 RXJGU1I+9d/xqqsq2uhYXRHkw628b4K+U+621IVaYRtgDWFDDpHHJR7B1yFCuKDthOZK8QvhWBd
 63ZXNh9LOeIZpEt2ArIyodxCkDTLbz59a3w70bxFCygmf/lpv7KpXlTZpf6ikjbFsLer+YhWcV2
 ycvHdTD/BVjwWGgz0zOuawrrguuHgafXHaR13cSH1nj0xp32+AjMsVypu0K9UeIYkXV12VaBxcr
 nz/9lXM8YRH40KuaJmiCTQubUsSq6WZ8s0MfiHpCzCaE7zr2+kGqu5FiqnQWcoFhMvcXvZCTXvy
 7TogBggag6DnI0QpLz2XM8BdoqOmdYKAHAnfaVJB+xSXiP7z77bqTH+pub+u6B2Zvx9uE2L0ZSy
 tuIwEzZQ1gehU29TTBRuTceumhJhnaA7tnM53VoWKVQGhauDjHMvXpjC+R76DBuhWSQ2U5Vpmkz
 tNOzxjEQqd277YinWxuCAVfsggwqjVtR2V58kgopRsGYnuWTb2D7XzHIN+marmjrRXTe/mpUYAz
 m11NncGFjXE8A9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accf117 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6Kgsdax8oSNbX6mdXg4A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfXy3/ARch26sf2
 eITtca4Pyr8gX71PJOWAqj+/kF6B7y9rntRu7L53MHdTXnHnjy5lN09ukNXAOSe1nflr8v/L+Ag
 JlmQMec39Dy9uRtCamV6hHrY3mcbS5DlbcNTgUqVqZKpDljzEbdCK41etbpLjnBN53urf7xX0u5
 vN9kN7oGxYpgSw/Ewp0/VTeYTT+W7xQPTk6wWo85N8JqNJe0LS8g5ohEtyL5H5XjiotRBCdqJwp
 ywy4FRoM4TiR8hamcO7vjnWpJVe4Dz9yGmWVSkkJ4BDYMWy5xnTnhcwREzCpr9AHd/hwYdC7Kdv
 F9DQIaoXGZOoM4Ywfd0911eq5BpH2qhoeCvXIJnuWI8vvhj6YZlFeNyuvV9aisEobQypnnHB7su
 QF3+ntygqjI0YizHfoK02F9Yhtl2R/G/pw59T73ZAdSF3MTTpASq8wHTzza5x+YQnGPAdHMupPz
 ONnVZ7PVpLUUOaPOpsA==
X-Proofpoint-ORIG-GUID: N1UIfoDxi6l-Wb9sXeDxgnhe8jNfaZ-_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX6IeXaZ1Lbfa7
 XxDcfYUHpdOkH3169aLGs+a6EY9tBnp/mor9WUzP/QYk5ja1yFvTbuPufXeRKJg0+Ln+392qXfH
 Z7eONOdDjICXfX95gL2pnP28Yaaxd54=
X-Proofpoint-GUID: N1UIfoDxi6l-Wb9sXeDxgnhe8jNfaZ-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120058

Add a kunit test-case for retrieving GPIOs using platform lookup tables.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 100 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index b662be88a08711380f938852d84809f36a8d62d0..5d04b134d57746a78439fc54c6c78c1acde10a1d 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -18,6 +18,7 @@
 
 #include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
+#include <kunit/resource.h>
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
@@ -828,11 +829,110 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
 	.init = gpio_test_register_drivers,
 };
 
+KUNIT_DEFINE_ACTION_WRAPPER(gpiod_remove_lookup_table_wrapper,
+			    gpiod_remove_lookup_table,
+			    struct gpiod_lookup_table *);
+
+static int kunit_gpiod_add_lookup_table(struct kunit *test,
+					struct gpiod_lookup_table *table)
+{
+	gpiod_add_lookup_table(table);
+
+	return kunit_add_action_or_reset(test, gpiod_remove_lookup_table_wrapper, table);
+}
+
+static struct gpiod_lookup_table gpio_test_lookup_table_by_device = {
+	.dev_id = GPIO_BASE_TEST_CONSUMER,
+	.table = {
+		GPIO_LOOKUP(GPIO_TEST_PROVIDER, 0, "foo", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static void gpio_lookup_table_by_device(struct kunit *test)
+{
+	struct gpio_test_consumer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	int ret;
+
+	ret = kunit_gpiod_add_lookup_table(test, &gpio_test_lookup_table_by_device);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_BASE_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_test_pdata_template,
+		.size_data = sizeof(gpio_test_pdata_template),
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	gpio_test_device_check_bound(test, &pdev->dev, true);
+
+	pdata = dev_get_platdata(&pdev->dev);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+static struct gpiod_lookup_table gpio_test_lookup_table_global = {
+	.dev_id = NULL,
+	.table = {
+		GPIO_LOOKUP(GPIO_TEST_PROVIDER, 0, "foo", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static void gpio_lookup_table_global(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct gpio_desc *desc;
+	int ret;
+
+	ret = kunit_gpiod_add_lookup_table(test, &gpio_test_lookup_table_global);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	desc = gpiod_get_index(NULL, "foo", 0, GPIOD_OUT_HIGH);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
+
+	gpiod_put(desc);
+}
+
+static struct kunit_case gpio_lookup_table_tests[] = {
+	KUNIT_CASE(gpio_lookup_table_by_device),
+	KUNIT_CASE(gpio_lookup_table_global),
+	{ }
+};
+
+static struct kunit_suite gpio_lookup_tables_suite = {
+	.name = "gpio-lookup-tables",
+	.test_cases = gpio_lookup_table_tests,
+	.init = gpio_test_register_drivers,
+};
+
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
 	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 	&gpio_swnode_hog_test_suite,
+	&gpio_lookup_tables_suite,
 );
 
 MODULE_DESCRIPTION("Test module for the GPIO subsystem");

-- 
2.47.3

