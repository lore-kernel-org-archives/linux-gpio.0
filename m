Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924AA3A71A8
	for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2026 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302753; cv=none; b=OHl/bcT0j69UmPZaZJgeYQ8txv2xWsADUcWg5TSVDTbPCrZkj0Ob67D+sAe6WzU2qJESGdm0/Dfbb6j1eDGMeFGHlaCXyUsWXyq/DwiPUz1bhjzohD8VAxFFxV7bVu191YWLpPGPpsmBuuvy9k+1evGVPIlSeYG90ojDGPyjadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302753; c=relaxed/simple;
	bh=pFYD9xnmywcXUkGLbix3V2jspMeKMaccoDyDTjuRfBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahRT0rohZB9U+xpkXCDUkAAuBWaH2/FtgHCqGf+PGLtKJ+8adhCzf/GotWrL8fG26n5ChfNK8EjtdMvSXd2c1o+TcvduLgTbqmcLT87Sg2aIKWt6O49eYeiZy8rAtr0pmHZMw4q115OfeWgQp3Eiq4+jY24YgDTsuww6oCPj/gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6Smo9kF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/D0WnKe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6Smo9kF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/D0WnKe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DATtT51525447
	for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2026 12:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfP
	Qn4Ziz5U=; b=U6Smo9kFJivHvkMds8U2IxKIiqYkWh1SgPCHvlOv3ToV6rfhIVx
	aiA7G1W061+QCitNeFESvaWnf7l5Sdx6GysnzFL7frFWJx4qVLd9gDhlH/M/cppB
	hguAc2gH/1hKHSNEnAvtTIUaqTeyW+5xCWooOItBKlVlcmA3v2j7+jQn+NMhmhm6
	BwESPjPzRpDR6BIEDIwhfXuEXFkznPV4vTDiHlL0nuQYhUEJAbNgDhUOY10U8nDi
	IHWOe0crgKe8YGX82cVwyCWbbKyMmlLW5VTNd5mDZJu12gZNnuWKzf+PAPrGt0Q4
	CTdRcpd8XtoXJXpnJJsJ1UXzLuf9WtCirlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d376r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2026 12:32:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f248907fso174114685a.3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2026 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302750; x=1789907550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfPQn4Ziz5U=;
        b=a/D0WnKeBJ4hknkMA/4HO58BiM/FDwjulLLLfU22HsRvC0yd8MV6PmXl5RS75ox+2t
         ukh3WmHJNhb4H/qU1TMMUQYPuL78aFb+gRS2fCUKjJYZRZHju3piZhFjxQYCBg08M3Pw
         TfzWcwFO4s3QcBEcAYRTbzejmHKI2hgBIZ1EhP7ARjnIE8JQIu7yX0iiqUrvtjiVf7aK
         awf5Ukhw5u0jqEfaU5CGaADD29/ccvUGBlRRWqbKeSabdsKXBQscuMfS02EdYYNDjLfk
         kDmm3fwGZcChLAVlmWI7qoJtfx3j5+krXxi+k79ktK3B/VLce5oPmoT5Xef1CmFnt9ic
         uu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302750; x=1789907550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfPQn4Ziz5U=;
        b=d9kdoFEM+tel4hq/mcPZeLIVPkFgmh14IyvanVXvNO+zrQyu9WrRT3vWeoXq/AW/KY
         3QIbjw4SXcmHhWYOsOn5nhRfFUMVTwiq9IeogNkW4vWs8YCfx7pvIx0YveQNjBi5IAE1
         9QGX3h2IHOnr3ILvCtA58/ntWJs4fkU6lZqz8anigINstuFNcPWH19IAVnGUtO+u0e3q
         POT9N7+6vAis8W7hk0xU2W4OsEr2LlfDsPlTquULLelf0Ul4Igrm8BhgRfF771sTvXjM
         M7oI4b5ew06rfqAsVBsJ/4lp8y98HLCEEblFLGPNcwCxdjQ2iE8qNIAGymprlS6NIEEV
         zMKw==
