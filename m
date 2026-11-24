Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530588;
	b=pDiI5hXm5G2FsAHHuCuWIBk+XPgu/886H84N1f0PBBIFZdbQW0nTkTC5ev6SYTHgApeK
	 SkvySPKjB1Lw2jGNvSY93PMGReYoxr0YnSzjZaWzYSXCgZhfy0IrNJ5G1LX1N6asdzUxi
	 N0yrrgC1kOdCl6yNN1VraVi2dxFfMemMKy/lQ82k+MXf10zscU8pdIwWgTOvmzt/ddWfb
	 9ChaswXltFHM42IU53QSzMwCKeDOnl/fo8VqPeFij5WHFY0SadDseTCxmTBtaq8h3ewHs
	 1/435mMGR2wlDdfZZDpg6OErfvOgE/O6yRSQuAxMcFR6s34fgYSWcJBOpMTQ6IbgCvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zYEtaKHhND+sA/YTv6k7/E4XeO7YGfpCzyD5QNTJAag=;
	b=O2fq9DdI5daYd+/8bgtNfi60GYp2sg1bK2EiPFFLkrAb5byeIRwfXNyxA/ttStS60vYi
	 TFfsPzB+zDI1WOJxRCMtJaXXpugvEoa2kvHqpqw0XDXIqFSorI562FBBEJj/C+AdUF7tH
	 yXDBgh8xH7shRyQVzZ+7NPrhQQxMQmGckMV58kmzyfh+M+wWtIA4x+nzUdM2rMyBaV7Xf
	 JOaVIz/JtBzPGZdggrcUCWtMOl/QoTH5LAw0tGlDqYW7HufumaE1G7+TnoEADWmaQTPp/
	 TNnm71kylNilDwoi9/I605Irg/VdrDyzRG6LQI+GwPbST/S3lYDyRFPnnY/92wlUyZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NbBqiHSK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kArBfvjU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7E6606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7E6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NbBqiHSK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kArBfvjU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubu11025289
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zYEtaKHhND+sA/YTv6k7/E4XeO7YGfpCzyD5QNTJAag=; b=NbBqiHSKs17++GmW
	NWcO8ZaoYEqKS4iJiBSXqRgWM5QbkcwTgmVSCV7mzsbJQkGLXQuHfObCn6vVsMOz
	1uT8WtzeVZx2dBny6KeTlL7x4khBtqeiutgU8N9o3aqZkWx/G4kosdqZlO6h43U4
	EfOdYOvrIKCEVc8p054MBlDV256PPmKCPjdw1OOUf0ajGAKc2w7sRVULUeC+Xtvf
	yGVwj6KOUSRVoF+9KohQHo5M8I6nByhKG9rX5DbLmmxNf7fIPRacPi43Bp8guwtw
	oQvgYGk1+hnW9TchP0Z753ZBnPNEsC8RJL7i6+wRs2IYu38zhJLgtKfkALcZoeU0
	taVjxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt384s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso929766385a.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530586; x=1796135386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYEtaKHhND+sA/YTv6k7/E4XeO7YGfpCzyD5QNTJAag=;
        b=kArBfvjUizRCEhEDA0g/2RgCyS/ElrWECQ98gty+jlqplMM0JvglLu/0MsUdXIXxyU
         zrCNN4njBV+IUCaXSBLV74S5ocuEVn37k73WeVxd4RxLzv4ve8p295ZpTOjxVq8HnkR+
         VtqTHG+F4F3nWANb2IhDQJgV73ZAESw6O2eelj5aaHyg55meOQC4261rKDP2He7tKFYq
         YksTiXeCVvC7xCZLSxuJvrkewAmoOr0XqA9Gjbova8X9Idea2ClrLIuJPQr9LGNZVxSW
         czEzHp7EkjKMc2ctv0FkHlV61To9jxvvW2zP1vunld3pDKZkFSHLA5D3mIV8owoL3Ruj
         2btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530586; x=1796135386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYEtaKHhND+sA/YTv6k7/E4XeO7YGfpCzyD5QNTJAag=;
        b=Fx4VQoSPiJsyxV5f6D5WNcXSVWhdM8b9PnRBRlbmbpN1Bum1QfpDJksjY7z4rREjhB
         7JUKJoG2kIgBIBCGhdrdjgevUDbzkR499hzrrHDfnTPm3Mluc2dtODTRc8zW8pvz2mt+
         Gw+pnlwyBMZF2Xgv4DG8c2imOB4O9u2zqsE1OZiztaVJskkEoMK69GAQW1J2zmODPzy9
         OnqKzKs+u0EKWS9W7YclGKx3g7PziAGHqRGud2DLXouyi2QG1FwveKf7yREXK7uYZthM
         zzfFmiCutaKzQFMe2rG40rc7KrxETzQIoQyWTGPNh2sD8fZyUFXfkHJejA5U79mExjCJ
         n2/A==
