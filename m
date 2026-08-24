Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F444E671;
	Mon, 24 Aug 2026 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586533; cv=none; b=nwO6I/DQHkanW3btRQYE/C0ft2rAf2DWTnOhKhYv74X74Mb4P1pKJ8kq+yhfHu0Nwzg5z3QOM4vboJLhEAP0y+Au9txgsP5OljelRkZAKRVghaH26lW6LrEvzvBZSuN35Qd1zKirX+DUo7ig0hKCqUF/IjgYt4fv6u5fr0Zti0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586533; c=relaxed/simple;
	bh=lzdnAUx95T216IUDSVY9aeEOQ1aidV6c8zN6L4b7fuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AAY77e90piTWDhCt0eJaf7LJB67GPbjEkxoAmhgXERZXYQxjPv9rOOz14Zdz+ULqSIYhHRK//rPUY3+E4XJdF5jM1kSI5AcscYG7PgOxDLce99SCrJyoN/u7JcypcxJKMrzL2PWZMhs7XOGJnm+Z0GHdlxzHE6ICGXE23M0A2fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSK1N2+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSK1N2+j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0882BC19425;
	Mon, 24 Aug 2026 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787586533;
	bh=lzdnAUx95T216IUDSVY9aeEOQ1aidV6c8zN6L4b7fuA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XSK1N2+jd9V3SRtV2eXKrsFOyng9GG1o832bXAXv5uAbljD6XfGPusjwqWUvHdAMI
	 CutN2DitxZGyTp/8gN/H4Muk+f2EGXVC86vLNcAKMulrpIOfd/UgjYGHVle+EILIDo
	 SF1osmloDj8PRlHFk2xyphhLCKuX7F8rP1xfJWZ+u5VIn3qcD2vRJjq37Ne9EuU0pU
	 1KZR7OhFF/2P89nqaym7lOkWmlDxe1jEPiVVZMBJiLoAT56DVm+a9XtQEtFNEvB12o
	 BGJ/R7heIPH1Pfw7BFB8iqTXs+GRd6yIVSlKEE6JA8gdPTpaDtlor1UlisWTLvV9fD
	 fS8Y/ccrDVPyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D729DC5DF9C;
	Mon, 24 Aug 2026 15:48:52 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 17:48:51 +0200
Subject: [PATCH] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child
 nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-dt-qoriq-gpio-hog-v1-1-d75923bcecad@free.fr>
X-B4-Tracking: v=1; b=H4sIAOJnjGoC/x3NwQqDMAyA4VeRnA3E4obuVcRDWdOaw0xN3RiI7
 27x+F3+/4DCJlzg1Rxg/JMiulZ0bQPvxa+JUUI1OHJPGlyPUQ2/uezG/oNhx01NNkxZFBdN+KD
 ReYp9oGGEGsnGUf73YJrP8wJqDSircAAAAA==
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787586532; l=1584;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=qt8u1pcOwjvjD2kGag7Qjh2sfmvzstUBk/iBZTZZ0oo=;
 b=pXqaykBNOpFFaSmjGjMEEsngg26noICqXld0sY3tOpzZm1b0/S8moly//tMAbHa06zD6AgC6n
 5P1UrlGj246DEDU6C8SIgQ3dtywUK3HScsphobIjlIpV4VV58qS6Nlj
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

The binding sets additionalProperties: false and describes no child
nodes, so every gpio-hog on a QorIQ/Layerscape GPIO controller is a
dtbs_check failure:

  gpio@2310000 (fsl,ls2080a-gpio): 'ethsw-reset-hog', 'flash-reset-hog',
  'pltrst-hog', 'thermtrip-hog' do not match any of the regexes:
  '^pinctrl-[0-9]+$'

hogs are handled generically by gpiolib rather than by the controller
driver, so they work on this controller exactly as anywhere else, only
the schema disallows them.

Note: some other GPIO bindings already have such pattern:
gpio-mvebu, gpio-davinci, aspeed,ast2400-gpio and fairchild,74hc595

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
index 4cb2a6b9fabfb..a6252440e099b 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
@@ -63,6 +63,13 @@ properties:
       GPIO registers are used as little endian. If not
       present registers are used as big endian by default.
 
+patternProperties:
+  "^(.+-hog(-[0-9]+)?)$":
+    type: object
+
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg

---
base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
change-id: 20260824-for-upstream-dt-qoriq-gpio-hog-5092a0f4d089

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


