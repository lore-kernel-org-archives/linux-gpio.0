Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895544;
	b=a/DDDpCLLF0O9S9sp7b7mUxnfj6KdNnGYk2ohJNQVnwb1os+4mT2pPfmeTeW1r+tvoHe
	 EW15hXTM6JNbd3J/oeCXStSeImyoc9kI/7PP97p7sMAW9ybQbZvBUDhZTM8ZJ2wl7bcYy
	 W8PXwFbt6EL3x3jW830Vv+6huAo630L4jiHzkjMC47JoD9Z1DggWNEZzGrCVPOO9BBClI
	 Ye51OEk2OVyAkbPpv62LLJasbAagw94w5+BuTTkBvIlG0z9vi0OIieyiPr3etusjOFP4o
	 pxvzuw9FmcMPZveprHyDy33zH34lWOFe4dkWZUDVy5h9FAbePbopd9GJnRnVC5FsM9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FcJOxiSipIa3lbkmFsBEsrX/6/5m87I40dDnzNRDJEI=;
	b=jOrdSWQkQ8O6iZdbypdecInXI+ac49NhemEG/ZuMoyIIoEvoXHEZfY01VjI5SUhgOE39
	 bRUTCyoKmYgOJbi3zmoK60cQ7EWNGyIDd9lzDZZjFNEAiQCsOrf28sGSbBr4f9DLdm3Ra
	 oOzhFXAaxSnangUT0COzOGkz8p8/2BaGRPJNJuhnpY7lO6VKG/C6VHhYY+DF5N6fdhydZ
	 lRpb6qu63NF5LOhcDXt7ThBbdsOdcOLGjrEva5p5bM4ZS9WQPzmkqkiHqfd5fNICjJ+Xs
	 Zi90aM1NRqfcCkqEYK0EA2pQV2TuPORzcyk7/JtBtOCZ/qbafQ2bSj8rMY/sSNLBEyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MX3eRFb9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJoEZrDf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A3606A331
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 16:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD5A3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MX3eRFb9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJoEZrDf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ7Pa4134025
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 16:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FcJOxiSipIa3lbkmFsBEsr
	X/6/5m87I40dDnzNRDJEI=; b=MX3eRFb9OrOtCYseWWLyf/hS44iSdGzDyMJ40q
	bcWrjZep9TMr28KmJYNBGVSm21a1JOWLjeGdDWXDEboM6Ucow0NF2dMvhoOavCDt
	85B9QLQyekmWJwv0QRK4/KR2cJQy1nJlbqgLUQ8v0Icnz9G4/uIxTVtLO0EOq0IX
	2DDVepFiWkOhZKDjoyJ7GOLywW9gB4roN5jPOEb/q+mr2INys5H0TzwEtadHV1PL
	m0l2p93mxgYT9+9Srm7IiSZnF5ui4kk3rVOPaxxbcVbQcu40RsuY3g7fuKjOhdv5
	+dEPk4Q//ZrGbethUX1asFng8mbPmp2P8xZj9/GhLT4APupw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksqamef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 16:19:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9907de400a6so442138241.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 08:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793895542; x=1794500342; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FcJOxiSipIa3lbkmFsBEsrX/6/5m87I40dDnzNRDJEI=;
        b=OJoEZrDfXzijqaYJlvdzD5lwXfSUrVmqLljribq18NuWWFxWj2m5jwdrUWIroKlG0S
         eyGsGubV741rom5x4uug7UX1HS9AlRqco2Lu+Nw7RjTTIEDopi6yRr85hGCoKYMek1h3
         rb6s+SMWjctMsmK841MgKpVtFhMLbh3BW8GPMA87G2MLjk8MKJOYDdTCQ/jnOEaonnwI
         jluCT70zKRzkWFtSnOG+cFqcHumNdFZ/w0fTerxL/gFfW3sjOBEkgmNmFb1j95kTOsbP
         Tg5jLaUbizGXcmXaTP9iTBZLIBxR9XmewkZ2R1Vo5ruu22b2NxnmwH6WYkyQAwoSRSuL
         Grtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895542; x=1794500342;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FcJOxiSipIa3lbkmFsBEsrX/6/5m87I40dDnzNRDJEI=;
        b=b1Xkno+BTajvfklvARFNPSQq8i/Pok/tr3ms7K5EeAKPrqt+Id5h0AWSl8dveqQELa
         O6j/KCyk2osfkrw7hARORgNCNOXvKSK5Numf7UpMV0QlQqVgJroc6iE4Va1Nk4C8jkna
         bvYNm+wRaqkDM2MM5SreVSLlFXXlQpXHN/FYTBbmBapLD95+cvg8iQ+uQYHuordNnNc8
         yrtz9d6hUxVadZk+m1leOBwQqrCuz3lP98YRZUHLt1+hbfeBPhHgFuQuICzNgn7K57YG
         Z69Ebzz21oK3B4ncj0LpJsLlm0sMDEur6GGGWgmphUOmzNV4A6HshuIcLSlIZMFYnXnK
         UTcA==
