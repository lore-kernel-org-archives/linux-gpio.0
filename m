Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619028;
	b=HIOUadDNa+K09OF8OrUT4BLrLapKNmnyHoMT4byO7/PEaQ4IrSPaaqdMDx130QKK+glX
	 w/HBs+oU7ZSvODAHdeAU6yz5cOKVTGNRbnpscjY7nfgUHXE1Xu/cYi60sjMHa9dZWihru
	 sBIErN2okSKiOPNMwmV8IGJ2x3AuF2Z3jHSP0UTJQUsdkP1RIrmzY6b7kWTPMBgdN8Jth
	 fJGdyAUQLW4s914OpMwPESNYJsQmOKbkfrKmwT8l7MKnlEfYN51P6AK3ufSjKrWRpEYHA
	 Bwk8jBmWGm/jxxhmRXOvrKSwBwK/iya8JdZ0javyHhsE+esJ9ypaLmfL38jaMjdIViw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2WvmVx0NUl7jiOkggCIKKfZSszuZz9bNRR1+QpGBv7o=;
	b=ZDUVxmwxr9R5nKZhyPuLsD9J3ncl9J2fW6J11kBtmvy0DNzeoeDoGOItmxLAMLEh+SMx
	 u7lI9HsOCQutk9Qu1hBk919LEcol5/B6/0RUINYaKeF2a0ijv+pFTOrdSuCKJimsEX8U+
	 qzMK/OWpJJdZJ6Fqew/ZP+skw+3YE//rVMEbroO+rivOAEFpO0Ycl+OdT5LFTG+SDOkYm
	 Wz/bfAzoLwfbcbZtxl09cPEusR2bEoFxaL+537rXX5Zf6gNSit5WAU0DGr7JGNqLJya2+
	 3qNNCxfZniBfTVk/mY2lslP4kCWpIW5J79x4gl5cCiLWjZEXz1xIO5LWgIVCjESSO0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HhPsOlni;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lj6WQf6w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF398606A326
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 15:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF398606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HhPsOlni;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lj6WQf6w
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APELq893725614
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 15:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2WvmVx0NUl7jiOkggCIKKf
	ZSszuZz9bNRR1+QpGBv7o=; b=HhPsOlniS/1bo9SPFygtJ1UMVjLDlHfOGsu521
	07xuiUj/ItcEcIuZ0mlfh4MUpOLvrIpgtllWc5DgPDN22xKXiPpkOS53ZAHU0twQ
	Eb12SNxPv6O1nYcpFzNchKeEHTDeMlgv7NQtVeDGmYw/dnr7Ertr6+s0HkWE1FBU
	V3d7ZxMDh//2XNJiDGBNIZx6dwgtxlFNeWEmtcSEdLSr+xrNxDczSNpyDIV8qGUZ
	H2JflxdTBlRr9zyQ68WFXbKechWNk2K3FpAY3GEb9rFjqV4TNDVPOm+YJHvNJDaF
	FoDoKq9e29OxwrwV9C/pswkcKHF9Dj53KXF2Qv3fZ9szA4wQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61af06at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 15:03:46 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71ad76c01c1so2745806eaf.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 07:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795619026; x=1796223826; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2WvmVx0NUl7jiOkggCIKKfZSszuZz9bNRR1+QpGBv7o=;
        b=Lj6WQf6w74OtStjo9FavlQy5uo2YAxyeoFtldmyEak7FI+/K0wkWiLYxvZJ93X8BP5
         DEMZBQERHpPmYAmdBG9hCoU8qoG2PRmDwlZ3gkVk9yhTs/dZG3n3CfsLi9tbx2GtrgRx
         t9IdhX1TE5D3UvDupJMNDyuBr/LYSbDsT3hr6HRf1XpFNUs5E5LXbWw08XBVT4EBvOFA
         qkYS/jEW49VWjeTP8YiDcuFw7YCqZLwzJFRJC2vMXyg3iATpRikW8GUA552ZQvDDZYcV
         voOiecvaWKM30y05tt8N/A6lhFC3z29x139rBrhcSsWBEKLboTU6yGvAGadv7wcbELL5
         Udgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619026; x=1796223826;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2WvmVx0NUl7jiOkggCIKKfZSszuZz9bNRR1+QpGBv7o=;
        b=y89ONuc1lBD7IXIyBrk88eqTr95Zc1TqczYNsPR0B7oqct3UPdf+zYSwQ0eShaTxwt
         0YtQmb8V6JgSrDfbFf/52RyFf6hCHNn/tdgvg7m+wrR+wyYAzcf5SU8BhqNF/2z+QIUu
         L5SYGS/uZOdEJugV1eLYprwI3pQbCM0Wi0qjfmBGZbcPeRFxvSaK/cZdJE2ttjYBq/Ht
         k5XR34CCVtMuhhYNTGm9tE+OEo/jzajEBiodCi6grA1xKN27iB6cCYq9kmAsY7wpFo3B
         Xr0sKm+GxM5jwJTOvAF5iHe2uYKCTTTl/6hwaQdSd1+3pkIZ99mI5PwCjBFl2HjiCBCK
         wF+A==
