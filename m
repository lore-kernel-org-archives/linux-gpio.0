Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11E737C0F5
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260475; cv=none; b=FDwMsI5QU0oWaBV/CkrN0WkDNInW1cFCFaBY4VEHdCEgTD7OPChJ5L35FQZNGllec+PJOSlbTSgn7n7glYXASba+i4Bff1oXyQL9nQO0qNaKTWamCawwQBob13AYhz5hunmxTeXV8DlOtnBAQ6X0msWDYawsEjQIuhgqogrn4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260475; c=relaxed/simple;
	bh=y6+SHx4jWzVSPLO/G65pXmYK7pxuxGZP/jlOkCWmBgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NE3Sj7e+jU3mvwhXbnDfuHT6ZMIGaPi3AP7jlGIxqSbsC7tbx+57TLhyVpL1bI5Ay8o4RZ4FAZiEjB7sITg1yTEE+swXu1VRlOLClnDntcehB3LzV2JhQ4H7bmlOh89GfyixJck4naD4Ua5TMLdeLgq5T0W6+up3bPvvuulifc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQaAHxuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drJ+8Tzl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQaAHxuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drJ+8Tzl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795c0CP3065852
	for <linux-gpio@vger.kernel.org>; Sun, 9 Aug 2026 07:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=; b=WQaAHxuSent2Jsyc
	u3xpRYhi8UdSOyk2E6gBPQiR4iOUOQr6zojvtxgJS197LWZXIfaVhNTuDeTvDHl6
	wzqrH8HRmZLsPUjBC4xdccOdFSgzU08ekkJdvfuIwkgWgDk91M5bjfwAtsmj0fAD
	k4+HqRvBcWsUzC5+TWAwI8uBTH/X31hewTEJxUoFuWgKK3iPUrZDdIRWwTCPcTE4
	Am/Ik20QWFLzsqtav+uI0kSxJvQBqhTMJzo13eFM4OB9dgm9xYh2v1zmWE5tNndG
	xqDTJhEi7cRxuB1hvchGmBasRIh/jKITLwEyanOX24gJluKVkbSN/cNDp+6BMPWa
	SITchw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwt5gjqg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 07:27:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso28547925ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260472; x=1786865272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=;
        b=drJ+8Tzl2zoLEL+os2be8GEyv8qE6ZzGRtfGGVHyJ77fIPAGtcWFwZM2io8pAorLy9
         wN/+Gq0/u+a5m7sF0J6fqxpzQt5KGPVdNjg3zSX6EnbPnyPsmpYAm061ccctiq6+xH7v
         OnjzrcthBKLmmHls4AkSfJyEkGwvhc/KIdO4VivLJgAfiFW0jdxK5Ko3VrLE5nhvsTCR
         K1qANPBZu0ke9M9rJoH0kWQGzrXSjklC9deUDHEiOBjN6UxIhZr/52D/2r/iXfAOssVu
         K0fxjfFJdJf8JiTZHynlbohdNVxFNgTYZmP8rfokR/o9uX02XD+IHOXYpKO/IhqblNdt
         xx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260472; x=1786865272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=;
        b=a+b7WSQkyVD7siA5pYiwGFwfT9qemjNpcBOA5FByVHrcaJOdHSXK+UZlZiecRxx8mt
         j83dIn8NNHKRyzItKIT7rFUNenD5LOElqYT8jO5BpW5t7qI7vUGnNnVWDeAg8qfRjQML
         odzSAVggktjmQXZXoGROjjmxrUw+1IzZVlmDAiX8EzgFoHvpb/PoahKnVp7NL5LDuInS
         D4TE5aYU43f/nQH00qNZnoohAvUPhgPK2d7yRO72p9GpVqbiavHc4XwMihOW6Y/Z+/kC
         cwTEL7YndzkeTRLxcYIfRB9ofb16/msuH1DV3wAAiCOdhdCbVLduwbxaEqx/6iLY8TbR
         1jJg==
X-Forwarded-Encrypted: i=1; AHgh+RoWZkDWafH+9UI962bNOch1zxQv0Ct4amB03FE7m6gtdxv7d97A3umZthBi006+HiOO1r9sObu+o35F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ZfuFVeuIt2dHftgugZeCSFjAUE3oOGQj8iNpJrP5CpyUhnUs
	XnNODafq9Pt8QZuAKpncsyuafhWC5qa6Qy5KeKEJ1mwrlrvB3WdA8G4vQs8qB2EdoQevHVua3KH
	bQcp++cFyp2xgQ/mh/V76MIoxKSB2MSOUFw06neFVn/snRVr+XRig6c/SjLQG0LAn
