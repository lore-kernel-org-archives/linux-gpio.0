Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884474;
	b=IatO8hWZPOIBxXCtf739WxXV4woLQnNAIeicjRPQ0wt6+J+SHZ3r7t2Ud4SVx3Fxy0lz
	 jESKIuqyMY8rBGVP5qC5jTXyjpdsTuHHhFKEDc9XKWHtfdFn0WqqoK2lZHj1Tj+2LfqYA
	 H4bXuLwzL9RK7u42L5UtI5MmRsGhAyS7izyM71Om4LooAcoOy4sHehm4arYY/TZK8Cjju
	 le1qVvgnhOtahw8ETgwuzSWqpHao3s9esRpbAp8iwWehb62WAGTIX4OoVtNshN/eYuMPZ
	 5l3ArkX+dxvyo13Btzkpyu8f3AxmDKxbTzOGbYcPMHSKXNi/dnyx8h0qvSUirBQDSCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=23xE/pG0PxrZgDnTN6o56S9USHdH1/BEwYK81Qphu78=;
	b=tM0Q2CD34NfyKM/7s352EyN2AQbMSo60tkw7MfS13+5br32D7SsjM47aHhBPR4qTyWwz
	 EXglmqDmMRWIsvXclCEaHifHzjNp11ywQU9VZATBsvlhGS172aFpyPH+uEPXu5szUUqoU
	 BwAWLmQpstJCYGuRv09mCFpb9VKbQgdEpzehSlNtSyCc0sVN6un2M7CZUAF4Zzo/HIfck
	 b2bS3aoOiykPp+cUNxE3eZlI1ttShNZ+1I3MkfWMymiZSJdGN/lOmryXhziUVVX29Zlbl
	 BHeT6N9wetMVzSIuwHDspbBN0fu7aFM7mo+/YcjEgyYSXeAPUMxelKZ+IpwulHOBdFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GS9QQOEv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWZfsYNL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D1606A329
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 13:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7D1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GS9QQOEv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWZfsYNL
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1QYP1416462
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 13:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=23xE/pG0PxrZgDnTN6o56S
	9USHdH1/BEwYK81Qphu78=; b=GS9QQOEvyagyxW4AOpm6qYjR7jCKPC9ovlt/st
	BKSccjL8AG0Ka1So5VO9j6GGzimISP3h3dtirV5lPTqpe/NUDU8oYHV0X9yWGziy
	F6aLmxd+4AClGFV49qJ4ZJ8DI1QAqhOxnutB+MCUF2zin7ayMmkl4iAMae8kou8L
	GFSgwrJBaYyvREDrr1DOKhPDhRrHheOPZqWGXhmnq8jjHnwFzEfoJpBX+a3XhS3+
	sGatro6fX54ZfHd9u4r3SKR/y6G5e/R3/tHcztS0eIjQygnXRkMhgkZAxOW2myuU
	usc22bkt0IKe4b3Htqk+sLYgw5eODEY4n6tZcocDQtPwuuIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd0sa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 13:14:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so518271585a.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 05:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884472; x=1794489272; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=23xE/pG0PxrZgDnTN6o56S9USHdH1/BEwYK81Qphu78=;
        b=NWZfsYNL8uCzcBcHt6ZQ8GuYtbzTjwRj0tZ56Z+Uu3jD3vLURCwZgpovB25qsOyvye
         8ypPOvFzQGqaoYjckWuC8UKrp2UvxTm9L8LEDVz3fwH5aLEtWfU/WohCdCG+cp+NvJAV
         sINKNHMp/TPX/1JKM+U2as/ecJmMr0e3yGqmUxJ9tpG2FDhRfRgwtrcR1KvQ5vIp0KZC
         1hypduv8vkZB0/poi4w3J6oRVzWgFPXSUEiNSDLymzcrLVt0/fKrmOsx5VpiN/yaJNGa
         G2/ZZAD5cgHEaz+Tp0C4okrWJ9Ur9+FJ4K7Qu91Cz+/VSCNX23fGt5y7h18e+5o/6WiX
         4F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884472; x=1794489272;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=23xE/pG0PxrZgDnTN6o56S9USHdH1/BEwYK81Qphu78=;
        b=WV+AGxW0gfg4ijc3EnuFZptf94rEEFKdidgnuhQprlVqEcGVfGc09PrqT0K8yfO/2o
         KdZ2/BV3BPNBBPNrE9/87NcGpz8BdVA6xN5YtYkGZnIO+BDREB5vFlxMDAJrZe+777FG
         b8kFqEGfjcwt19AcbUVT5TXwNqOvctjYwFKYwDwNs4anvmIqsGaTySHe7lZzBpZILpPd
         izJAHHuMev3mxlSImTyp6YhVTS3mU/pU5xpVpMpQlIyiHR6sHdQgfbTE6gMGm4IyvMnb
         9G4wF/HtaI+lsakP2D5UUNzvrXf4cKsRtnenOC3bxH0YLPJ8Id9oehXPeHTrely9Bygw
         Uc8w==
