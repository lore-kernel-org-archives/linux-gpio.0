Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074741DE8BE;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807893; cv=none; b=ehVlM1HwxIIbogtgvMlsklMU2Oa8IEKcsD2v1cbh8uzOWgu+3CBntIYpOV8VpTMYMQJB10473iwWC0XmaPNva40jEUAur3RfM6dL2CDTxO52nC+meh+E5mYJt/ujJQQk32/5DlCWM+zBKBUFIkMZN03PNLiisLFlPKXv1B4J1yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807893; c=relaxed/simple;
	bh=jjQnxfRGET2wkjQ49uKQqq5EzfIY6g35fjsnjyMVD4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvX1PspUH+5mj2eXCx0O8Q3NaohYC89xW2peb3CXnIffTpEYKtGwE5TKfo0+DxwJkuZjHZld/08ujJBT5pUJHIeHPYxcoAWuWr5/kfkHICGdk7Hu4lL0HbNQPeHN1OpmWh/UeDTbbwIhFDH3FbVz+MuhNe5piHk8accJztjPZEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OY+pFhx5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OY+pFhx5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B441FC2BCC6;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807892;
	bh=jjQnxfRGET2wkjQ49uKQqq5EzfIY6g35fjsnjyMVD4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OY+pFhx5lOG86Ao5tfC2wtNj6CF2cBACUAsOrpG69Pz+aYYebjMhdfmIlOa8IbvOJ
	 umTOSEzROcreQEP8fktrctT7MnEKs5b9gr7aI8ZJJ3R3Ks7BLHANOEfRSTL+xN0vJC
	 LXnvNK4khINUkoNB0wFOenvDQVarwWlGNzOHCLiq6KK1fE9Lt4N3LU1qquD2cKjfSn
	 26R3K4reFS/Uarx/tsxXV+yLk0wBDSFt3VKczWxgtdg8+zIYFDyfxwmBv40FRcVvSf
	 QwbFl4Rw5OSEYwEUwI4YPMRmru4yVO3V6SqeQ0xHj+jDSO3/FyKjr+g9F8o/9sx3uu
	 Qmke8Hd6XKj7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A164ACD4F39;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Fri, 15 May 2026 09:17:57 +0800
Subject: [PATCH 1/9] dt-bindings: vendor-prefixes: add Rongda
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-ultrarisc-pinctrl-v1-1-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=871;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=9QG7ZiRK3RyROMWf2rb572b5ZDl0GYAcQWD6s3msFM8=;
 b=BmYVDPTGabV641x/qomuXrXxvhNW6sr86M4t/0nTP8YFuQsD95smGsJaFll9aSWKoJtQnh7cU
 5tJXdszmLHLBQn3ku83uxnGymFuIGnfBD/Gu4ylCzy79lP6l68xIEup
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.

Link: http://www.shenrongda.com/

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..04e593c66c7c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1407,6 +1407,8 @@ patternProperties:
     description: Rockchip Electronics Co., Ltd.
   "^rocktech,.*":
     description: ROCKTECH DISPLAYS LIMITED
+  "^rongda,.*":
+    description: Shenzhen Rongda Computer Co., Ltd.
   "^rohm,.*":
     description: ROHM Semiconductor Co., Ltd
   "^ronbo,.*":

-- 
2.34.1