X-Gm-Message-State: APuU4Z88NoQW29nGojC98JTCkEdmLeLlkTvPvwDlWmhQ0krhmjMO0TQQ
	XV2LeQLt72wloESataDQqThp9WwtjHA6WU5D9JXW1Wf39N4sj+sehWmHYlXHGv14BLuhE00ymzs
	rLzL6Xm0WAfRiPCxTY+T+JlS+hqFfIK2/QzEohTojWjAUfIeVE92VLvha7yaiVgbLEshdWwdR
X-Gm-Gg: AZFdTZesjwGd/c4fZ1Im5vFyaRiBGFbNju+SO07LC7+2XkeDkHmtfbsm4J+6Ild0QnR
	7QIp/Wl1zeNfzLCb8qWAY/qcBahtqNzk3bRJ7XDARtm846FMTjyXm/npJvdOUc12q3ch4BZXmP/
	AiHKddsh8TiXmQ2ljKo7m83r53YRcQLz7/uNFSjdc/0aSiPwYwNoI+WGpBNkfkRTYofu+PxbKHJ
	pzGGNVQwyvWJuoV7HMo5Nd4XGk2YMba8zypP0k3NZfRMJBH205E3FANsv0EFNiVrznFea/bL5/n
	j86LjCOdihHfFta/Rgnu2fJWwu5weIlnu5K0NlaTDHWMCu4fk5ysrDSP0QA8sQsKHPWrbFULuoy
	iEDAqQX8heZJ2a20qytCHchzZN1de7wR3vqate1E93zYi69yr0bqANFq9YKsEg1zdP6OtKekvBq
	z+hfUwTQK5PqnbQDLwhwic4+UFaamoYepOTabqoJtnuK4ZWT/idZl4aQ/w5CgQMSs=
X-Received: by 2002:a05:6820:2206:b0:71a:f637:e5f4 with SMTP id 006d021491bc7-71b3948644emr15664863eaf.39.1795619025716;
        Wed, 25 Nov 2026 07:03:45 -0800 (PST)
X-Received: by 2002:a05:6820:2206:b0:71a:f637:e5f4 with SMTP id 006d021491bc7-71b3948644emr15664811eaf.39.1795619025174;
        Wed, 25 Nov 2026 07:03:45 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm36291267f8f.33.2026.11.25.07.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:03:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:03:41 +0100
Subject: [PATCH] gpiolib: use the of_xlate() result when hogging lines
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
Message-Id: <20261125-gpio-three-cell-hog-v1-1-724b15c4f0d8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMz4BmsC/x3MSwqAMAxF0a1IxgZs/KFbEQeizzYgVloRQdy7x
 eEZ3PtQRFBE6rOHAi6N6vcEk2c0u2m3YF2SSQppjJGa7aGeTxcAnrFt7LxlkbaSsqswFUKpPAJ
 Wvf/rML7vB18SqrNlAAAA