X-Forwarded-Encrypted: i=1; AKwUvBw2IDKC9tR3kk9tpQbayNqyc5qf9skNFp77YapX5o1VEmQg+cSyNRth0Ru/WY4uXLfuhgaDEuoUdt3a@vger.kernel.org
X-Gm-Message-State: APuU4Z9JwbZsGdlcibOkJ2rDuhjf+JHO73o6uqtmEVJUmSIORFCfgR8t
	XZIzBV4sF+2g5jrQCU+4q6wtc1ftnoleFwezj4uX4ioCFightNk2mDfLhRWRF3S3BDSwnJMmLZe
	3dJOaHJ7xzOHKHmoFrysrdB26uUrKPDW293sWQxcW+SnWORGB+7hapQPXWcz9r8xt
X-Gm-Gg: AYBFou387lIjBv90domNW1PyTSehe43ZaR3IMJY95vZrBM0D833yqp8USXz+KyIAnQ6
	zTKFIS4kl+mCi/8w090Mfm7t/9Vmt+/Q7Ie+KWFTBrqOt6OWw0LBshHPgro6Kk72ipdFED4Z4fe
	2q8wOaC9yvvrDhEVb7C334Jnc48ngGPzBpzKC/CGDbMfQddbCdku/hGhJ1jcWKQZQcpYmyKYH8M
	+X/vEojZ5u4UKCcMFzSeI/AJDEtyLQiXgRQTasdkAJKahyrV4mZumQ+mTMEvF4AAbiYNmPbV6Hx
	4BYabCD/7P82MbIWExitTJ2egNOWidfx1nrUANnukzi8xZ3fp9L/qPMxiu1GeSDNyY4vVCkd4mA
	qWLd1/EwfMIQNomSrTK9UUPgFawPdNR8itvoML9y/XJns/rXvh+dnsWPnkFjzlnROLC2WheeDCr
	TlWA==
X-Received: by 2002:a05:6102:160c:b0:7cb:288a:b66d with SMTP id ada2fe7eead31-7d2a15989e3mr3552137.20.1793895541857;
        Thu, 05 Nov 2026 08:19:01 -0800 (PST)
X-Received: by 2002:a05:6102:160c:b0:7cb:288a:b66d with SMTP id ada2fe7eead31-7d2a15989e3mr3523137.20.1793895541369;
        Thu, 05 Nov 2026 08:19:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm10593388f8f.56.2026.11.05.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:19:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 17:18:57 +0100
Subject: [PATCH] pinctrl: qcom: check the return value of
 qcom_scm_io_readl()
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
Message-Id: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHCs7GoC/x3MQQqAIBBA0avErBtQo6KuEi0GG2ugrDQiCO+et
 HyL/1+IHIQj9MULgW+JsvsMXRZgF/Izo0zZYJRptFY1HuLtFVY87b5htBs6khUrqsmwo7ZjDbk
 9Ajt5/u8wpvQB5EjblWcAAAA=
