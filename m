Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318431;
	b=G9wdpJ5vYFIDWpGypLneSXnQQb+RwP5dvlpnaqBRFWLTNeaA25GUmREw8bytG7Lh68X4
	 F7UDoi9jvBwQy/gp02Ssy7bhsNf8RRZIfszEUqgNmYR/GCDcBartRKfTD9y/UHWd5QRgb
	 RvWiclBvGra5NfzNu/NbdR4mzpCWIKv7Pip5I+nl43pNvtzLPtHCXv1SJiD880mdrzQu2
	 AIYnUkxLSvE60cjS8jwk9j9BXLtycdVN3LyoV/zvzvxRSPbJSVkuYEmxIIMvVpmphGbkt
	 9jWg54re4CzyIhajq6ZFImkqrGCCibbGu6mjCKzzxeyamQ3ctR4e+vwjdx489f29hFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LDxrpSTjR1x207YXRGbENckCJGicT1QoyDbfvYZYoM4=;
	b=MnhHdhWE1v3fpBsdLfuJ/kH59g9R1CoOoj7jjVvDyboP4Nv6wijkQ7apQOurbWOJdTVF
	 zd/CgwyvGh0JYOkF25MMBr/HDUM8KagWeYBPuRlNYnqCYzx3Jvb14HBbbL8MASbRtyeJf
	 yktjpzNh3PocC9hrvfi9AP/3QJt4lJ6erWzWJfomxjeoGqpV+wismW15Lzc52mG7Mt7TA
	 zHBlTFifW856v2sX09zaA6mVB4k6v1gNOtp4F+dmhohIGLhaKV8N0UB6lRc0vkLT+2cj2
	 OHjF/mBQaDe1iU05ugN1EhKd/jGE/heMH/ibCxm96DOVNvsVJCW1Oo534dmf+sR3fwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw5g+aab;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fosvUbeC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D189F606A33A
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D189F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw5g+aab;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fosvUbeC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAbPY3850919
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDxrpSTjR1x207YXRGbENckCJGicT1QoyDbfvYZYoM4=; b=kw5g+aabvJBAkXhH
	TWtO6NzzojVwT4KzPfrRCdfOuh+vSOtOoj5fBcsYMyoqDmwcwYv9uy9yH6Oqq2Cg
	dpUXTxUrIZOuccCh5Y560MtFpjbv03XRxlI0k7cYKNsemEYN9qfN3JMqHB9ukCaf
	USDTuX70PmhS47ohtWw7RtuiYg8EnRo+6888rEkRkEFTn5YUyToIh9UDjecf5h9d
	J7cZt7fSy0GbE/jb7VxIuP7C6h2TREv9DiBsR6t0p71m/zF1yYHdoxwTyFVFGMbf
	jyMp2K0LHTTYPEyhMoowDgd/3Nk4GKVoBw9k7e4LrLogTYK6szR+naqcJ/ULDOuf
	NpyhlA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx84xde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2c415bb8fso365102137.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318429; x=1794923229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDxrpSTjR1x207YXRGbENckCJGicT1QoyDbfvYZYoM4=;
        b=fosvUbeCFR0ScxBEKjM0KXSRVFrAcNodvJBtCSyB48I09FtDEZbNic3ebyqJyxOvbi
         YMkBZ1x3pdAThKKnllj6J4Nq48IDlsoydaECPYYEaA6Yi/8I8CZP7wu7G+qEZ2Mt5hI0
         TgTkEAAcZ7PjxR+cTwcHZT8dVEsTW83K3rn5zEBQpdscmFvCVzWVrNRvMX4YSH2T5eGh
         ZD10K17NuzIYKYEnMB1t1T5GPKKArWdCrVgzwrfL8kpzxJ7hh39tSc8tV2UP2MrESfUw
         CRVL57aJM2X7PMzjglUoIA+UVcCKsrw0VL5BAV7z60Q+W+wMd9+VL5d1QWUtSdijOPbP
         hrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318429; x=1794923229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDxrpSTjR1x207YXRGbENckCJGicT1QoyDbfvYZYoM4=;
        b=e/KsRsDbybKKr2cljbgCaaqF+8lBHjJtfW3i4UsSpiAn8dx+a65LfhQqDFiLlGanLH
         GiNosxsmHuO8lz+68KjppDQxqOmmQfNLeeRTPAVUkT3aUNBp3JwobYdWYsW8PYl9HsrI
         nXor2qhSUNNp1+QXHdkiTuI+LF7+sjyQQL7VYXlR/RzWn6Q1Ij1j2AsdfL1+BpzyqvTE
         cPc0YRwf0N+gVl73CoC3droZ3xXEU67qdIN4mFjSQ1qmJS+HsF/iDVyWWkEgZCh3KNLD
         uimDIQqUQDZT1BSxYdAfl3bWMD44hkPsdsTdDD7rzcKA5XQSWlAVn9dW+roHZVyWoz98
         Pmuw==