X-Forwarded-Encrypted: i=1; AKwUvBw3KC8B/Y7S59X25OJk9/3EZc1+GyJ1wCyU6ySVDz+Y5//udol4vQIF3HO4al7D8iTyMp/ZoY8Nk1rh@vger.kernel.org
X-Gm-Message-State: AFuF++m15dPksXYw60q8fGCcFxVQJCvgTHT0h0kvvybDct4dmxuJgW9K
	qfZNTc6MMgAxzp3uQk11S2vuF8yh5UQwdeaYSpAlv+oGM+LgOJqpsXn1ArmLla6nNd7vpaYpnft
	azU+PfmbUq10+D+fHhR50u2S4H2/6O7JHRh/wlOVSSdEfTnbkvW5Q4goMcCEvwYkT
X-Gm-Gg: AYBFou2MEh4Lrh/jZr7zmYrB0OttKprqiOxRtdQHqCbGAhWWb5OUeSn28O92QJ0LC2s
	iLMqDN6NJRSAuSWPtHZaawAQqXd0jhlBIWl9zQS2pnfjCRbz5bAK/9zOQeBz9GMtmgxL5O/5g1O
	4SKugSZ3Dgu72elvYI8K7iwhsM2XMTETXre1LMs0blWQSJC/2UHQKTTxNrndP1cM6LamUG5kRFj
	V968upMyWyzNPAasQwfHGC/2qG+Yo3VYxPrp7gDdjUQvrOgP0TnkA4djibwhC/DfeXESh/IDgmy
	Ky1Py4b79tgWBM9oT9ay52p5sf7KLwGuxxQoBk3WIPh9lFiKZQD2LFMVhzrQT/C2CzG0vciELXY
	GbQ8RwUGTz928wxo=
X-Received: by 2002:a05:620a:a0ca:10b0:939:ec25:e58d with SMTP id af79cd13be357-939ec260367mr1128823185a.12.1789302749605;
        Sun, 13 Sep 2026 05:32:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a0ca:10b0:939:ec25:e58d with SMTP id af79cd13be357-939ec260367mr1128819485a.12.1789302749044;
        Sun, 13 Sep 2026 05:32:29 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm329566615e9.3.2026.09.13.05.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:24 +0200
Message-ID: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11926; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pFYD9xnmywcXUkGLbix3V2jspMeKMaccoDyDTjuRfBw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppfXhbn/AsH2HCU28b+w1iRFMdoj44HN03Qm3
 9qsEYLGX6mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX1wAKCRDBN2bmhouD
 1zKAD/46HmSfdDukAVteVmwTPNNO1cL5boOFPkv4ZaaxjHIhnpTCrIW0WdWOE5fgJvjVwV+bPeB
 POxVwkDqBR8WdNMwhBksOAN2B9t6K/mT8VWgirLj4kJaweY68/N6GGVuwTqLJmHfJqFYDsFD9hW
 ez45yd6g1zgqrDDsd9oyrX3ERmzTtM4bqxvLFp0E2Qv9FgDpXXc4xGzsu2BD+0BwBfTaEFpepMo
 HjC2RXjiLCLufXzHIAA9i4agQ+x1I0M2+sAOk4sioEvDOeeBfDBDCVXQ+YPq+YqMnLMFUMmRzxd
 EeKQgkHRm7XMkDF/5QQxKdjDnf7dkG7MMQbgdooZGIGAAJG+WNIOpqQDfRpHHeXbeT3u6j1F4Tv
 sm90tdMOKMibTPwOr0oo5kSUS/jVKmg5Q2YzEFqlzDdRasM1ko5zYnSS7SsSmBYsxtE9Ewlau2r
 +3jATULQBaJ6vc3gJTdNu1ocY8OLKu3KDmdIUZ47C8ERQu1PBRlmQXC/DWMlwvG8KLRXGeD8Cfy
 vOZWuvUaw2+sU8pCu6gn/BqrmlhAdMDkwfBSVkFx3/Pse8y2L6RQ5stekSCSs6ru9avZLM0zNvb
 y9v20RgSOGflXFIFA69CaqMWm/hptbvXEVCzWUaTuzzPBysthZSsQMYhab3Jd84wdjQuZonyysF YnhKsJOyWxJxDXQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX+Xb/E2ezvYdu
 kkAhXqJ+JX0aKSI6yV9K++PRTr8rfGg8zNh/Natv60BL1t3/1pbihTqaK8YrB7rMEFZlojTmT58
 diA+BzKGvkK3cgTUgN12Hv5T70LD0pg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfXxV/kaIDZPerQ
 vUPTA9VVXH+5jiMVEs+aR6HkNiHrKltGCQYPi7VAr+aP4ixZBa9aoMFHsRnkAsrArhabBgIM+Pn
 aSO8rTR5S0krJoCna+PEGANRPPBPjLdRp59vm4YsxfjO+D5zmu0gdPPdHSEuHtYTpUW7mnhfRXu
 +eC+PGA2bfS2bVnEurlFpTpfCAXrnPf8h6pLx9A46MvpdnmHGM7kI6nNzK4DvxHCQYQQiyeHQeB
 Gybx+jywltQdSq6pqf2JQS8o3h2Ct2BpJ+pJgvLffqRa3hZOMo0Ug/dRvDzS0aAzfT3fYNgpMmd
 ZdPmG/i8Q6m7pcNcV55WoUnntoI1ns+ZXnw0kI+MGZw1GMNEgbIsJUN16qbQHaZxRV84MSuNZpd
 LYXAz4lz9V4tUFl1288gX0TvSmNVoubrk+C7yGQJaFaSm7aMcrq8L3BuRB3h46PDWrYoio/l/5M
 4rjCHIyLskgzm7QeBZQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa697de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=9YUYMJPlCa3gOHXfvi8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ULGTQY5xCYpoBPo5NYi9tITX3RFxB_dX
