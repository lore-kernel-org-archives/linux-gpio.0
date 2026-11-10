Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318432;
	b=ekVMZfchnY/WuMS6nfA1coHfyPGNnJojWHj2Vsju495QaKomeYdzTqAbYCFHjKNdjYUs
	 yYwEkzzX/RkJtlZn8m6XC7Zze767NFbrNOaXWxolYrQ1cRNCSURNFzdSFdp7mMmSjFZ5U
	 qTJbsKYsvR34R7SUXVcglqRvaSi5W2+AawGVmcnZCUKQjXnI0cDexIGgtze7tt5CcqkJr
	 /uKxk/nJUoxACOLTmcKKBBPRDMtB1ty6pAvyx5KhDPth6JOk9vxOKLhvMIezWVXXaxIEZ
	 b4b+jq5HFjM7lLOPIIt6FE1NQYwDgmd79vzhIE06uGfeh3uGlo9HBPWJpEbpW8SNqDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TQeRYkQmJ7tDCHRVBmpwt2sZ5VPFxjPdGPyUcZkNU+U=;
	b=gQ9yQJdCxtLOTt1XDKDOAGzGpRxinGRpylz4BJjEsTqpXNiDjhL4xBguYcO9sVrHdieR
	 VTIxZLLcZxK6ITJoT/6Vt6ctn+SxSrfNvGD2pE9QizhOJO5txr2zLXo83HyRVEqpN7oQz
	 A8diiYJLmvKnWOe3ZFOIIHtxLHWEy2eAZzsPZwaPUiD9BZpHy+vDnrSF2VA14+4RlZK95
	 qcD4l3RNaCHpVydcGkRpbrP/OjpUSGV3T1O6RjT3npbJSt5re5zA5RQjEwfgWJCuwj0xo
	 cONESJh7HrH3Qsouxkuzat2N0LbcBYe/Oz3nDg919Van7keDTFhyTJnHJrB+rVuhCZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HibgPE2C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhlGcwW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3741760A2619
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3741760A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HibgPE2C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhlGcwW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA6Wv3217038
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQeRYkQmJ7tDCHRVBmpwt2sZ5VPFxjPdGPyUcZkNU+U=; b=HibgPE2CYo0ZoCjq
	bn4Ej/ls73SqO81dC1lhA8bih6HhHGyKLjwtrdIoP1EhnB5CG4fVz3n8KTFSTDul
	JLXtOXZWHnmNOqxKka3Y5ZZXBCFe5PC+Uq9JBoB0jckXtbSMilOcSZpOleD3IEOd
	uoDjSgh/9iIzFAMzrctJTD0dbr8Y0XA/KMQRHJl358ML0/nBMnhfAFkO9/kutOJJ
	iPjDbzhUa5S4agHeous2cvJd9jSUS0wxHHuUNae5sE9CBXffBSmbNC0+3VnzjoEO
	MN6JhITI+KSvqvzAagYsISClUKnq8eKsss4rN49xIXjBeiTyun6MKMhUNme0dPlo
	8BcpNw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd9w2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc37ee6562so176556137.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 05:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318430; x=1794923230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQeRYkQmJ7tDCHRVBmpwt2sZ5VPFxjPdGPyUcZkNU+U=;
        b=YDhlGcwWs8ur0o6n3TYZqJOn0noq+rnS67dbJeA06iZpCdzCcgyKjgXE7A7d2maOB5
         9v8yE7PR2dh1PEFRxPcA81C2YVkfEBoOTvNriX4yzbgmfoxTkBzvYeSzvg7mblM1yeGm
         KQrIqP8q5qseZr1iSa02sv0X66+xNF6ckrUmiBToxBZNQ5i4RUl80jxh+4lwvTKlLOuT
         dBbkLqzZPV7PWtWJFvXDDjkCcN03aOXP6ivPrWR7VBLyvTYuhQi2pWOHc/y0MHPGxy7B
         jJl4FkDJE3W+021bMlAD+gmGWXllOUAO4BhqD82/5to34fpz/6iHCfFmxhsa+JNAICCS
         eDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318430; x=1794923230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQeRYkQmJ7tDCHRVBmpwt2sZ5VPFxjPdGPyUcZkNU+U=;
        b=PhvuMuQqD5/XNdI0leVjkEnjQC9Am95vklf7mz/D12j3y0dqYa0H8Xw/IxVaP1SOtu
         EQr7yAfcmqsvAzDfdqYyE8dFXBOJXoh2FGIzFTpxjNj/8OQDEg5TrLHP/Th74F59dkBN
         D95BMAw/sPi3LHd3/HJp64br/HjlirYjWyreYYcyyX6lV0jKQpl/3HBjtIOXPXpop0re
         wzu5FWH9HaqrUKAyX/qp7YkYRX4lWyaIRhLjvu3JehiRo/2oH57Qc7XX+iu9DA/qPofd
         5ZpYmpKydsMlSseEpRebfbeh21dvDKl/kLL1l92CMCmZFVNcnJwMAFZbiSymaTJkJfTb
         tKKw==
