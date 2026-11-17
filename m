Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940194;
	b=xfp43BWgV283+cr614yXBN/mZhchjZoSHfMkTYlCNAJfXSH2Cgr1n0OlGZj1WC2pmiIG
	 BoEwg3NArBcLkg7PiNlPeMyLYyZu2oU7m5I1iRCWa33pS22oMUdA7y2+yFyyQVa+y9xFl
	 FTit4my+WM+34FFVFO4RSkWUpF0tPEd0h+kaMxlbchh6F8oe9aV0giFt/3YKQDMIRi1AO
	 i/rg1BHOE4tr6g4Y3s8rL+wZ3ESmtuEuGwAsmW0UQwePr6Cjmk6ElWuA9yjsacsCHmJyY
	 SdOfB47xvB/k/sWIGeh169VCWxoeCbGdgmbtH6Ndr0nwIwLprIWY3GoUAPZLSwMFABA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940194;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
	b=cpqRC3CH5XmYluM7iV1y1ctuCO+jZaib/p55pXU1d/aQKvfN9G0TdPYzX5i44le/OlRv
	 XukbSlrvlNxbyMPIzUPnci+4AUcMI0rOYUInCm+cRFJtToQyb8uUuzrgNEDVI1g0dWBjz
	 BloTscDR1enASUvrsP926sSBFG+26wgums90S0FOhsp80xE54QpqCyUBV8kLQawtzn5Kv
	 V6kdNzcGl/9+ZAVtDidOH7u2uINN3jjSfEMIoQo8a2MRz5TT8IwlRylBYZdrhus+5XYrC
	 OH/azqcC3jC2raDmsJNdmc5gFxgpU3BgJ1Q9rpqX7//0EGUQeEoB8e2kRApUX76I22Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Sopqg9tz;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="yHrq7l/w";
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91987606A88E;
	Tue, 17 Nov 2026 18:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91987606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Sopqg9tz;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=yHrq7l/w
ARC-Seal: i=1; a=rsa-sha256; t=1794940174; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EEJja2CiHinb6MEKwNHnorHFw5/+knlpb1m9/hIpjt0dPVD0t1US32SPQ3Be9DQYGp
    DRDEu6GzKhauKn5BZwqDGEksun6MobGCQ3nAwnXcMJ8/tJiRVxmQKSEXrOFC1eZCiW8E
    xX5tLqSb2X5hKVrRpVeT7KAEEI/WUN6gEGzIOvZI4u/geGzyHaC0dXtscysU+K2S03Sr
    DLQd6SPr31HFBV6DbC/YIr9oOkJUY3+pu2s0qk4Pt+wldHHtCtjGFE2lLBUvHj0XbtC7
    oR6VpVuw1Q+MK5otHk252eeAZ06NYdRsJel1v3VkfXHHIQcfpMt6hQRLIgeDSmys6u+L
    L+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940174;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
    b=LqHCMihNjbYS9Vy9LUfcakhvyz4KJjWSgbYcWA+DxQDUgc1mK/TlorSSCQ7QtOrAcv
    YCWrzPPhsZGH/icBKDGE3jIw4dkdzcPjZ/9fpOEVKVr7POryJI9D7dcel2mEW4h2H5u5
    4wx1ZD+OATnp90aZg/HNibUx/jLQ/nN9MNW5HEmWU+1+/Zw1FSG5/ti9AxdhxZ6gs6/W
    QssJLqVmavogf/VIQyLgoTTC9gIO1qGiV4JBakVgEynUjrTFcCJKWVY96lYFMWZXiiyk
    vlindMKyr+2rlmUjIsG87CV7MkdsFuUJVbP4IiXPALI2d+5shaVEvRI+V+NiIoIB26Z2
    V6Xg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940174;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
    b=Sopqg9tzbK6P5wBHZQCgIH5e2U4xLhAWTuWKxbbC/ELjlEmGbdv6sz9ZFe6idRbRJx
    Rk/HqAUPggGFQfIy/7LdCWW4jJwiDxPeRK2gMwGR7LHg5l+MlvI3Awqr5ZViKrnWGn0g
    WSrIKYBPDFyn12BstGrOKXBl48iMpPWv2Fi/X8/xPmkOBsFovFFLo2WX9zCOn6Vwu3YO
    ZcFJwUA0LOPaRhoC5Zvx8UWX2GmRRksB+oTQZPxLfIPhfyTeTBXrHJVM1DXyJAY7t6Hc
    wwAlWZc1F21a8TkSa72zu/7OgA2wbjEY3shrRAzOkrP1A7yHg7QWtc6Fm2We5/EPiUKu
    CaJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794940174;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
    b=yHrq7l/wxXCHl3UE6fXfCPURjcpCBCLpRgTHuuLx8i7aS70+EDB4vkayUB8m3z6+En
    i+Kjf/sl0lZB+hTFcLBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ppelMiNKoEY92nD9kO01+3QZuyyF4VcrvHZ"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AHITXYbQ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Nov 2026 19:29:33 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 3/7] dt-bindings: pinctrl: ingenic: Add X2600 support
Date: Tue, 17 Nov 2026 19:29:24 +0100
Message-ID: <98bd8062ff2cda00ec96c8a540aa9d2ac789af2d.1794940167.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794940166.git.hns@goldelico.com>
References: <cover.1794940166.git.hns@goldelico.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Add the pinctrl and GPIO compatible strings for the Lumissil
X2600 SoC.

The X2600 has five GPIO ports with 32 GPIO number slots per port.
The programming manual lists 113 implemented GPIO pins.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/pinctrl/ingenic,pinctrl.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index 84e960255a36d..15966f6a79f15 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -19,10 +19,10 @@ description: >
   pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
   and PB31 is the last pin in GPIO port B. The JZ4730, the JZ4740, the JZ4725B,
   the X1000 and the X1830 contains 4 GPIO ports, PA to PD, for a total of 128
-  pins. The X2000 and the X2100 contains 5 GPIO ports, PA to PE, for a total of
-  160 pins. The JZ4750, the JZ4755 the JZ4760, the JZ4770 and the JZ4780 contains
-  6 GPIO ports, PA to PF, for a total of 192 pins. The JZ4775 contains 7 GPIO
-  ports, PA to PG, for a total of 224 pins.
+  pins. The X2000, the X2100 and the X2600 contains 5 GPIO ports, PA to PE, for a
+  total of 160 GPIO numbering slots. The JZ4750, the JZ4755 the JZ4760, the JZ4770 and the JZ4780
+  contains 6 GPIO ports, PA to PF, for a total of 192 pins. The JZ4775 contains
+  7 GPIO ports, PA to PG, for a total of 224 pins.
 
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
@@ -46,6 +46,7 @@ properties:
           - ingenic,x1830-pinctrl
           - ingenic,x2000-pinctrl
           - ingenic,x2100-pinctrl
+          - ingenic,x2600-pinctrl
       - items:
           - const: ingenic,jz4760b-pinctrl
           - const: ingenic,jz4760-pinctrl
@@ -86,6 +87,7 @@ patternProperties:
           - ingenic,x1830-gpio
           - ingenic,x2000-gpio
           - ingenic,x2100-gpio
+          - ingenic,x2600-gpio
 
       reg:
         items:
-- 
2.56.0