X-Gm-Message-State: APuU4Z9SyMmiYKF5sS6hdpS9m5dU8M3rW5mrF1q98Lc/DrMWltGhs0dU
	r2RrGSeSfoP2B4hGlpYO5XQm0qxrSlsHPImcUy9VxS0wlaVNVyLII6Ul99y20IRe3ooEypP5P22
	bIsPqHMtW7pAdkepAwXb+sFMMKnPA0eYy00MMOP2Q21GzmIfYdt7/vaJN4cmAMg53BqNkW5EF
X-Gm-Gg: AYBFou3RL9HF6CqtW5Wx4paEtqHsrROQBlfzAelyAiwkNCmuA6bsmAKjKohrryuFiFx
	A/s3afgTAfd6GcQ1HGsS5SlnE30we2O9lrm8J1n3IT8yRx4bmldZw7AHnX1boYJybBR/Jv7LQeP
	e5oo10iJ4NsDF4ooHMukiHsVQdCEkjQ7Fl0Rn2bpbVhHMfhiBzNwmR1qUpcqhBEdUXBDcOJAYNk
	WU1Odm+2A1fiNeFI7i6NZgVgBaHTq0KJozz6FtiokCMUtz3GT+PtJNylg6P9vIaDOlAW6buMGbo
	93MqTBOG+3sPTH/vfy9znjuggtlQ0bc5Jpany3GJtQtO6rkzaSM3znnJRFxa0UQ1apxKEffifdu
	+Mz73JSWZc98qo9dxG4WQor6au59hxjQhF4yD1rbgLFpTFlXZ/MB4ldMLS590sa8ae4pqc7QEGM
	fNJXF7YiMojR8rAfJXgI9/Q8gnMAqKly6L/4j5K5SPwXXBgLv+vhpf/LvjPjuduko=
X-Received: by 2002:a05:6102:370a:b0:7c1:6de4:9f67 with SMTP id ada2fe7eead31-7d301ab04aamr717323137.2.1794318428831;
        Tue, 10 Nov 2026 05:47:08 -0800 (PST)
X-Received: by 2002:a05:6102:370a:b0:7c1:6de4:9f67 with SMTP id ada2fe7eead31-7d301ab04aamr717311137.2.1794318428229;
        Tue, 10 Nov 2026 05:47:08 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ad9sm75913445e9.5.2026.11.10.05.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:47:01 +0100
