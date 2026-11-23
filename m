Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463509;
	b=O4p2LHwOQnA9EMXNFTdFyylhhvxremsitYAXOHuSfUQaSs4HDP9mO4Zaj11yS4zUQWys
	 xQECQqtItxh3f5UFQuMG0IRtQEtiQfL19vvPznZelFFJVck9ekEzudYJRwz6y7QFw7pXy
	 vkkgJYrv72XNxYG4JK6xtPLc9rT/J9EzXiARiDa+1MoHm/9fS68UyraixU2JfrKR6yUGR
	 sO4seHHtoCiTjD4A17hztPSGAxfw5SfCqF9UNeJsQowx78Fi605wYAa0vG4u+P4+TmJZW
	 9D28nmYzExkYG0gJH4EisK7N7KOf1afHJpX1kCerv9B6Fo0JQldiOZzYA8KuFvu/xrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=n+QKcJBRktTYuBTAHW1qaej8q94iwupCVASXpAxjPkg=;
	b=FJvvI17Xxdbm+S5T7sKt4hhs6ImuqqZD/cyjS9ZRmXDTvtpGSFnISHvb1oFYKzcBmgRE
	 X1QDFDNlyNIgLdECVsOUL4bNeBDaLE1r7ouwSNEx6BzHPfdzHPPEIAFYeK4VeKY7agE/R
	 XTwQuLf/fNRZBTQUugfoKOutXGPzKrANWiNlHLUSwKPaBplRpCzFhGEw6ZwT+JNEcIict
	 D48TJyro0lZXdvtEZE9y+fJlJRPa6sVe48aKVcQolpG+/6D8qnegH4JMsO7JhazJveoZD
	 qv2TVeTFvaNxw/iMYkavpPpdsZGztBAgYzjSYhNY8XifEsG6+IbNau73B/YGCl2TMBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g8mejC/+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs207oLo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9344A606A33E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9344A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8mejC/+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs207oLo
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGwoJ2377186
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n+QKcJBRktTYuBTAHW1qae
	j8q94iwupCVASXpAxjPkg=; b=g8mejC/+tDNHcOQeZNSHAUEhmaKbu4lCrNQN7D
	RQvWSFfTuQvVae1Ap00Yv0EL2ZA61atw2aAsrs/eG2nbwP2sV6uADQYhQh1xsIo1
	cZVRAS1yqArGmbmrgofdMFVmBxkCckzXaC1ChFUg/y+ILQG+wYId6RyezVwn7kVf
	J932ulVsNocU5AwXarGkaycqzPGZa5kL0EAPvmqagR2DMIsrVfjYN/ABdVncZh8H
	DeUDqUqTn52eMEJdBKEOs0nxJg0FPt3Xwwwrtj4T3naAM8Tp/ABE5R/4vPpaYwnM
	r5OFis4cCcTpjqmOppcfXUorWMMd0iVQ4krCb6veOFupVALg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut5qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:51:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5094036eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463505; x=1796068305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+QKcJBRktTYuBTAHW1qaej8q94iwupCVASXpAxjPkg=;
        b=Fs207oLodzgFUiUpF4f30aKjJ1aGvEj9u4q3LusdQHdqesz84u2YNq6bbCXFfR1Spc
         uCkFdDMJlCmix7zOSJmpjk20Fv88ztbt4i3NY30Dz9FTr9qNrUs9bnwOU7BeNeh8lzZh
         J6DhEnysfxrolxNUVNqdQrQyw4OFhM5QdHiDx+jBojeZ0+7/wnIfGMr49usLnFhM7+HS
         E0Vpuc6VKXLmPgpSAOPFNQhCndoryJuA4PVNrZJzChGh6jkVuLHaJjDkQo6fK3htVksn
         jI/JdAOTg3wQN4S5PDYJF3xq4zI+N4wQsvLaEZN4/quTaTXAnq6ikB5Sn3bhn8JmJsuT
         92Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463505; x=1796068305;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+QKcJBRktTYuBTAHW1qaej8q94iwupCVASXpAxjPkg=;
        b=bx8WgofpZRuQKvM4oBT+VMslE3RAp4jqTJJFJ7bhrZ3A0Z552N4VxbI3klv4uZ4rGx
         TBK8I3ts0QTZzKoarKIjkZ9CXP2N5DN40RmpUyadePFZAUDAMv77PnQQk0AJBfULX6NO
         3Bcp7hvSNbz8Z1UnxsLhN3l10R1JchmfdnfogJUeDn6Kn5LgxzJA5avtZmNgCzCLWBOL
         02EW2wGDeZxV4XPVqObGGMx7jmuxoYNZPMQszj45ldsHlJGKc5AwI8Vw163rkBtTH+VN
         dz41bayGsMo9YXK3rZq3MCqEO8uAFYo51CwaCNOz3yP2B0DwWqAMKFv3h+puwQ7CSF5L
         PZmA==
