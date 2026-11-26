Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688497;
	b=VRTP3vg4yUbG5Uao6mkrzbg3ijgQwjy7oEQZhs2qLEuP/+emlTHWE0MN1YpJqrNLs6UJ
	 y6P3iSKMzLXK3asJLfyQZT4s0JAfN5sv1DHFy/DZo+RiWNz9h2avl898fWN93/VLce4xQ
	 vBf2I+bpbQQCAFosdHBKEumXCnWX4kUEsWPQtOB05L0Ctz1dF4T7nxoEWvJWqKwNgTqPv
	 7C6GrJZ3wKgPuTaZetff07RlbUimXF9syz/E55lg8VR9QNDU52muuZAUr1E9dQfclVvlY
	 9MV8hmlsD7THCcMQBQ9NQoPsTn8G4+kCFlQBBjWn7YlREVTC7W7E0kEaVj5HN/E3JYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=;
	b=kiBQvfyT11jO3UVI/K9jH2xufvtxI2PUR0byVHIwwDertuSNu6PxDp868MY6QRJCCP5O
	 n7rPYiBMMe1ryrxMipkcUZ3bixLgEx0bA4g3GPG6w09/6/zDaFa2xvXRfs02sx4sBIJci
	 taGCsd8NgcRBkkvh0GFlr90FVmC9Q1TwWWiu9CAjeEAHfFRkc/MbWWLlWQ9xrhrR4jpRK
	 rPwGEvLLFv4zqUXijAlJoY13/sDK9xXQZfQM/E2waL2igSgvH7lM86RGVxR2rJ9pkz9zq
	 /NQk5xKu3LBdjk4F6EZ/W519tAlCnuKLVdKbcRk6umlvVmSk8UNaB7sFnQlOmHcN20A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hSLg+Y+X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMmWDDvl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A55F606A326
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A55F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hSLg+Y+X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMmWDDvl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AsM72885476
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=; b=hSLg+Y+XgJqDjPUZ
	yRLujwQbzavYYO74euLdbimeyrrtMmaPEge5C2jEogzJfeElbRDYlkfFvTzRRjdA
	O2M3pwzmNrwqKrxt5xRV/COde9S9QlPWwv/k+1ZrEwiaPImxKHUxC5g3ZcEe/yOy
	8OPhh79OQ3TnS5hDpfg1YsBpjfJuWTLZSJYSmDoMQtDAOgUrHd6FzMCjurBa46Fj
	iqaMGVf/KMHOc4IJe9tHCCzjkKDy1zq9+yF0pg/PeQ7DU/J7E2xZWg2gsOaBGhRZ
	C3s9uA9iNJbFzK3TV/iOPLmOCiL/KJhmc5ch6G1e/Jyx/Ku8WYVcwkFs+tLiP8Bp
	cqDjjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgyg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so1628979385a.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688495; x=1796293295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=;
        b=BMmWDDvl2lPHUvbV+tdDW1pL/2QgmoiyCa5l0KBR8qMdAwhmVcb3f23IAN9I77gVHw
         Kq1q29T2dYyWMd1vhQfKA3oDchpTfZmxmNJE1FRcXWAfVaf3o6/JVbxU2n+zXTzfNACB
         VmnoV2rqJ3Jb+PnUEpHUpijMb1HPJRSRDKYcflh6IKjVHxNjROaKln1xs9RlMUZkBLS6
         MvfKCJWKG3g0d5gLGq5hOnra/Hi2PKS7R/4H9Eg/BVGB9vl/QlzXlC6G6RhQcS5Wa4/X
         K9pPeNBphzkl8OZ4kZbBtZbhiRZqKfsPqA8o3OJ2MvXWduoLovgm5MOm9dv+V7X8XBLQ
         eWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688495; x=1796293295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=;
        b=LacdL4etvxNEUt4pJv3FKnJQfBsq4HqhMfFPAK1VoY9GJRO+gPMt98Okylq9eZG84U
         JrLkTvo8bxptlzdgI5aXBZE0wxgG/RMesyj8Fvo+Six0dgTJJ7J3R7MFwE9Kk1b7/+2Z
         YIR4NPSnp+/1lnIU3MOwMC6ck6OxU7y7pFyHtdhnsv8Iegya7GDrWG4MuFbCOuNvsiOa
         iGuXa8aieiFb5OYAVvNfXAjjgdF/tsiNw96gofIRENeEGMQ13XbCIFQfYYWUJmtDyFVi
         or/23oUeEnXGmva1NPTdviRzoqskEoQp8RHGBaYsWSULaTnnagyez7Jladcq6nEdtLg/
         lvzw==
X-Forwarded-Encrypted: i=1; AL+hErEd7Q8xZUmT7bLslZ3wHRubhGU0PwntEOPtcBC2Wf843g1dM6Zg3tK4jAmpHslznccUt0o2fR2bnWAi@vger.kernel.org
X-Gm-Message-State: APuU4Z/s9QYAhmPuk5ijA55xr3vQTc/yUghguFFN9TDsFe4vr/rB482N
	2Wcphz6XuprzAmV0QDU9R0+FIMCM8yCrENB+j0Jqs1qeoWuRAysWDBEmqQBAEo9T5vs6fyTXeDr
	/FonL4tC3RQaswxXep2Vr/iV7IiJp8yKuIZlLqvENa34XsFVdjU0Rxrd3xKBengLB