Subject: [PATCH v3 1/5] gpiolib: don't overwrite the entire flags field in
 gpiod_get_direction()
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
Message-Id: <20261110-gpio-desc-flags-atomic-v3-1-2f463bce8086@oss.qualcomm.com>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WCMvGrs2u26s3lWSOpOqkDNBquBfAiITChjb3XLJa2U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8yBYfY0Stc5FLMf6u4h3pBHfM38Dhye37GIzB
 jjR0jeUgy2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavMgWAAKCRAFnS7L/zaE
 w8EnEACyn6QziGCeIMzcjdSwNQbWeiTpCsy8Vvuk7aKQdPsZCQWKQ2V2HvFuadkQWQTAVZFoo/M
 hggqxBX856AdJ3vHJhOIWZpu5gCpLwJTLSvEHI5m6Mz6flFVmrX8w3picd/sqdlGmuacifk6XTR
 dupMrLAnQERTfPjtgR/Gz0ln4EOVwlP4bVkSjqraofu6IDiHO84I5Qa1ma89NwnjDMExdtrJzuC
 jeS5J/UB1mDl577SPRB2iI7TVYa+AijVuRMMAeO52yRIEvW3Z9TxT9jKRoiPokQogR6my7U/k4K
 dOMbQJi6i9UBTWt4FkMBnUo2pmCuJAKh4Ex+mEdn+7V12AGawiq2xvS+f1WApYT63J85DuzvK0n
 iiRTXu/YlzWbPs7h2rQt3pulYZpN3X587/3Hc4+IY0rVBIlEPeKE2f101PaduDtnat8kUGY+SU9
 DCNm/1abqyMndRzo1b2EE5kUmy02uccGfsJBkAOA/+A/3bUWltCsnZv9ENrNZhDKLLx+8Zybk8/
 d7YHVY7Aely2cs6TpDzD5Sd/6ir5omx4+L35Oq6Pt9vdwpCb+eYM1ejWqG48vGf9AWdG8BjoKNw
 Cp2huQ5l7ZskN7JIs7P1sFIpDo9agCjNqBY26lMn5uGYqCRsfZ5IdVo7HJPnbjFHO93DBB7EYdw
 gVOG8Rq380Of92Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af3205d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i4ZC8ekb83Sdn_VXTnoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 5thJCuHPSGczSNEMxLXdZoQnplG4UtNq
X-Proofpoint-ORIG-GUID: 5thJCuHPSGczSNEMxLXdZoQnplG4UtNq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX2JaSsRCrL1Gm
 LQeEVKWW8HoFneFy7dO0RMeUMqkDGllDsmtiifA3XD5vs9GN7UZ0tJ9m8NYuwa37XjU5365/oe/
 KW+nlSx19sa1OcJ+JrFLnnkDW9z46wI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX+dVKInpUINqK
 8OqoPhD1YmTYlZ60ounL7oRx9SvLwl6VZ2oncDJA+UwTEeCseJoRaTQtmgo4sN92ILLS1UdoSmU
 29f7Fi8XL/8a1S1RlSYuP4xaewuSGwVgiZicENt0miszR0fTPxERuOTRJvWagWtAKx0DeBiUHf7
 wnYN5oH8xLZqc/qLA2RzBfTVrPpFrhcULcd6jAHbFDatSDQzB5vwL7qipy90itLh2Ba5kjPr3iE
 UZzo018B1ThfVKihfchUvCLIO+6nr9P44p+wGuKBGoQWJVhLaTitLwvXqcHZGhrGbkY9tpTwtvG
 f5ZW0z/9xD89GzCFMP054XbsMk3Aq365ic9QKTED/Snth2F3qnvnLXJuOVJZHn9VCr1jS1S2VL5
 JSRU0KX2RfsDg4yhVYkiMK74H6fXO4Mt31eSALudwbiN0RmsDTBWD34g6SPdkMw6Ly37h07lAQx
 SNvWnF791N9u56f8vfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100054

gpiod_get_direction() snapshots desc->flags with READ_ONCE(), updates
FLAG_IS_OUT in the local copy and writes the whole word back with
WRITE_ONCE(). Any bit that a concurrent user sets or clears atomically in
between - for instance: FLAG_USED_AS_IRQ from gpiochip_lock_as_irq() - is
silently lost.

Update FLAG_IS_OUT with a single atomic assign_bit() directly on
desc->flags. The earlier READ_ONCE() snapshot is only used for the
open-drain check and stays.

Cc: stable@vger.kernel.org
Fixes: 2559f2e09211 ("gpio: reinforce desc->flags handling")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9282d9874e1109b7f030a3e83598ad016c2bf629..1285a993a1ceeff719142ad019451d2e9af6a520 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -486,8 +486,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (ret > 0)
 		ret = 1;
 
-	assign_bit(GPIOD_FLAG_IS_OUT, &flags, !ret);
-	WRITE_ONCE(desc->flags, flags);
+	assign_bit(GPIOD_FLAG_IS_OUT, &desc->flags, !ret);
 
 	return ret;
 }

-- 
2.47.3

