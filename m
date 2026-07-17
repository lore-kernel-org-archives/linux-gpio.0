Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A23F9F3D
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 12:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291867; cv=none; b=OdwaC+5JGt+sqwSwN306AH7Ltk/tXhk72HA7ehRCFZaA67DNv2msWJHdA1WvW6AWKgYQ4VgwSxuYZcB6HTP35EgLdUdxKkjulErzuP7ypAKxWTOc5O2GvH8993C/ihWySjIEG1/Z0bQigobecBgzBbWo7m+Z2h5tWCEEZyJlyhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291867; c=relaxed/simple;
	bh=PRB3b1r4OhZFmM+47mBZHtJkpZi09jzr/2fCoY7Emw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fmd+w+0PdNuBzYhZiz0ti430O437OmA2EbRp9TJU5pthgYWRhIUgvMbH1mTX+UQYdtjlSKJlkBBBAdOQ3g8HfC1MOgvD7yOWE4QkmETjFFCg+c/2o/iZO95tD0hSt3vpjTQwJTLtCbFK5EP/bqAiJeDzGNtnOwzl4LY23ts5Ln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYpcpL9t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEGLUlgo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYpcpL9t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEGLUlgo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCSrbw1456490
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 12:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K8IiVcphKVOk4mAKsawWGh
	vDjA+imzypOQ24DCAyYJU=; b=NYpcpL9tunhWWjTm8d5rNOToJ8DOmSD8oQ5Mdj
	2lksEf0uDr5rYodhzDdSebsyp6FA55KHpv0DlIfsgB/UOP4ucCxHaejB4TT5KMWx
	QZl7/y97gVzoPwjqljbY2SSBuRIJvWDASeEnk5teS0bryyAOmIibfBj7AuU50ZM9
	nHObZhqt2d1Tdqxf/jZndJzT52P9f+dq7hs5AfbbWmLgt6z7l2//3imYBcnDE2rW
	zJGmf89covY4zh2DRawmZs7bBeFt1bcRZoD8BZotGsMc7HpbyFRg7/SWWQBLhB7n
	3pWNmM12cBVS/rwmIo1TkGkai80vNu6nmzqZiu/Aog3kHsQg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78rh95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 12:37:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec3314f65fso149233446d6.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 05:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784291862; x=1784896662; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K8IiVcphKVOk4mAKsawWGhvDjA+imzypOQ24DCAyYJU=;
        b=gEGLUlgobX9L/3JbWW5Ems6qJWF6WT2rr0W5f4QP4L9jxeS1Xxn3jiU9xreIcS2hqQ
         p+YiBQknYb9GbRgEqD7lyGQq0HWG4klJ7bulMTjSXGfC7GIGntBtQEm/lM5SLc0s8j7C
         fi2FgWTeROLT2BjrDZMsvGiUl2re9gFshFKo/Lf2awTbE3QZwcxzogAgEnkj16lRz8s7
         QGpUs1O/1s72oEtEC+3j4gbaL4uy1DCOuFByhJQCvse17/3cNlkZ31QgwQzV8RXqi7zW
         K/mJoTTW8jky50nN3Ok1wyOvf0E3luhk2iID17zRg2uwlcmlBCv1Jew38TfozVa2AGbw
         nVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784291862; x=1784896662;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K8IiVcphKVOk4mAKsawWGhvDjA+imzypOQ24DCAyYJU=;
        b=T11ZAJrnS+50hh+mf9sFJW32n1qVMzCt6jYoqyzCZsQ462iSjxHKtwowbsgAfzFD2g
         66sdoH9XuwfitL5RD5iRKDQKrEJb2/9+VI+to7zAU4flfpYnpfa36ht2MUBCu3EsTAY0
         hx+4V8k3gQkM92/5ppwveuJePywRYyYShLcr/szIMfrUQI14cJVQluANRlx8F9pd5Tyj
         DG7ug7Eh0baehLPeOzBsQhIl7T1q4nqNPofhhFoitMcmHYyLc5d2P2bZN9PsH0V+32CZ
         HPjNxXjshCA5SkQlAWBlDuWYiTAZ/72uvnv7oTh00/MyCtdzearUAbiGX3Abv4IWlm2u
         7awg==
