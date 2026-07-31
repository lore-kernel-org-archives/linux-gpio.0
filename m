Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442745A280;
	Fri, 31 Jul 2026 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521447; cv=none; b=onNYG6pzXuLCaMmJtncAz/zo3uNCAdQysMBax6Rj7CtAh7yuyxHkFHeHNB6Lb3173dJLhL076le+/FEmR6tQDspvJn6osdQBbQOVsoxlfVMUQedHUQDb5lx6A2LPv8IoRpRu/+PzTVOGnGjjCBukopHLs49Bnu22fhe1Hr8UuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521447; c=relaxed/simple;
	bh=kk/h9EqTHf1du7pPLLLg/wQ11+5cMf//VGDNEIKBpVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cTl9SXAjmraYDa84uxJuHk45N1C2H83EfTB5i15WTjQ9hHj0QzePWE+t4pGiU6jWZRsUqZh90Hku34SlqfOTUaaP2QGhKE7w2KNyk8dVTB/9sqK+eXRD6350czJ9bNgd3cAA7ohUWeVDouLUIARGEuMrJrP9LOV9x0ffdqeS0Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecdIncY8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecdIncY8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC950C2BCF5;
	Fri, 31 Jul 2026 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785521446;
	bh=kk/h9EqTHf1du7pPLLLg/wQ11+5cMf//VGDNEIKBpVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ecdIncY8N8TbQqxxPeT8Rui5ZEYJWAMEiCqOK0N1qgqzIby3lGl1agOyJP8z7t08B
	 bVXk7OF/S4CjLGET8bE6mYWnhQQDJH8GW1Yeplt3HsYE4CqICcQqjbLBjFlpEMdxee
	 AzjcimXY322zxeMblGQt384Le57ovAAKy1eQNvb65K8NCo0p4EftghYJjBMggJvD+B
	 rGhjiPficGDFwQUXYs6UYuSvYebjJCfmonKUv1pJydCWqmvSqvvfO9MOvmo3FlbFyD
	 dH80XZs4n3m9XACAAGMyyDpTLgWN4UPldYjZ4WOtmaEeT++Ff6Dkl8DPTDnHdzeESS
	 oNO6lAQKhFY+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0566C55174;
	Fri, 31 Jul 2026 18:10:46 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Fri, 31 Jul 2026 14:08:24 -0400
Subject: [PATCH 2/3] dt-bindings: pinctrl: qcom,sm8450-tlmm: Add compatible
 for SM8475
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sm8475-tlmm-v1-2-3007a8e4aa62@proton.me>
References: <20260731-sm8475-tlmm-v1-0-3007a8e4aa62@proton.me>
In-Reply-To: <20260731-sm8475-tlmm-v1-0-3007a8e4aa62@proton.me>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785521444; l=858;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=uNYE/Aw+T2Ydk8qBeptK7lz6gSl5CHQQQ2W4ELAzgXE=;
 b=0y90eIdphhoGeVeb+kEaTiqKGFbkklwSR0EMxiYy+tpB5Fcv7VYsMfApMPLXpYN/Mzr+b9Sm1
 Asg+wqf8VvjAz3KjQLmWIM04zaidau3xgdCEZS8/xZxT6drD3ytHdr6
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

SM8450 and SM8475 have different pinctrl drivers, which are incompatible
with each other.
Add compatible string for the SM8475 pinctrl driver.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
index 16fd2c5e2339..c790ab851bc7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
@@ -17,7 +17,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sm8450-tlmm
+    enum:
+      - qcom,sm8450-tlmm
+      - qcom,sm8475-tlmm
 
   reg:
     maxItems: 1

-- 
2.55.0


