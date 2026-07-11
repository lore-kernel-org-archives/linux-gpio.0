Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F402BEC55;
	Sat, 11 Jul 2026 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803717; cv=none; b=P7/Nz6VxxGTqlNymqb3dq2brny8yO/kFmHeRojSPzQRGFln1rwcpr4rwbNoAxPvhUuElsiGcjImR+nWj0ePQsAB0ntyqWWt7Pp+FJ33FXf+pY7YR4vnWGOQPNcDMDiCjCoTcNqRNdHnjcvDu5dueniPKLm/QAC6/WEAIzBZQKnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803717; c=relaxed/simple;
	bh=jlk3MmdIEJG0iGI4EF13F74a/8PcEG55kBpycnwrl+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyGpMCBszOVqVt4rvDmIZwY9JUMkCYuF6OvYmiKkY9Cz7gaY2srkGqIHx0N+Bf5YHTdh4Mu7JQihMotosdSgviaxpE+R6JeLJYWmF166dV9ymv2GdAM43NX1LjWGGCd0drUtC9aAdn3uG0VhxKSu8ChahuJeSnBhpq09lzOAyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=OKYLE/VV; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="OKYLE/VV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C983119826;
	Sat, 11 Jul 2026 23:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803708; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IQ/2jO9kY86PBveaA7H07jnCAULpl2h71VwR4VV58eY=;
	b=OKYLE/VVcOkNBDQn2Yd4FgbE+2flqHj5p4DN0VcY+B4XF0gEyGkfvODqgGNUlrT9QqzxQU
	0hqzG2VUxj4bbpUNS1cXmLtvaaGZ2r5ZSNy1XSsB1O7/dlGSpHP/24m7f7EZfC0G9zaLVW
	GmlJYO2VqdTqEiMzZhKQukhXp2McDoiV2khX766HzS+uDeE+kLp6SGaXky8M53Vqkb45oJ
	8s1Ackks7Tyoi8KCVyOXXKJYYykLVPocsGjGZirKcGf4vQgbanMpt739gsn2AQ0MfpRI3t
	E4ymYcHNTo5aiAzli4NpwtlkIU2hGT8tGxFO/X0fYYvTDkgjUnm/PjrY7UwTVg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
Date: Sat, 11 Jul 2026 22:59:31 +0200
Message-ID: <20260711210131.236025-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
expander via the I2C bus for microcontrollers when additional I/Os
are needed while keeping interconnections to the minimum. Datasheet
comparison suggests that it is compatible with TCAL6416, add the
compatible string and TCAL6416 as a fallback compatible.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4f955f855e1ab..4631388a7d914 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -22,6 +22,9 @@ properties:
       - items:
           - const: diodes,pi4ioe5v6534q
           - const: nxp,pcal6534
+      - items:
+          - const: kinetic,kts1622
+          - const: ti,tcal6416
       - items:
           - enum:
               - exar,xra1202
-- 
2.53.0

