Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530574;
	b=us2+diXL+aZwQ+LhMYhVg9zp0AvYcl25P3M9SwhEmtxeJwtGgwPtV3P6ZIEYcs/b256/
	 NCAj/bUfxIFFeIkr1ZFxIWbmNZcSEIwRydxs8Rhq+Y+qXoTt0slD1MyLKQT7Z9JP7OvPk
	 y7FG1yvDvnM2s+bV5MSvvTKU8VqQGGLRSHungq8Uob64KkFxvWf9m4UK5KkNlFKPsf++o
	 5mb0lI1XLCvrMKD1JXYY+P1qjMWLV4RE8ksR1t7H163pvc4lOkCB2igeiG5oqB1oO42NA
	 an/qXP/lLrzqCb+/hNN+HxefXfbRcof/vcaNzN7wNjQDhfFn2jaz1b0MXWs1V1AptKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HvWZx643LqPhRlnf9WADwoCkaZni9cKPZkWuJnrq57I=;
	b=qIVFY19iHzalayLSBQA+tgE10WVGix5Hk7N/W9d8qomyAuViBhB79q5CPehD0Y0+0mDM
	 IyCAPr+GRoOgMYbeuPy3s4+GQo0p8c7uAioaZ1jnOM/KemLFiPq38ArdZYynm2ASYlcX8
	 jpm7KzE2AXY81hAtRIFNX77Gv/qzxGIibleVy7HxZIZmjgXNBnCCbC0D5Afh7nYzdIrN+
	 dyCXFLZff/Cr7/mi6HF5PxHw1e2nq2LMFECqrQhkATGty/a7nnMgVwyTr/X6i5KIJN1UW
	 xpig+RUqLgreY695OH7QRvP46K9ltdnLoc/d4xUalCdZi6OP/xbTNyLEsdQXER2H3Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAWngP85;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6rWQS9Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7E606A333
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F7E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAWngP85;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6rWQS9Q
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAunKK3299973
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvWZx643LqPhRlnf9WADwoCkaZni9cKPZkWuJnrq57I=; b=gAWngP85nkR0gwsQ
	Is1qfpbaoMDJXOr8amonEQssAKJ0b2OP12Epwh/7fnAGTLUln/anxWTW1il3ZESJ
	Ub+5B+lCgsKACQprvxFgALlSm5v27AdiEiBCUXRuH8DZLqDkOdnxiDF1z0Gw/iKf
	XJ8odqUF0J8Ulplr1GrjXLhEE1HPI15ctUU2fi8uOa7sVQ+1aKvcHZgXNzDyKFHn
	QuueFzqdX1M563xeDewbsCUYxUEWE6r+zXaUoEj4k8j79vdQNcHcIJQeV9frbDI9
	T6hDOOFDULQFm9K6jNZG128LU9SiKx1ZvhuQwMt+J4eHu7OpLNsxdPEQBr00uwWe
	99g90g==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy139t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:32 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-677c2db10b1so7027387d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530572; x=1796135372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvWZx643LqPhRlnf9WADwoCkaZni9cKPZkWuJnrq57I=;
        b=a6rWQS9QS78N8PTN8o3BZkv5VQefhjov/+ETGcpxkpCmCGQgGqMHoj1SXvxYGIPTGt
         mHDZAs69shLIO2SsREwXkM6m6PLCrREntvDJ1IutDliVSDGn8l4eqqttcUqYAUzUzxP6
         dabaKN7i6/34v2WOiUq9HlumIpachUNt6d+HaGBikjJZOHBd3r9RcQM/XGIiOl3o53ic
         JQFNxdfDDRQ9z7XjS7nEBUHUJhg23j+/U8rR0h491Ut+SiD8DC2+WgTVS+njEYNZZEF5
         jqLeF8cIQV1pz+xo+DZwORY1doxa2hmFSRBKsBklVDibe+N/9c14R4u1h4nCZSB/VWOF
         74jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530572; x=1796135372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvWZx643LqPhRlnf9WADwoCkaZni9cKPZkWuJnrq57I=;
        b=tKyuvLZ9WdRAT/SIpcXmEUQfB4H3VEkDsldUM70kRnrBYSkdeyOpKz56EJPx8LHtKf
         oRBkxkRXAsuicL0xVua8JFx2Vc81xH9LhpinszNyLn4MiJP8GFhZrBQSL0VajDW2sarb
         pVigG6c+z8ZYCbm2hSDT5qauzOmpKeH57EhNZ3EepZ48OWB3tGrMA1hqkTbu0Mvw2E05
         O8pcOGZu/LlWBr6/FPUeunCRDVqQ5TWHd66HC2H+busBSeL8n4Kl29PjbPBNUYqQoLTL
         5DzQs/ZVWOT38ly7nfRHY91Vn4+8zeftjZYisO3wqcH0+NzzpMAwBtg7qY4uuGyIHmsy
         801Q==
