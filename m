Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C224A4457A2
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911384; cv=none; b=Ej/90ljDJjndIQ+0U2hqingw59SbPV7gBhYoAFXb2VCDcp7J6KseVYKg52nGNJWn65GIzew01yUTrsL7FgKKXhV1ECAGPn7GV0/p4PR7gzdVgyIteulrtsR6VwvQmZUe//SSiU+nqgS60JT6vmcHeOxgts5WylchKsQeWsy02qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911384; c=relaxed/simple;
	bh=vVPJhbOe/jDVcy81Rh+x1AgzMREYdmwHkMLZibZ5O3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VvB1ycnhNM9TyuXiib2k55bfeHEPvRa+tQreSi0mG1QErY03y0pkmgPbU2/LUWxH33FxaexMNV7sA0IW/D/iTD9OlCj2oOmGCjn0VA6kPFDYiOUaVPRcxe9+P0fu3XAgn8iL44bLb7tGr8PYlmnY6Oq3EYlUDQ1BWzJsxCyRfLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGirO6Ip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MC3+sVci; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGirO6Ip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MC3+sVci"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbXSa3336572
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 16:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AqdZU+HIpQlzd6GEke7H13
	KmSvgaCfgUvWqrUDsQsNM=; b=ZGirO6IpSO0ixAZLdx6h4DmFQCQuOiSXRmro9M
	7k7c2EEHcRyuzaJNC7gcZlSpspmocCZU4B8tcURd8rPbP8qpVx5g1blXEGqtng9p
	qyj+1U4EA71JarMKlX26YLNSOcPgf0BGouQDQg28Vh0NOXWeNKE4ZR/XQ7IQ5l3A
	liKFuXTqxHQaz3zW+ivrMe0ScRzLZRvOF3fISuzUM26EmoexplA/jocIOA8oJYOH
	qsofW+mBkbFKmVFuVWyy8hBGpUmkPSg9vh2toBw64g50chTLgRXocuJs/DSp7J2H
	OmeXSnMb8EveGMe9uDAg7c4Gs4vXj9NOMZIkR5FON+Ycdi6Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5bysm6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 16:43:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso833702a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 09:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784911380; x=1785516180; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AqdZU+HIpQlzd6GEke7H13KmSvgaCfgUvWqrUDsQsNM=;
        b=MC3+sVci5JiHWAsN6jJBqg1hUQBjc4nZMghE4WegABtac3g6oBS1uFPvSQ+BGfU0Gr
         w22h6rbRAhp0ywmhKUgoY/M9jmwC209LfCJe27zQJQLfkvE1yjorDCtRWeSZXQijuB2g
         g4QNYc7l0IPWW41CJ1pdcd4Zo9oUrAxdDwGTwbrV1oRQTnsppkvGbzWLaJXEzOeMXHPb
         kmzGPvtaZyE9nrRN8i4QKq9nyCq6nBP/x+pEK99HZSfmSGRU5FtXSEVfx2YJtCRiuFq3
         aG3ltZmOXdGvM+rFwjQDZYnrh+ms20B6GyiLatK4jHGlHRBKVjayBs46MlruSIwHGaoy
         5WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911380; x=1785516180;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AqdZU+HIpQlzd6GEke7H13KmSvgaCfgUvWqrUDsQsNM=;
        b=dwIP4wDAPmDlJukdyTo7OT+uvJsW9fjuLcfVZ0Ehvky4o2tZxvyWAPdNfhV8Hgf5oD
         t3jMBJf0mdtYq87vucO+LQLKaZsqQ8A9609lBDIU+09pcdOeI5vdghSx3QN8T6FokrYf
         ycDujrIWNqe/Q8+mLzG4e30C73ttLKNqyDikr+pLxX06+DQ9KUv85QmeOgil46fhB5D8
         yBRaR7Nl8abEomxBevzv02rrpHyo2WKLSQGjvzL3sAj/j6K5Jnn4F0eYjDSoI6tMvrlq
         Ah/58w1yFRkKbMihAleKuVAOxkLCyD4I56CCYKdRsuXyKt5alBEmynkPvlIxWAfu6ko5
         nd9w==
X-Gm-Message-State: AOJu0Yym7fKvYQQ4SAPAoGVh4o4RLyiVkz7jiIVWMBvaoTG1Hqbi80Ph
	VGE3Ry6M8eTdE8RDcAkKAT+JFchSBBdk/Od6vnu6ReFI2gp6qgoZPunOV4n3WlIoxSKGuMr+H1W
	0PvSnZDpUWYhWJR/KfWEAsi9DnkYGOoaeGw192IS5/KE3DEa2AXEXmgGlQe60qXJs
