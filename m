Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557711;
	b=M3kBEBoM9P9C5jDncoXpEpHqB2U/MyyvYkTQ6OshZFe+GoKrejz6OkmUtB/kh0lR2Oku
	 7WImaPTNRO9xLO5ALxg3jf3tN3WwAn0D5uma9AhcUhxz4e+zfJCWMObYuFrey384RgNF9
	 1WgQKIQgLOk5FzpCXHB9F9ugV1nMyqW2E7WTecMom1pSF1qWxveTDAQDQl4mspnwqkAnW
	 9GEOn3aXPE+u5MMsOIY6XtbiXweMlWcg6e5C2vpii5pEov+Uhu8vPb8BBQmM0GqKTqoe2
	 M88eVXw6lxSMgvhP52qQlZnk8bKjpppeXktDEu/RdLCtGdtQY64RkfEzaUKwES89XAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557711;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=gUh9Uxrqkw2FP7PQDSVxGpjIKMmkd0Ej3FXznUFmKNI=;
	b=HkyBhzKC4hyGeCrnp9wqOeDkJ76aCzmf0Nys8M8F3Hx0WBDIHclWPa2er4e1URPVjiWa
	 WoEjbHOtWNY8Ku1GGPtjjULAtvVFvwuhjgZBGgY4sI3z/U3FmSyHmqJuVgDAqv6qFF2FG
	 nGshQhQ4KoyIFRczF29jxO6d29+NP8cj9/HbGkQm48eYO6WnEEjdFy9EkNLDUbDRUvQsE
	 /k9LviHIQCzWLLEaOiOHwCCC9Eh7FGEbyKix6s+0CYguLVUU7Wu8ErG0W5XNdO8VStW2z
	 6h3DAByZ5UXERu+epSuDTIZ9KpGoJnnkOphWC2oSQCxNENxW1anecqg6QiKcbjzL6XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="cSgKcld/";
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=S0nQs187;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F05606A321;
	Fri, 13 Nov 2026 08:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F05606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cSgKcld/;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=S0nQs187
ARC-Seal: i=1; a=rsa-sha256; t=1794557700; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KegwQkM0KB9P6xlxdpoWZ9Wl/600Yuhz8/MesUvvsGuS5QcP8qZ/hOjvi3p/aYMVcG
    soQyTrt51ab0Tvw5kLeyumZHmUwq4t8TiKlYKHMknpyXFlKKlxKCHtxQkMhpMmUlfbgE
    M4tNYAG24dfMJnQTdEzSIJct1l1/48hEMvl3jV6GDsLmw5NrbeTb/eYdcq30/jdgLsKp
    AebGCqM+2FlRP7g+L/vP5wE1jIoFL+pho+1pNUdubW+EF0FM/rIWBOEs0NbPXi0/lAfN
    MVYcaxMkIy+Ludu1VtVAbDE4UUneRwc8/fvdrTTZUst32CHmHyEljk5QPRtqOFDfPnr+
    M2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794557700;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=gUh9Uxrqkw2FP7PQDSVxGpjIKMmkd0Ej3FXznUFmKNI=;
    b=ADYlT7iBi4pqtfohV7KephpVo2Ia7WAJNhm9uoRxh3HtTaBT4rqiNOc/NXe6ZHF4+7
    Fo100d8BLlh4Hsol+Snb7xS76SYTATO1OdRvCgaW3VYqJAIC3nzPIeL+5YYNzZ2oXjpS
    B6nZ0SmIiJifxyBusXDZ1kKEkAb5RLOWhcYEzJ0hmbCrlYdb5AOEWxeCs9L1N1hYdl4K
    SC6rUGuX1DS6QwP2ctBBrOKrSzsyASGjJZBxshY4aSl6bjA/YkkQ404B3S3ADpA23hDQ
    ZHgXKmOUZ6TZt+D8l3cnUJUAhcg/dQcyjKi2MPfuj1wCoEW2YkWzs5wIwt5mo/EteyDU
    k4UQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794557700;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=gUh9Uxrqkw2FP7PQDSVxGpjIKMmkd0Ej3FXznUFmKNI=;
    b=cSgKcld/sq4IEaTFzFSKXWMaUfZU3AJhxhnxl53P2FhbiGpL/idzD2KlMRxS+Ej460
    UMqXBNtOGDlhzRZeSSwepnaNKy7j2ITT5dLWHahEhojfMJi3bkBm3WAVkkYRI++pOmy5
    TwoQgaQrx8BQEWZ7kky/4RH32gSa/AiYMnlfuVn+UvxePdWpfhTUJnOS6akIeyqTjB0C
    Sb5nj6ZLko0ObDwF6O0S/zweXuYAr1TmhQKlA4mWUASnji0BsRpNsfYgGzxzGLe5Rlo6
    tf6d/ghtkEqdz7j25WkvtbFxiozBVD2tjOO30ywIwA0L6gSEKfMOIEmRh1kKpW0okWZM
    mgiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794557700;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=gUh9Uxrqkw2FP7PQDSVxGpjIKMmkd0Ej3FXznUFmKNI=;
    b=S0nQs187XnchgxFaoWEvdjic55JSpky1P6Ei0YdtEMu4JHL2O5Xof43Iqd8x2du8eS
    JY4O7s5+sDVijGrX9GDQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2ZoHmMiNHYIZPrro6QPZGBqKLoYar6phQmxG"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AD8ExFGB
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 13 Nov 2026 09:14:59 +0100 (CET)
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
Subject: [PATCH 1/3] dt-bindings: pinctrl: ingenic: Add X2600 support
Date: Fri, 13 Nov 2026 09:14:56 +0100
Message-ID: <ba9c514a8243419da3bb46fcb507b706c948fb60.1794557697.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794557697.git.hns@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
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

The X2600 provides five GPIO ports with 32 pins each.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/pinctrl/ingenic,pinctrl.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index 84e960255a36d..05c1a31469a42 100644
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
+  total of 160 pins. The JZ4750, the JZ4755 the JZ4760, the JZ4770 and the JZ4780
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

