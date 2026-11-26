Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688494;
	b=ZRNogGELPX2o4RKMM8P1m/QoNHUdMx+/gidN7vE1UWaw0falYlgbcdDQoF9rt37DElI1
	 LpP5R7xInaCNzokkwExaQ2NxcK3Mg/oOZO5qvOCBIf+0PfdZyUbA/8mqT+e2w3mwUtTJ/
	 z99CMmKqTQOej85bYx1ma+TL9yP0igqAAC+Y5MBE81QRfAkhEMBjaPv5fFJ6jxDGG8PcS
	 XQ1SbpdVZOkCcUe+btdhWq89VGehVKSbGIpdbhEQKnO4jjArvV01LDa0yInr4wetFvlgb
	 pzUc7eorebrgjmmeZF85RqAcf1rZFJ7GPLDCK24+3cRLtIlae4A40xbL1pW3uiJ61tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lgy1czmHr+DraDMqMhHBVWGh+4sl2CDRnyRUXWQ4Wgk=;
	b=abw6F1YLb1Eq+7DY0lKAsPFtEpEJU76gGArjx1pVviVxvOHxXpJg5IXvmDas5R8i9wam
	 QYz0fhG1A0UMZF6miLuY7I3seEiqZm8KzJv1xnQFCORKD2DkWYwUA6Xty5EZs4+V4/QMj
	 2slWBQObwqWIByqfQzpJQp75wgzqrjSbNgd3XEDA2diwxVxJBrcjPpmtGp4USPs8U0Q2V
	 /jT/zWGsfw7cIhPtufwsoylSur+bdEeh4Lf7otjy1vcwSxHR0ZOFVBe9MbG0ZmDR8jX5X
	 4CVxbfsbFrcu/ghdhi5BTWT5MZal/UkEwdGyVvasTCE+tjUavljIt+fWVJyC3WGLhmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqbHFgF8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cC7WrDRs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A03606A327
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A03606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqbHFgF8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cC7WrDRs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B27Z1682403
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgy1czmHr+DraDMqMhHBVWGh+4sl2CDRnyRUXWQ4Wgk=; b=GqbHFgF82iPOeT0Y
	+XZeZoHdnPykTJixxstJi+Bmc5ml+5CJr2OQkRQT5u49rIH/cVAcWRvmXs5EEGBV
	LiHxmazNaHdQR+nQjzMfVrTjDoQNRz5WwKJ6t02AtPSgtuTlH42tqqReTlj6jlVy
	eNFiDNJRm4uSzKv6ufNqxHtV20PvWzWQTJd96o2pHmCl54zoQB5LpYWizDwDmVu+
	jQCLNKkYzNAU/jn+OKfpXIOFiOa7qbfEWX32Af5QJcgkPu6FDr+EChtWUZ8GchYA
	h850vOGf/gu7t22sVGhSIzybOxH4LSPzs1YlOFsgBfxos1o/yprXEX07wnB4NKJM
	/FO4nA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekny0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131b4eso346329685a.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688492; x=1796293292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgy1czmHr+DraDMqMhHBVWGh+4sl2CDRnyRUXWQ4Wgk=;
        b=cC7WrDRs8lOs0U7n1gfVxxxfUvrWP5mWWcow1htCpKDrD3Dp4VtrNJ/xnrjleNPfrK
         fz835Ja6qShYzqhEhfxlyc9us37Xs6vHAZqKA4UJ8e9yu5RW+1xdBGam60TMiT7x3Kb1
         ucQ2eww9FPA2/OzfdniAXU4X6yvx8HsWS3DqV5XJjswc0wIbdwVqXYfktH0G+E/GonC8
         JMYiWpmHwhKVoP6nXm9FzoDKFNP5HBOB0vr/Sd4awQmR7DVt2s07ZkkHablpIoDH98TW
         FS5d6B51ffQUVVRAGTH1JJVSQzGuFAml1EkNwUPMIzXqWAE7krUoF5kwpOt+oGQpBfxy
         SPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688492; x=1796293292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgy1czmHr+DraDMqMhHBVWGh+4sl2CDRnyRUXWQ4Wgk=;
        b=jufeIqxgxtFSUc8DbRtUfyA5w0pTEyG9HpWFNgdB1HHkBgY+mUhhBAyAasZZB1rjW9
         +Kb5AzrucNIWUpW6s7xUtnGk8Px5G3RA45/o/cxJ2SWJQ+PSyiKYNQFBVPTxzY8voZ9f
         BSAJNVQBTIF/0rjXzX4F/PbMTojyQnIW2KvjIGKFTIaAK5Deolm+u+cVc1QKmhqSuzzG
         pByJzmBjJYSrXy6y5RfOYOy6VsiRZvFzp5Of1OSx5a0s7/QssNntfseuGp2I+pr9dUeG
         3MJY+/J95BD/cu0xmdJa8FhZ3JMiG8hV99E77FHAVA5y0dW67Pm4vr7MnpUoicxudbmC
         pchw==
X-Forwarded-Encrypted: i=1; AL+hErEfOcdk27V5Ylvmb7PilH9Kl1nlOo1TQncFENVO/Tm90qcRMvdhiz45d7sX2bKX8HLXXMNSAqvYcRHv@vger.kernel.org
X-Gm-Message-State: APuU4Z984VlLH5cQM5Q7BAkamOCmok+j24OwjDq5+vCkAXHXXNLU4+Qr
	fqcx9JRL5QSm3QhgVRZYdc700MSDHPeI8MftVM4saz4P+y+gWTJvfCt+gx8skcat+QfW9a6+laU
	KSnTJ+EsCQUo6iwnRgAE2cCiWYF8NovS2q6gqJ9ZnIw1DjpREZ14bGxtc+Okbcl31
