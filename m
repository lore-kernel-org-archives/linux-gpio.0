Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE38E4908B3
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815959; cv=none; b=IovBal40L6+qP5H2HduErfP04p8aKGsH6y/YadZpQhd1moU8THfilbqd0jh2oc15DSsohbzDD8GcVAZ9o0tKMluGn0bGP8iBPqfJygS/XLDbc2/gqFSJzNA9TkZEGie9Vcgh9b3fbGKFRXUO6kHadi9IuykM+X/ra29pMru6qP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815959; c=relaxed/simple;
	bh=UVkNK/zxDQjE6j7JSjCbFOz9XUxp7R0Ya/CjNimBc0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XY8qG5drLUmWX16B2B/HZtHUN6sX5+xnbGLXq97pfMrcl6gZxGKLNmJGJcPitAqRHn8js2sTuVxxapqvjKgMLmBMtWQtGtKYRFuk+DnjMQV1K4d9HAa/WVLrva2RJatdudBmBptFECLplDLrw1tH4OzCdI33BIGfuNyH6RZ5rBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nal9sNcr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6Fi958w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nal9sNcr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6Fi958w"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0P4x2088498
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gpLVL06T2YTDxPC4mdvxK87Ifsdtuv3HVr5hoiqdTY=; b=Nal9sNcrF/9vVVQp
	Wl425pNza2m1V0HT2AtQkIMT9su0kbAaLpMkFkucMcVZecJ7qn2M/Vevp/h9nVHA
	CFz79xEw7QHzLe7OvUtqcQbPaWnE1yequqVwkOoYdfmYUBSCCErXPta7cVV8MioD
	yyD33pof9+RAJtpGL5qm9aGki2Kalo2Ja97oTCQ0Jpg0GM3Ob4G7zFDFPxBiiUiT
	PuYmqHMDmQYoLqWwtL/I+CAYViiURfRGibPKNOAiT02P1ciniKEiSDaTafCyeneG
	y60qDmYO4llCHvhyyx5ZmpNXCSAUuXDGpz6WVf0xO742X+ZPDhZ0T//HvgygJhUD
	5XPG5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2d6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:39:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so179084185a.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815956; x=1792420756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gpLVL06T2YTDxPC4mdvxK87Ifsdtuv3HVr5hoiqdTY=;
        b=F6Fi958wPgjzNJUDmd/camTHGR9DZdrzHNttw50XtZyXamNegoybEe66YzrZQFLLCX
         KQ6ghFO54fQ3ZwEi2C10JVkKAMkDur0My6MoTMlwIdkR0HpuFAS6QrS6DRyFQpGKNcRp
         Svpg1k5spzA1av7+CAd0kRrZwNjKRPGX0QAagIa+cU7dUj2fzKWtlS5XII1spd0gPGa2
         oZrCF6hR/sEPXFpBjQhCWNZWf4fsvvDzKHGJy4hYt9OFu2odjE6DF2pYink/SE6kt74G
         e1SpEcJr2dK84uA5xktKq75+/1VIfi2JrtvPnHk6FD5kRV3NWbClHERKkGevzKlVqdOD
         kmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815956; x=1792420756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gpLVL06T2YTDxPC4mdvxK87Ifsdtuv3HVr5hoiqdTY=;
        b=UAfdmTRV9dZ9OU218H66xjrZ9cGkKR6KnBS2a+6fDokNppyDtxJgSgzRTKEogoy1eB
         R0O7O/3VQ6gWnMdObYEV2g/6ITI1Zi7uFEOmXeYP2BMngyHJN83yHAr+d8dc+PlG613I
         CU+uohdq4MdR6F6LbgD5L3t0dv3GyOuMnnTGWVX1KDyuqai4+dHjsgu1/Iae0u6ZJeIM
         lQNshZ0wrT3wCgOhpMLiSCZKTuOxn7GGUejFulFQY6+lkEJ6VL2VyqO1agtGXppnb1Gp
         8IJ9C0jT/NGFHRhgdDJj6jkwPahw8v9dh28/1NIbP9gVc1kADyWH4qGLFXpxk59hVL+u
         5cIA==
X-Gm-Message-State: AFq9FYK0T/FwyQuXBr1VRaLnV77aNWxBMAtJ92n0tbMD/+f27rjOqTqk
	kcHwUmo38GWt8UcYVdGouXpjC0THiMzFSanE4cttZF2f5gjU60D9RvXlqyDiXNH+Mh6JaQdwW+k
	+YhTbzUrq5lPhbH/APotq6plTDU0gLmMAq9Cz6VvVcTOrBAXDEzA5isZMyxfnE6mU
