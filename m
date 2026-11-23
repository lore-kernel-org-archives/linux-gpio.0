Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463521;
	b=2Ib4gk90wGbRRo0AC4F0ff/b4WoM0v8kVkeL2PiyKrz6+LsDKBKjdg89z8q+oJT8ZueA
	 R+I+ba3M7UMRg32G9tLhFKiP3BJB4qt+RBXTg8+kTBhIGNwXssCDmA40IOq7QdQm00Dt1
	 9Y3MQOj9x3zg9vNHGC7fOez3LPjaqJtuVZ/2OPbFM9XPV7Xb7L7X1hNFrRC1y8bE+t1z+
	 CPpsNA4jhbRmCjG/o9u4Eq8lvrgapbe5sAUn741bv8lVrg+U1s1rV5wAvgrgZ9jVvLXib
	 nKpOqyu3/9fzVSt5bhozgqooWlXT4hroK3fdr8Wxj46CAJ2tx7n35D26ybdvFBL0tRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bmQ30jQqMNwZmjGFkuYgtcg/0UXtSi/qTb52PKDkGdY=;
	b=2+Udexogq1TBsHz30fsrLIfxEmMUK9CKC9r0ONAqlfYD7oercIJKHRyJwhNNZT6O7bwv
	 8jKGQM04Q9pfDDmLYrxPDuamFa9JYFp2HeY02pVioLF+qx6ZAJWxugWOQSx64ewjKzqGt
	 9eMY/2VoecVr9Dak2CPWbYm1mQ7L1Cnmo0pZvj7B4hE9QGsv8SkGbnP4lLbxDe0kcUrJb
	 YJbXARW+tWB9Se0bR6jY2jxDRXJp/AWQXdRcM4TRVzEx9WUwApGMn3aDEwWJiIf806d8R
	 AE/yqaPGaGN83zSeiI58+hI9TI6D84Cb97bQg9bFEFsRIkn1kVn3ffBSBth3nv7hRDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E2vptEh/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2f4jtw8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29446606A321
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29446606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E2vptEh/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2f4jtw8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGso12486542
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmQ30jQqMNwZmjGFkuYgtcg/0UXtSi/qTb52PKDkGdY=; b=E2vptEh/HQByNP4t
	7A+kHy4yItIf5B97NdyYtmKXd2NSkkLJnuhI/ksLoLX8wGBeROk53QZ5sKVpE/if
	pcdJa6Zj/7p7ITQBHkejZs1aJQt+IBC6UR3nYVtIczzDMU0sv/HuchF/Jl8ThPMo
	C1FDc/d/VPORUUHO5p7CO2y8XfRATeQWc5B7a+2AfQf2U26/Z/GExBegIHYcB02R
	oLhwWOkePWv5jjM/Wmyc+nmvbLVoJ2FnOCRUhQxN1eknDAsUZyB7PF61ELeG83C5
	um1dNJfuYUvyojlYzUEiK76c5RSy+DjffiY1SJhooOG5ALcuMcuu7CAFjnkV6rr3
	vVVkmA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy037ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869accaac2so1972311eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463519; x=1796068319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmQ30jQqMNwZmjGFkuYgtcg/0UXtSi/qTb52PKDkGdY=;
        b=A2f4jtw8d8s2cajlFlOYffzDzjGvDSk5MaDvJWS6Zr1Mq+zCf40EvUy5Qhn7eDzs/I
         0VCXJ6exnQgFjiPvdMBkfEQiyRayc1FVpYe9bP4gfCRaxvBk4nG14qF0m3aFJT7nuslG
         0wlBQbavlJxUmpIB3b4d2b1W+e1IjxCawXAdu1Gz1N5+nCCcPHSatdSyCBVAhfyDd6SD
         7bwvwbkMaeSzekRwO9Nf3+j3QJ5/7KSBOf/RJNvcwEADf07zgRIpW4833kfcbA2XzUDA
         x2JISF5DBRYozS3ZXVPVB00XyWXlpVkJ/eoM2BalmY7HNZqqMRExpj+eU7wwfskyVruE
         C7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463519; x=1796068319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmQ30jQqMNwZmjGFkuYgtcg/0UXtSi/qTb52PKDkGdY=;
        b=hqumz4xtW2G4qcLGoVCj338Llj2BI8GlBjATdDle9sZuvpE9FKyGy+V52HS+zpvuq0
         wBcmZ/fyjh1aWtk2APw+otDB1CF1PwGe5o4cH976JBhOc/lbBBK2IBmSlyrKPjYc4hHV
         80wzd83BDCUQ75acbyIEg2U7xB9N/t9fY0b3lER4GGgycWtLVSAPp9YkZHf0bXWnu5J4
         09tzGTV3x+X/LDXYPEMiAJLl/MMqtJkkuCHoVuB9khZMR+q8sd9W/jc/03HncwY+OaYY
         QlhDRCN18tblY7fO+Av2FjywmU3HyACjZMbRiuepKws7OeC+shr8GmwpDD05O4jiM1dJ
         FXZg==
