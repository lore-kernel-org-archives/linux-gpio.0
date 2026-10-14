Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBEE485CD8
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967457; cv=none; b=dJgcflRnszpFyPbCBXKIiuC2g3Qzb16Ht3hoc3s6Qq1RfgvmAsOrYELj0lUIvxyVtfhM5hQIoHqm8c5PKl7xmtjJaFm/YOEjqIb9ES68tZaJo4ag2c4HhtYa4QP5FJNazJdWb47tQNveQw33Ge6VD6oGBsNPRVC+JgI/2XXriRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967457; c=relaxed/simple;
	bh=qmzjgNuXswFfzVsQlGsX535LOsJ4miX4hfwuT3AarCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LHQ52M+q1PeQRY9blNlENd41kp2VNYphcOUF5b/I4FIqZ0Bp1y8NEHwV1rv5MAng+5abksp8Fwff9L9psKKHDNbYVVasWypqsfNNDWgLswOyaJ3tgWrI7wIWdwS8sSfNtm2ypxxlpVunrYXRT0eFc9NSrDiztYXhDWo5OIMKpJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdLMbACL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Geh4qipU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdLMbACL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Geh4qipU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7fXLh3017725
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 08:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JHoMsFtKNse1MlLVeF/xwl
	AxrCV9vWHJUxI2jz9dE80=; b=SdLMbACLBUM1vDQCUmcCy6a27xKviSoDtOwNw1
	Hv/rxFKgX793s2Oa27blYK8rAsrUNde39bkmqHUeqy+wkL0FIVCAIWay6IxH65tv
	bQfm5s70UeIYU7qXuAEfUyo56Qeu261K8Cmz2Kc004yDfSvAE5nCJeIlB5Ai9ppw
	uWHJdKeNH9KbOcBKsle7ih7oyU4OQhoAnYk/f3orZYuyBq3Zab8t4K1GJUxIDwD2
	lx81PJqvRxejTugfUHRXhQwI4/r452QnpernI8WxrXrBdYy/L+hHCaRnTyCHQWDo
	D2MPzkXly73PhoiWiIuYzIhknKYZN2pcBAWMrtJsUkJddl8A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b3byf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 08:44:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a3c27c9bso75699506d6.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967454; x=1792572254; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JHoMsFtKNse1MlLVeF/xwlAxrCV9vWHJUxI2jz9dE80=;
        b=Geh4qipUEmz9mNfnEX2SNmd78Ee7L/fC0bP9n9q7ZHfi4osYuhGBAU0UYEOARt0BRv
         grI6t/HAufyDNMjqBqGwLvDGmZFFZx5UpQ/SglxGCGOB6r6R9k4BPdJa8RgdAQ/VDhnl
         4ib/U2QY5XicfX3hMrIBZoGgjxLbOff3BdmQXoyKa4VqyMJhM7lSaqyHiUcqKbp6ftzH
         gWhFWiEH7J/vxDehMAi2Kd58IIzqyqpbjzSUgZuOSniW0tIyui8Rvwa4L8c8VZMvu3I7
         96y44brrAYCcHopMxfdBykKXuBTjg4s/kI1x65nR+WPZYdBAezmri5aJhPgxORy29U7k
         eC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967454; x=1792572254;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JHoMsFtKNse1MlLVeF/xwlAxrCV9vWHJUxI2jz9dE80=;
        b=akFkr5I1WZ2LlLoMWImDEV2qe3lm5EgczKwaSJZWlJ0/EohoyK7+/hPcuoNpnQq99d
         7wny75ZIn6wI4tn581usWxxbpPbRGaFSRDwBZwJsPdEbO8wApepB6F3IvlSuLjgt9fMt
         OpwXKRo//i3a/WXWNaVSwaRB/UrMznzbcxvb+BMqiAiCSolFfLbxJdLls26ajhozg0oM
         voxdKBWQMWk0zL+0rfFCCbH7bz/XkGAWT91bmxkfxbBkMf/Ma4iJ1bR7HB/plaI49DHZ
         R3rU1KCLzZSRf6dnnYsUSoSDzdWpxtoehAvGl+S3fTbRznS4WLld3A+tO3INKBSeQD9J
         zzow==
