Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579656;
	b=XRBC1r4IwlABFyI/jVyQBwbRh4Vj8TVkcnnA/HPGq7R+NbHpuXDFrO9TFk51mBzs6kN0
	 yKFFYvzB/ETE2GwY+vOMGXWJSwCzmtWpg/+8FHPzSkfgaj2BpbwIRsO9YtzLSLf89OClB
	 Zch8IHq2VPdgvhh2ryF6RgFPO9D/HW2MRWPbTJYfvET7E3hHKkHPmMzJgdDXt55Yzjf8B
	 HQls4sITIgWaDJsnXHs0APtK2oawgIEkJjFf8W/u4799e7TnS4IEMtvuc0QOUnjUgO9by
	 9QqQGrjoCIYOyTfUkdlh3Wn39qgkIuJyrp8Q0irkuLx3f1b5h4b1oRVjPh0juQwFBuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PIDMKBXMcrh97ujqVDS5OhOp7piRRyGKl9yfJVLv+5s=;
	b=K/byzdchX8+YqWJ9earS8fCljIV9Htd2UVI7A4E9DcnQDQ6NC8dLrCnDRM/AwTcb5XQb
	 H2uHt9p4lzT2n/nOGRLLAghuNfd1Q8UgFrHOKV+ZKxztdqb2kPtHGJR4NjVBjB4gJ5yAc
	 XWRt0hHbnQlrcAXDMnFdpWt5nj5LMHWY/isixBec/hzxvezRs+4sC+A3wyqpmdZtlMFIF
	 mQRQylb5F20WOlg6mXrfQrpI6YTJJl4My1V+cZxhQHfdnrtrvkK3NZHjme8OcYQVkh9Vf
	 0HDZG5mFX7t2LVkRZQsqb9P64BjbmhKBDkBeQ9yoxADkTt1q8nIsKHH2TAbHKXbc4RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKcce8Ya;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXPL7Kw5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CFB606A319
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0CFB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKcce8Ya;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXPL7Kw5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5jW13449612
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PIDMKBXMcrh97ujqVDS5Oh
	Op7piRRyGKl9yfJVLv+5s=; b=NKcce8YatJYHx6Uco20BLLkStYJudPvyINqNHV
	WRizjOHvVbUcyOwZv/G2rfllgJdwIqeXGYP5mNhKeS0NLHz6t7x6Rxm4hz9ip1Lp
	gwUMQqSpXidUnkwBk4csyQcrn4qt9uCK/fH3O2SYvZJn2wgNY4P+QCuXYADoFmva
	ehhMBYyPa7dK6F4K9TOKrAEqA9wnmIKbQ69HNhKOPBngqyGOTZd0EzqEhYhyrpMl
	2x2MNdXfhdth4sQmkocqqYxZyQsoQvYOsagZMkocRDRZ0Z/VO4AYDPTIQNFA/cgo
	3357J9ajQ7nEabePexY5k2u2Zf+K4tXA4ekol0rh/78RygkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9bbd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:47:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so100298985a.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579654; x=1793184454; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PIDMKBXMcrh97ujqVDS5OhOp7piRRyGKl9yfJVLv+5s=;
        b=KXPL7Kw5j/iBEZwMhZDOMZe+wfvKHUTljDthry6ulCpQrU1lqS8DIC/McJ5n8E0RmF
         EwIXTJoK/NB/NWNGXjej8nhqawiBURykwIfl/Ujuk7B9hmrxEHPI3I0o6udmQOezFyFm
         rcYJNoEPALJxbrpU1BvdRdPITAc0cE22HHL0WZntkfGngMX1gxMePpsugtXEhPoyEnRR
         uC9T+MTU/32WzGixN+X4FqihFEPN8i80p98B0t1wD4b4wBCOphDNODFPS7M+ScaSDiEa
         ogfntFU4UeTSTehbU4GySO1VPMdvYBqZdk6tv4tLMK+Qbvi/P1flnycIc6ro7AX38g/b
         pvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579654; x=1793184454;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PIDMKBXMcrh97ujqVDS5OhOp7piRRyGKl9yfJVLv+5s=;
        b=ju7MgGYVXsk+tz/BMiOCrAbOcvvKy88NzOz/SXGd/HJTAImdFFYDHelq5+M+PNWuZ7
         YbNLQaV3TSSVutrL2I1JdSxN2ER0OXBJz25jJ8HjeIUYSvLZrg2UL0RJACaH5iZFaa5h
         X8T8UqX4dC2pSQHFTYg7ig0f6l+5Y84XW7eLhme7+3BMSiJ8RMwDjn5/gbn4I5vNEAmq
         jUm8M4HgGVW4dyqYA+83iV3/3xrpBLA2hBPNQdaYdvGmS6d8l7FAXUOuXVAMHYhjyq93
         Nl2lGrHlPQKIHNoOHtRqUm1JxMSTangT7YhDV9Gz9Py35gUiYp1O0NoD3Q25rcCLOF/t
         kwhA==
