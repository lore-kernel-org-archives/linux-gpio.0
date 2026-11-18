Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987714;
	b=kKr36crqTrwSNlK93zI1wQpsjwx7ZSFfL8/wrf9ifHvGTV71L4h0ofHsTFJtXo8Tm+4z
	 9OkRTThNe3girlpM64TpnnzIWDqwL7GcibsRxNAsHyXSgqOAJjwrbfJ8na6dLbuYwji0b
	 4eW8vvWC/5MXO+9DkR6z/HG1t0VqHf9X2oJwuT5t3kjrYkS0VqOUUk9CGz3XofAHXhL7v
	 6kE1BgsPF9ZNUkN1dbzx5fPBok+MDVZim6Z6jFVJGmUT5DrGR0HMueGQx33RXlbIjNBLH
	 WzzvkN9K+ppYNqdlDRanP440bH6ZAupPUOGDuw33tII/kCy6R+00nPGRB/g5nmNPDPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987714;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
	b=3VOp0GH0HoCbNf4Ui51zROsvQ3A1KcKaLAGxLxoRc4fwbVS39gr40I4G3OiR0cpk8HED
	 1Y9uCUcvYtNSYR4KhhCGdEFwczuIXEqTiNrdrncJq23TOeHNOD/O2rHOiFYEeZZQ3S13H
	 5YcfWjqNpCUaiHByYaVCPf8v2x5B1qDGj9KpvBAxcoe/qI0NGp4x6+PFxrbH5ZY6v4Fz7
	 bk6RA0g1j20lMEKrDD2X6C8WyCM1ZJhxKOrPdd+4C6jtzdH+MT7dpRi9FBJQ6dkAzg4gq
	 Spfv1iEvXU5aXH8+XOZiLXKRe4H5ofqCujjkx9NeBhctkALh/5KHLHqqLc2NzSbnfNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=g9BE4UIf;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=e6yBpS+x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF571606A338;
	Wed, 18 Nov 2026 07:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF571606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=g9BE4UIf;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=e6yBpS+x
ARC-Seal: i=1; a=rsa-sha256; t=1794987703; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=QKbcm6q0hIHMn37BYjeofUhDNahYCuzEZ1oKApXrfgqYr43uaBFUX0j8vJpmZL2Lb4
    7iDHT8QcXm442xymMZ3Neylqkqsr7c0o/0ty2yn1xtAelDGTTnDQeun2AjBJOKS2CLwJ
    ljRzhGmp095i9UePeS34oWTdNeqE9R05X67PEjTN7UG1I3Uz9UzPl+7qLJIyxPv3DFVR
    r6ZUY4mwWgs1bO2z8FDFdLKoH2ynD7DyptamZnG/AmZJ2PPOMBROhj2HI1J2qemKiUn9
    JkmswRLgHcTy2JBzZooMZACP0D60m3KYFHnXUMxWU0wBS8MWr8XXtEGCeSF1FRpjXz1W
    dzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987703;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
    b=KuswpjWvs3zfsMXRNmBF0WR/N4blVs3t0n2W8sD2D3I4rXFtA3csjNHGBCQGWHnU8w
    A56O1r2ZjhTKQIFr3ykpz/g7DDYJRgjGOB+/uuAO4dmxQ4QtmeQtlCpXd/fmSxNkC0lp
    9qf2hvqzW80l16jseWUa3TvWsgMhS+n7sMRynYiEkOtsp5Nx+q35jvZ/4PU3TrkLXkZz
    udfxfK209AJhLo3gS1oL3dkALmVYOrJ9ed1fap1sgYertb6K3ZA4hWX4vGunjajzr4JT
    Q3c/h8zSWlIWQ7EMCYYJ9ZlmGDtUVLo8w70fGRE/WFSDdIOmdHNasyN74IAqsMYRnMZ7
    JnTA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987703;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
    b=g9BE4UIfAn5wSWjL9E0vPkqBNVjo1c11bEzMlY4FOHsMQ3Ms46KvUNEe/ZlMlyBfkw
    z6sfETbjwzAu7AMpObgKP5bJLMY+wrrNf6obd7ITOnp+3pKyuqjXkV/3bhzSyZHXp9jm
    dWkj/MCpryBIKHHo6FLuXjGUJ7u/g6H0JPqalCHhnPpQ7/bwRP/D6tz53pbLrclQJcAT
    7q0hbatBavBo4i0aNwotuQP7C4kToWfbVicakpX0YWJ2g5A1sF8PMWfJ7lR2rhgTYHv2
    uzw9Ykoh5aPCboKwBsQW1iGOBabpN9edrOX0YEUApOEKO1ZDDQA8pNXnNLuhuh1/zHD6
    iMfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794987703;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7QImKCQCn026qrKuxcLq5KpLrEULLEp8iucMM/ifoYE=;
    b=e6yBpS+xDG4y6TNv+Dq3nDWjN1jMXxZr0tANqXkyh4s1rhJHOv8GBA4Ns7yjf8E8om
    jZQPgX7k5Oe7BQXanMAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AI7fhaVZ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 08:41:43 +0100 (CET)
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
Subject: [PATCH v3 3/7] dt-bindings: pinctrl: ingenic: Add X2600 support
Date: Wed, 18 Nov 2026 08:41:37 +0100
Message-ID: <a7c4414ce3b63e5e924d540c8530901d8dedf932.1794987700.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794987700.git.hns@goldelico.com>
References: <cover.1794987700.git.hns@goldelico.com>
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