X-Forwarded-Encrypted: i=1; AL+hErFXqoT8cSBMeiT2nXDFOZg6X4cOsPFIcop4VeOoIdgozN96PkTGFx47hlO7W9SeyABkxwHIy6tVINl2@vger.kernel.org
X-Gm-Message-State: APuU4Z978kNrNsDXBDX9nCqaK0s8lGI4vxVIYwR41YDgEj2qasRyg4y8
	M0CKgmhqgE6VnM1V/sFiH/JhoLNHE9p0D89zoP3D0H91+hovfEtovx77M8N2PvKkXB4uCBUt0s9
	vtxX1rilYaCFnhr+jTZp1q7RFeADDGqSLtkxaGrK2EPZBbos9RZUlemBHXX1z6MCc
X-Gm-Gg: AZFdTZfFDny0Addio6tCEVtxpG3Oz2O07pRobVbyEcqwFdbPTaj7Mm5CJ4qIcw+KKqL
	VSq6tvplY3haAaeNKeersOP76i7w4aRtdL6IeQsqkfQs/9xAtsb0AcMBHewXksMW/HIPR1TIl1c
	tjbk5J6M4zuI32m0JagUK4mkkGJzP4yfhBJGiLQm9EBusnsqdtwOtpIr39fFcitjmFoB3+EJjBy
	+C0yCVSTxz3U0geCSOhKgXGi2ZXSvIGv9oINNTkBEbr6doZ8rih88zo5YvGdxfF6Py4Fz0IYUOX
	cVmW19IjiN77vga7R67672CygMDhMxxHDIhW0IvAr+FFlP6FIrnqqabckiFV/imokydS7G4tCCt
	qqRP0FeEM0sCcmjjbMBqVKDkrBJC8zzbh65upNmo/L+t/loV3zV0krZpV2SNIJvcyKEYU9qsR6Q
	==
X-Received: by 2002:a05:7301:241b:b0:386:b526:24d2 with SMTP id 5a478bee46e88-386b52636aemr3280635eec.41.1795463505110;
        Mon, 23 Nov 2026 11:51:45 -0800 (PST)
X-Received: by 2002:a05:7301:241b:b0:386:b526:24d2 with SMTP id 5a478bee46e88-386b52636aemr3280605eec.41.1795463504586;
        Mon, 23 Nov 2026 11:51:44 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:51:44 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 00/10] clk: qcom: Add PDM GP_MN fractional clock divider
 driver and DT support
Date: Tue, 24 Nov 2026 01:21:31 +0530
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEOZBGsC/22N0QqCMBSGX0XOdRPdbGlXvUfI0LNNR26zraQQ3
 70lXQaHH74f/u+sEFUwKsI5WyGoxUTjXQJ2yADHzg2KGJkYaEF5WZSM9BWZpRU43cQwC+ukWCh
 pGsYarpFjh5Cmc1DavHbttU08mvjw4b1/Wei3/Qkp/y9MVxCta1X1WMsjP118jPn92U3orc1TQ
 Ltt2wei4ErqvwAAAA==
X-Change-ID: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: SRi1M6AHV1jrB-k8wNjg8YR3iKMWE_Jo
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b049953 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Qz70-_R-GnIlLF7VpYgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: SRi1M6AHV1jrB-k8wNjg8YR3iKMWE_Jo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX277hTtkrRPPN
 70EU89OOR8C4LhCVj4FFRRB4OtrP79R5UkFcnHjvDrrxqrzY7ey5EIJeJNmfxpHBLRSAVMn47Qy
 8CwKnIGUkDSlJ8GVxEG7RMyzodPCtVY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXyjmghQPPuhUR
 sRFC1fnmspGuroRgEEQ8OimbTKgA/V1TxMC+Vh/rkw7rMnlvAWp3cD4xtostXH44mRBCfRV02nV
 TqgCPoC9AL24PHz8h97R1VLQQ6aKdJdl32H18toCxNKz6aEtb5iSGS4BVLlcuLHQntmTFtrVRQC
 1NeDvk2nQnmiQ7vo06fdK4AZGOJOvJN5Yt1JxggnrkHZ20+xLZ5nIjxBE4vGni1lhizOsNcEZl2
 KlMNEpvvuTdwiyNqf62TgXVF0BrNPda2vY4gfnbOcsnb76oxPSh9W/OhdppSR4einqShjRMjRFB
 aLiDY2WpDLLFM4Y0bpEDxiQlW3BWEZt0IroOJsopiKxe5nIoS6NKEpriYH6xLxEMS+5y5LEz6/O
 N06yscTR24yKrD10I95YMg7JNcgKg/MJ7zN9Z23HpahVKblwoSyxUihZ3PNmOGQ1JUU5xW+u7RR
 lH37S/Hylt4VXUuN4AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

The Peripheral Web PDM block on several Qualcomm SoCs contains a GP_MN
fractional divider that generates a clock output from the PDM XO4 clock.
The output can be routed to a dedicated GPIO pin for use as an external
reference clock.

This series adds the binding, a runtime PM-aware GP_MN divider driver,
and the GCC and DT support needed on QCS615, QCS8300, SA8775P, SC7280,
SM8750, and Shikra. GP_MN controller nodes are disabled by default so
boards must explicitly opt in before the output pin is muxed.