X-Forwarded-Encrypted: i=1; AL+hErE9qi49DryDr7y8zRb/wR9bGbHbvo/ZsjUwW0pga6/9gLahlvK16iq75fJATba8rh7OgGGpEM25TyAH@vger.kernel.org
X-Gm-Message-State: APuU4Z/qtlA6oB9n50HJ6oaM7nVxY6Nx8CmVOz8KMqAn1T5QmmsqCnV1
	VUuxPP/S8vyIIQ3a7hQhvRn9zKLNjQuHn6z45dsWxK8rVzjg/cs49YFOrE1ofzOWUmf197H8+Bt
	ik2t+jPqMzD0+OH3c541pS2cWrfSp6KKS8InRMEEgiUBIzqjaEJWHQ+OCdIqLCovU
X-Gm-Gg: AZFdTZd85ZS85SOsZlxpPd7hScVV921RAgvHvZEOJChVwK1AI58/p+lORhYRzqyrgkP
	aPDQfNO+RcufKASdEV4YphxrpIxUPvjVyWs02uiPF0vhggPe8lRtEfxh5FtorwfoAbT6L1rJFFR
	Z5naryFBbBJqdfL/sC2ia5BTd9uBCC6xGpn8vEelQLB8orgEQj7uV2Ns9XUIHY2diyntGNdvEsw
	ZiVqq+fcZFRPHcewF2lndYEgx5y5lIaAyLx82lMFyfu/zSQq3psaPkpeyyazplh2oMZ3B+tkpxI
	xvHj5uf8gZr1MBk33Xy9aQ8ZuW6kmXX/wq9NtfVN4hbGm0HQsz5lfI8qQid0t5pg4cSsTCGNyG+
	sdWN1jVtJwW3QXSln2eypmnxTOdNFkS3v6JUS4ph0pRDs8HslejM7IyCpT280lmUF3sJ9/+dKXW
	9qfGb0bSvU11tdb2wJ6R4dK8hD6hautQd75cmFHOBaBWIDS4FVSv+g8ctqYenDVOw=
X-Received: by 2002:a05:690c:48c3:b0:8b3:615b:71d5 with SMTP id 00721157ae682-8b52051d1d0mr46647777b3.107.1795530572386;
        Tue, 24 Nov 2026 06:29:32 -0800 (PST)
X-Received: by 2002:a05:690c:48c3:b0:8b3:615b:71d5 with SMTP id 00721157ae682-8b52051d1d0mr46647657b3.107.1795530572013;
        Tue, 24 Nov 2026 06:29:32 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:20 +0100
