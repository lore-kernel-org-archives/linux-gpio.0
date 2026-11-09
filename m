Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220041;
	b=g6MArCJl4wLqt9kkNtg/XxgzT1I/df+oVRHxxrg6WffRiaRHvGktfO3J4Y2jxaVkbFXh
	 5Wwuwd4kvAvcgZ3ZoLMmVYsC3wTv4H66Y21rC6LJs2ncfBMxMUktpZdAsFXuo/YABGqY7
	 L9q1xTdvkvPOm2jgLdX2AJQ0FmqNzxUbDRA9bCG/ERWYaX9xn4B/6nNQQ9w/xTEogvzu3
	 nZYAEuRaTF1iyi+jAeonQqMI3rhweGfo/KEIlRE5Fw6jdKBQc7rJeNSIf6G7mUa7FDWdt
	 dejbzH20dGrGiLwrePQvelQkOPlu5vsljmEkLFAGHvs6brCBPIelNNnZcvGj6wi0+6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jc0wRqvlZzje/aseVvtvfLBJ6kcDSv4zDujObU0BrpY=;
	b=CTXLkZ9U0LG7QsP0Ca9SkkQRcACQWWi+dl+xusO/G8GbaCpY/NbeOD2N6JVdBzS0J0xc
	 j+JDIfT4NIZW7bxA1B2YVnXYfSF/o9/3FVs5JGw5gCxGSoUXWAnI+XVszBzEd1QTIR1qS
	 I1zUnA/wL9Iub3qMWJOtAireoFgwvQMh+CmBFUF1Sf+/AieI7JejJWgVNqJtzBwTWMkle
	 bEDqyKDHVGSuwq8pNr8A+kpKDNStS5bvjM3qtV0iEL098P+59clZz4kEK0Ar+6hTaHyQc
	 3ajV63xV/5l4XM50lQJVGFfAtF8ttAhZcssCt2fpOZkf077i+SLXljkKLP5KmwYb4rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjyQV3Zp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y/56Fp9Y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57FD606EE8F
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 10:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57FD606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjyQV3Zp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y/56Fp9Y
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99usrB550755
	for <linux-gpio@vger.kernel.org>; Mon, 9 Nov 2026 10:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jc0wRqvlZzje/aseVvtvfLBJ6kcDSv4zDujObU0BrpY=; b=GjyQV3Zp/PN2uSrF
	d0X5Zos1q8cTXCom6yje3kcUbAFxd8p8AhO2ozmx1ZWJDsbYdax1VAi3NO7ALDWh
	HKRbhV52SVNLznFVXAHUVj8tqcXXE0Qeuqqd2TKmqyTy381i7qcwINh3Q18B+hb2
	8itr0T3X8t8lp6/v70uRitGczt8QGWwaIYqlt/5BWzzKx6ZpMuyZW2GklBulm85c
	bDLzUMjj1ApRJ6fc/oMUNlJ0e4aliZWfg5oYRIyGTWGPxyD+HDkCr3T8vuFThJC8
	QMHhQDdBluiK+ZsNwnHtfN7fMq6fkZEazHpL7b9zOMytTxv5/GJJAeNyTMsSmEcn
	yYOG5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2q9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 10:27:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363763b556so14016461cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 02:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794220039; x=1794824839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jc0wRqvlZzje/aseVvtvfLBJ6kcDSv4zDujObU0BrpY=;
        b=Y/56Fp9Y/Yz0FDx3q0JfU1FLdFkBf9fkO4KznYTsmwfQNGivVyGFM9vUK2tNc1Srp5
         F2byidFoxrCeaenKc+HJ2xJs5UgvI7E1ZrIqepYHODnvIQDn43lKmrwOm+hDgFagZ+57
         a3E9xSU3yCa225aBK6RyhV6ArXlz6q8lOsIEuDXtH4/tztwRMLaaWSMpYNGUYONnmyPh
         1PI1WdjQFEnc+L65NrKIVDmdRTqpSJUowlEZXiWlf0favvAhYuWNr4zZ1Xe1VypTypFt
         6cDQEYNIxXRB+RvOouU7sf4dryG/h3F7TR3nUgz/SZe8JQEUygEuUY+67IhiO3Eus22Q
         ho2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220039; x=1794824839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jc0wRqvlZzje/aseVvtvfLBJ6kcDSv4zDujObU0BrpY=;
        b=rvzcQnMxWcjDpBopzrb+K+s70DixKWuIoitWPQabNsHUuaxgUnIu7R0nU8MahtLcuf
         ebIEPpAdlcWJxwuihGGN+m4fKDaf13V6I0302amhNdHpZ8R45L6dyxqKAroKvFCxwSdV
         jmLjVlV0z5TLzns0518n+UjDUGCfst//nX1xPzMo4zqybELsdKYrF+F9Tifgte67ot8Q
         BzNB9hjTH7tzycimoDw70mtJb7dcxAGFdW8VGukepJEIfVgI2UPRKRY82J6WTeLeV+/T
         n1uqfcHytPj8DjT2ASuyvuPbFE7vCobjgT6vnmfI5eV7EjIMqIp8U619doa2CH918V2a
         Mw/w==
