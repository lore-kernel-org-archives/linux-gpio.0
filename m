Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795022750;
	b=HgV/gyNw7dsLwgEFiKQLbAq1BuKpo+hGSIRslqRCH1yRkD+CiGGwYfMBb0YdvkJi4ghk
	 0VkORVt7+ic2AyeIvElDk4uEhUIe76XajHMEmxDkzNo6wpWyZerof0OeEFbKq9vk8INgn
	 MWYf0atOA+3DaJmVxmmJLRytpVkf69Mk2v75yNOl8EcSlzeZsiWE4oB7vIhksiS/W7mgW
	 y3ilc+Oto0jb7jFclH3BtbWNYMIVba7oLNNt3ZA7J7eqbm3qXYuZbvL4AOPPvgH6aODI+
	 /sIDtgwbI+MfkRsfoNIZm6WAuHe/fBiNITLRxLBwTOhNLRc3g2oM5W1WmL0Yw7NtMAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022750;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
	b=k72OnFVLWqNc6+32ljLAiPlcXyXBESiFVeOdB1PRDFU6rn8vMXxj/Rky+NUlq+I8emvP
	 FgSqKbqkqEuislFVQyBFu2frPYcY4fMDGu169B0AQ2qJ7gZO3orJIeTtB73NJaqD0/aeZ
	 7L5m1Kjo3gDohtberCmxLq64sS3LuWCeyK0xaraPwDbPBNuHVOMUNEH3LplsQToM+8bQK
	 K+CsWnXm37iSu2iQdGSD0qo4fHUnlkeLB2f4EhUzv8QpxfDZL90uWef8aLmp3YSYRb/Li
	 eS0DRGalhqXvA3gMk67zW7zXN8iTub6kVMunsfvX3YgJnGY9j5p+r2kec4nmVfaNnHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="izKK/t9h";
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VwfE0Fym;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1B660A6F53;
	Wed, 18 Nov 2026 17:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1B660A6F53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=izKK/t9h;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VwfE0Fym
ARC-Seal: i=1; a=rsa-sha256; t=1795022740; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ZJcEeDvfhaj6ptUyftchRAKIYU0tVIVVSMlfEtpTaw/+cw7EUN4es99xwY66gx5ZUS
    Ra8skddM2DLkZHRqJ6iwhEKgZX91gXXtwsfhzuVfkROmEV8MVyN3bz/z18S7e82KvpOB
    lZH/9YrjSqv1PguKRhET1XnbbrItnH+S0P1lMkTz9xW+YdFwws0/IX58OvMwetk+SSyR
    FWyTEkBypzSoYt9B39Ahq82+T1GOESBg/gVcRHvkZlFHutUjQG+M7EaZokDEpTjnfSAE
    MaLJVs529RxpWY/TtieUSJAnbKPbuej58jTXLAZRFQWTWVJ/Nkh79mGUHgGJ9TPPs7fV
    gG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022740;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
    b=nQ8CDELXgscSmWWtb9ig3J1ENtn3vkTJPTjrr2Ie/aBZSgzfb4q8JSal0Xwm8uqG9t
    pBAqdbd3DecG6bY5Povbe4zvV4CEYkpp7ABvym21mCh4/+QFY9jaWF/rdkJIgMZHRun+
    HgDyyE3kGBspFMwDB4bBCgSsbC9UfC9Z1HDAosasut+P3SWF+TvKQsNbpo+Buwbg5Dyd
    8yD+KfdP4gbg3mCzEArcqRcA9Ruy0Fgb9gJb9uCOfggP3PHC8Q9gL1dxgriiOQljiX//
    mslG3UKsUIs+Y3+M48aJhMZrL7zmdmbpeWEwUgtg9aehgZeGeSbcBZpXJWWd+oWaHE/e
    11SA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022740;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
    b=izKK/t9h9qBViXi6RKoiAI0cZIKC4a9XNgZrdiLqHSeP721O4I3SuwPAZtRQVzQgFk
    slEr2BGrhX6fR+Ok5pxq9WxQLNZbNtjNABNaBJP82HeqRJR8WMDT77ayyxTiLwJEEASp
    BiV4N8xfBw3L0w8GGRWmM61cgFaAicvWe4Qz50AeHjsStEh+6QmieQOmp3jvk3LG94+5
    kQoBOVM0f0X2G7mBJtMZrxZsz4aK+ndLK1X689Nu00gdljFUJm2CnUwfkOrFje7+EHdk
    P/u99EuR1CooOt5j5F6LXY9N0cSw/H90qvh2rKdVHqFV/bHDH4aHLesdI4YFUqlWMoVs
    kG/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795022740;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
    b=VwfE0FymMa+IlUHH53KWn2C94OIIsx63e24FZ9AzDIovqmEQ3JOUabBwRIvKW6gRGr
    dHxc6tdzIHyGfOouMVAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AIHPediW
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 18:25:40 +0100 (CET)
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
Subject: [PATCH v4 3/7] dt-bindings: pinctrl: ingenic: Add X2600 support
Date: Wed, 18 Nov 2026 18:25:33 +0100
Message-ID: <a8688e1ea979dbbb3ffa198ca041b31c97752bad.1795022736.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795022736.git.hns@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
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