X-Gm-Gg: AZFdTZeIc6lT8ZsTzs9oAwj5JBj+ZV/F04eEZlmGomwWthRwPxZRoVodeVMS3Yuc6S/
	AxwCxLDuuFZoGd4X8Uceu458ccep/KuwGWpl5b21OtKG2phA+Fbrg4qOHbev41cSWWGDCFV7xfQ
	ajhiChuyo+GXhDsXm4XWnCOYOF2UGFie182iGkZ8xcjAIJ0uh8qcyEUZ3CJQB0emxINfF89L5Qn
	9wsPz4G/6s7BdHBGKpNKoGCSMlXJr9CzZ6DKqXt06K7Hap+YLrJTs8604nQ7E3EkCaL8tUwrHNP
	JCM+AunQrkdlHn9Q0C3N/0GbIlbSkfwv1gC9ay/oSeoEu6nUwBAVzAzE2S4Lm1IB9voyRmeaFmJ
	ytZ32xttGiAaNTHZcdmNHyaz3s7tw9MEhlsW1PegONF9v8EdGAUfXIHFEAkwIulO8fMWQGDL8ya
	G0YHmOPLkXHXswzd5sT4SENZFuJqGeJvRNBMxcNK9ms8Eh4sSr+jO8/LdYL2ruqMo=
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3660774085a.3.1795688494555;
        Thu, 26 Nov 2026 02:21:34 -0800 (PST)
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3660772785a.3.1795688494138;
        Thu, 26 Nov 2026 02:21:34 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:13 +0100
Subject: [PATCH v2 09/11] dt-bindings: pinctrl: qcom,sm6115-tlmm: add the
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-9-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=e9gjgqmVN35E5q0f7mN/S2W0FHM2q0sIPfb/NwIZsDY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgUMf9wAz3+gAYQ4L+1woh512FKHLaK/5WlU
 gQxjs4MeRuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w4tfEAC2OmBzTNpcwCg0T3PcYTt4Y31jc2RW3ocrqYHLNzjb1D+6lwpvptIwnvhwoHLxFiUvovH
 gBxZtowt9Kji9tvcxrNVSe9vGLJxnXWEz7mc+1sHxh8+v+kWpXOLTsYKLKtrshjnAwWbs8cztyt
 zBVXnVWqT9JQtcgpChy9VyPH6eppanW6FOjcn/EJ5CoicdRED2pjO4Ttq9H7tI9hltcrZNVXVX+
 wc/XS1s3I7oeflzyqzDia/0qZsjeY1hDVpnmME9cvuzKWWPDfqevcNf67o6Ml2avc61gCtwP11S
 NRJZrq0KQ3v5Si37e6rZYthJhmhuDd2NmWvL55dZJOnRVuHu9S6/r4Ko57A8dayJlB/hJda9PsT
 B9/mT7PcjynQdm2Nw0bCHQKONFbqPuoCEM8JKhW6aXbp5NrP0bdyxx0pYQrWOpbfwV+RcK/8YRs
 O6E2REScmXME5QPzhBSZYW0+TS7pWgUUYzHfKvC5rpn3dDYbGi7t55zqizkc03hz/9QUjWi6FO0
 pVEXCgA8XNssfgD748VYjIceGEV9PkdYht/1vIfoyjdY+TpD4DE5JTp3wTKQZScg811WpuvfZHt
 lwlJ1nXEq11YqbAHD+r6pOiSfGIafuxEfVQ4k3fh94AuC0inaIyt52krccxe7pxP+M8coQeS27O
 /PunhGBAUwW915Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX+JjGMHS61gw5
 A7Wgpw4DaLrB1LM77X2TaoltUa8s0xDh7WvFJLzP3IAH+vkuv9nvYfUyfkfj6/Kke4iaeujbmoh
 d2U2M2xmlanuIf1qZaWEq30vXQ+aPaUfgal1L6Tk+VZuU9MZevr02DtxPAsHY8yBIxxxD0L6XMD
 8RHKk3I+JxWH7OUgaWRE5NqmhrAuVSjrW8JkQjF2EpPRw5iCbgzyYGgqRoeGpM7BsWvlIMqZgob
 RuZkCarClGlnV/BIcN3+weIz8Kk2Bckzz2BaMjpNoUA9PdzP9bB8O1rmbwP5CPG25+iLnYbnBkd
 O8BpX1Jtnzhccu97+IGplCb4y6Xx9fe3IprUix67blhlpH0YOPVFSlcKI+dIMmMleGj3m7To+Iz
 DJQRKTsLabdeIZr6JadplJ3EhKlT+j9EHcrNLqeLq7KUw60mbgwq7/DxHmdBdWjhhdx753Uj4I2
 9IDdhY/V1xMyjMa5TWA==
X-Proofpoint-GUID: amaRW9meOJbnAdkvLN1W0uoN_QSquSrd
X-Proofpoint-ORIG-GUID: amaRW9meOJbnAdkvLN1W0uoN_QSquSrd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX/3a9plP5QNcI
 KwIHThDCBJCT3SMC8yqmC9va5CSj2VN8pAOwDBNq4ZWKAgUL/uJW6ujzaxabu/A4a15oKwIceW+
 VwKxySSczMvcC9VPvlFnc7efjb2PrJY=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08082f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qcRaLMgUlmIIbR5VUokA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The sm6115 TLMM controller supports the egpio function but it's missing
from the binding. Add it.

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