X-Gm-Message-State: AFq9FYKKIQDEghzaki2A9Z/RFXoYQUzQQtTEBR6KHp9LwNxxsZl9/4YK
	T121JXOfPdPdu5NX3+SiNr0ZCzBZQrrzwVfrD8MSmeGDLGlOdnO/8SmGGVeuyEqBLA7rUH3Zjes
	Ok5FUKTz8YTeYy9mUaYJto6bwz4Yr0HFBFWccyV0iAiiGIJjCHn0ltGA4OHPwfN48xbrXMRsK
X-Gm-Gg: AYBFou2KvjXtOVZmbhH+Oq2H7lJU5g/sD81Sp1K/0MReplybh5FYMnzx+/vrraR6Zvm
	PhsPS3Nhc7MSfeUyjMjEOzQdCR/79m3PujV73wLGsq1ZkU4OQAO6m07mjHCjn2AVVAo5vxxipE5
	HyLI8rkQtwTeC76uf7+rEtBvioumjabHsjZCoRzIkzs9DMVz/+auYRmZCKHXVIqtLm9Ag31qEcQ
	UG23GthIGTdA81AXi3pZCYAh+QRkptBtjZTXCQo8YnnQ9rwTgd3PT8TJuQqhcWknR1cCQGXLxka
	0vtw1RFTqquO4tzeAZ+56kPhe6foTG8dsXCV0Ns45uCiW+BBCqIqJMnadUxunjg/nsgmvQhK6u1
	pdewW1MJUXDyEDcLW4bgKAB0ERIhP
X-Received: by 2002:a05:620a:6082:b0:93f:d27:c89e with SMTP id af79cd13be357-93f57f72761mr329087285a.75.1792579654067;
        Wed, 21 Oct 2026 03:47:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6082:b0:93f:d27:c89e with SMTP id af79cd13be357-93f57f72761mr329083085a.75.1792579653258;
        Wed, 21 Oct 2026 03:47:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583f25asm4530670f8f.45.2026.10.21.03.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:47:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:47:25 +0200
Subject: [PATCH] gpio: sysfs: use const APIs for legacy sysfs attributes
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
Message-Id: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADyY2GoC/x3MMQqAMAxA0atIZgNph4JeRRyKpjVLK42IUnp3i
 +Mb/q+gXIQV5qFC4VtUcuow4wDb4VNklL0bLFlnyBqMp2TUV4PilpNeaCYmRz5MRB56dhYO8vz
 LZW3tA96YZ/NiAAAA
X-Change-ID: 20261021-gpio-sysfs-const-19e060af900a
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4274;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9dDH5v2k0De+yWj2b89X57Qpyn9QTdgy/GLl+uDHr1Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2JhAf9806VHM311pj+PG9hBYS+ih0eI89PIXx
 psX5VHVeW2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatiYQAAKCRAFnS7L/zaE
 w9VdEACPAw0ZFrt4mEHZXICmVA0ivMlkhtttFQpA8DkyF4Yhswnkbqy0u06rUSPFO9tYhTUBP9K
 qljcPA0LxNSVeWVkAMLmbexsl0gMUXUFD77c75GzFLYwSheVUAUFo6GViByBtMqRR88KY6bqmjM
 6Bsp0Z3tgDuYPbjHZtV5xk2WJOcH2zajwz+wZw2JZ3ZzmVr6eq8J67jwnPimA/6zOjlK0Y3VqUr
 /2CaXe2Hycpvex8tfPHjifRQDwvYw3TtvbOOTMvHtML2qLiigT4TxR7ZPPkXsrnTEZeivbFtZxA
 Sq4b9i2gkITyVqpn3+FUhO1c9rhNNmbJWNOmZ4vKTVsRUjjQCCx4PiemfX6RabkARJEukyPXtmB
 PHif8bRxwKu3YrKLsW9sOqdrX4weCm7j21sW16qGTF/cXTBAvFKNY1AxmOf5wBdthIAcvzC6ybS
 2yO4LgwkyWujS/EWsraKLZKFSBHyaPAJvlB0XhzFXnc2+LXxg5dnW4ipwjWwx1U4z+FM7LEsmIa
 rRrVcwStbFg/4H2WGjrQbfalLbLWWRxpuRVdi5+aoDoa272Bxufaj2hLPP0o5qleDx4hISWGpVn
 yyqlxw3BIRkYAUpyLTFMqrNwbcAsAu6yZvdHUON4AmJbeXgfiFNSQRfQCtv54uUszzAyFv6TU4+
 9riDZwvuQKptNIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX83PRHw6ICnXH
 PHnudYlW06FsiXdo4ehrBUDxtC51PlH6TyQ44msc2vhxdpmOOSSUNku4z0vY2R5K74GThR4UMiG
 cVw6FIQVzftX5CsNoDmczzkYLFIAnrU=