X-Gm-Message-State: AFq9FYL2DD2pdtXNsGyVKyy+xabB47wESK9Y/xh8OtfNhq6hihpedoIW
	t4feereuCEgqBQ1j5iHO9JNJGSjmYguqnnaiq8vNR02bcp43rX1+ic6XTvqv/JsYo9jSG+LH5XT
	A9xxZx6tBVGsy+CZsPqdR97hgc93IDAIB1BZk5SQ4t0msaLo5qbdtBQLpNlcqLXQpyd4DpdJh
X-Gm-Gg: AYBFou056WpVcBowIECxdBjlzmZiQb2F+w4pP7nb8g6/dJbnnT2fAQsl5MTh//4H4ap
	UrEur4+/mQ+PpgaszZu1KvcvhXiHBIzC1tYT/j+S2lVJKF5PCgCtT7xU2cRKjXoqueX/I6RNGvY
	pEqVxtAlvV+vaNrUVZe/t6tjEFA62E2p57lp2o+6M/jez+WNc0wnsOgVqMzIw8H6wfVRoOZz3Cg
	X7+SxBv2/2wlSoiU3ky4gUcjEYmf1Y0qgnEPxnQQvv7As0yHv8SaNOC5e309e7ds5nXW+75oTLD
	Mn5pnNdNr9Mnx+jneh7atncDYCkKO3GUtzrf2o6g6KJrzCXaatjN3OH6nCMm3N+gwIYWxkMwf5M
	qENYcMfSwL7xGgDTqScgfRUJCDE9B
X-Received: by 2002:a05:620a:468e:b0:93e:c12c:f12c with SMTP id af79cd13be357-93ec12d0fb5mr2383181585a.71.1791967453637;
        Wed, 14 Oct 2026 01:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:93e:c12c:f12c with SMTP id af79cd13be357-93ec12d0fb5mr2383178985a.71.1791967453165;
        Wed, 14 Oct 2026 01:44:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd733fsm10534760f8f.58.2026.10.14.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:44:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 10:44:02 +0200
Subject: [PATCH] gpio: kunit: fix GPIO device reference leak with __free()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-gpio-kunit-autofree-leak-fix-v1-1-5bfa7be0eb1f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANFAz2oC/x3MSwqEMBBF0a1IjbvABPG3FelB1BctlEQSFUHcu
 8HhuYN7U0QQRGqzmwJOieJdgvplNMzGTWAZk0nnulS5KnjaxPNyONnZHLu3AeAVZmErF9uxRFM
 PfWWgKS22gJS/ffd/nhfrqpJNbgAAAA==
X-Change-ID: 20261014-gpio-kunit-autofree-leak-fix-fd6e98cb7ae2
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qmzjgNuXswFfzVsQlGsX535LOsJ4miX4hfwuT3AarCU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz0DXV4qbHEbwlrRf4D1o/Fw3XpwRbNbmF1N+2
 fHDxpfC4XyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas9A1wAKCRAFnS7L/zaE
 w2OxD/49S+bJ7cbCZLnkhEyYHl/iODXRWCRlUT31BOBTSq5W9h+9cqlrzAnKIu4e8+OA9uEBi//
 uszd0ZbW9IHcPa/mF4+ajLw0ajoOHOmb9CEieyeEmE2faquK863ltB1tE5m06w941yuc4VGPH9T
 8koe+QfFVVNF6GoqvWuD2KbkKWkYwtXtQX0c3dQaJVCHf0PDxtCYxgJI1ftn7f27uPsu0tdL0O/
 1ixNxpwa/E/7L6YAfLZpauDl1DP0lXkDVwx34wPPyi0YBx/RP0O0z/AbBaoUAGFG1ADV6ZswhOe
 TwVDFW3oTlrPIVsUhkI+2RWWGsYvZgLNOFlFwO67BwMPZfz7tIUH8P5GBO+aZnqj5/F317PUwIx
 N0Xs0X+CymABYK2L7O0RIdBwJfA9qemp0uhgrsti5H0EaHaOkM67Aab424MPireMTxxkp60IQ3x
 6YwgigKcrUco1+3dxiG6x/2JH1rnUr7uE2ze/N+R30n+DXI0gGQ9/5mhm/rSkHdeuljSFU+ZkHy
 YsUWNMwRxDUmkx87mODxu4yiOoIKRQraK5AgygJs0tXNgoeutmAOTRdQpBeBLi3neGfauaY7JTc
 MDWiH9FnltZY1MyJ+n1yorjJTDrZYhtfPfIUbYUBekuRmemvrjezpNCC59SsTsyYU5jaxJrZLWd
 c9tmxe/qD/W2XZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf40df cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=O3aD_dgH-A0VS9j9oW8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: cC9VlNF0F9qA7Nuy2k4QCa8-HX659HeB