X-Gm-Gg: AR+sD11OoA1ysxDbfHmegfc5IbdtnkEb9UWsq/Xv6lUGz1XPitWYQBXb93AmIBVtFMX
	VgZ6qY8n+dzxkXu90s2Pz32VVJV+ZD8zoKEwuEqzqmKU/gaBgsqm7bkF91PZ9hA1n/Rc77Fb5Xh
	r5tI3mrn31GGUOVZapChXOs4OIc9MFcy1OHmVQwr+6/Px0lX7yfiREPXVnFqP71cc+S+5Ii8hyd
	fZT/Ya+Pdl93krqkS1GDnmGdoWstKQqKCH4inb8fiN9RGLy1GroYfuAzxnhMFkr8l7KODaVyq0V
	RA4VQ9Ar5J/3dTd4iQRpfnsmT+25GYfc3YQfMzAVZnmQETaZMnIGh8Gtb2XmkBBYcUCC1m7G4a7
	GTAFvafh84qBJes3E3Y5h6EhwV7qOqeVt+gP5opjW39cw9zhVVA==
X-Received: by 2002:a05:6300:648f:b0:3c3:69d0:c573 with SMTP id adf61e73a8af0-3c44b270d73mr9674040637.68.1784911379626;
        Fri, 24 Jul 2026 09:42:59 -0700 (PDT)
X-Received: by 2002:a05:6300:648f:b0:3c3:69d0:c573 with SMTP id adf61e73a8af0-3c44b270d73mr9674008637.68.1784911379221;
        Fri, 24 Jul 2026 09:42:59 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5cb670sm1294580eec.31.2026.07.24.09.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:42:58 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:42:28 -0700
Subject: [PATCH v2] gpio: gpio-by-pinctrl: Apply initial value in direction
 output wrapper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPSVY2oC/42NSw6CMBRFt0I69pG2ICWO3IdhgO0TaoDW/qIh7
 N2CG3Byk5PcnLMSj06jJ5diJQ6T9tosGfipIHLslwFBq8yEU95QwSsYrDZg9SKDm8DEYGMAjwF
 SP0EjGkrbc9Myzkk2WIcP/T7st+7HPt6fKMOu3B+j9sG4z5FPbP/9V0oMGKCqayGUVBWyq/G+f
 MV+kmaeyzyk27btC50bAqzfAAAA
X-Change-ID: 20260723-gpio-pinctrl-output-set-val-676008568122
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784911378; l=2294;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=vVPJhbOe/jDVcy81Rh+x1AgzMREYdmwHkMLZibZ5O3I=;
 b=f8f24sis51oX+wQgI2W/CuMFxjc5YR/FxUXMv4O83asaLPnqkIczbB3SWoZtKycmc9w4y6WB8
 csgfqgtBzGyAHhf1EeappyJiuNLGItxmaxo7M3YEdmHQdOHUroX7CL2
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-ORIG-GUID: VZE8q9oEmRS5Ji8wrVRRInw2shra2dZ-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfX4nujrTtDifme
 J+utxbFsbbLPW/wNw0f05IwlYDpwQxWVQjoJOQIO1z4kIUbq0KqLpDJs/T09HWkgjcDDUCBpLxX
 Au0ylWhcr0R8ilKZGFPgoi5T0AEzi4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfXwD8+iCcT/FgM
 AfPfUHneuZZ2lQ+/Poq7rip5Xcon7ARUnlcSQqNuR57wUY9UBA2Yb/auUGqIrfUENErXNAM1w9Q
 0DBDh0qrkHUm93moKdEIvrOnFJepmR9KP858mxX86sxuOiTSL6wn6goPO/hcRoZACJWVinWS6kK
 STVl19jNLqg2ppsQ2ZXX2TQnfa5vzK+xi20Ij804HLZOh2xgtJDiG0w+8gpALWf8g7obIbI4Ns4
 BFdSpHI3irSzPUDA1A7uzbah7b60RsLt1dP7wlJ+lkHo8wyqbXHJjQO4DHHugo3W5fMud0c41Zk
 N3Yn3XRtkGU04U5T5JcIeyqm/G8YNHxjM8D6qnbUHuKEU6hsz42DgjWFF3pBA8C8UuR9z8VNZJO
 crpg3WRufpjrjh6h7pAAyyiafYPvmJ7W3jhncaWy2PAKH3i6LIeGg0KPSN0w3aa+vNczFJWopkb
 O+PfPMaXTqoZZ6l4DmA==
X-Proofpoint-GUID: VZE8q9oEmRS5Ji8wrVRRInw2shra2dZ-
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a639614 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=oAmfn5b5h98DFWpm4AAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240150

After successfully configuring gpio pin as output, set the
requested initial output value via the existing gpio set
wrapper, so that the pin is not left at its previous level.

Fixes: 7671f4949a6c ("gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver")
Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
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
index 7d7c48ce5163..fb8440acb31d 100644
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
+	ret = pinctrl_gpio_direction_output(chip, offset);
+	if (ret)
+		return ret;
+
+	return pin_control_gpio_set(chip, offset, val);
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