X-Gm-Message-State: APuU4Z+N5SkUc+VFOhp/nc4KBbJJpE3X4LMRH7vd92u9ujswvA9aLv9a
	VM2vneBDX30PCTkrdj4uXnw+bDAfiDGY5zGEBqIwtDoLk6i/KEH7wxSHCF+ap7UbsvevyuUag6J
	FFTB/Y0jJ3xruGLdYxjLuXf6TDh261iSu/K0xRfjmF+NZkMfZTxOWmJGminTnklqK
X-Gm-Gg: AYBFou0R3GdDFa3bBwd2jnkxshuzDgVMEu2iCBCexRlyZdg0LY5PklbZlNbgQ2He8Yj
	9vCgmGeTjoInTBJfWDe/Y8Ycm5eudmyvYBNZpQlsWez3DIzfiu4chjRb091Q9xuyZyVmvwMO1R9
	37x1E98OpZZmm4RUTZoYHonQMOIiU4NFFoecHxANz39o1TgyS56HB4fPNSins3bN6AqCoO+rqsk
	LZiGMfkae536eMZIwdcRwZRXIatYPxUzwSQHsXgbmPzBrrIRn1yksaNtJoJY3IlIy7I5CImLPI8
	z4HIvgECB85rmhBu1iu9fseL20VbSiVAn/XwpjD9JQTato7BK6+FrNwOfk1W45gSDYLw4E9sqee
	yLGmg1E9bv6J5vmJuEJ8iJqLPTDiBjQO9io0XfTwpXBXmWbUfgzl0DoJHKWKamgwJJEyv1lFeqD
	YNWvlA36Af10MX833xsHh7yer2ljAmnOTEJ1Yb6TY6euZtf4QE2B07xzcXmh5A0yE=
X-Received: by 2002:ac8:5ad4:0:b0:533:7a4c:d8ec with SMTP id d75a77b69052e-552a50ab7c8mr54500461cf.43.1794220039157;
        Mon, 09 Nov 2026 02:27:19 -0800 (PST)
X-Received: by 2002:ac8:5ad4:0:b0:533:7a4c:d8ec with SMTP id d75a77b69052e-552a50ab7c8mr54500141cf.43.1794220038696;
        Mon, 09 Nov 2026 02:27:18 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm237381545e9.5.2026.11.09.02.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:27:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:27:09 +0100
