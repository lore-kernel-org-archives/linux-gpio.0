Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530585;
	b=28Bg3lSma8S6qvkpmtkHldxKmJw1+Hd2vn1GOB64Mrbv6NUIgbcaV7XNZ5qcU0529ABI
	 EVUldhss7F2jHxqNU2GHoRnbMlEWPO4I71YN3att8tG10KoUdUIUYcPNjXSzjZ+PFJrBH
	 gwn2cBV98YgPdp8sJpCAunmaPHcfwhmAWG4gIBQ/WHhLdbtBgcns5Cj5jsJhMgZfp7G2F
	 9ubIrVIOjNzWAYfy83w6ftEhipNH6p1wvmBiZpvVHxYGmOLHlzpyCN4uGDhkawniEnDjG
	 0hjDhe+Y+Vv3QisYVy6dvvpewPV425WVOXDKFREI077NvpJyzbl9YGryRw83qlIdofQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GSdWY/O/F+Ype5FZFnjwSsiuRFnCFUFO39Z3b1DQLTE=;
	b=Uh0rdKfK0rYE4FjKMgvaQjO1GmGfOO6rw2W1WOf+RpScjIDj9nbhVXec11UlPLJZOKhR
	 LBI8B2zRa7pb/R22bSF4OYo6KAWtTTpSBQ/7npn1R8NZ5+PyAePpS19Li0Z2iE5/AvaN4
	 di9UdEOpDqn+An/cH8fQXmduN85Cy9PHNKJShUoXFfJSaf6sxTs3UP0GEdNFneiDZrxU8
	 AhX9RJZUbcUZd68f4Bc+D3Z3vJMGChGFdRM6aAiA67aJ/lOA/pOUMBEFsiqrjoDmf/KXs
	 MFf7HmrHl6BeaQ9u8yF+VJet/50n5gUQXpSQaNbdBg/2S7bhkD3O15/p0zoMI8dh1PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bXUQeFJf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vgz48zAS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE447606A327
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE447606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bXUQeFJf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vgz48zAS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAutDc749668
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSdWY/O/F+Ype5FZFnjwSsiuRFnCFUFO39Z3b1DQLTE=; b=bXUQeFJfbj2f4e1U
	P+Ds0+blh/H8EN7ngl2o74co5O4j1SArwoL4CM9uynXCuk/WUWn43tFDVEvD6NRc
	clL6B6OOBy48CKFdvqkYFeCG8KbBf0GTYryZwm0+9yyfiqW0Dfyb75lh7ShfUJyR
	sjWJd7dDkkW/45zynh1N5LM7txxQ1bPWKoI+2P7kIiTxqThmX28wfO5lCokACZa3
	yG5Tu4dYZ7S9bK607/YmB5V+0cX9tu1+RUG6BkMz9q+FtGjF78stmgnmptKo4/+G
	OwPqqOq0PWZHu7ay4RKkw3/Ab6SadW8MTvEt5uCrONOQau7CNkS476V7tE2RZyDJ
	uLkwtA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb3941-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so811002985a.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530583; x=1796135383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSdWY/O/F+Ype5FZFnjwSsiuRFnCFUFO39Z3b1DQLTE=;
        b=Vgz48zASYs72vvBVQYaewZvS7MUDBJAXbgTpCTfBAslc6Sg2KfA6iKeXQYEpC9Cy22
         m6/DG7TSjzivOQSWTJbXLcX7p0qH//XP31H7S0eiQssvHm0EWCerqOY2GLWKD+eOqz2j
         RZkGC9C3fqRCfhZ+p1TS0KJEJn9ZswH89KLRdtuIx9KPTJhbHo7CuH+hsIP3IUxFGXJy
         l8c9T2T7tSH9YLQeGZ5xNd5yRbZCDSSGnR8jyDWciP+yeqFt2Razej8b3FFFicizsyK3
         IL0uB3gUuOANf9tvHU2vIKeOve8OYrpEpk/X/KCo1wMlCAvOWKQbfj5bO7rwolhVHuwS
         Cswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530583; x=1796135383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSdWY/O/F+Ype5FZFnjwSsiuRFnCFUFO39Z3b1DQLTE=;
        b=auiVl5XfI/3qby4vV7gU1wEg3MmTvhA+MV3cR4d8hWVq9xlqbPwERXTRO8jLRTmKUm
         6J47S7nzVe7GLKNbmjoLuXcflhQtQOm0Lct7qxQycX2SN2lBogC6Z2C6ckjTIBEPCMlV
         MFN0aQ8OSkGCSrQdSVGRBT6LRnxvtFYp/T1CTycdWNyKkDsGEAAlLiUqXd+CwXJj2O+u
         q72hObhU0rbvGn20enOlNF4C4JP2iAqkbewA7TPC5mtgRTKheW/J4dtI8G6jNXv21pAY
         D9Fm0YAO+fuavonxirAfG/T6gjtJGALoIuXGiHfkUY264+CKphUk7/c9ZpHaWAYlV2Md
         ZJtQ==