X-Change-ID: 20261125-gpio-three-cell-hog-22742394ea02
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, stable@vger.kernel.org,
        Norman Herms <dockseed@proton.me>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4782;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JOFHXo2LvlDk+FFkBfNrRUjsN9R6frDp2E5bOozo+qM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBvjPIeEutoW5F8W2VXPI6p1fcryHxsG1Se6U8
 ZhF7t7Y6cKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawb4zwAKCRAFnS7L/zaE
 w1HyD/wMhQgjXwRkMbrg39Tg7f6BTVs+X5FvoU0boYFrYyeDYxKzVwcR31NiDS0emq1cU0H1JsV
 PkSferrG+XISR16JBCdaeaVAdHmhTQyoNQiwSM+/uV1Sktwi7KFNzThOJ+AC8SvRqiO349TclhH
 iDX8vDl/fEwnroUgWZFEGlp2o5nDMAegYWHQOH/iZxTIoF7urlk+6iSE0B1+X8LDzJKIpAPbVLw
 0y/q9FCWVxdU240jhxcVwxvCZa7w6RCkcIuHx8yGOK2Iu21pobeTnB+SXoHb1N/m2LWZC6Jt2W8
 P2fY+NdoUB4tmfaTDQxncCu7iiR4PFQcPanwlqVorb9yckrlXsicQrfh60aoHVP/cNf7wpC9arB
 /PzWEVd1poWGGpSAEf8zTA51cJqQKxo2TD9UQZqKcDmfCHJRFN+uSyk+uLCrKxTM4BP57syjJuD
 8/8HrZb6tsFgPYZW/kHYkjdkdftQpoRz+Vdo7WiuK4UgU1CIHg0nsFYlHkf0vr4sS7WOFrcwWU9
 aifZUznT5AB/XV5LJOY8iVuzCcW9EXGBKgzjSfyhSs/M7og6NiJH0KABoqTIlvr6Qm+LKYW/+yT
 ImcuO7jOx9D0Twbs2stqmjTTc1Mf6cJk8PFq4ijN+31mbVdLxTMq2v1yRXnk3RRYv3XZrXHjINl
 RkMuxT5kSJ6yRPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OSBTYWx0ZWRfX0CnBz1P7iEzP
 teYm35b6gFsvk70S/ImVxjsjQ94e++l6zoasKENRQRP6IyvGaphNC+/6nKQeW1grcbsj5dd1U6b
 UYC9WVO14QIghd0iSfiY6aRpwSy27Xw=
X-Authority-Analysis: v=2.4 cv=PdhqFShd c=1 sm=1 tr=0 ts=6b06f8d2 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-_O2tLMXsRGhU8GF7hkA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: n3wCFcCunVRMqUBrt0WGYmY_W0zpil05
X-Proofpoint-ORIG-GUID: n3wCFcCunVRMqUBrt0WGYmY_W0zpil05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OSBTYWx0ZWRfX24K/FIoz/hMh
 9MWJqmInTb3IniPo/3btJNsPxhF/x685C2+SuibPwT2Pp/UWnODSwR07lGuiPtc3CVV10Py3jAP
 kBNySenFgIBujtNZYyKhw4e55r0uKwYMMEVNmsexKAVugb3yV0/InsmrC0rK2GyIVzbMxgRMVoU
 02qQA3bxclevtnxEThmCkfUY0L2F7fEE6oDiqVzUewMcV1qanRsSAoNOEIJNayjSGhYOlPW1vTO
 gg5xyVhYIXpeq9eVEbkNCsMYHvCiY16MGzwiKzF24BLeSj2FWSul8Y+oWaKx2BgoSS2nGyp2vNn
 LizOoAml7tJduvYOFCPv/un3wcb6urne5MZvHufwd7UTSi3SkRP0YFU5/8b+HcCS1fNWkvE/k95
 XfT5fFGnG2e1sBjqN+OGUzAe40ykUatjkluBBNbel2isHRZLBQGfRHYWdbSGKClDYB9sxXkDFPv
 NNz8juCgwHOjQAOUu7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250059

Since commit d1d564ec4992 ("gpio: move hogs into GPIO core"),
gpiochip_add_hog() takes the hogged line from the first cell of the
"gpios" property. The of_xlate() callback is still called for OF nodes
but only to get the flags so on controllers that compute the offset in
of_xlate() (sunxi, Qualcomm PMIC GPIOs, tegra186, ...) the wrong line is
hogged.

Use the descriptor returned by of_xlate() for OF nodes.

