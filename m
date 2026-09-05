Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D398D223DE7
	for <linux-gpio@vger.kernel.org>; Sat,  5 Sep 2026 00:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566966; cv=none; b=R8caVj2bJS0SbSrALZRUBNj/vO+Ctc4jqVarla/P8IwV6r7cDgtS8fsROYGMvgteU+hLytkQiw/gkdAbsVglVrJ+YbcT91PZ2V9WUPXkobFm+0wLaMiUbXEuLcReheLyZ28n82oAv8WTfUbTGUmDBhYYdc3uROKZvvlI8LG5o+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566966; c=relaxed/simple;
	bh=Z0eqXMInzFdWundp0bdyqvyQWa4WYterHClI/OnGILA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ATfMj7eTqKhYoLAx/z2vsn6hRFCtQ8yo5rH2LnypEyzrf2m7jnyBphGh9RTAD+d/UJN69oL/e/vctBgFPV7iaMwk1xVjc/zLXYJGVuML47DIbwLpUSC6+GLaQ0LfTO7xiQw4LY8juKglm8GMYnETNPC2oEnd2BAeTJGXlnu4sCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fucYi3dP; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fucYi3dP"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52d8679c149so16606551cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 17:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566963; x=1789171763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5lvUDKi34eWgpEQ9bn1qS/2tjyT90hT4Ul3KLa+Q40=;
        b=fucYi3dPfRb/u7nOr0gUdD3Ka/yaeSL0KJtpSf6GwvdQrt/fCh5kRd7JzaPBe47xQV
         EH0VUYp62gWD6xkoZMHEfuLjhfxSESoHA1OJNV6YtBqVpxKeVDRQs6LfhMWWPTrlUKgt
         WdP2HNq2uHbTWx7aaFyfNXsAiM6CtVXlxZ87YngTQfmZdJ1vyK0QM1YrGMjJ9f/z5Qel
         nFVRqNr+mrRxy1LZqhdZkIRN2XUX+rzeDYnbSFrhsFG1ByugtGtm0wXhCCmLSfvObacT
         C5+sbPWKvl2wPepZgaxxZJjZdJ86jwzrt9sNsA2BzRZNfyIkKmV57ZxAu8vbY39Manma
         AqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566963; x=1789171763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5lvUDKi34eWgpEQ9bn1qS/2tjyT90hT4Ul3KLa+Q40=;
        b=IXnw7sqkXo0UWBlqotJTLtIpbPllPLiNBZG/j5ePJgvtEROCvcZ1CfxV065d0Sq6Iq
         AgHCRLXnxIjxY+VoR67YMljd5Fq1lHKH49voLkVqZjZvuCSW2B4EOY9FIQdOzwSxIm9M
         ba3TzIssbfTiWi9VKXK0S+Skuus/wJcnitrEiVlyhUNKis8jErqVuQhMpS9kbvwAKeHG
         eLUgi0iijsSgRVMZk2BR0b1FN17TqIt0zJ2qMq5iHmuPEnpImY4oAj/n83ABpnDWsQIC
         Og9emBBL8Kls3dxwPbk8MISH6pUNy7I4D+eRH1ed4y/fRJxtRsfT5XQWZe7qeg0yIyUD
         ksQw==
X-Forwarded-Encrypted: i=1; AKwUvBzPsg0sKms4gsVeTp2PtZynZ9IcfPDbjMSsxBNZn4Mm0Mu6U8oePpRkvN7JrtzZSmFu7LjRvkoxaPO6@vger.kernel.org
X-Gm-Message-State: AFuF++kJGXr7msJXiPAt288DN973Wk4lUb7jJDgM/5ZrGGjhaxZYQVXJ
	GH8u1miXx9x/iIi8bkbRZfNFm0Z4V1wqir/iw9m9+vR+xwrhhIiUYjQy
X-Gm-Gg: AYBFou2La0ywNT00OrJn3sQTZXnj02xJhxZyI91/rN3cVss8vX066u0mQHqe+D7BAhY
	tju2zZI+kGwp1Fi+O17NFO2F/zJYkri4tvKAej4E4eOPDAxMNR8lccXYOEag00P9n/FvklC8mMt
	AGkXNX/amandOekbQg98ipDI4GjXEQmwVcHv74aBp80BpNhNpyx2GQ2LLZzWc0+5LU7lpEvsg4Y
	kUsA5vySCL0KUOzxrGXKwHzK4OmtxHGsAYYG5uTgZwkuTXjGlBj5EMZVPvmKByn++2COdkEiKJh
	nuyCulSkmsCfp+vxyrSB5gILG2bL7DEkVROZ8wl698EaKPMQc6liF51VA+Pnxl8AvXieUyDrSu9
	RlI3ds2cvOzNgYXCDsbU/NJUETNQviFrJE1rOfNhRewAPHjaTH3WKxjuYd3kK7dHeISeO+KHD3w
	l5pPPqUypINyHT1QjX3zGgTddIVGb4XrEaGgrwN+toQHqcOTgCoYBCv2/9lGZ2bb0rAFY3IMptW
	qjj0fz80bVmYtZjp6DC4raL2OyUKW105v69QuqHJl6c3bSPH0qRN+tR8x16m4Od+XYp8PVZesSt
	h69bFiZmQjCJIeKPc1/cV7P7KdBPXsl5NU0NIA==
X-Received: by 2002:a05:622a:258d:b0:51a:896c:9aae with SMTP id d75a77b69052e-53054876057mr102752221cf.13.1788566962767;
        Fri, 04 Sep 2026 17:09:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53053ef5af3sm33158421cf.0.2026.09.04.17.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:09:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
Date: Fri,  4 Sep 2026 17:09:19 -0700
Message-ID: <20260905000919.155694-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
expander and is register-compatible with it. The addition of the
compatible in the driver missed the documentation update.

Fixes: 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi pca9655")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4631388a7d91..563f61e6e543 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -67,6 +67,7 @@ properties:
               - nxp,pcal9555a
               - onnn,cat9554
               - onnn,pca9654
+              - onnn,pca9655
               - ti,pca6107
               - ti,pca9536
               - ti,tca6408
-- 
2.55.0