X-Forwarded-Encrypted: i=1; AL+hErHHDnZbtyKaWJxAMTW+cd9LbPuY8/B451VaL/oYTDkYhtHIQcs7w+TmBHczY9ok1r9Qar1OR/FVb0kg@vger.kernel.org
X-Gm-Message-State: APuU4Z9HoUl3jWVoQiHUZL1Pxic6YjWGlAgXuDQaTisj8Nb5yl9q5tQe
	D91bqI0dkgiuy8znd1Xr12HESV2dCBUMvw7C6Y3clNSk/yT0XVoTRMMuSj5Ml6Bt21nJFWtmPTD
	zBeMlYdyjtZGypShyKmWOcr3xrN6eyz9gf9XOc54KJq3otVIUJ/nvcKui7G0RWsDm
X-Gm-Gg: AZFdTZcJ9gK0ySKy/BIl3fcJzM9f90AVyET+okpF1khwrcgSeWMDEZ9Pa6sWpMbAsoy
	oQdDR4ntXEriuWBIAYpnlC0cPYyk3TgwaPt42VjopcJlEtkdo5M/H/ZWv5DPCjkGBUhTJzngCl7
	WdipXEaCIClT2ppTH/D6C4WHYJILO0Kc883vSpui7lbmCIklyvMr9ldrn5v/mXtc8Yo3Ltc9y2y
	pDqmOKO3USRgmwSlNB5aNJ5Gu5/2YOnZZzF8dMNnBMhUE5Bss3WtsOEqcQu0eUS6ql1QlnHD1/t
	Bqnt7scBko7Y5nK6WJ/dJv8i63qqM6kKsXN1mUrTlX6D4NggMA525FpMBeO1aZF5qFXZ+i0FPP0
	BAcyQCqi70TmRX7MtfROuFwlh94B+c+OL32uUNQl7BG8xU94QgDKvYyD1ZVx3134BQ/SzsCzdcK
	3srSEfkcfru0XgHmGM4cfsbvsZ+KOmIoPkY5YGQpaXLJzkwhaOmX/YJvi+/IdpCCY=
X-Received: by 2002:a05:620a:601b:b0:949:692f:f4ed with SMTP id af79cd13be357-949b385b33emr2380191485a.43.1795530582985;
        Tue, 24 Nov 2026 06:29:42 -0800 (PST)
X-Received: by 2002:a05:620a:601b:b0:949:692f:f4ed with SMTP id af79cd13be357-949b385b33emr2380186085a.43.1795530582331;
        Tue, 24 Nov 2026 06:29:42 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:25 +0100