X-Gm-Message-State: APuU4Z8+ipKZ24dHUGz4oWKcrtT3TJsW2dnKFOO9lMMh2HJ3/UGSY3YM
	OiGBXbhzMXxv5k57Gpzryk12jr85lsvug1dihyD7IB9lErOxAuEz8PnG28MoYJXJ1fe+qZWbSxG
	fDSKwxLT8D6kleTxE9f1B45s9dvL1Ee+hLrf782Jgg14Jd5vV3j1RahrJgA++c0DL
X-Gm-Gg: AYBFou20rPaFWMpa4454ITlXPWZ29AHaPYnhvfbw6U6A/JZ4xLCcoKugEjsnP3K6eoB
	HUreoAkiK/EqbkT25acJlB9ZLRCSbaMU9GdSaWvc+h/D6dRrcyV9055r0EPa2XH2WB18eS+Fjec
	AuZm/UBJxbCwCgfSRM7sNCjDbildoxFzVzWQQoaY6Mz8O8LnjRTRzXoTa2sZh2q7HJlE9yQ+WCG
	fYzagY03qjpbMXs2Qt89t8fpeGJ4KK4f3Rg3C3Dg/V62k35BYBEySLAww4xwBR3Rvar1/u05L2W
	XTwicGwXxpvvcoTTKA9ViFPuUfjlz4U8gJYDCcWgGQjvBypDe09OuiH8h8JBOS/KZydGBG7wnIG
	iZne41fREfm6jY6gsLht01pc1akAykhsUu/qvBwPid0lOb6uHKH9HkHbvOhP7IjWK6k9WBkvPg2
	jxeP4GsuyCm70UDazexkAIl7SlmVyxELAagdj6mfWSx2VQlm3tlmomaERPSPbtvXY=
X-Received: by 2002:a05:6102:418f:b0:7d2:b21f:ce1d with SMTP id ada2fe7eead31-7d301bf6bb0mr655111137.25.1794318430514;
        Tue, 10 Nov 2026 05:47:10 -0800 (PST)
X-Received: by 2002:a05:6102:418f:b0:7d2:b21f:ce1d with SMTP id ada2fe7eead31-7d301bf6bb0mr655098137.25.1794318429980;
        Tue, 10 Nov 2026 05:47:09 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ad9sm75913445e9.5.2026.11.10.05.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:47:02 +0100