X-Proofpoint-GUID: ULGTQY5xCYpoBPo5NYi9tITX3RFxB_dX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../pinctrl/awinic,aw9523-pinctrl.yaml        | 50 +++++++++----------
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  2 +-
 .../bindings/pinctrl/fsl,imx7d-pinctrl.yaml   |  8 +--
 .../bindings/pinctrl/intel,lgm-io.yaml        | 14 +++---
 .../pinctrl/mediatek,mt8183-pinctrl.yaml      |  4 +-
 .../pinctrl/mediatek,mt8195-pinctrl.yaml      |  2 +-
 .../bindings/pinctrl/qcom,hawi-tlmm.yaml      |  4 +-
 .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml |  4 +-
 .../bindings/pinctrl/qcom,maili-tlmm.yaml     |  4 +-
 .../bindings/pinctrl/semtech,sx1501q.yaml     |  4 +-
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 46 ++++++++---------
 11 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
index 98c310a3c63c..1c09c0fd4930 100644
--- a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
@@ -108,32 +108,32 @@ examples:
         #size-cells = <0>;
 
         aw9523: gpio-expander@58 {
-                compatible = "awinic,aw9523-pinctrl";
-                reg = <0x58>;
-                interrupt-parent = <&tlmm>;
-                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 16>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+            compatible = "awinic,aw9523-pinctrl";
+            reg = <0x58>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&tlmm 0 0 16>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
 
-                keyboard-matrix-col-pins {
-                        pins = "gpio8", "gpio9", "gpio10", "gpio11",
-                               "gpio12", "gpio13", "gpio14", "gpio15";
-                        function = "gpio";
-                        input-disable;
-                        output-low;
-                };
+            keyboard-matrix-col-pins {
+                pins = "gpio8", "gpio9", "gpio10", "gpio11",
+                       "gpio12", "gpio13", "gpio14", "gpio15";
+                function = "gpio";
+                input-disable;
+                output-low;
+            };
 
-                keyboard-matrix-row-pins {
-                        pins = "gpio0", "gpio1", "gpio2", "gpio3",
-                               "gpio4", "gpio5", "gpio6", "gpio7";
-                        function = "gpio";
-                        bias-pull-up;
-                        drive-open-drain;
-                        input-enable;
-                };
+            keyboard-matrix-row-pins {
+                pins = "gpio0", "gpio1", "gpio2", "gpio3",
+                       "gpio4", "gpio5", "gpio6", "gpio7";
+                function = "gpio";
+                bias-pull-up;
+                drive-open-drain;
+                input-enable;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
index 8ed53496c386..4ab1f00775cc 100644
--- a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -86,6 +86,6 @@ examples:
                 pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
                 bias-pull-up;
                 drive-strength = <8>;
-           };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
index 948160cfbc5f..7275215918bb 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
@@ -106,8 +106,8 @@ examples:
       fsl,input-sel = <&iomuxc>;
 
       pinctrl_gpio_lpsr: gpio1-grp {
-          fsl,pins =
-            <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
-            <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
-        };
+        fsl,pins =
+          <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
+          <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
+      };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
index 1144ca2896e3..96c405711f65 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
@@ -64,13 +64,13 @@ examples:
         reg = <0xe2880000 0x100000>;
 
         uart0-pins {
-             pins = <64>, /* UART_RX0 */
-                    <65>; /* UART_TX0 */
-             function = "CONSOLE_UART0";
-             pinmux = <1>,
-                      <1>;
-             groups = "CONSOLE_UART0";
-          };
+            pins = <64>, /* UART_RX0 */
+                   <65>; /* UART_TX0 */
+            function = "CONSOLE_UART0";
+            pinmux = <1>,
+                     <1>;
+            groups = "CONSOLE_UART0";
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index 3db2438fadc7..4bcee7741fcd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -221,8 +221,8 @@ examples:
 
             i2c0_pins_a: i2c0-pins {
                 pins1 {
-                  pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
-                           <PINMUX_GPIO49__FUNC_SDA5>;
+                    pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
+                             <PINMUX_GPIO49__FUNC_SDA5>;
                     mediatek,pull-up-adv = <3>;
                     drive-strength-microamp = <1000>;
                 };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
index 33cb71775db9..0bcafa78acb2 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
@@ -234,7 +234,7 @@ examples:
   - |
     #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #
+
     pio: pinctrl@10005000 {
       compatible = "mediatek,mt8195-pinctrl";
       reg = <0x10005000 0x1000>,
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
index 3b3961789860..2b1354e212e5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
@@ -113,8 +113,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
index 53534a07a1f0..ea7d4768483d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
@@ -120,8 +120,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
index 64fe90b2391b..a0b56adb3388 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
@@ -113,8 +113,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
index 39d7dad3313b..f7a7551d7f50 100644
--- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
@@ -244,8 +244,8 @@ examples:
             interrupt-controller;
 
             gpio1-cfg {
-                  pins = "gpio1";
-                  bias-pull-up;
+                pins = "gpio1";
+                bias-pull-up;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
index ce66fd15ff9c..300d38f87f2d 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -317,37 +317,37 @@ examples:
     #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
     zynqmp_firmware: zynqmp-firmware {
         pinctrl0: pinctrl {
-          compatible = "xlnx,zynqmp-pinctrl";
+            compatible = "xlnx,zynqmp-pinctrl";
 
-          pinctrl_uart1_default: uart1-default {
-             mux {
-                 groups = "uart0_4_grp", "uart0_5_grp";
-                 function = "uart0";
-             };
+            pinctrl_uart1_default: uart1-default {
+                mux {
+                    groups = "uart0_4_grp", "uart0_5_grp";
+                    function = "uart0";
+                };
 
-             conf {
-                groups = "uart0_4_grp";
-                slew-rate = <SLEW_RATE_SLOW>;
-                power-source = <IO_STANDARD_LVCMOS18>;
-             };
+                conf {
+                    groups = "uart0_4_grp";
+                    slew-rate = <SLEW_RATE_SLOW>;
+                    power-source = <IO_STANDARD_LVCMOS18>;
+                };
 
-             conf-rx {
-                pins = "MIO18";
-                bias-pull-up;
-             };
+                conf-rx {
+                    pins = "MIO18";
+                    bias-pull-up;
+                };
 
-             conf-tx {
-                pins = "MIO19";
-                bias-disable;
-                input-schmitt-disable;
-             };
-          };
+                conf-tx {
+                    pins = "MIO19";
+                    bias-disable;
+                    input-schmitt-disable;
+                };
+            };
         };
     };
 
     uart1 {
-         pinctrl-names = "default";
-         pinctrl-0 = <&pinctrl_uart1_default>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_uart1_default>;
     };
 
 ...
-- 
2.53.0