Subject: [PATCH 08/11] dt-bindings: pinctrl: qcom,sm8250: add the egpio
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-8-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tnE9XqfoGbUNSlUyMfczo9yXy1kfZ1G8Psly9oKVopU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9DG7r6FBIskRauLXgGUKtnXuTs01Xu7DmYv
 OBwzYtVKzWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQwAKCRAFnS7L/zaE
 w0iBD/93UWvXOoR2tPYlV5NMkibL4dOSyctvZz+dKVZ5LiwaTw2cQLcUK2CVnifEsr3nrSFjvNh
 XR7+tmFDgEv/S0uZYXaVrljXYptCeuS02vZ2OZvi3REbWDBqslHWnnTjunkq2qZFjLzvIXqzLIR
 1xIbuNXzTTXU/3zHp3AxiFRomtU2VoUdkdANGLTSuhtm+9KXYMpNd9lD64keZ1AOCYO8WGxFP71
 GuLmvv7GgroGL5LISBMjrmGV/H9eh2sW3cIOUjB8htyl6Fjo1bkzqEPqpTtALV39bi+hdg/3en4
 28eHDBG3BSY5prxVA9Kn4z6YddiO8yTj2gkKrbQhRW8pOKhTKy239iFBU00+8zcy6Lp58EccQCk
 lHKW5H8/e7SONxbnADPQ2DQm29PzwlAJ71KscPY8zU9vzaRm4iDS/GPmG3Cn+7digzsQ/S0bsvc
 kuNbJVnDkNmH4l597GuEgrfYoV55arBbWLF4uP3MSIg6eK3uSVOm+3WGUBt+asmZu3mP3X6K9rR
 NOieUTcZufwF2s7A4fUdTfCCD5qxDg+UTAa3YEPTKHiyome6D825WnaxUehIEbl9f9yo17+2UUI
 v2xkt922aljiKIkWYT9DR5Ixv7QsFoXRTvoCEndDdzt4Q31fRMB3ySIoiyXy/BSwXYY4O8Ic4xT
 gVcLQ3+Ls6HQRtg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b059f57 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2Hlz1Ra-QEqM0uTCcOsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zdnvJpQA3Mgw8Xx8IpCb7cE1sFqJM9vg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX0cMuuTa74GIh
 dwU29FOiEx+PNHP1/GbHbc8m8fIu6LHXIFUSTlK/aeW4cXjbpPIpmkl9+yCvjLnTwMOr0Jsxjk0
 72sE7z4AVnl+awoNVfQ62e3olHwdSdg=
X-Proofpoint-GUID: zdnvJpQA3Mgw8Xx8IpCb7cE1sFqJM9vg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXyTZ1QHpvFAIO
 dLCqoFIsK+6aTRVINGy0pyhkP1W3I2reIwk2Fych98a0hiGZO8zPWoqExmPu/AThnvv1zfS1q0t
 AhMfcSRBaw6+l7e7wS2827pCt0xllz7tUxCjGH/CREHJkPKF+vlrDzNyfLx9JzgBViwqqXfoqPU
 ak6L9Sd+ROR/xdwLb6QqZFI/RLQZo7KF6zlwzlebcCygGE2WevLRgvVRSonQvq0C/4v2PcdiZL1
 txGwzQAmoveXBmKKeOKs4kCFZspSad9dhDtSEfjSKP1YdVZrEDkFMdXU1yH8urfawmkfS7v2zSC
 UypMLvHlyYHyJc/rNROyKANyv8uTMvG+M16UdblohUBs+yUJJSuOEkNAa80Dv+kn7/vH32gAUw8
 SdpYWlL4NQ5ATRqrqXh/cLcG/1u/rKel4xyUVocA2+yjg6QL4PQsvhiWctuPlv2e8sboINEGyQA
 SACy1X4oQUJAq0OrYXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The sm8250 TLMM driver supports the egpio function but it's missing from
the binding. Add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index b11edbf8bdc05739a34207be561c49c95c64f221..482d98c406bf661788c13ef360260a024a90c2b7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -73,8 +73,8 @@ $defs:
         enum: [ aoss_cti, atest, audio_ref, cam_mclk, cci_async, cci_i2c,
                 cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4, cri_trng,
                 cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
-                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
-                ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
+                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, egpio, gcc_gp1, gcc_gp2, gcc_gp3,
+                gpio, ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
                 mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
                 mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
                 mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, pci_e0, pci_e1,

-- 
2.47.3