Cc: stable@vger.kernel.org
Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Reported-by: Norman Herms <dockseed@proton.me>
Closes: https://lore.kernel.org/all/qh4LV99kGaQYdQuGbsPX4b9Fm6Cip_Ow7ImY4icfwI8IsbMQy_09FovZY82b-_HVkDmR2ELMlKe8bzCuBB5NpaZizoO-s4tc11zAX30FDhw=@proton.me/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-of.c | 10 +++++-----
 drivers/gpio/gpiolib-of.h | 15 ++++++++-------
 drivers/gpio/gpiolib.c    | 14 +++++++-------
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 8bc4562608e1141983300132b90758ce68d7625d..072f84a83c3c657baebd88694f062849b7526a79 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -749,9 +749,9 @@ struct gpio_desc *of_find_gpio(struct device_node *np, const char *con_id,
 	return desc;
 }
 
-int of_gpiochip_get_lflags(struct gpio_chip *chip,
-			   struct fwnode_reference_args *gpiospec,
-			   unsigned long *lflags)
+struct gpio_desc *of_gpiochip_get_hog_desc(struct gpio_chip *chip,
+					   struct fwnode_reference_args *gpiospec,
+					   unsigned long *lflags)
 {
 	enum of_gpio_flags xlate_flags = 0;
 	struct of_phandle_args args;
@@ -765,11 +765,11 @@ int of_gpiochip_get_lflags(struct gpio_chip *chip,
 
 	desc = of_xlate_and_get_gpiod_flags(chip, &args, &xlate_flags);
 	if (IS_ERR(desc))
-		return PTR_ERR(desc);
+		return desc;
 
 	*lflags = of_convert_gpio_flags(xlate_flags);
 
-	return 0;
+	return desc;
 }
 
 #ifdef CONFIG_OF_DYNAMIC
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 9ca540d93f93be9c1b4791c7add0936527646849..347b82f9e3ff4dcca6b919c058270cc721c81541 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -25,9 +25,9 @@ int of_gpiochip_add(struct gpio_chip *gc);
 void of_gpiochip_remove(struct gpio_chip *gc);
 bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index);
 int of_gpio_count(const struct fwnode_handle *fwnode, const char *con_id);
-int of_gpiochip_get_lflags(struct gpio_chip *chip,
-			   struct fwnode_reference_args *gpiospec,
-			   unsigned long *lflags);
+struct gpio_desc *of_gpiochip_get_hog_desc(struct gpio_chip *chip,
+					   struct fwnode_reference_args *gpiospec,
+					   unsigned long *lflags);
 #else
 static inline struct gpio_desc *of_find_gpio(struct device_node *np,
 					     const char *con_id,
@@ -48,11 +48,12 @@ static inline int of_gpio_count(const struct fwnode_handle *fwnode,
 {
 	return -ENOENT;
 }
-static inline int of_gpiochip_get_lflags(struct gpio_chip *chip,
-					 struct fwnode_reference_args *gpiospec,
-					 unsigned long *lflags)
+static inline struct gpio_desc *
+of_gpiochip_get_hog_desc(struct gpio_chip *chip,
+			 struct fwnode_reference_args *gpiospec,
+			 unsigned long *lflags)
 {
-	return -ENOENT;
+	return ERR_PTR(-ENOENT);
 }
 #endif /* CONFIG_OF_GPIO */
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c09342fc52cb7fce163e807ba134ecd0e1389436..889ed7e420c19c9a69c9149ead3ea370d7cbbdea 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1036,9 +1036,9 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 			for (unsigned int j = 0; j < cells; j++)
 				gpiospec.args[j] = gpios[i * cells + j];
 
-			ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
-			if (ret)
-				return ret;
+			desc = of_gpiochip_get_hog_desc(gc, &gpiospec, &lflags);
+			if (IS_ERR(desc))
+				return PTR_ERR(desc);
 
 			/*
 			 * If no line-name property is present, fall back to the OF
@@ -1054,11 +1054,11 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 			 */
 			if (cells > 1 && gpios[i * cells + 1])
 				lflags |= GPIO_ACTIVE_LOW;
-		}
 
-		desc = gpiochip_get_desc(gc, gpios[i * cells]);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
+			desc = gpiochip_get_desc(gc, gpios[i * cells]);
+			if (IS_ERR(desc))
+				return PTR_ERR(desc);
+		}
 
 		ret = gpiod_hog(desc, name, lflags, dflags);
 		if (ret)

---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261125-gpio-three-cell-hog-22742394ea02

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