Subject: [PATCH 03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-3-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=USFrusBLjzVGtNlhMXFqgRfWrH2nvPIRGCilQGpXYks=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9Chxn/NhPHJWX72S9dfm/NiBX6bAxyubasJ
 EkpDTk/oCGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wyIeD/9nd/vmpqUfnAuZ0wLiZ/xTICrzSJZPqOOotjo9bFbTrk4aMdLoaGZuK8WFXF+E+Ggk89N
 g7jHLzb6cO6J1MPB4IKyZ4TS8CaQHEGbPev5q2mbVOnOyPjlr+BiL1Q6GRHhzaQdzdFUD9zSmI1
 5/dM7dKSO4ygn+92C1GMyjIOe+0ZGuztGZZWklIrS/ITYU/QsfDhDOFpbWLeI2YUcECBqwU7OuG
 Ws2t8PMPgeOjA6EkMgkaFaxPN7GiS9Kb33jsCnRoBtkqmuMQpglkNfmtC6hpGgpdXV7/AcntRFZ
 JmVkJI7w5+nHyViwA/BggYfgL2tk31iN47f7B/NiwVJua14KA9IMymjP1GvhlC1gO/V63Y1zYEk
 lqdLYEjR9S6ydOWLL0BwZF7gD0swMuwGtxdGcaVWvoXnOIjlCY1iEVeMu+nfFgZHAGjV975kRA3
 o4KD9s7xQ5Kx10oEFvCBy6Tv6bdSkxah2k3kr5f9fXjioAC08RSVg/SsJvatzf/hgsvyyMhvyXH
 l3zH9vnUUU7JEE2zJ4xKOieZ5ULJM93xsl++MCv+5d5M45VwuSS4kO4pvTgBFoXiChkMNiHCogF
 bJ5FBhSv9tNdd1DTKjN77N5slnb9IlTMQB3ruGXikknjMCp7HDQZmyNTrwDL29KC1GA+0mSfAY2
 ERtDKxpbbyxmxWA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: b2fRhDrKE-gGLfH2GQTCZL9WeOouQckQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXzE31FEP2DJgW
 esgpQdax3E8anJnI9oFrTw9W8ZRaAuG6OE8Q/588zSvQPh9zG69PWWJ6NXHMmaCqYqWgGnRdYAM
 TsRdk4iKLwmjYCYQv8Ok0ftyESz1ANE=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b059f4c cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WQ8GYrprbdz2Ztkh-BEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXzQL4EdfwyI1P
 ZIu44jr2l6W8oK7Jb9ETa87m0B8pfFmEp8/KxP4KZ4Dqv8BgAFYZYTV4q2qzjqq2JYspQzuCTkH
 8ZjtzDAcz0lJuj5a8ZPAF5cAS+QHeXTJ+vieE5r0NyYYJMGaeuBCbEFct9a+fHUv8bqKlEmErzK
 wrZpcanyyHcRrHFU1Jkr8PJZlCrwrwdAqvwqezxlaZx8gLM/mLRgPjPyBM1C+/6wZnINGWfTskn
 HTXxj6RZp7rnQMg6UZXZxyOm9yuBC/yLbsnjGEIqZctOHTxueQySzJ1j+GAIdPTX/PEvnISZbpH
 ZucZymcLpFukwJ7bLDz7ThApAzA2MIE33S8Ey4FsaW4fNg3SX5L6FYFiXmUcMmg1d5Rdy+1QzuG
 OyR0Yc/S0aTxmwf+HiHZuYUqfTNbaVO+YTHgKBnMScRWiBYrP+OkdPgDjs5cnyK9CM3bG7iPISv
 eTh09I/EDA82AOP6s1Q==
X-Proofpoint-GUID: b2fRhDrKE-gGLfH2GQTCZL9WeOouQckQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

Commit 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins
function as non-strict functions") converted the gpio function in the
milos driver but missed egpio. With strict pinmux, a pin muxed to egpio
cannot then be requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() for egpio as well.

Fixes: 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-milos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos.c b/drivers/pinctrl/qcom/pinctrl-milos.c
index f5079a0ce0a3ea64f301427887af0ac7b32e3734..5dbd543e6057bfba5846bf6e87d4fb6f637064a7 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos.c
@@ -993,7 +993,7 @@ static const struct pinfunction milos_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi0),
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(dp0_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