X-Forwarded-Encrypted: i=1; AL+hErFDDnJdInPxsTOdiQpG6T2nzaOn+BPwx9m+QZCuXc9kuSepZ1gXsmY4xSV8vDieYnuH9kiub0F9IHTZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/jiZDndY70AhNUlturFj6N4R2vudotFThKRNc8rvYfkQvvgsCV
	uABnoe6z/4szqlbgc2zqL2hkH4FU36RprVpTR4Tju3dxNqj8TmVU/kHp44O8DN4XRxefLFsN5Kw
	1tL1JCBjAwohDnh1gCtJdqty+nzX+5We9OvnfIurjQkZOP4ehMSd+otJjqmvpCKDz
X-Gm-Gg: AZFdTZcb5970+SX4llsArcKrLeDZd7ajE64TZE4tjUwdr4KKU223SZxmXVhnxmzdpp6
	BhGc6vb/HkVuyA4TCQoazeIEqtK3khFyXNCsmm5l21kWz8EkniwE1MLz8+zm3BG7JP8lpKwQpaZ
	Xbm1/q3cEGdwJktxE5dvIoqCcpveNiniXPAmzqxD6kC2Ibsob31WeGykDoSo8t3ajQBENWUlQNg
	UHG8KXOgORwoRs4E+0HVMNpbrYPKz5TcTl2roZ8CsVaGoLrsXLu/mIQBH2AKJUENuayzfOcNcy+
	d/jgr0JDJtU3PlOJvJfx+19wo8Qi0lRFmc+NmnmBfbv0OrpAj6eUtGTf4ATFqTpKiSlQINEZKa+
	4VxynW5D8q7ANusb5BjPtGzckREiTdA1uvdNtHyInqBTacURtm+xHS+YFCS6UA53v2ObPzEyxNr
	vl5BydRkivIhnz+Y8T9YugpAIvaQTY41SlooiPoeR/wWL1Dmub0wEvhpojCe7ARU4=
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2758370685a.18.1795530586331;
        Tue, 24 Nov 2026 06:29:46 -0800 (PST)
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2758363885a.18.1795530585805;
        Tue, 24 Nov 2026 06:29:45 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:26 +0100