X-Gm-Gg: AR+sD11NBMi9X4xGgOSYaa3GV7mLSjij0iv9YCieXCobX4UIjPj38gGdNr6BCv7dMi1
	D6raBbCS2h0lcjDOyOuUxHJGKzopH7vUhbp0vTLYzhwZZ+GmlKIJ7qyJiq4ASTWs4fwJkx6rVFj
	fo9r2e90NgPhpes4bG0ZDANhkzi/Dgi7KJOFy24FKoOzEPl3H8SD/w7/xRJWL/a4Ztb4p4hA4zH
	AFubzGPZTfP0zthdX/Rk6WoMPt49EdCwso2y79voOaYtrNmooYc6CMao0tD24yUP/3osdfTP88/
	kGmlj22eVxbEB7BwjhHSKRFXs+vUnSqaXz+5iY3zU42N8wgL/MxAqiNPZUmqfHUIPgaF4yHzsHQ
	n6UWjR9h3pcJxT47lElLfNrOm1q57BdxLonWQ3zfxMkABiwm0tBwOl41uKFnkwcBLvQZ3/3k1ZP
	ZHZcoehaokaVpgSuJZUznk+l4=
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr18623815637.23.1786260472492;
        Sun, 09 Aug 2026 00:27:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr18623755637.23.1786260472066;
        Sun, 09 Aug 2026 00:27:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:03 +0530
Subject: [PATCH 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-4-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=862;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=y6+SHx4jWzVSPLO/G65pXmYK7pxuxGZP/jlOkCWmBgI=;
 b=qhU7O99SDlfFR8Z6z4Kf6lk//kHxeS5D+db7xUfMIC/OxSBf8i8E3N52EXWsiRBWNVQrND6cW
 vhQd68Gdn9PCZzv27ywcqXlAqhuAQfcYZG3McnmiuRemmqvrYz7QiIc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=c6Cbhx9l c=1 sm=1 tr=0 ts=6a782bf9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jfL2y6gmHgFrDZrSC00A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX1MtjRaZRKQuw
 YOsgGA13pdhdqbFqXVxEfqL+ywLkSdQQ9yBiEdXlm277XUFS0R57XswwXo/+w7nqBnSSfwFikV1
 xg+YDWxpU2QOCyj7V0CV2pQHptM7C1c=
X-Proofpoint-ORIG-GUID: R7QKiRvwJC3EgMitK0ESiFcJYOdwsQPH
X-Proofpoint-GUID: R7QKiRvwJC3EgMitK0ESiFcJYOdwsQPH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX+3b8VD2gN2SW
 HcdTHRs3vcru5oIeWzcijIHXy3YIDIP/fXYkIwLEEj54ZWN+aSJ4GW91Wf3xEw50TdI2w8NBVcd
 xZtrLHJQ9KzHQEcisdg4X6WqJDUhNAIbk6icVkN8l0qkxHcuxE/kiTpJhlFPcQ6Lr6z0/8Hp2y+
 2reO5wb4ADKzfPfeMlmUs7CvCeOI8r0gnaRNHy6uyP6LbBot+/qa9I30yvC2LgU4WKzTe4d9Ewx
 drgjCAezBKuj38mc9FcIegkfXCcfGOaa6uaCprZPy2kx+58yS3h9pJVrGSwoXrgr7AxmFMmt2nk
 Vh/21yHWb1LgEa3uAm3I1AsXbeFgZ14rXnhVoWx2KYyZhSfgQHF8TPMoC1pKaoemnbB8orZsLDe
 rJDbHwpTU9T4o2bd31VYog7SbrTnm/Red89NOT7Nl4HviwgtfLbdLnOTYao4ppMlKWZkqWo2gCl
 f9Mk/ueBSv1CVVErszg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Add the RPMh clock controller compatible for the Qualcomm Kuno SoC so
device trees using it can be validated against the binding.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386042..971464c63ed6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,glymur-rpmh-clk
       - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
+      - qcom,kuno-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,nord-rpmh-clk
       - qcom,qcs615-rpmh-clk

-- 
2.43.0