X-Gm-Message-State: AOJu0YzlOfE/WQplF3cW3T2A0KI11/LuW6M3aN1ylIrRRR5c5HIUy/Qe
	pQwElMnWKh6BTdkmIc7wwda5MjnVRYoKCdtwMkH8u2Z4qffkJEII0knXmVPyR7mdsO/wgGcJnUN
	O+kUn1lNb2rVIgbxbKA9C8M5CqVNb5zVyiX9GASVZaVYC8hCIBkmYbMJI3k8vbxyQ
X-Gm-Gg: AfdE7clzhBGgIjcX47E3ry/VE5YlbZEqnM+8I5nTm/X0f05F8LG+z2HDBd4Busi0WkW
	uET3SjFtmytbSMUZb02iYFuT9N46Mu7meZOJFEakbLgoc+xz7CSFjbTLui7TZMXkF4+J0el7jRe
	PQ0iVaGcsWQMHKtXfjn4et0HZbwEMe0mcEovAXrqT0wX8tEj2v58zW33Vl/vhvgxHzDhv8dgEX8
	8J1mpMdSlX31Hi8Yk0BiVRT4w1N5TD8jydAYNfT0E/shMxFpIGFTN4cjV7jukvhpdf30DRolVXu
	iW+mJXHI+V2hYQ8sKzO+NGq0XDbugVZ6SRAdpRXHdfMjn2BHuD8h/QsSkKn8ERIsGqUnX9Q7whe
	q/LehZVwdsYdzVNo3rdRUwv9G4xi1Cw==
X-Received: by 2002:ac8:584c:0:b0:51c:9e6:ec42 with SMTP id d75a77b69052e-5213dba3846mr21597151cf.57.1784291862151;
        Fri, 17 Jul 2026 05:37:42 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:51c:9e6:ec42 with SMTP id d75a77b69052e-5213dba3846mr21596851cf.57.1784291861614;
        Fri, 17 Jul 2026 05:37:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2e83ddsm42074215e9.10.2026.07.17.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:37:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 14:37:31 +0200
Subject: [PATCH] gpiolib: unduplicate the pointer used for storing GPIO
 chip data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-gpio-dev-drvdata-v1-1-401b0cbd4d70@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAoiWmoC/x3MQQqAIBBA0avIrBsYBZO6SrSQnGo2FhoSiHdPW
 r7F/xUyJ+EMs6qQuEiWK3boQcF2+ngwSugGQ2Ykpx0et1wYuGBIJfjHI5E1etpo9MZCz+7Eu7z
 /cllb+wAmB2NVYgAAAA==
X-Change-ID: 20260717-gpio-dev-drvdata-005219c06a25
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PRB3b1r4OhZFmM+47mBZHtJkpZi09jzr/2fCoY7Emw0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWiINOK5vx4IGweX+JdAuNRr0vGzy3M/ewtqK6
 Pi1yZvLm3GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaloiDQAKCRAFnS7L/zaE
 w/QtD/4oVhNAu7GzizaphPicI4kP2Hz87q47h/X6kuUJm8u3KRdO8h5TuAI5yXSd/xAqebiJ6+b
 ggC8uzFlsoSV/8WRIvEUJ2wImVv1iIchWZRBlWOLmoDZGWJeV2iqpR8KWgtVHJh0qqnR24tCAfy
 0YdtOQ9StpkZf9JZuDa1mCqx/oX9X4uNvtiAFL0/UiDZpgHhG9+KbASDwqoQSKj7lO43y0cokuz
 0EXrCPiQZTFqdhk1DJyC3UJEQ3LZGwp+PcdLnS271M8O1y7Ljh01lkdhxXX6OUXK/ajARs5n9gc
 NMbIbNFWutjoud5TyzPoq3cVmYmlvTF+GgFYgBeCoHhCzxtZjHsNVqrKZxaOSs5ZYdUo9H6AfrB
 D+F0Qyqu+PdpI4n8aG/Ckrj3F/e/OR52F0a3MKQ12+R29MwfnGef+PP/ev5MdQfJcNHmGlA/Htv
 9752UKYRlB8NG4rQyFk7tVtSS1WXWX/Wj5p2Pl6A0+dyEQvv/Mg/zV7l6Vf15z7erpAJhLTzRiV
 ks3xc8W3dl78YYPTiNRqMw96IkDSQPeQWWJuXMfOksUVFHlTB6VQHqQFMp+fW85P3ja21oYYH3e
 ECg/D5sgED5aJa7ypaXEUjc/FlmzIDZtQGGvNRW9radlz61VAa3z5RcQJVdk60yhGG1r967Kb6L
 xfxAeJIMXmb60hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyOSBTYWx0ZWRfX/vL+Z3U8iC6V
 sa8g0/E4/hovHXRe0U8tNZlUosihpM/w0fEa27mAUJKez/qcPDwXcdMvYQgD90tfNS7ypRC4sYm
 LG/3eUmwmJVjf5q9tWSifE+6Zk3Uen6wmIvlCIM+BMDF3l5E+kIBy2pyRMGuljZQNAmYZkB5DXO
 cev0ovk/jVWxRIiR8oSkk76hp3JIAXLbJb8muYR3OIR5AjHlSz1X6NfKzPvtH8cmmcnKe7bCgHo
 paghYWYNPuF/hQYO2rQBPFsDdGqbRbxyjE9MM/f3/av8coc7QOUyujCgcOavCtt3QfBj4WsFouq
 hpAaDdmdxDC9NRekRGv+zEhKuEck0iHoyMPvc0TisBaWs385j6VEQdSsG1qiutoxbJ+j4nNIvPj
 dG1w0UX+YRpIoHD0XJAXKxCPTEXPVO+9ik6TpqvaV6Om6q0CYxSgCXn/9LgDfz+0l9XuUAy7VP/
 eRtIDOzFUtN+iNJAsbg==
