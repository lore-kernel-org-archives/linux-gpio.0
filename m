Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530570;
	b=aU3BZq+y7jVmSmGxpaIaXmDQQvvqWktspIy1Ei1eh36DdwJCMBGBqQ/NKZ2FAP/zHE/m
	 MM14FgVSI4XUK+LMnfdc4C5ZTUG/Zfk+xnS8iQ3jRROSismd+bZNtwP+QxxZ20kfXwVLA
	 xsh9DfQ0CDExYNatjLdxW5KFXQW1hH32CuiSKenqm7r/rUtTuXIX8dPyIYff22bqM3JUD
	 qASKGgMDskvdSq5mt+971svH/v3X5jS1HKWl7+X4MPnZnfC8wGsBEopY26oFUQgudZbKk
	 bSFLwcebgHCx9E8EV69Acu4x5+QmcldMi7KbMBEs16yx8asK/MKKh1L6PORdTPWDn+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pDx4ATD4efu0v6aDPCmWB7bmfn6OMyB56XASYCAPkS8=;
	b=h85HRMTu7vwXtaEKYTeLcsYFdGK086iAo6AP2PUvdd3SFpfIeBQ5BmaUhjrNHShwEeOa
	 nJH7Il7j/NnzJhhUWjelBQ86r9HuWNPfUIa/pi7mswVNWZeqxSI+dfZP/KsXERFBLmAcL
	 U5feIK2ejSvzCT9xKajc+Z7Djtvx40e8+bIs1RMHjtgTFoReNPBzM8WTXTEnpSiGnzlLX
	 gpOVCFOkwR0KV5wCcxONwozQJJTK18GZ3hc73pVB3x6wzfcz823A5AFGASDKz+hqc+Uvq
	 rw1yidR4grs2TYGd0MyTmLIyLxWbEIUDjpKvzyF2tknDK8oCPKtntr84qGIxL2P4DnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZVI6eAb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eem6zKA2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348BC606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348BC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZVI6eAb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eem6zKA2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuoXi1291678
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDx4ATD4efu0v6aDPCmWB7bmfn6OMyB56XASYCAPkS8=; b=kZVI6eAbq5bMKcbJ
	r+d2CeYZ/YGlfsOaqcuGNg2Si/NaqTVwYdviVX5kfNxTgaRnNWql1BRUPLiiJuCh
	Wc7z+DI6xi1uY7QygdPGCKX0Vgem0gTMxLnPeZjZgjFJcxj3hMtgnfs8RLH3iI2D
	vxGb0SRyvp27dJNTyBofQv59JAn2BWcgHdpoz5oux6PwoGsof0ejFHvtaSl92MYe
	7gbvh39neZ98HGviHQZtFqMsIQNOapqEZmGMM0ox/R1dAzBhEEhJ5dsh1M/CdBiK
	ms2MejRcKpWXdpciMGoV6JcQvCNJk6jEc7lBjBx6ZMZJNWno9/m/JmMrFuooGQMV
	WRpnSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrc8pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961ed97d6so810962085a.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530568; x=1796135368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDx4ATD4efu0v6aDPCmWB7bmfn6OMyB56XASYCAPkS8=;
        b=eem6zKA2JdT1qmVUAztP1/oaAjWHnqrZGDGnIFZw1m6Uxsfg0D9wJpyZ3ULT2dzKJb
         2nJ0p2Yz0KUMkPszEiQ20jBGo+JlyFQJDGJCS7hPRagxzz9MxDwnxEauVmzO8YEzPkyx
         lADk19wf3UdAseX70wyYS4wI/MzTkNdVJkX8LllyguEJkGFeW0uakpzs09BXiYirhpHi
         g/LV0rlOJ/XqekLKzOylfJVT+ratPzQV7TW3oVaXxGyExHBc5O9udExVF7x1dSWLVWQj
         eD+b/5ZXkJGTInoH7WQGo2N9NAVmQydwwXFd1tsxhScE9CWjf9AudayenWEG6AFav08U
         YFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530568; x=1796135368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDx4ATD4efu0v6aDPCmWB7bmfn6OMyB56XASYCAPkS8=;
        b=ZBWODB2AQq0+ffWaXro03fpdu/k9kCQ0csq8te655M5a+p1usXXCkDE/YwCCrVhIAj
         rrG42FgpfbeEOLqatqEDvbGOZJCtegZkTW08u/MyaxnFsG2J2r9dXo9YEhzWgZJxFNkn
         FwNzzG0xRDu/2gfR1NGlCGcCK6HLoZYI3VBuG8kktTd/pZb+WpnwwuUQz0CmwoXJPxjW
         sr1tTh61D/POaYQzR7FkGEdk9luCKixV14vN5b3a0uv9Y5kBy4rkTITMD0wMNzhBDA/q
         VoIZ8GGQ3419CHymOINFtbVuIdV/xB0q/lyvXj78Z6iQrZLAQJdz2HhqMaCpm9jEWk/U
         LNig==
X-Forwarded-Encrypted: i=1; AL+hErGCmYTRLhl5DyMDWxKByyxry5xzx4lD6CdhRZzG5hsLegUt/brTXqbP1VSneLjQVhHq2VIOtv8LZ89r@vger.kernel.org
X-Gm-Message-State: APuU4Z+dPExe0rF4tbEaI4WAAgs4JnLr0BXgLZXU538LLqygbeNWWvjv
	+rz4HIIxYibNfRqsd7E2fW8/nM9ADNqgPXhKyJ4uPxovk2uZTYs9iDOf+f+bbxRwd3bm8fWmHQ9
	euxCY6bQHbmYFIy2yEgan/OwBOeOeMAvDzPdcEmWBLNemDgeU3bM9Qr7n7JDFzU/U