X-Forwarded-Encrypted: i=1; AKwUvBypEH1AbjBuXADtoOHfTNok3rKEqNGxlN0MOPtRchA1MB8jWrIGzMfIpVbW0r3JBRyfqjG6wwmP0VMF@vger.kernel.org
X-Gm-Message-State: APuU4Z+08NT3ov+gpZnyKgxjLUdk4ahHy25OO++Iez9RmVVAwxr8Lh3W
	nknYa0tB/QY9inWk+IKMvZZ3DNpxgl/UpH22tEVflOlJhvvnLHs+NaYWIJws9/pdQDZy1OPuZm5
	eNNDgLNOh87BwrzK/pbSoqEPOKPTahXG6P9TQL68kE4diCph3+5dIhbCAWspH+BBQ
X-Gm-Gg: AYBFou0H4iumBZhac+cooKsQCA8JBVaktEyHgRCST9LzrWEgXVIQq9uB8JsTVGPu7cK
	LunLi4zMGBqw9ybj8ooZ6B7k1CYG1CDtRjO3LkCOqFDH6dNhXml0Gmju2Z2HeDoS/9Yprmb9tkM
	tod/ezPMYSVw5+KhLCt6B6ZJ6XVeg7FOSdrnmAg7yAulBvm6+Aimly/vISensYpWuuFFILCFcZp
	30k/HKCvlUt16vk/aeUe6PvLc3wK9zQLv1G2Tph09MjKOXdFWYdHfzMt1T/wNasEDcdu7bACKWe
	FWcO8gzknhgsVydqb+OrmTLhiLhYN5dJ1i7DyjqEj8GqAVUHbHT9J5bduo5EqUOOa1p10+Dpf8k
	t4ziFF6uGQwfIn5epJEldHPW/jbJF3M0C3ZP+qJboqXJaQIuMLVafOcVeQlCc0F3vIYp3CWRjQQ
	t0rg==
X-Received: by 2002:a05:620a:a8cb:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-94430bc5284mr1978057485a.29.1793884472161;
        Thu, 05 Nov 2026 05:14:32 -0800 (PST)
X-Received: by 2002:a05:620a:a8cb:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-94430bc5284mr1978054185a.29.1793884471727;
        Thu, 05 Nov 2026 05:14:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ea594cfsm58427225e9.5.2026.11.05.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:14:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 14:14:27 +0100
Subject: [PATCH] gpio: sodaville: fix use-after-free bug when registering
 the irqchip
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
Message-Id: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADKB7GoC/x3MQQqDMBAF0KvIrDuQBNuKVyldRP2xA2Jkpoog3
 t3g8m3eQQYVGLXVQYpNTPJc4B8V9b84j2AZiim48PLePXlcJLPlIW4yTeDVwDH9oZwUYNeEGu8
 aHXxD5VgUSfb7/3zP8wKZe0oPbwAAAA==