Subject: [PATCH 09/11] dt-bindings: pinctrl: qcom,sm6115-tlmm: add the
 egpio function
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-9-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=srMcIAzLP3TvXBs4OdFim3v6sD4uxz3kAA+cZgS1e5c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9DJwjw9BvlWNiXfL4JtImpzQvTS8t1Cc28F
 riLVcVWjaOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQwAKCRAFnS7L/zaE
 w0ZMEACa+nYgs0UTVDwMmnxEbBU3clmBWhFjaVXdzBNwezfmBC0fY8V0fpDx7/2sfBoI4aXeZcj
 QtUXfi3PzFgZaYKaenxj/HTuCoVqBt0mIADtzfXv+9g8IDqdiAt52MfEWdwmx9BbF4L/GiSVndO
 x2lfSHzIsXzZ7cqCzkwUuDBmae18b1Rgzvulaqe/bYCN71gxhwBm8KkS+CI6Y7khvkKlOIXMitM
 aZIMi/gsBP8xSVdYDWcQ7Xy23+IL4mErJ6037b7MRxY2iPbsxGesy17upe7tNHnLUXd7rHZ9eZP
 bo9Pf+tZlU0YtfSCSQjDMrFHaZ7eB/GFWg7jYSrb5xYVfz2/9Q0xx2rggAZnQNcU5pO49LjZDoe
 t6tqGaMQmEg5iI+cHZC22HbZF4SgtxJJ9JXjJ/ylNUfpi0xd4O9XgYakh2pUFjUIkjPUckdjAvU
 iRRpTGTDbm0EHJFWiisGrcbIY4eQeZjzDy+woumZfgF4dgD/wtzSacq/qjKW3j0432N9m6xno4R
 udI/Omtd6FV7dMQwCdn3H+uHIrdNVOiOmnJUeQqou2yMeuJeQMFWQZWAvjaALtUM9FKWQL1jHGy
 9pu/VCgYlO4wWLQoGGEc+FklCLUMnZAIfeSfR/Ql4LGxyE1UyMkwSHomNvo+U1SnPP5lB8m+rjp
 q7u6WF9DAAns/9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX+q1wJ3X/7wat
 mt7KlI1J/veGUDBPGl2A397Gc5Fi6rmobn1kXvgMkh3Jzj7TDZO9+ij91AIHvcxbPTTCIibApdG
 rSYHlsAsNku3wYLa3lcU/06T/7RJ3K0=
X-Proofpoint-GUID: iuoKjxm3-NTeI47Lq3oDPC6vci5TG8Dw
X-Proofpoint-ORIG-GUID: iuoKjxm3-NTeI47Lq3oDPC6vci5TG8Dw
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b059f5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qcRaLMgUlmIIbR5VUokA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX0nzsqlsUj+1Z
 A0kSwbwKMg7vZnA/TGOIjtTF4jeL2NOjY602UkVZhMuyrY3i1m99ljnatHlOYWakbS70EP3mNNw
 ryVUuoGmwyWuoJ+wDJJ9geUqnmoWPqTKT0TjqS5apNxuvTWZBRDCqPHkkl3eQWCKj28pSDVlOAA
 nQGH3dr2z3vgfedZMCXT6wBpwF0eeCkHvhLcwVg006KBWAYReZOBucqTbIXnQcFaFKqcAG68DUY
 Vp+1slw0bxnAcLJv6Jk3bVBYCLKkx0qV+TMJKWE2LIKS1LcBA1YKAL06CSenTnh64ITAcyxDaBm
 pQATPbE1FilCt2ob0DmzRgurWZMw2wctoZXdKwSFxfzXlhjJIsMD3QfOWItQ84BoMh6BgczrZh6
 QFxp+eod17l+fHvm2C8JxQ2irZmdwbdnwiSC/Itq6jA7jmqhPMKLqVqiZ/n8oJZOaV+MWGtemUt
 DPSqppchKVg3CLt7S0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The sm6115 TLMM driver supports the egpio function but it's missing from
the binding. Add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
index 7f36f9b933330937ef9d7b334b041174f9617ec6..0b0ae54c0cc60275b914f4a2e4748e0e339e6ca3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
@@ -69,8 +69,8 @@ $defs:
 
         enum: [ adsp_ext, agera_pll, atest, cam_mclk, cci_async, cci_i2c,
                 cci_timer, cri_trng, dac_calib, dbg_out, ddr_bist, ddr_pxi0,
-                ddr_pxi1, ddr_pxi2, ddr_pxi3, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
-                gp_pdm0, gp_pdm1, gp_pdm2, gsm0_tx, gsm1_tx, jitter_bist,
+                ddr_pxi1, ddr_pxi2, ddr_pxi3, egpio, gcc_gp1, gcc_gp2, gcc_gp3,
+                gpio, gp_pdm0, gp_pdm1, gp_pdm2, gsm0_tx, gsm1_tx, jitter_bist,
                 mdp_vsync, mdp_vsync_out_0, mdp_vsync_out_1, mpm_pwr, mss_lte,
                 m_voc, nav_gpio, pa_indicator, pbs, pbs_out, phase_flag,
                 pll_bist, pll_bypassnl, pll_reset, prng_rosc, qdss_cti,

-- 
2.47.3