Subject: [PATCH v3 2/5] gpio: shared: use atomic set_bit() for descriptor
 flags
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
Message-Id: <20261110-gpio-desc-flags-atomic-v3-2-2f463bce8086@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4MZFB/JlsIQls6voOiVQ+Wibv3mjdrlerjol78TPPcc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8yBYx4jd800vQenp6odZ1Gdf0mNQcvRrYNO56
 oaMo6LneDqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavMgWAAKCRAFnS7L/zaE
 w1UiD/0ShLDYH0Rohl7UYOWbHwrWX1HDtQKjUTTjjWLmjVOmZuUr4RjDaPaw40o0aYPD1NIcgOa
 haaMVUDQFtphI1BwE+p0SuR+AHXwR3FRbCuinhJq7VlIXfF8BEGDCXVV46ledJkDQL480Mu6eHY
 3LELcg/aOOjmKH6j/M543xc2X56LvU7AXOMjmontWUpekKMnZeBXLNZvlxxGRv9dNP3P1FshJBb
 /UKAil+H7abucpiRiXsDttHojdsKH9pBAAp4A6b3rA88J/YEl67+qxDXLsVcPqBdICuYfhKhpPG
 TJxO7+x3br0hbKzTkgVbw20j8y92/uDU7dyMm2UZQtAcDdkj7ecEp7fjPgnnDxdpBslKzkgi40j
 b80+t8HnNH3kYy0VSh4zrZHT0N7tjhtrYqP3+/FPraYeal4i/28tdzBmlzX13o+LIKuOyy6Hzmd
 swc83vDZR2tW1DeVxB5ICa/vFiXYjnncMTQe8kin5b0qP4VequIsFGox48qoGgrPrZUjXxYPRBl
 Sk6tfD5l1hCDqEPMIQP5eR0hNOT39hIs/2TxleZd842fs2mkV0CysmHlYb8mhXSWpH/uB6ZX/pW
 uGJ6/reMo0X0QMSKnX3V4LObdY80VXIVUA9Oz+W617HK1Xx/fam/42VPg3xsEd66cUlnAJcINGR
 unpOfhPwCUvZl8Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: HPpdr9VaGOUZHacASLtdJu4BFi9HkLMt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX2JalTviR3EH+
 KZRKa5VfZUVAEBF4z73kv4L+To8jjF3D751iLxu8C1JIEiNLRcNdQImq9iPj3qP8h0o/rNGBpMj
 gjSGprCpoWMfpDJzF7z8FmM9JPYbrTI=
X-Proofpoint-ORIG-GUID: HPpdr9VaGOUZHacASLtdJu4BFi9HkLMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfXxeaHWZl4lNaH
 jFhPxrX52aDp2Bw7c1FON6EDqQbbcn7G6UeZ6lrGvsKw3vqz8/VC4FpE46Zsm/ULK/4KP45hurS
 54zDs7KiW/dwvy/E0+LnwQgXG50/HxIWTHv1LtxNTLKwNzFU109ZWL6BE/dSELv9kqtztf0UrDZ
 MBfE0fl0WtHUrMvWkNU52Ay4l1TCcVTKSSEazsO/K4ZelAHiZueDoDBcehcjf6qUpX552ZhDP08
 XYB4OYDmqFK2kej4quqo5hvyrJJkuEwrv8ROPfh2O+bc4QrdmVjids/UcJpY4mIhZJJKr4BMrw2
 nfHGU78lqdiSo1nhZjMd6zTkAnoaDA/kzbQnxaLL/t8/VHAfYYU/Um2TRsXue5fUFRnvkFjL/O0
 W1ULi3cr86ZczdPf34MVr1qyb9fvsPG6OFc0ZZbw9ZCcslsUbG9nbad8Bvclp2tJXxBtS8CQOzr
 jlvR1S340f4wgU3L3gg==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af3205f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H6RLajfuJ0QrpAsTGAkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100054

Use the atomic set_bit() instead of __set_bit() on desc->flags so that
every modification of the field uses atomic bitops. No functional change
as these run before any line of the chip can be requested.

Cc: stable@vger.kernel.org
Fixes: eb374f764a70 ("gpio: provide gpiod_is_shared()")
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..7faa5109617018af84896163f3602ff7dc2ab62f 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -532,8 +532,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
 				 */
-				__set_bit(GPIOD_FLAG_SHARED_PROXY,
-					  &gdev->descs[0].flags);
+				set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);
 				return 0;
 			}
 		}
@@ -573,7 +572,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 			desc = &gdev->descs[entry->offset];
 
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+			set_bit(GPIOD_FLAG_SHARED, &desc->flags);
 			/*
 			 * Shared GPIOs are not requested via the normal path. Make
 			 * them inaccessible to anyone even before we register the

-- 
2.47.3