X-Change-ID: 20261105-gpio-sodaville-use-after-free-0824e74ebe18
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mtZCRkkcVp1Pu8MTkbPwoYXRgIxey6b4FJwI8ZeDJrU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7IE1+YCaN3rfSgsz490/sqXEUn/d0CQdL3/3b
 4jl2xeGVMSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyBNQAKCRAFnS7L/zaE
 w5RPD/4mACSFED3s9lgkJASVoQ96FuxBAVSoSz7sJPe7ON4ttfxDlSOQZ7SFV2Jrtn3lfqXXq7C
 TQZOyAiTJlC+qarUYkIR8eieV2YudN+Mk9sdCrwI2xggU9l6rjyocu4M8wQde5pOGKaCKfFC0uf
 cJUVgadk+5qZS2694XAgy0mpskmeQtnYKyJuz3KkkQi/rEAWu7iFcTf13Gv3DjovTnD0tT/2Sr2
 DblPBPpBawhrbjpsGPzx6PwzyT97btbk8eAoOA3S+0GGREE4onSndqkjLIKcflHymc3zCc4tYXv
 kfQwoy55h78c9UCR/2URIGs8gNfeZK62fNK1rRlYW5msPsgTN0sZcwBSMMTsHUcZBVU1f7MTHkh
 jAfW75kQgmesLjiEudM7PREIOJqpo/TB4NbYj4HAmET/MeasIqg1ThslL5iHXbxiXx1kou/Z/6+
 8HGk2JsBBVJh5mYKsvOp2Xsh9RQUJdo1lw9INoY/Wdy86E7+4ovsquIyRMXD/ql8nNzkLLmToKM
 Y5dZGTTpPzE6yskZGhp/64kH7hVc2BlgTpkNLxu37MajFmh4PdyTmt9ulredKHVon3+YMj4PL7v
 6vxeskvmrkmVkg6zW9EKLcC16lqlYwHAGtNidvEUgkKkfn54Z0Sni4DLcODiBbgQZ8UQmE30nLh
 QD6nGUIANxxx1Yw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX5EBGnZmBI5rQ
 srnCFkyuNKaTcB/hz/rGznaslALyzOpYr0VZH7YpaCFq7K46bGY/Qm2CGdFFftMuWCAh0dF5N3H
 1Un9ot+kZxveUWBQTfk3vHg0lbiDKtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX4EOabKSSiq7A
 sNS1I9l9Mlg9SGxr5lpcN0S2JytRXfYZV/mVPCmt3lx649TbmoggsEyQYofzDL/g+3qA+UParms
 YF3SYsDaa4myiEgcW1BZQm8gLdTWQkjymNKiNJEKvBZGIOD6QN0sXoGpcKbxr8onhHEp9xIlY71
 D7KA+CG4YHPuCQ9bat9DyRXTRZdGQgE/WoP3zgHeqc2LQzCebYHnV0fuI03lwRAMeEisgkyzOTS
 Uc5fgRd97CnUbp0ESHoEi89DdRsXteG0K1bD9miG8+6Ag95K1cIJwV1LOkHtD78Tk+EeoJ1Dq8I
 NItmneDTD2x6TPX0CiSHJPZuRzk5NiMhWh5BI4GnAcbCTAIu1Vd2ZKOHfUuyExBpiw2CoyddZcO
 ieNup+KX9jB3pxeCoUJIjEi2boGIJv4NyHAUYqh6lRcHT/w5s7Cw/yaWhUD+gnWMq9j3d+Rte5f
 t8vo4oiip8BPYNI7s9Q==
X-Proofpoint-ORIG-GUID: ubA5FmMx519hEsJuREsa828lYE-htS13
X-Proofpoint-GUID: ubA5FmMx519hEsJuREsa828lYE-htS13
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec8139 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NpnzE1Ya6WnjZ8Z4SpgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

In sdv_register_irqsupport(), if irq_domain_create_legacy() fails during
device probing, a generic IRQ chip is left registered in the global gc_list
while its underlying memory is freed, leading to a use-after-free. Use
the managed variant of irq_setup_generic_chip() to ensure that the chip
gets unregistered before the memory it uses is freed.

Cc: stable@vger.kernel.org
Fixes: 9381fc5d655d ("gpio: sodaville: Convert to use managed functions pcim_* and devm_*")
Closes: https://sashiko.dev/#/bug/linux-2f7ac8b6-5034-4ff1-9afa-5700ff44e3e9
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-sodaville.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index e2a784df275c98699dd625c48f14a3be31113920..4ae38d964bfc1f4191ebebaf4716d544183a9e8e 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -166,9 +166,12 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 	ct->chip.irq_eoi = irq_gc_eoi;
 	ct->chip.irq_set_type = sdv_gpio_pub_set_type;
 
-	irq_setup_generic_chip(sd->gc, IRQ_MSK(SDV_NUM_PUB_GPIOS),
-			IRQ_GC_INIT_MASK_CACHE, IRQ_NOREQUEST,
-			IRQ_LEVEL | IRQ_NOPROBE);
+	ret = devm_irq_setup_generic_chip(&pdev->dev, sd->gc,
+					  IRQ_MSK(SDV_NUM_PUB_GPIOS),
+					  IRQ_GC_INIT_MASK_CACHE, IRQ_NOREQUEST,
+					  IRQ_LEVEL | IRQ_NOPROBE);
+	if (ret)
+		return ret;
 
 	sd->id = irq_domain_create_legacy(dev_fwnode(&pdev->dev), SDV_NUM_PUB_GPIOS, sd->irq_base,
 					  0, &irq_domain_sdv_ops, sd);

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpio-sodaville-use-after-free-0824e74ebe18

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