Subject: [PATCH v2 5/5] gpio: cdev: don't overwrite the whole flags field
 when configuring lines
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
Message-Id: <20261109-gpio-desc-flags-atomic-v2-5-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8034;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fVhmjZYt0e+VV07UFHqrVusazPl54UkYh4sJD9+7jGI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8Z/7wPZRBDYNmLOGXhhvjPAYkPfLE2szCBNct
 NREjp6NcJ+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavGf+wAKCRAFnS7L/zaE
 wwiVEACoQ4czedNhkQyaceY6VcGY+uONsKxeHAkQiBqz7dqTJsiqcYWQiJd11JwfO4BRuqGvgXg
 D/ouDPeDnEvQsEm49z+O9Iahi7SgT6QcPmYx4FRz4/oKZFYfce/C/WVcdzrLjCwBDRWXnNx7vo2
 TUDKODhiBx0eOrfBXkOFTpbz64k3QnGkIhm7ZK5P1liJ3gzo3dXIE101jCRbmvYe+5v38kyq90v
 GYU6cc456G3KmgPMF57Ym175tx+k3eez9QEWPgUvdKcLL9wzAqtEqpa02/XQxKtWf09XPtk32LT
 nmE5OSvn0fegiq6D3z8AmnhZ6FYK75ydPnVtt6L37QOag8w/N4+IvVJNpyhkNeyu22B7G1UQ9mA
 qEdD37Fu8qpTMjFg61IxYBXkFGCuiRRyp2pcJ+1HJSK1VgDYOxWUTIRlS/kr1fqoJ3e5vbBlrbW
 aZ8VxMN6DSUsrZDwADaq25K5Iy45XCfMRRKcYzHlEOJ2cdyX9VFtHOU/RK7CpL5B0NEZhy88vtP
 x1gDeR5o3UAlBDAmEQYSf3OpXzS66RXbOwLrMxZIwe9FHlIR2LoCrgr6pHCYvpuiyta5as7XfQW
 Jfnv6RhSumIEO9qwTD26gPcrrque6Debm/HGsnZJuhM05OrW2Y54nS+AxpYRk4QbJiKs+CUMNAI
 0SZ+KfPrPfTwyLA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX3Z93nwIwlDa5
 KZp6V8ktWwYAAK6AhLAlQic0/FIQ046ELf58dGlE0jkTpKjAZqcSlFjSSvhc4l0i9WjRFO4Uf7u
 A4O6iyswK7+mCRwXHkj8SaznGjZltQ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX1RsDJ7sdiC3G
 efio2nyYWHNSIURNfEfatNXLn7gkcr64KR39MuVvPaOkx9emnQB0xuC6TYWD+2rrQ3bEYrFAnfv
 1up/UkVMi//zridFWrg4clsLHVLxcHqEQ54zsM2nziln4D8RI5AkZCjgqtsKknzCFlBEXXExpso
 Tm9vpDX12ureBMWhzOyUMXAPj6tyjMsPGbk5qFyk4ezKRumkH0S6jPhnBHR6lu58arZNnWiV9WD
 pDLR7L6KceixMDQ0NtfoZGuYe7Dussr1payx5vTYIyMc0dEmlik3g7/lkiy3vfYRhHe21ztV6v7
 nq2oSb8EUNt/ntbjdsojeYloRPFWPgMpXE60RhE0GyXA9RDt1Ib0xGSuwlvQr9LlSXQ+yBJAdSc
 fdQGz1xzh8Ja/xbGM5GRBTh/WdqEg/DpXWDYcbwVHw/DuL92uQIsnOHdGrwjiLvfRDbMErRhois
 /ck28CMxUzfvBrXgWTw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1a007 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FxeHtzAkRt4RPYSLnXUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sx-Sv-b1UNRT85wkjBJDVocC8QfJwm2J
X-Proofpoint-ORIG-GUID: sx-Sv-b1UNRT85wkjBJDVocC8QfJwm2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

linehandle_flags_to_desc_flags() and
gpio_v2_line_config_flags_to_desc_flags() read the flags word with
READ_ONCE(), modify the local copy and write it back with WRITE_ONCE().

The per-request config_mutex does not exclude sysfs, the irq core or
drivers touching the same descriptor, so bits they set or clear
concurrently can be lost.

Build the mask of bits owned by the line configuration and their new
values locally and apply them with gpiod_update_flags(). The whole
group changes in a single atomic step.

While at it: rename the functions whose semantics changed from
"conversion" to "flags update" accordingly.

Cc: stable@vger.kernel.org
Fixes: b7adfb6076ff ("gpio: cdev: update flags at once when reconfiguring from user-space")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-cdev.c | 111 +++++++++++++++++++++++++-------------------
 1 file changed, 62 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f68e33cbd7d4cd5153e82ad77768cf52a90601d6..50baee455283c3aeb25ed92f3936c5f6a5b215bf 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -3,6 +3,7 @@
 #include <linux/anon_inodes.h>
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
+#include <linux/bitops.h>
 #include <linux/build_bug.h>
 #include <linux/cdev.h>
 #include <linux/cleanup.h>
@@ -140,24 +141,30 @@ static int linehandle_validate_flags(u32 flags)
 	return 0;
 }
 