X-Gm-Gg: AZFdTZfWalQAVC6LmIAlDuSF2Qn6ZRB9JLsioX5hRfsUmt0oYN2Vgsg6+yhUIgjbvLJ
	mp4tdifqcFLxKMFelDnagn5UvzNvIy0XxKWTnrsk5w58keZBeZGIkyC7mUwBD78MUVJplZFZdVP
	UTUIBUdzIUuDi+IXgj9pqctgpAyZo/WQlAPn3Rfvn5t9xRT1bvBWMHft5xb5eGNVDI8+fieU/VZ
	J3HjH6i+K5heP8Bsxlgo8tUj+98DKRblEpvAR3RLWME4THtgRsWhOa4duL8I3JcUyyRFt4g4Fhz
	wmWF+aqXWaFDtJEMeUPrkDn3QLLocChAUdudDCWJ9WqlYTTURf5PiGRZ0N/uLxJD3mLx0gAlWWA
	RhEunSLQ2HFE6TDyvCbxNIaVWNsLbIECf9Jfg7XIngZsd57DCH/bT0Tr/Ubp7orI1sifix7hP24
	JhttuZfKGCR768rstg0xeVPuJJVcLqB7bcln9L1021Di9TvKt3YKs7HERC1Oxfz94=
X-Received: by 2002:a05:620a:1a09:b0:949:77c5:a58a with SMTP id af79cd13be357-949ba9ef1ccmr3559265985a.33.1795688492361;
        Thu, 26 Nov 2026 02:21:32 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:949:77c5:a58a with SMTP id af79cd13be357-949ba9ef1ccmr3559264085a.33.1795688492005;
        Thu, 26 Nov 2026 02:21:32 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:12 +0100
Subject: [PATCH v2 08/11] dt-bindings: pinctrl: qcom,sm8250: add the egpio
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-8-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uHIwQFyn98qCPy2uszdUoInx2MbuZrYPkNdDr5Eb468=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgUDqVtzFPzs8Gezm587puhZaPUNbvwnTGEQ
 Kx/INCo3FyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w4unEACB0FHImas4WltCxT5GWqch7Uze/tLqgdxbgBsH02406mPYEgrtTl7zwNHKRf9V+phriOO
 iTJ0zuI1eZ3QjKGWRM9lAW4IiN0xJTGW2F1EOzNH5OrxY0NafuOJnPq0iMdCbCgIgit0wB9FYJZ
 9HutTwtF9/v0a0QD5OKwahSUTAizr09tDnqi79xb7lmjRDWjAXdWAsvfcHtNLH/aaX6LJyS2Pwq
 hbqzu5H5adAaFA6s8Yy8Zj5Yufpk7bwccIz2mrdQH+6U0pSen089EqDb2vfSQdljvVdPxK5wM4D
 jzu/Xj9u4NQ+PPm63/3VDaMwuoTTZlDWjk/MsuJVSlLeMKioSEOWizzrZIiE1U6Limf9xDzFunP
 0tXd2nlM1HP5uQ5KBGdGE9NePBcz69h7GFp7VQ8Y5rNOzxEuEZOd/2HgXKJcK308u0+hgyZuLCJ
 ++zg+/xJvk2F3LDRaoeQp88lXtBFYUow0fB8xqxkepIzxQfsFquCusRF8J8/7Oft/5AABl7gWZb
 PmM3ZGcaHripkypnW3MuCFp4wi09i/gChZB9UJ58dkIeT6DqaF6Tw0QUh1cnEbNJ/gEuwQR0zdN
 8gbTskTrnvPZYYTpOiV5JygOLtNdzXNwImsXpfibJn0pczbN4HcgvPPxcWmOwX3OwVMt882UjI3
 mhA95K1qAT3t0kA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX7NjU8i/0O/vG
 GUqbSe8GUV2KhZWE/BJBhZZYTX80+iETY8e5GWlyum9BsUydJUYuXItmTuzLcjEIozqJNppezss
 8GKDZn1gwdch15cFDfzf+oUHcAcjt/5hMbIhkB66B6mzvIHsMqKs503stF+l7Bamw3ooFVNjv/7
 ccBLYnN5QYyciuAKuYTMsEXV07DlvCPzDgU87Ay0Q4iz1D6I7x4H91+jux1A/bMTgX73DsTKA8e
 dwVr4i2TbUJRaIn/wo2E+QN2IZbnofnSNY39kQr2drcJ6C/8xdgE6PXcrFAwe1duJYgvML9e43i
 eb3cCu18jH4KbFXLK7RUcIkOmCC3U+MRJETZ4GHt4H71Q3J9Tzy20FH/QU/TX4z2EUTqw2R1sn0
 rfdjLD+nKDSWjc3vJXlc4m7T1c3Tq2Wvg/x2GCsTpzNReq20+QJebzsND5SK5c2KVCjNk7MldSj
 GfGGVjXtlUNgPYXK1Ew==
X-Proofpoint-GUID: 9p4TKgixsNs5elJ16aydNrCiHmnu7jlU
X-Proofpoint-ORIG-GUID: 9p4TKgixsNs5elJ16aydNrCiHmnu7jlU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX8jpeZdwEzBgu
 GbN1EGzEDEKey5+Xq5DtRCL7u1JAsHYQPITKVVpNMJDT6b70Gkp0CfoNDWUFc65KrGzhbtptYpB
 DStgVz1fua5S0swoJbnpIh3PtIfS+5Y=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b08082d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2Hlz1Ra-QEqM0uTCcOsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The sm8250 TLMM controller supports the egpio function but it's missing
from the binding. Add it.

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

