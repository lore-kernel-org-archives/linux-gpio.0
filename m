Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C70442D746
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786388357; cv=none; b=u4etVw1slDWuaV4TuGW0MsoYyPl0joLXagQISarUbGzHYi1l9JwxUcyMkaOPeW9DFzRH6BgDIKLeUzFCsOg345Om8utP7QkjuzrQI9fsS3fyHUT5hGoIOtJ3nzxiiJdlJzg+LVkXka8/3PSti2QgPFKYMLsaYpwQs/w1hQHyFrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786388357; c=relaxed/simple;
	bh=ogyVoi8J6WJwhLnlVKpeoIdhzk+HbFBoJ6bTlbrvAKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NOKLMx+j0ITR7n8OYriUJeugFOXLZ+jyJvgTwcGwyMLbdS6ROuxzKUfgaoO/e2wTRzNEYzT2QgpLCg2IpMTsuoVWCStKHn37jWs7LG+nJV5isKE/xnoGC4IlMAjYzZAQQmiaCpiCFWn9/npB2TPf1TZWO7izS+X5W/FoafBGxAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKbAdMHr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cfn6nUEO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKbAdMHr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cfn6nUEO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AIwAxs2439390
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 18:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=djux3Y3cuRx4rxhBZBVEHS
	B7717uDJdremSPnISiz8E=; b=MKbAdMHreI812ywcOUBs2ObStlOGBwFX8Mo5zX
	XiQdoZingsQgi5jYgKsD8tmRR4wyWfRmr3LZpveAArhIU38pM5vgCQHw49OrIcX5
	dC9bYWJuNU2ei+j58RvvFdCpTq7loKVqREPvrZd5oXNwcx5wuIbFuP/8fIx9Fbrk
	AoIaELm9lUfGv9c0o4SeDxVvg4KiwaS3MqN2P3mdICMPM3mk/olkwcEs0ryQK5I8
	oKY8uw3bZxuaWim2IGWSq1I+1lBuOxBTN7RUYP/55dIb5t83+8Ge7Udx9uRn1rmH
	rrdyGpyLo8nuD48n9unNNSMVVC12oo+nNuxDgdgVcw17ITHg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv0gy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 18:59:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so3927381a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786388354; x=1786993154; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=djux3Y3cuRx4rxhBZBVEHSB7717uDJdremSPnISiz8E=;
        b=cfn6nUEOyM7cb39wlqU+NWGUfdDRPYMW25Ga09LHPygEe+PlyqKuJvm//46qCaCVxq
         q7niTgoDVx0Mij88Pv+vsnbNrqI4VioiE0CpYRdoMmtPMmnhopvmVe8gsRfvIN+B5Pqr
         YXhWxAvI1ZougxJB+3gdRD5JpjSKqAAlVWmd9pm/lsBf4sww+txdop4g6hRHd9Ox9WuL
         jjvwNR4eqP+4hoI4EMPEocKYkD40qBVEBS2EcUoN9fltbuGtYqaggNAwj15bTEvkfEIK
         99GTdWngH3LkApdt4XsdK0ViS6K8UzdbuH7djucfOUmVA3jP1gnQA6i3gD7BUHFiHOJ0
         AyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786388354; x=1786993154;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=djux3Y3cuRx4rxhBZBVEHSB7717uDJdremSPnISiz8E=;
        b=iEROYBp3xBHD8au5D6Lz87yUFFCJy4TapoOdBYFtF7S8bjGZrZlsTwVo9XsSIXv4lM
         4OynmIcHd36DFN9UI8lbfW6ewxu5fCqGiRyq5vTfzQ12A2DbbECKQy5FukInWJFHVnJ/
         Vab4+BStvvGDA85TpT85wf2ud46Dh0hOz43SY0QZpcymViE/4/98mGzuw6jlvs2kcqYG
         6C+YtaqhVVDgDoPF+xi/OpVSJeYKBiYjzASh17+EcwcjucZo4+Z9imeXHz2MzO1Ll1Ls
         N8VYvcUF0FS5j0x0iXeFbImiui1QSNADSbtDmZyGGY2uXeQvRF322hoHIALYcKXlXjjr
         /uSA==
X-Gm-Message-State: AOJu0YxmjTByvdKVa2axi0ZwE6MusxKkhrl8tjn35laooC83LO0TVK2k
	T424syKW0XgWqW1AyIvFENKUse6pBY0m/rZS4QJc5ZG3I9Ep6YSC2Oot0XXghrT1RNwLUtR1cdC
	loRAw9qKQEQf1ISNx7lBeAsfo5eDM9wobi+uT11YMztX1p7HvPtRJNOXXg/XLxKFt
X-Gm-Gg: AR+sD122yJ6mxmA4RmTMUygFciVkKyWzilhzh7nIKVqWA0vabK39hiD8RXyig9J4V5n
	+578e5w82FB1NzakoygWkyctwP7Qv8swjdnOtV3JOpw+AggbCBz0AwUSxHBUk6u+t9kcZMguRXV
	/eyfW1OFq4W6mjaX4qU7EEC+JLizDPdjlw+1H2ngIQqVELwZSBiulNuuKE1JSSlC82CHjSy9REr
	NHsNCVRo+/fgH57cGg/8w7CyLhJm1VN3O+PSZ48ez4kSYLC9O6WzZXILDNK7CvAI7sFaXtKI0C/
	WdSm9cYV+wtVrO7ovbuiujTzLF6NmY7FaGeLujqew6MfFbFA3LWX5guxupB+/CIMQSk/d/4mLXN
	5rhQ16s7hZnIMlVf5QvyiST5GeKmb0bJqCxygGOIU+REeUVJnWA==