X-Proofpoint-GUID: hNR5ezdCkvRw3MU0wV8BSsfcCExdMYW_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX5DvoqNMQwq/m
 GAiUCCEathXVoMPdbR4Wgsj7Ne759434Y1uEhzDUWVlKbthOqZRMjVdM+qV0iFHQOWmWRLKRl2F
 RdvmzqTgMt3tikGgsYaZnlKCMyf3mlwBp7TPhcAa8lPZNLmssd8y74YiaatsdKu8+NXiFORLxgV
 75vFA0u0bCJuK5VtcjFZ4hMxyoenUMEBLJikE8Ed8xd5FS/ZeYvUk07eQIsqg2YmyeGOCMibTx+
 fTnFNseApfJl1JIZyachzUswO2aRr1dZ7tI30fmlfdsZDkMG7nLs+K8/RKUYCgBZPNlfu9zLvFp
 ItYzeXqN9hAOeDv7krIOxOavfaZ7/ZqQqUNXms5yujSaK9sHy4d8Wqa9yp+0RDDkwVZ1b0YxP7+
 EhgyqL7jLjPX3R3E9tfDLRJiMz/XlaNEITbqiJvgHlmzJ6R9IKhjW/eYIB7cSuhKU3UBbODIYfW
 ZCKtfNXiwYHR5OHpW6w==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad89846 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ylqvVeHYuwYs7xP2k5oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: hNR5ezdCkvRw3MU0wV8BSsfcCExdMYW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

Replace the deprecated non-const sysfs attribute APIs with modern const
variants where applicable. This leaves out the attributes embedded in
struct gpiod_data as this structure contains fields that are modified at
run-time.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-sysfs.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index fc06b0c2881b9427c7c2e069047b0896156eda65..08f5149925694320a2fc6615ff7593ce439fd1a4 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -442,33 +442,33 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
  */
 
 #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
-static ssize_t base_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static ssize_t base_show(struct device *dev,
+			 const struct device_attribute *attr, char *buf)
 {
 	const struct gpiodev_data *data = dev_get_drvdata(dev);
 
 	return sysfs_emit(buf, "%u\n", data->gdev->base);
 }
-static DEVICE_ATTR_RO(base);
+static const DEVICE_ATTR_RO(base);
 #endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
-static ssize_t label_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t label_show(struct device *dev,
+			  const struct device_attribute *attr, char *buf)
 {
 	const struct gpiodev_data *data = dev_get_drvdata(dev);
 
 	return sysfs_emit(buf, "%s\n", data->gdev->label);
 }
-static DEVICE_ATTR_RO(label);
+static const DEVICE_ATTR_RO(label);
 
-static ssize_t ngpio_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t ngpio_show(struct device *dev,
+			  const struct device_attribute *attr, char *buf)
 {
 	const struct gpiodev_data *data = dev_get_drvdata(dev);
 
 	return sysfs_emit(buf, "%u\n", data->gdev->ngpio);
 }
-static DEVICE_ATTR_RO(ngpio);
+static const DEVICE_ATTR_RO(ngpio);
 
 static int export_gpio_desc(struct gpio_desc *desc)
 {
@@ -529,7 +529,7 @@ static int unexport_gpio_desc(struct gpio_desc *desc)
 }
 
 static ssize_t do_chip_export_store(struct device *dev,
-				    struct device_attribute *attr,
+				    const struct device_attribute *attr,
 				    const char *buf, ssize_t size,
 				    int (*handler)(struct gpio_desc *desc))
 {
@@ -555,28 +555,27 @@ static ssize_t do_chip_export_store(struct device *dev,
 }
 
 static ssize_t chip_export_store(struct device *dev,
-				 struct device_attribute *attr,
+				 const struct device_attribute *attr,
 				 const char *buf, size_t size)
 {
 	return do_chip_export_store(dev, attr, buf, size, export_gpio_desc);
 }
 
-static struct device_attribute dev_attr_export = __ATTR(export, 0200, NULL,
-							chip_export_store);
+static const struct device_attribute dev_attr_export =
+	__DEVICE_ATTR(export, 0200, NULL, chip_export_store);
 
 static ssize_t chip_unexport_store(struct device *dev,
-				   struct device_attribute *attr,
+				   const struct device_attribute *attr,
 				   const char *buf, size_t size)
 {
 	return do_chip_export_store(dev, attr, buf, size, unexport_gpio_desc);
 }
 
-static struct device_attribute dev_attr_unexport = __ATTR(unexport, 0200,
-							  NULL,
-							  chip_unexport_store);
+static const struct device_attribute dev_attr_unexport =
+	__DEVICE_ATTR(unexport, 0200, NULL, chip_unexport_store);
 
 #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
-static struct attribute *gpiochip_attrs[] = {
+static const struct attribute *const gpiochip_attrs[] = {
 	&dev_attr_base.attr,
 	&dev_attr_label.attr,
 	&dev_attr_ngpio.attr,
@@ -585,7 +584,7 @@ static struct attribute *gpiochip_attrs[] = {
 ATTRIBUTE_GROUPS(gpiochip);
 #endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
-static struct attribute *gpiochip_ext_attrs[] = {
+static const struct attribute *const gpiochip_ext_attrs[] = {
 	&dev_attr_label.attr,
 	&dev_attr_ngpio.attr,
 	&dev_attr_export.attr,

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-gpio-sysfs-const-19e060af900a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

