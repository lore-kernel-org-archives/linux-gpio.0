Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7014B386C12;
	Sun,  2 Aug 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785656050; cv=none; b=JZRZ5gIxOzPQZb3mvPUp3Xb1F6go9K0oZ+b+WLKCLHhYU2AoZOZAyJQtpJW0BxmTIUZy2dzU9QclDuYXhd0U71ex+Kw7TQcmS4g09QEHW0xSxDMxO63CXqu0TyuKSWRH5wWgnSfYvqAfZhFzKKupHzdo8po5NUarcKZXZINZ76s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785656050; c=relaxed/simple;
	bh=kk/h9EqTHf1du7pPLLLg/wQ11+5cMf//VGDNEIKBpVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JqgIL0tlSW/gLwzvp1FlV0QamV2i9xXmcXQ7+qXNIkRpCMhwJREfky9AEIbfWNl/rRMBzdIZGuM5xQICD4rDVEBpRpPjZ5R7eaL6YTkjrTq9u5j+KdUog9Eo5+f7CWVZ8lCcDI8KIrzhkp/apwQZ3gWZxGptGiJpFk8V/oB6998=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmd99qg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmd99qg9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07D4DC2BCFB;
	Sun,  2 Aug 2026 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785656050;
	bh=kk/h9EqTHf1du7pPLLLg/wQ11+5cMf//VGDNEIKBpVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lmd99qg9X+j7ac3WxclQfsv6KSL0EsrdFMS72VV5YSE5qG/v/cHcV1+daMFDFdXGs
	 T+bk7HA0MkDFcspxYDdLSqLchMK3XdqMoOkzmXQc3WPPnXJZSwe36J+49E6rA3Gpss
	 4Z79JNc8MKyLALWmLqXZe+XAsd/uX+KV8Fzj0hQmvDLDJHnJ2h0MRmFYgh3g1k/xNX
	 qguZD7pLDhtRTQThrDOAVofR+d2LFLLv2ZNGxqZB5x5YIxTHvl0RQZ8g9ZzxSgIdkY
	 EtwVJc7gtpDdIBBC/wLVnx/Aag0MVBfXPoDUKrermyYPrM58cuBW/6/YGXle6nbnro
	 jWuRYXzZ8YKFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8131C55179;
	Sun,  2 Aug 2026 07:34:09 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sun, 02 Aug 2026 03:30:56 -0400
Subject: [PATCH v2 3/4] dt-bindings: pinctrl: qcom,sm8450-tlmm: Add
 compatible for SM8475
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-sm8475-tlmm-v2-3-a93e1d1cb53b@proton.me>
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
In-Reply-To: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785656048; l=858;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=uNYE/Aw+T2Ydk8qBeptK7lz6gSl5CHQQQ2W4ELAzgXE=;
 b=9yeFSDwUCfMzNItrzFZOml7DUdDrqrYJed+jwA6tV5JQWsXILynfc8sIQ7mdrMUI7UaOf2G2N
 ULiBXphXKLyBd8xV8ht4FoLJB9zqie8+z3MHxkIbUEh/0j1uK+zuHK6
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