X-Forwarded-Encrypted: i=1; AL+hErHMTBm7IRw29K6GkUchK8zNO29+TjQS95zhCLG0hJsd5EgGLt3B6/eJjPwgIc2Mzfdn5p9XqaNQ40wl@vger.kernel.org
X-Gm-Message-State: APuU4Z9+rpp71Kukv3Fe+I8VVp+ObWcYOAwfHh5iG8yjdILO4pwz+/hN
	RXAUJntS072Sl6PGnSo+0bpaKKXi+8ukJfDGlCRS4MzW2rx/QX5ZaF+8l29acgNLclquyGDNkpP
	1DakQjDf7EYBkfLUYEeolEQbZLz7j7i6qMEwC7LtceoBB7W+QT7Sfbhq2/RWW+39K
X-Gm-Gg: AZFdTZevquiILZtpoYbHXVedF3JPcVqUypZEafvl0xNTPTHIx4rRNpu9zzss9ZLmZuE
	RrdIWxFco37rowfxAPBZ1y+v6pddtJyzCZaUBZP7ueUdb4BRQI9bMBFqs3pGNZyEI0VKEEXXJB0
	wlcoNOPp8jMlXRzD172wQ+2T2EXs0TbveDoznMgpaR7vyVC2f9ldEiOV6597W/vpIgGwZikPh5V
	5tD+nu9EvsbRiN2B6TwhzPddN3/+kGPNE7Plad0iywrT9DCLUP1MvPagKE8un7fe3pA0W1M2P7R
	zUw1bP4gVWD7TFeQ/Og0KTauZ/vGDAyh2zN/TQ+PhJwMewNHsdLXMeK4iSSmkqv6tNXDrogpkPU
	kCz2E8hKfAiVQu1O5Tb+o6iPvyOXbSMw134LCXat/RnHZx/vh8NQ3fWNDjeb2owBhxe+XDpJuTw
	==
X-Received: by 2002:a05:7301:a0b:b0:386:a416:6c91 with SMTP id 5a478bee46e88-386a4166fdemr6588588eec.20.1795463519215;
        Mon, 23 Nov 2026 11:51:59 -0800 (PST)
X-Received: by 2002:a05:7301:a0b:b0:386:a416:6c91 with SMTP id 5a478bee46e88-386a4166fdemr6588558eec.20.1795463518660;
        Mon, 23 Nov 2026 11:51:58 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:51:58 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:33 +0530
Subject: [PATCH v3 02/10] dt-bindings: clock: qcom: Add PDM XO4 divider
 clock IDs
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-2-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX1dqnBirBfSRX
 hnYZIwct4zz+Y38ml+DwfXw2IylIelFXyeCbGsuOl3wTK3kZe40oy4g+uUDQckSOo9leYlGc7pf
 xaeryXVXjl9RryrS0n2+ENBpvKXLyM4BjS7sUNLifqHsMJoVAzcRwQGAeJIKsQL5fqyGB0DK/X2
 cpjAjJugsXXb/wVWF68tvPPs/HQDcgVrDluaN4P2UtGYhYOznF9CKyPujYFtesXIkZ1TSUWLutz
 BfoYy+tnGyhImMHrqh/BYv24AnWuWTQ5OywB9QjAgrZDFLUsZjD/edRUULo0egaViapOq+lhvjN
 tFm0XT59WVekfbHYtPA41y/KM4llIRv18M7lMKK8MZty5ZY6DVwp31ikYEbjgAujMnZI872iByJ
 SFvlBY/5uVNo2O46IQB3H8P3xo45F3uki1L9/YG++W0j6aQ04ue5LVaRm70ggrEyHza9EgVBO2Q
 JA1STSzi5tKivuplleA==
X-Proofpoint-ORIG-GUID: 1PYZr1PxVbZUiW44kHL7K3vrL7Wjwezd
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b049960 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ogv3psnu3gARwhNlCuYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 1PYZr1PxVbZUiW44kHL7K3vrL7Wjwezd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX+5SJkkY/m1gM
 c6KnbpplBVrHMTVRy1i+rc3QakOGWyoRYynWTno39/SUU8P+Yce9N9TUtNzvHWzofnei0wu0N93
 UcdKu/012J+1ScCsWuKLBQmPVa6VfzE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add clock IDs for the PDM XO4 divider sources on QCS615, QCS8300,
