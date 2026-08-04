Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A822D2931E6;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825293; cv=none; b=p8U4a36ISF+mjOz4iC6tfZPfNLuhSP4NgzS37j801rYZK5xFFaLk78JpwlzDrGlhKwx4fRK3n5HmtEA4lKYDr7I2tQyop4/AFwTq9vCavwQMCubJSbRxraDEbvEtDp7c8GI3r5hLwyhlJqBbCCNbfm238etNk2E4PuPqB1DkMi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825293; c=relaxed/simple;
	bh=UQADokhMMs9ijQx/8MIvZTTkJpSOxP4ort4y3prZCtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J5wwG2h8TuN10pEFsbKcOUbvB/hv0juJK/focPatzQ7DvrxNY8dzDfulXsklMSOcGxuC8sQ7ud6q80Sq/WJQZGYQGqVgMvGq9ijPDCSrK9WTXWxmnT+83HJkcB/WlurslCHh57194VszTs/RW1QizE+epowiDt5nlPGsHebWpQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmH/yCwb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmH/yCwb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4935BC2BCF7;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785825293;
	bh=UQADokhMMs9ijQx/8MIvZTTkJpSOxP4ort4y3prZCtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kmH/yCwbezebx+rBiLLBKlDcAH/6HVMV+gjp38458RroFmEta9s0HQNDRSDXycMrP
	 n2wOO9CbygfkOuITatuT50KX3jB7fYk/JH5Ec7fezSpwXEaFWbyKDEXzUDI1XYa60D
	 PlBgFIm1W8ZO9wOARC4Bd1ziBq05rAXrraoz35BQlFEORfBDk0qA9P46N8tTCTCJLV
	 JrIMAWLy8TPWS9rVrIAxQaRbm9ULzsAVTBCpkhmi3KQZU9pbE1/2/JI6/FmYZKxISn
	 bpv9NNFiscTtv1JK8J6s8LY0xrHy9P9Q4Hl0OHcTeGh5wSrVHWXkyM/iqMgTH8NWdi
	 jzP17CiD8hbmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2394BC55822;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 04 Aug 2026 08:34:26 +0200
Subject: [PATCH v5 1/6] dt-bindings: arm: qcom: Add Samsung Galaxy S4
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mainline-send-v1-sending-v5-1-149dd4372ac8@alex-min.fr>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
In-Reply-To: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785825291; l=854;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=Lrgs0k4d0tyivYZbLbwfL0EK902GKco2rWAQQHTAiDQ=;
 b=acZYbIF9bHPvxd09sQmA3y6EGuJD/ggmJG3yTP7nnvfC7Svgd0recCie+slOO2gsG+4fb0jzl
 F+FWC5lYXZZAAU+uQ0e2zZ0EH3+1KxJ4MRGJnuiplNbIi/sOLFgCi6p
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr

From: Alexandre MINETTE <contact@alex-min.fr>

Add the compatible for the Qualcomm APQ8064-based Samsung Galaxy S4,
codenamed jflte.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..b7e186ed2efc 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -39,6 +39,7 @@ properties:
           - enum:
               - asus,nexus7-flo
               - lg,nexus4-mako
+              - samsung,jflte
               - sony,xperia-yuga
               - qcom,apq8064-cm-qs600
               - qcom,apq8064-ifc6410

-- 
2.43.0