X-Gm-Gg: AZFdTZenmYRkwijLDKViaHs+8Zth64adRAVEBuQbXZuJ0DOtfLw+NBrM2sEbCbYbW+K
	2FPCg+iaPnAVEamwrrML6pl+OOh833B4Uk3tfwXpn6xU4ulXwT9mEAZrTCAu5Mk49Ha/9j87JUb
	ojTHdFnQVuzTXfmpaJ1+2FlQtS2wfOLi/goCfGquw9LqGoFIcXXZ+SF0I5M8kxeUEaO73GV4v+0
	PLvU4HBEAOXJZn8nbkOdnp+k+GcL75BADJL1d/C0eugUc9Nlm2ZHMZsi735AxHSOGpwCJ6xPyHR
	oYUEDo+qNbZQ+Vc4zAHUiBmVtNcfrsnJvP6QoPgvipdj6OryJoqvM3b1Cj8xqRPalZhx0JpYznh
	XOpw7NiIvKMXxd7EPqyWmlzZU4egl/MF+4iHzIXwPDniLyxTot3AQmt09B/rr9RLIp/LAe7nZkZ
	pD15TaihLk6GhFej6zyf0nRAW5ZGA+i2ixYk5HSiRsqmOhYx0k9wmVnJx43ny9+OE=
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr2743781585a.6.1795530568361;
        Tue, 24 Nov 2026 06:29:28 -0800 (PST)
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr2743775785a.6.1795530567868;
        Tue, 24 Nov 2026 06:29:27 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:18 +0100
Subject: [PATCH 01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin
 function
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-1-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EUwCuVmfEOn7bJ4/3Uy5/L6RffQPBekG+SBlxVb6MiM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9CkmrJnDvplqDSU1ZhUafxeu4dIJqff8AlX
 zvgczEqTWyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wzNtD/9Ytv1UI/lhG7r6aM4/MH+25CRsHqfhlC1dRXBDmv1kxXWzbIC8wviC5YImWjiz1Cg3+nA
 1rebVQz4/X9ULSQaxHzV3f0Xa2RJv5x7urluMzENWj5GjNrzjpMQDq5wGFd1KaRAHeP/hRKlgWU
 /pHe11J/a3Rb2AiAXF5R0XGs/OfYSP2llZfHkTH3B8EckjOfM5DQeCuHFT38RHfIml15Ia6oqEd
 VkfA0myyfrg5h+amNE16rX0Mbd4lv6GjY4sI9XibynQeLwYH40lTwOQ0cFpJcucAQ5MTjuY/q00
 LR6YPamKwN8De7WnmsID94hlr+xLrmftnD78s8ziNn3AdkjmznqDmcGwAkEK4vI1BpLZ+GBl9E/
 17aLa3aKOPZguUYwJiyXQC+QJyOJq8SdzwXY7qqCQQtCg7Cc49Z4GHIia4dH7k5z5lRR9JkTJrw
 BKbKHEjLswPyltgge/IrJ4NyV+D0yMJFVgCop4GxQPVPqX1TgXJypWLRButVfAkEB3UdEruQUVC
 oqMvrSzti6qelFCDEz5yG2CvWZCakpGIvEQSWjm7Q8NmxxzQWWguLsEn/XC8+MeM9U6LD0v4rXk
 SYdNN8qri/4yTDJ8OKjlx8qE2nP1+bjwHiHf+B51dnDu8i5vbN8qw5epcS8yY37UDQostxObqDd
 pOqE7XDOQwMLuoQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX3C2MBtSdl6bM
 I1sEQ746QMXVqj9sKxjv4wqDGYktHpYJEBAewhPjkMCxbF7rDFTSbe5Go3w32Kf2idHwaAJSFXn
 bmYzZgH0BHCRXMgb8MLZMHI+346GFFk=
X-Proofpoint-ORIG-GUID: EYS9ot-op2XVFjtRN8fdA-F-CV4lkxjk
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b059f49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6-PDsE6mYu08rWp6JRYA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXzywit0/pZuui
 j2amb7/EliK1ox8fqGfLok6wHivI/+DlhfXjXuMZoF53jUCe3nPLXcMUgzrABrQ33Yp1zrRgTrv
 lqmP5RP/2t11DDRuSq5T7fp0y1rCCl2dLQkIMvhOgDZ7FVUONNrN/DfeQDMFoZXWw+jN1Uq0czw
 WAgbgX2QsSYJPtl9NVYSWqIN5t78ixdtewHgMPhOsW8/sL1NxRNNYtIeQbwkrSuDQfRdkylLDAb
 nVVdm8XU+eXUgcvzxVPzfYrl2+2gha56Tz715a9RHPB8CcLjN+Onl7TV2LcCKHCG5ALEkdDG+wy
 iYIHMnHVPxbBpkIKmLS2Mb1GTgZvHtAh7lFyUVDRDs2mLhhSO4Iu71cVdSn0tFqJKdLs7sjvP7V
 b/kU5GlGrPjyxGonJPLv5YN59ui/ZSTbyKDHdWsrZFHe1K9OogEyvBiY2Vy31U8NuJlBPKd/V9P
 LNyMw6udp1+7whAXagg==
X-Proofpoint-GUID: EYS9ot-op2XVFjtRN8fdA-F-CV4lkxjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the sm8250 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: b39e9199fbe1 ("pinctrl: qcom: sm8250: Add egpio support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index abf5f68ef62f58eeee3354ed8731d194d6d60b5c..8791b4f0dde415e1dd2e61e2219392782c4752d1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1026,7 +1026,7 @@ static const struct pinfunction sm8250_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
 	MSM_PIN_FUNCTION(dp_lcd),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