X-Received: by 2002:a05:6a20:c997:b0:3c3:88a5:83e4 with SMTP id adf61e73a8af0-3cbc0175a62mr29288826637.10.1786388353923;
        Mon, 10 Aug 2026 11:59:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:c997:b0:3c3:88a5:83e4 with SMTP id adf61e73a8af0-3cbc0175a62mr29288771637.10.1786388353486;
        Mon, 10 Aug 2026 11:59:13 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199bfd8sm38033768c88.2.2026.08.10.11.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:59:13 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 11:58:17 -0700
Subject: [PATCH v3] gpio: gpio-by-pinctrl: Apply initial value in direction
 output wrapper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-gpio-pinctrl-output-set-val-v3-1-8e35222b5c8c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEgfemoC/43NQQ6CMBQE0KuQrv2kLVCIK+9hXGD7hRqktS2Nh
 nB3C25cGONmkkkmb2bi0Wn0ZJ/NxGHUXpsxlWKXEdm3Y4egVeqEUy5ozQvorDZg9SiDG8BMwU4
 BPAaI7QCiFpQ2lWgY5yQJ1uFFPzb9eHp3P52vKMNKrote+2Dcc7uPbN399xQZMEBVlnWtpCqQH
 Yz3+X1qB2lutzwFWQ8j/yTL3yRPpGxVVSnKK1GIL+SyLC+LnkSJMgEAAA==
X-Change-ID: 20260723-gpio-pinctrl-output-set-val-676008568122
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786388352; l=2466;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=ogyVoi8J6WJwhLnlVKpeoIdhzk+HbFBoJ6bTlbrvAKY=;
 b=JEx7bN3fZfAUW0Cvcc2Zcf5dMf5sdvrj9/QwSPZ1uFE2OFUJlleQ857Y6a3vdI+D/Gazy/K7r
 A9qmwjWpnpMCxE0nfRPBeO8ezLVtN+OfnCS1O6ujqxfbhs8qJZoZGf5
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE2MiBTYWx0ZWRfX/ya923isnYYp
 +5Giwo7LxZliFqjWY8pryMVNe9u6NonaM8TtJ+aEryiltCzYhhTLyKMiL9ihxX6DMA/W3g+VM6O
 NPgubPY9FIREHfvpb2t0I7nfb55PyT1/0DHMLtdnsKgwj7zLHhRrqq9Wv+8p66kuimq0cB0vx9O
 P8fbQ5uWSnX0t0sZDAcLlUsWIXUiG1k8k55p6a7JXnC6JvGlj4NYbX9K9PwtQWwhg64dQLKmGu3
 vwbwd9/Bes0Yyo51O/IzdEbgYnQD/8U4kDzk4V9xsd6hg/1Ph2kXozgEperShMNxlFPoqAeOWjY
 m2YGbEVuO/QFB48X+EkDkW3AukocKTAK/6j8NpYOcRyeeFVEltRd870Fsg04lKydthO28mLqmKM
 yuINPun9upDElv9bAGXCy4oTlbcm3YX0R1sWCrLgCwosT9pC7O0RCV5fIzsPk9qXzVrjrWVVJIK
 NPImn/2uyO8bUpsDK4w==
X-Proofpoint-ORIG-GUID: YH0qjexlQxT-gQ_NIRGKLPX2-HHbpm02
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7a1f82 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=pRNNWAZ5LrywNCxHBvEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YH0qjexlQxT-gQ_NIRGKLPX2-HHbpm02
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE2MiBTYWx0ZWRfX84ii/AiRLExP
 LjOsNn07Y5VikgAiMQ/KHeGgsM0cr/xQBcQLPCIWaEezE7t0dDt/FdWoeXDMnyx6uDukHtHHwxe
 gCB6o/2itfG239tatIiQms+DcYKQxaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100162

Apply the requested initial value via the existing gpio set
wrapper, so that the pin is not left at its previous level.
Afterwards, configure the gpio pin as output.

Fixes: 7671f4949a6c ("gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver")
Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Changes in v3:
- Apply initial value before configuring as output
- Link to v2: https://patch.msgid.link/20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com

Changes in v2:
- Add fixes tag
- Link to v1: https://patch.msgid.link/20260723-gpio-pinctrl-output-set-val-v1-1-ed4477dcd3e1@oss.qualcomm.com

To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Dan Carpenter <error27@gmail.com>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpio-by-pinctrl.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-by-pinctrl.c b/drivers/gpio/gpio-by-pinctrl.c
index 7d7c48ce5163..f54efd635f13 100644
--- a/drivers/gpio/gpio-by-pinctrl.c
+++ b/drivers/gpio/gpio-by-pinctrl.c
@@ -27,12 +27,6 @@ static int pin_control_gpio_get_direction(struct gpio_chip *gc, unsigned int off
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int pin_control_gpio_direction_output(struct gpio_chip *chip,
-					     unsigned int offset, int val)
-{
-	return pinctrl_gpio_direction_output(chip, offset);
-}
-
 static int pin_control_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	unsigned long config;
@@ -55,6 +49,18 @@ static int pin_control_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	return pinctrl_gpio_set_config(chip, offset, config);
 }
 
+static int pin_control_gpio_direction_output(struct gpio_chip *chip,
+					     unsigned int offset, int val)
+{
+	int ret;
+
+	ret = pin_control_gpio_set(chip, offset, val);
+	if (ret)
+		return ret;
+
+	return pinctrl_gpio_direction_output(chip, offset);
+}
+
 static int pin_control_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;

---
base-commit: 4539944e515183668109bdf4d0c3d7d228383d88
change-id: 20260723-gpio-pinctrl-output-set-val-676008568122

Best regards,
--  
Alex Tran <alex.tran@oss.qualcomm.com>