X-Proofpoint-ORIG-GUID: cC9VlNF0F9qA7Nuy2k4QCa8-HX659HeB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXyeU16JPYUPel
 NQ5lxSTG9ciJSZ7RMDnAiJ7SlfVD2kHsnw++nGbimEKsejzor5SVS2yfg0NgrgYqVtv0NnvwnCK
 Hsq6C9ZJSlDVtOgHv4BHCUTyRfKx0hTmkT+QIUcfYszusvS+nWz975CE4q86syrtt3joVbNz0jl
 Aw63xdESb8WCgvOdNWAZAYa/7oh9ATGd/ia4UB6CBQnP7ycyjHFJddw8NCx6YWCNTIJ9VD0BemM
 2kq43XM+l3dLMWjEnt11mVTeHaIuE1TYx6ZG/yHG/GSKI3GxmJPMasW//65cLbqG/VdQ7xMzS/M
 g5rkApIfK9w8lU0BuTq9v9rGH3VYo0EH1vQ3gTJmYVL+axmSc8AWf5fXLUWp+VJmjUHanne7l0t
 EXSyY5Zxy0ELSJKyss4gT8vGQGhRCCIkCAnNi786tnIf8YqgKvSleA45ZdWIOoWasM8BIQsHmJi
 IoeGbYJRuJltuEY7crw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX8TMpW7UOVMtM
 RM8nsJjGj/sZlwf2n4D9Qm9/t5qZazEn6bmM4md0WwCAtLmLEfJUGWBbnU904DW17XTnLdZ8SGE
 DznrnNQyVz4Ef94ejp9+pdSgqPjsYvM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140034

KUnit aborts the test thread immediately using kthread_exit() so the
variable annotated with __free() never really goes out of scope and the
associated callback is not called. Schedule a kunit action instead.

Fixes: a05cfd98c5ec ("gpio: kunit: add test cases for software node hogs")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964%40oss.qualcomm.com?part=1
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 90b7e77ef0b51f5115d8a3afe53060a8f33992d2..f005854e7ff7c37dddb966ad25bcdc777e7d978d 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -28,6 +28,8 @@
 
 #define GPIO_TEST_PROVIDER_NGPIO	4
 
+KUNIT_DEFINE_ACTION_WRAPPER(gpio_device_put_wrapper, gpio_device_put, struct gpio_device *);
+
 /*
  * The test provider tracks per-line direction and value so that lines can be
  * driven as both inputs and outputs - this is needed to exercise input as well
@@ -760,6 +762,7 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	struct property_entry properties[2];
 	struct platform_device *pdev;
 	struct fwnode_handle *fwnode;
+	struct gpio_device *gdev;
 	struct gpio_desc *desc;
 	bool bound = true;
 	int ret;
@@ -779,10 +782,12 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	wait_for_device_probe();
 
 	/* The hog must have configured the line with the expected direction. */
-	struct gpio_device *gdev __free(gpio_device_put) =
-		gpio_device_find_by_label(GPIO_CONSUMER_NAME);
+	gdev = gpio_device_find_by_label(GPIO_CONSUMER_NAME);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
 
+	ret = kunit_add_action_or_reset(test, gpio_device_put_wrapper, gdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	desc = gpio_device_get_desc(gdev, offset);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
 

---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20261014-gpio-kunit-autofree-leak-fix-fd6e98cb7ae2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