X-Proofpoint-ORIG-GUID: mKi7RjeVbqCSkIwzweKV4pZ0fSKxWyZZ
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a2217 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yt508o4TUAWRhPDqOYEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: mKi7RjeVbqCSkIwzweKV4pZ0fSKxWyZZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyOSBTYWx0ZWRfXwvtADzx8Wf4a
 A7rm40V9JuoGQcP6kFPbdDAw3lSwFOI9zIrW6xbsZetrGL+9ztZgrHE1xmWidJ9yS7yULeMcYMF
 0TVCCwb4qgTGxLFNtQtHHJHQyU0l384=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170129

We currently carry a dedicated pointer inside struct gpio_device for
storing the driver data. However: struct gpio_device already embeds a
struct device which is not accessed by anyone other than GPIO core and
also has a dedicated driver data pointer which is currently unused.
Convert gpiochip_set/get_data() to calling dev_set/get_drvdata() on the
GPIO device's struct device and remove the duplicated pointer from
struct gpio_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 4 ++--
 drivers/gpio/gpiolib.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c433a095907fe6ea0fb0a3e1234bcf1f37042cde..723953f909c6159218cad73ecb3ca0dc9acb4c29 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1103,7 +1103,7 @@ static void gpiochip_setup_devs(void)
 
 static void gpiochip_set_data(struct gpio_chip *gc, void *data)
 {
-	gc->gpiodev->data = data;
+	dev_set_drvdata(&gc->gpiodev->dev, data);
 }
 
 /**
@@ -1115,7 +1115,7 @@ static void gpiochip_set_data(struct gpio_chip *gc, void *data)
  */
 void *gpiochip_get_data(struct gpio_chip *gc)
 {
-	return gc->gpiodev->data;
+	return dev_get_drvdata(&gc->gpiodev->dev);
 }
 EXPORT_SYMBOL_GPL(gpiochip_get_data);
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 650a702741dfb938fbdf11db65a46ac85b6af512..cdf64785280e95e43f8d8b3645b93fb970347238 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -45,7 +45,6 @@ struct fwnode_handle;
  * at device creation time.
  * @label: a descriptive name for the GPIO device, such as the part number
  * or name of the IP component in a System on Chip.
- * @data: per-instance data assigned by the driver
  * @list: links gpio_device:s together for traversal
  * @line_state_notifier: used to notify subscribers about lines being
  *                       requested, released or reconfigured
@@ -75,7 +74,6 @@ struct gpio_device {
 	u16			ngpio;
 	bool			can_sleep;
 	const char		*label;
-	void			*data;
 	struct list_head        list;
 	struct raw_notifier_head line_state_notifier;
 	rwlock_t		line_state_lock;

---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260717-gpio-dev-drvdata-005219c06a25

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