SA8775P, SC7280, SM8750, and Shikra. The corresponding GCC drivers use
these IDs to register the divider clocks.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,gcc-sc7280.h  | 1 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h  | 2 ++
 include/dt-bindings/clock/qcom,qcs8300-gcc.h | 1 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h | 1 +
 include/dt-bindings/clock/qcom,shikra-gcc.h  | 1 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h  | 1 +
 6 files changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc7280.h b/include/dt-bindings/clock/qcom,gcc-sc7280.h
index 3d5724b79bff18a858bdbb5c1654c5174e8cb23b..68dfd6616ce4b1c1e41f11603be639685301129f 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7280.h
@@ -192,6 +192,7 @@
 #define GCC_WPSS_RSCP_CLK				182
 #define GCC_EDP_CLKREF_EN				183
 #define GCC_SEC_CTRL_CLK_SRC				184
+#define GCC_PDM_XO4_DIV_CLK_SRC				185
 
 /* GCC power domains */
 #define GCC_PCIE_0_GDSC					0
diff --git a/include/dt-bindings/clock/qcom,qcs615-gcc.h b/include/dt-bindings/clock/qcom,qcs615-gcc.h
index 9704091636b87108a2a8c5ccc4a6b293829d8272..cddf21466a96a2990f1aaaf7c655fa6a4369ccbd 100644
--- a/include/dt-bindings/clock/qcom,qcs615-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs615-gcc.h
@@ -175,6 +175,8 @@
 #define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				165
 #define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			166
 
+#define GCC_PDM_XO4_DIV_CLK_SRC					167
+
 /* GCC Resets */
 #define GCC_EMAC_BCR                                            0
 #define GCC_QUSB2PHY_PRIM_BCR                                   1
diff --git a/include/dt-bindings/clock/qcom,qcs8300-gcc.h b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
index 3c674c7baaba91815b13450e647b41053bd7330d..cee26f50092044f4a0b4cead6f669f0ccf7343c0 100644
--- a/include/dt-bindings/clock/qcom,qcs8300-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
@@ -196,6 +196,7 @@
 #define GCC_TSCSS_CNTR_CLK_SRC					186
 #define GCC_TSCSS_ETU_CLK					187
 #define GCC_TSCSS_GLOBAL_CNTR_CLK				188
+#define GCC_PDM_XO4_DIV_CLK_SRC				189
 
 /* GCC power domains */
 #define GCC_EMAC0_GDSC						0
diff --git a/include/dt-bindings/clock/qcom,sa8775p-gcc.h b/include/dt-bindings/clock/qcom,sa8775p-gcc.h
index 01f54234963d6a531926103f8658307d4e0662f2..e101c9b565d650495e63f5f97b3458375d0e85ec 100644
--- a/include/dt-bindings/clock/qcom,sa8775p-gcc.h
+++ b/include/dt-bindings/clock/qcom,sa8775p-gcc.h
@@ -257,6 +257,7 @@
 #define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK			246
 #define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK			247
 #define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK		248
+#define GCC_PDM_XO4_DIV_CLK_SRC				249
 
 /* GCC resets */
 #define GCC_CAMERA_BCR					0
diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
index 656c959c7e1251ed9af8fd04285fe616dfe9ecdc..31d381ee5c2298127b060935de60a425a0572b67 100644
--- a/include/dt-bindings/clock/qcom,shikra-gcc.h
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -222,6 +222,7 @@
 #define GCC_VIDEO_VENUS_CLK_SRC					212
 #define GCC_VIDEO_VENUS_CTL_CLK					213
 #define GCC_VIDEO_XO_CLK					214
+#define GCC_PDM_XO4_DIV_CLK_SRC					215
 
 /* GCC power domains */
 #define GCC_CAMSS_TOP_GDSC					0
diff --git a/include/dt-bindings/clock/qcom,sm8750-gcc.h b/include/dt-bindings/clock/qcom,sm8750-gcc.h
index e234595d7f42d60291d60d7dcae6c6c8cb9b9925..cb2f40a704cf82d668577836b2a8d5756c1e7642 100644
--- a/include/dt-bindings/clock/qcom,sm8750-gcc.h
+++ b/include/dt-bindings/clock/qcom,sm8750-gcc.h
@@ -178,6 +178,7 @@
 #define GCC_VIDEO_AXI0_CLK					168
 #define GCC_VIDEO_AXI1_CLK					169
 #define GCC_VIDEO_XO_CLK					170
+#define GCC_PDM_XO4_DIV_CLK_SRC					171
 
 /* GCC power domains */
 #define GCC_PCIE_0_GDSC						0

-- 
2.34.1