-static void linehandle_flags_to_desc_flags(u32 lflags, unsigned long *flagsp)
+static void linehandle_update_desc_flags(u32 lflags, struct gpio_desc *desc)
 {
-	unsigned long flags = READ_ONCE(*flagsp);
+	const unsigned long mask = BIT(GPIOD_FLAG_ACTIVE_LOW) |
+				   BIT(GPIOD_FLAG_OPEN_DRAIN) |
+				   BIT(GPIOD_FLAG_OPEN_SOURCE) |
+				   BIT(GPIOD_FLAG_PULL_UP) |
+				   BIT(GPIOD_FLAG_PULL_DOWN) |
+				   BIT(GPIOD_FLAG_BIAS_DISABLE);
+	unsigned long flags = 0;
 
-	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
-		   lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
-	assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
-		   lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
-	assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
-		   lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
-	assign_bit(GPIOD_FLAG_PULL_UP, &flags,
-		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
-	assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
-		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
-	assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
-		   lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
+	__assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
+		     lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
+	__assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
+		     lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
+	__assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
+		     lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
+	__assign_bit(GPIOD_FLAG_PULL_UP, &flags,
+		     lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
+	__assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
+		     lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
+	__assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
+		     lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
 
-	WRITE_ONCE(*flagsp, flags);
+	set_mask_bits(&desc->flags, mask, flags);
 }
 
 static long linehandle_set_config(struct linehandle_state *lh,
@@ -182,7 +189,7 @@ static long linehandle_set_config(struct linehandle_state *lh,
 
 	for (i = 0; i < lh->num_descs; i++) {
 		desc = lh->descs[i];
-		linehandle_flags_to_desc_flags(lflags, &desc->flags);
+		linehandle_update_desc_flags(lflags, desc);
 
 		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
 			int val = !!gcnf.default_values[i];
@@ -339,7 +346,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		if (ret)
 			return ret;
 		lh->descs[i] = desc;
-		linehandle_flags_to_desc_flags(handlereq.flags, &desc->flags);
+		linehandle_update_desc_flags(handlereq.flags, desc);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -1216,37 +1223,43 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	return 0;
 }
 
-static void gpio_v2_line_config_flags_to_desc_flags(u64 lflags,
-						    unsigned long *flagsp)
+static void linereq_update_desc_flags(u64 lflags,
+						    struct gpio_desc *desc)
 {
-	unsigned long flags = READ_ONCE(*flagsp);
-
-	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
-
-	assign_bit(GPIOD_FLAG_EDGE_RISING, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EDGE_RISING);
-	assign_bit(GPIOD_FLAG_EDGE_FALLING, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
-
-	assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
-	assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
-
-	assign_bit(GPIOD_FLAG_PULL_UP, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
-	assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
-	assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
-
-	assign_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
-	assign_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE);
+	const unsigned long mask = BIT(GPIOD_FLAG_ACTIVE_LOW) |
+				   BIT(GPIOD_FLAG_EDGE_RISING) |
+				   BIT(GPIOD_FLAG_EDGE_FALLING) |
+				   BIT(GPIOD_FLAG_OPEN_DRAIN) |
+				   BIT(GPIOD_FLAG_OPEN_SOURCE) |
+				   BIT(GPIOD_FLAG_PULL_UP) |
+				   BIT(GPIOD_FLAG_PULL_DOWN) |
+				   BIT(GPIOD_FLAG_BIAS_DISABLE) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_REALTIME) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_HTE);
+	unsigned long flags = 0;
 
-	WRITE_ONCE(*flagsp, flags);
+	__assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
+	__assign_bit(GPIOD_FLAG_EDGE_RISING, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_EDGE_RISING);
+	__assign_bit(GPIOD_FLAG_EDGE_FALLING, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
+	__assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
+	__assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
+	__assign_bit(GPIOD_FLAG_PULL_UP, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
+	__assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
+	__assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
+	__assign_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
+	__assign_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE);
+
+	set_mask_bits(&desc->flags, mask, flags);
 }
 
 static long linereq_get_values(struct linereq *lr, void __user *ip)
@@ -1404,7 +1417,7 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 		 */
 		if (!(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
 			continue;
-		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		linereq_update_desc_flags(flags, desc);
 		edflags = flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
 		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
 			int val = gpio_v2_line_config_output_value(&lc, i);
@@ -1660,7 +1673,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 		lr->lines[i].desc = desc;
 		flags = gpio_v2_line_config_flags(lc, i);
-		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		linereq_update_desc_flags(flags, desc);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -2055,7 +2068,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	le->desc = desc;
 	le->eflags = eflags;
 
-	linehandle_flags_to_desc_flags(lflags, &desc->flags);
+	linehandle_update_desc_flags(lflags, desc);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)

-- 
2.47.3