The DT nodes added here mux the GP_MN output onto a TLMM pin using the
gp_mn pinmux function. That function is added to the QCS8300, SA8775P,
SC7280, QCS615, SM8750, and Shikra pin control drivers by a separate pin
control series, which this series depends on:

  https://lore.kernel.org/all/20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com/

Changes in v3:
- Add configurable PDM XO4 divider clock, its public clock ID, and a
  GP_MN controller DT node for SM8750 and Shikra.
- Set the GP_MN assigned-clock-rate to 4.8 MHz (TCXO4 divided by 4) on
  all targets.
- Drop the per-SoC gp_mn pinmux patches; the gp_mn pin control function
  is now added by the separate pin control series linked above, which
  this series depends on.
- Rename the binding to qcom,sc7280-gp-mnd.yaml and its $id to match the
  fallback compatible. [#Krzysztof Kozlowski]
- Drop the redundant _clk suffix from clock-names (pdm/ahb).
  [#Krzysztof Kozlowski]
- Drop assigned-clocks/assigned-clock-rates from the binding; they
  describe the parent clock and are out of scope. Document the supported
  XO4 input rates (19.2 MHz down to 1.2 MHz) on the clocks description
  instead. [#Krzysztof Kozlowski, #Konrad Dybcio]
- Sort the fallback-compatible enum and drop the unused label from the
  binding example. [#sashiko-bot]
- Treat an unconfigured (power-on M = 0) divider as rate 0 in
  recalc_rate() so a bogus N is no longer decoded and the default 50%
  duty cycle stays valid. [#sashiko-bot]
- Use 64-bit division in set_duty_cycle() to fix the 32-bit build.
  [#kernel test robot]
- Order pinctrl-0 before pinctrl-names in the GP_MN DT nodes. [#Abel Vesa]
- Link to v2: https://lore.kernel.org/r/20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com

Changes in v2:
- Add SoC-specific compatible strings with a qcom,sc7280-gp-mnd
  fallback, map the 0x1000-byte register region, and document the PDM
  source rates. [#Konrad Dybcio]
- Use runtime PM and pm_clk for AHB register-access clock management,
  rely on the pinctrl core's default-state selection, and generate the
  output-clock name. [#Dmitry Baryshkov]
- Enforce valid GP_MN duty-cycle constraints and report high-phase duty
  cycles through the common clock framework.
- Add and register configurable PDM XO4 divider clocks and their public
  IDs for all supported SoCs, allowing the source rate to be configured.
- Split the pinctrl changes by SoC, retain Reviewed-by tags, and combine
  each SoC's pin state and controller node into one DTS patch.
  [#Konrad Dybcio]
- Correct the SC7280 output to gpio60 and disable every GP_MN controller
  node by default. Add QCS615 support as well. [#Luca Weiss]
- Link[v1]: https://lore.kernel.org/lkml/20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com/

The series is organized as follows:

  1. DT binding for the PDM GP_MN divider
  2. GCC PDM XO4 divider clock IDs
  3. PDM GP_MN divider driver
  4. GCC PDM XO4 divider clocks
  5-10. GP_MN DT support for QCS8300, SA8775P, SC7280, QCS615, SM8750,
        and Shikra

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (10):
      dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider
      dt-bindings: clock: qcom: Add PDM XO4 divider clock IDs
      clk: qcom: Add a driver for PDM GP_MN fractional clock divider
      clk: qcom: gcc: Add configurable PDM XO4 div clocks across targets
      arm64: dts: qcom: qcs8300: Add GP M/N clock controller
      arm64: dts: qcom: sa8775p: Add GP M/N clock controller
      arm64: dts: qcom: sc7280: Add GP M/N clock controller
      arm64: dts: qcom: qcs615: Add GP M/N clock controller
      arm64: dts: qcom: sm8750: Add GP M/N clock controller
      arm64: dts: qcom: shikra: Add GP M/N clock controller

 .../bindings/clock/qcom,sc7280-gp-mnd.yaml         |  92 ++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi      |  21 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                |  21 ++
 drivers/clk/qcom/Kconfig                           |  15 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-gp-mnd.c                      | 342 +++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs615.c                      |  20 ++
 drivers/clk/qcom/gcc-qcs8300.c                     |  20 ++
 drivers/clk/qcom/gcc-sa8775p.c                     |  20 ++
 drivers/clk/qcom/gcc-sc7280.c                      |  20 ++
 drivers/clk/qcom/gcc-shikra.c                      |  20 ++
 drivers/clk/qcom/gcc-sm8750.c                      |  20 ++
 include/dt-bindings/clock/qcom,gcc-sc7280.h        |   1 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |   2 +
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       |   1 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h       |   1 +
 include/dt-bindings/clock/qcom,shikra-gcc.h        |   1 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h        |   1 +
 22 files changed, 703 insertions(+)
---
base-commit: 96d7c30c51c0582a83806abba4c74e2c1344b324
change-id: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

