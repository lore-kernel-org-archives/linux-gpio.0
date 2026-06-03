Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B63D1717;
	Wed,  3 Jun 2026 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499834; cv=none; b=MBKR1VgowIh0Av5NkWSDpakV/M6A1CS7BYUQt5mZNoJla3aF/75jTqK9WKSUj3rlVLh2LY3X+yh77DZx9kQISuzjh+m8y3R0StbNQnfu25SqHxj1/v4YhQgiaOyOn0/IG2BrsIIHhEXcnMP6daGq3C525SmlxO4Vm+q6YpsZMic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499834; c=relaxed/simple;
	bh=LtTbRDsK4gjdoYdesANaiItjHA/I+jljw0J8rnBxa60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNfqzNYn+SnmQGRkYCwoaaTGCXUCond9CLSF3LwTH32QmMqIiiQelc/HGF+n75+eXFrBLL23j/xL5r4eAZuqf6RYMe3MnpmG4mH6aeOQ1Te31fVgBntXIUwwonBC2MkdKxYXCvhCK6APqoX6EFmLCmzUEAupuzKs0kno7qpNRcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2tmbu5u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2tmbu5u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388B91F00893;
	Wed,  3 Jun 2026 15:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499832;
	bh=aYa8cW3ExKVcGtvZx9/d68cn0QCtm1meSMNr+qL06Nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U2tmbu5ufzgCRljltgRBMr9bjnPQoP/XzbPdZrBfY3M+OkRay5iHr13sAKG4mghw7
	 EKCYT2AOk6QNUAgPIzjkVuUUMKKXGYxboikCZu/VmO29ckBjyDo8YuCtgXbegcrexB
	 lOzbyYK4WrNjFTOdwMRw+aMehEoDmb6IqgIVSCP6sOqkM9CDnKr3qSTQ+IL5R7QAVM
	 3NbKdECP7KjsWx5dmVUq/D/fJ1ww72YtPX/u4bAEb8590WF1bc+fhj+eoJTL+pXxtW
	 Is6mHEwlmVyNSmHY/zg2FmXmKY3R3lY4QDD6gAw8HiMnMizP8NN138c5d18SZT8AuD
	 ybar7Td20PT4A==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 4/6] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C power source option
Date: Wed,  3 Jun 2026 18:16:40 +0300
Message-ID: <20260603151642.4075678-5-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
1.8V. Document the missing 1.2V power source option.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fb1fe1ea759f..32864c9add4a 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -129,7 +129,7 @@ additionalProperties:
           enum: [ 33, 50, 66, 100 ]
         power-source:
           description: I/O voltage in millivolt.
-          enum: [ 1800, 2500, 3300 ]
+          enum: [ 1200, 1800, 2500, 3300 ]
         slew-rate: true
         gpio-hog: true
         gpios: true
-- 
2.43.0

