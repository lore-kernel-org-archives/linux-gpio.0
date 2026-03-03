Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CA37B3F3;
	Tue,  3 Mar 2026 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555600; cv=none; b=i10tNoorq+eeKT6M/zAy/tKAcVurJ5AmTjBf3rjtk1y6NqC4xnJCoOBJ7j8rCYhp3fCQ//FGwj6kqPROHhnh6SyKRZ7dI6vAiOpk4nqpIH9l8yxC255N5oeQPF8SYcC2vNUrTcKwUulr40FRsWYCEz2+RjN9nU+VWdpzCITU9hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555600; c=relaxed/simple;
	bh=GNniCdhssQvj6kOsAg5nxxAmhRPrZp0Gd8y3TJFrI1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pqSc+fGezt4k+fV2CBW8Y7jH5hrPXGkNrZ2BzycykC8qxN0aObXQ3/lG1ugQbKve26F0FtFN70YlT+8pEjkJEBrCIjPblTs00PckZux3bGrpZ9O5cJoUUEIr9YR4O8Qngu4XicpYhbdz9zZ2dNNBleT6C193NtXnW/dRI1xE9lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzzepbat; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzzepbat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D605DC116C6;
	Tue,  3 Mar 2026 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555600;
	bh=GNniCdhssQvj6kOsAg5nxxAmhRPrZp0Gd8y3TJFrI1g=;
	h=From:To:Cc:Subject:Date:From;
	b=tzzepbats0DYxPv38UnDFpKCG9GFlgUaJB2E99+0FEiPaO56cHA5TU+s1OcE2jsyB
	 v603bEMy1S4ox6OAXsDmhTi1Ylf89+IKGNnSxh8Hxgz5raT/1v6rjHgHUCXjMWsSBH
	 YmJwX0yLZ7nvZf9loPCCWOcINYpqSwaM8MU2FRzJtryEatw5R9nEsniVRwqiWxComP
	 AwjziEGlWoSA22nmwPRFibOZEEQ/4eqiT7QwcVbx4Owg4A68nxhWIh/iOuranCECcY
	 03b0anrNJ/9Li9g18//jcpkny9o6u2dLMCXqZgiOVzKxp0r/yOA94E1F9TlTC28f9v
	 zpFUj7vLz8kGw==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: gpio: mpfs-gpio: permit resets
Date: Tue,  3 Mar 2026 16:33:12 +0000
Message-ID: <20260303-irate-hungry-b54cda817e42@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=adnK8FQbeajElGGtcAWQu96FhmakqixOrQ9WdpBSAk4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnLeT08bkaErRQtnTTVm3tGzxKLvWrS6Up3CsssrO4L/ m3XOjm5o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPZUsXIcMt94e2wG5plD+9N tyjXaOpenC5WyXPvpN/7Ze7uypKfIxn+J8mpnOJnePkv+Pqhax3nD1wV2D6f/0nbouONt4PLVaU /8wEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Both CoreGPIO and the hardened versions of it on mpfs and pic64gx have a
reset pin. For the former, usually this is wired to a common fabric
reset not managed by software and for the latter two the platform
firmware takes them out of reset on first-party boards (or those using
modified versions of the vendor firmware), but not all boards may take
this approach. Permit providing a reset in devicetree for Linux, or
other devicetree-consuming software, to use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index 184432d24ea18..eaa254a468063 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -33,6 +33,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   "#gpio-cells":
     const: 2
 
-- 
2.51.0