X-Gm-Gg: AYBFou28x5TLez3eFM411jrl4p9CqSB9W9JZ9GrzOEtzKLW6SOZnTj7OwHK3jAmQ4Gi
	VioBEtFootPTTnKeYv4F/P7X5ciqFt4kjyrExuCE4UmeRnoSRX2NJGvCQ31MRbBAS3nj9c/ukWe
	DBknYTCeKdD62G5Ns9r+hnVHj7vp3i2rCyWIwuYivP8Msp77Q+mucsGTCYiSNfVxVMxp6LZAJxu
	8tyDEZrY0+1+jIRJ/B3PXUUgYs3VQCDsYvec7lz5a+5CfTDg2e6vh2j9RgWsyxWsaHw/gWwQreO
	gsgAn2jl+wRdFfa+U9lRtImrT5y/7kQbYgxezLaCV/GREowIibGzQprk0f3fQORWPZOVsVcAyDE
	3Wy7AUf53/1BziFqkJKmrolZ6+oNs
X-Received: by 2002:a05:620a:1727:b0:93b:bce3:5499 with SMTP id af79cd13be357-93ebd0bcd98mr1586724585a.6.1791815955735;
        Mon, 12 Oct 2026 07:39:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:93b:bce3:5499 with SMTP id af79cd13be357-93ebd0bcd98mr1586720685a.6.1791815955173;
        Mon, 12 Oct 2026 07:39:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm340396725e9.12.2026.10.12.07.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:39:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:38:58 +0200
Subject: [PATCH v2 2/4] gpio: kunit: factor out common code for waiting for
 device probe
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-gpio-kunit-plat-lookup-v2-2-553b0d6446b9@oss.qualcomm.com>
References: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
In-Reply-To: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7417;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UVkNK/zxDQjE6j7JSjCbFOz9XUxp7R0Ya/CjNimBc0s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzPEKYL+wyM1o6yk0+5FbEd55bB4qwfzsKEVgo
 kx7h1i80eKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaszxCgAKCRAFnS7L/zaE
 w8ETD/4nMGJZrfsfgXp6WN5u1jF/CFaVreD3xx5rOtXZLbPNjiLPe2enwRUmlTSocbGKVY06try
 7UvBeAHZQNg8EyTDFO85g6ZgAw/26cIcO9csB1XSmV1nj69gGkM9SqPOMv3gpyGVf00Ks/Dmn/4
 pIW4aZzLdpJqUX7hiiEjIq5HDckOPpj0pzIj2TaFsZFX72ZoVtdi48WYsW8PkKEta5f0cV1CWIm
 pYvDd/B5AcRXvhdXF+oe1KcVBjlXEexzEDZzPyEJ/Hl07AxHBUpZA9J/Swa2GZkVjBK+JoOc3B/
 MNH3p5RdSGI8Ox9fEj5yReYSWCE2QsVBLxIq/fYwdiak4fMqz4FnOu71vb6D2uGD1x0Lj6bxOMe
 6ThBtyYcjt1U0QLpKnymPNvUe/8jSs7kOh/aR7B0at3ZQt4Vnkxa7CAeHMSrKDrjSuTUd8e7Y5v
 csXatO3xlzVB9dGgr22x99EH3AzEC9FBh3Bypc6hIyE5xRcp+5BojxxSqMB+uPpyMmJVfD2sh1f
 rDiQpt/atOGzYP3wSgE01VF4WbmWoUsmp2hG0KlHGNRDYDcJ5JHFnFMp0mRiTTRra96Y2u9UuV7
 L3AlXYE6oPuymKBNqC3OVNVfdOvpPTQUxwW1mTh7YsqdcyIKPO3iHWJBjsqWm7AWO6JDuWSRB2Z
 KvUljvxMo9lnUpQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accf114 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MJvs68b5CPX-SHL3dikA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX7n8ht5Q7SsCd
 keg0SqFuHE/SnXWuILPABJJJQZ8R41S8Pi3QOF68IaA8Ra52aJsruyeXU3vgi5Tlhl3sWaE2owL
 Dd6Pp3XYNgFO+pQOUUo/AKkk0QY2K5XMKQuR5SBkmUOYWt6TfGqMNlzG5vDLyteYjS4r9R+cZ1Z
 /v9n6ekgTVNtRenJQ5TFxJl7CYafQP5i+3e0SybbQrvLtDwekFz6Xy6Jg9NO0zbTzNcG02Etj5v
 GeSutRev6NjTKDbwwLgAR4xaGg3YMuxzI54gDhooeQypBNdYKztvFrQ3Vdi5QWYW/qlS5XJhVAr
 G+6wfd+ondagF3hzWCrKKe0EGVtY0j1XCL/idtQArfOg4amid2uA3PZ++X1f+oyoW+AgjvhnfY/
 Ljncf0eYGcZ7GvdqP2yBhdnZcWVIvZYmfjmzyTs1xMuB0c0WZ4nVKRIrrV1Y0L1QbFUPdm4xLwi
 i3jZIdtaCxWAcbD/a5A==
X-Proofpoint-ORIG-GUID: pdtSwtnl_KJgBlzXpM52tO7te1R8eiq4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX027dVBBiLRnm
 Zcd1eshUmif4lale6jM7/ODiB1FS8v3HPtLXcJZR2emCJVR4JHcTbj202rgSeYazviNmZaPc5AT
 1fHuIENCe2QwkdZsqCDMywufRpFVCjM=
X-Proofpoint-GUID: pdtSwtnl_KJgBlzXpM52tO7te1R8eiq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120058

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