X-Change-ID: 20261105-pinctrl-qcom-scm-fail-3a5a2efa79e1
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Ajay Kishore <akisho@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z+sYRV3+E9NWUPA5i/L8SISI8LUGUb1V03d4YnL6uZQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7KxzpQS1HtT93B9G9ebCHgZUE6sRFu/yTU+MB
 roULgGzvqaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyscwAKCRAFnS7L/zaE
 w1dkEACHi+NWYWNPBSDtUdYOsv1S2zl3Y6zL+Zue8MJ+VGfhxZQNnUqWkVzO54aA+DhdIHC6Ldo
 0U0OZGmZqTHDPwtM8aFRqPkekhWcS6ND1O3x6smBGzQqy4dehF5NRogebbs7nJDszlQ7l1q9RuU
 vpCIT4kExvHKNK2FK18S8kFy4za0rTZYwa6uy5SchV3WV2BoSRIEepNT3Mpwkg3OnlZCDNmlTsF
 hudDYkuv0vYk2gjKGN6KI7felVAMfU60j2nQCvtyMGAl+3na2XZFh9NLO9LITMnMpKNt+iuOk9/
 8VKJowPh48eWyALmB8sq6dHFUJGgWmYGbEAkQMiVacYLBVaYzPoRx4CjX6QVUC72HCnvSoHDssN
 1GYlwIQFIMJ95bK15CN5x2ApBxhl1j3h3bjgAHxlf7LnWabxPqMvalIu8ApAtv+oHUE5JO9Qwx+
 5UhV0yvFsIFmnC6reTv2F/12iAYcmXrNSTjkgGnwtklPNhzTkpe2J6994oUklkJtkNDZnVHFR4q
 Kjtn/p+NdnRrvKjnTNTm87x0fGh5COv9FbjU1+yfNf1ibrK6CF52kty3ari3OsMV4xyUhkJAPYZ
 l2eDNqlWU9dCaSIdF8ancsPN9THf9kEM2o2yN3HZznKymTXWIRHTAOVpPimMklAosmDyXLpVjZY
 PgUiCuAeGe8D7eg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX/pSuhGBMP7eU
 U7X8C3fX8JODTRx7trWSS7DaxDyg4/G4/HFqzXtdNDyX/k7svhEH8bynYY/nvHTe2e8Cybrksh4
 KXHkz8YOqfNVZTs7AOCrf/40Axc1Ba/FOQHit7uKfOf6cY9QK3EzgQJm6eAmxnqKAqFMDWzj68m
 x9UjjrRszpTOyShsckqpuogWcmKlKjYBDBmBSeelW0Zm4cDh7YHiVJDnlxGzR7mWC8WtZyXoHRa
 DaaPr6RZ3ZwqmYRKgbOKLd0QIoLG4EmhWWmfphhSPoI53T9HZysvi4uUAWgFiI2fKtsFw4szy/4
 zeiqk++bZ/YqF1ZTdfDdVlqpjck3evvW04OTa+hMzAk1SzKPl3nDHA/oA5F1E07FOAzuHoVoqCN
 pOp+SHot23JDP/y3PhDfcNjQLG1kehK4MsmgEPcA3lERZ5CrdR9Zt9f1Rc16SS84Ru+NuCPy/SB
 qlD4vb3qE3EF500iFww==
X-Proofpoint-ORIG-GUID: 2auEHtzLfoXuU7yotFr5L7ToKUjfPl31
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX2yMWl/vJSmq1
 vCChaSAQVCIBTVQW1FBVewROPKkHkJ0598KcXHDor0s1Z34+mkWIsLI4qkbdk2RrnpSBLba+as3
 N/rl3/QsQi38y3OpZnRJEqgbKtn6Dts=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aecac76 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SLtZePgESXxLFGUVpRkA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 2auEHtzLfoXuU7yotFr5L7ToKUjfPl31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050064

qcom_scm_io_readl() performs an SCM call and may fail in which case, the
stack variable val remains uninitialized and its contents are written to
HW registers. Check the return value and bail-out on failure.

Cc: stable@vger.kernel.org
Closes: https://sashiko.dev/#/bug/linux-a5545ffd-48cc-4856-94cc-4b2dd7968f50
Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 32aa7b919e24a0e614078ddc70a248c746e4813b..0053d1d927dc134ee81377fe480befa2da87c7f5 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1117,7 +1117,12 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		u32 addr = pctrl->phys_base[0] + reg;
 		int ret;
 
-		qcom_scm_io_readl(addr, &val);
+		ret = qcom_scm_io_readl(addr, &val);
+		if (ret) {
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+			return ret;
+		}
+
 		val &= ~(intr_target_mask << g->intr_target_bit);
 		val |= g->intr_target_kpss_val << g->intr_target_bit;
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-pinctrl-qcom-scm-fail-3a5a2efa79e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

