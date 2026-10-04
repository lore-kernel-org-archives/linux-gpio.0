Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7F9486402
	for <linux-gpio@vger.kernel.org>; Sun,  4 Oct 2026 19:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141046; cv=none; b=EF0JO4PVn6XuD2gTi2CW+ZcnevkorAQcxvymWxK8WYNWxQIegVxEL90yhuPpJuxQ1Fe7zEMvS9qj0ItYcLLSWYVhbFko9iZhee7biHz+xM6omKQ/2KSY10wRrpe9ADcmdANH9rmtr0I/j5+G+eNHE+8iWx2+5xz2tHpNPaxbkMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141046; c=relaxed/simple;
	bh=yfRz0gCmlse4iaV69rfQZ45cJ6QlHrEv8Tvd40l5z5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IrKJQsGUdGHEztpNzQsFMROZxiZheb5aACChIWW6NMs6oCEBIGEKxOLMjcQIJxzWp7NnsZA9LbIZCrNbSnRAtvCvKR6ERrkoabMho3xlCaInBiqTV7lPMEUQ0w+oXihEanXnloazpCQKOY1mL4t1QNxfL98kjo2HJrLSVY30yqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVbXhKrN; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVbXhKrN"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78d59bb02so280106a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 04 Oct 2026 12:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791141044; x=1791745844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7qHCKtt5edtxB2hHoADiQ7fMvPvqmsdZvnwWIudO2g=;
        b=aVbXhKrNSmSjcClkuNmPzZ3P3I/Vj8rp1SyzhWu9uYU/e2opdPBv6C39MU7fE7CxSS
         N3KqM6cJ2QQcCdTHY4xT42rWjL4p/21mDW7srmwFQfSao6E/g49bLW8HYf3W5y/h4BDK
         gJR7aT8eVwWnRQcVetxe1unF110ZibdDkxXItxkCrNz8k/QiipgvC5M9XvnfAWgp8BRG
         DXPVAamdumDo1mhNwK8AW7KkssknKTFlBNqQGw88xUKewqSSv4X+Km66cT2kT/Q+P/Ok
         YQecUpQHNzosDWtVTdoIi9GBaiEB4d5nphsS6T1zDQhTAtYXvG+q3sZz6iuySCd93QdA
         JNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141044; x=1791745844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7qHCKtt5edtxB2hHoADiQ7fMvPvqmsdZvnwWIudO2g=;
        b=D3Pdr4+uOUe2Se2lOCXXjaBoanJWD6TwXF6Sy0irgvk7/baudO9pywUcG8zQVKFcjO
         Wi6lGohCIVeA4CzksRUnT7SFyer3Dkdo+/AqY+IwYegIy8Sh8UMUi23238WS15HnujmT
         bASxglGfqiAvrlDY6PsSm976IqNNffMOYI6pWSRzMWsxuZnsVVncZbaE72kKM11FMfwN
         KZypSvvCn13Trwxh8cnCiUzTX8Wc70b4ydPfCH9ZVAYi+1IwoAv4f/HlDJ5DKa3Bw4lw
         iqF+gQLcZjM/HmI8qvKs8ZGFNF5KAtUUpkd5qZDkMS6gST55AChVv1RaKyeWUZEcy9n2
         SdOw==
X-Forwarded-Encrypted: i=1; AKwUvBxH591lEAEJT5Lv1tgmoF03PKhVcYY77zYIQALJMNgeyzJ1NayJEl8zIRVD4BQ27VOBP4cqD/aRRn4O@vger.kernel.org
X-Gm-Message-State: AFq9FYLRk01Cv3RHkBtbh2mLDABqA4GaOddLliQg3y6R+IemkMd4fWSu
	TJ1MHqnLPfKFBGbFfn8x2sDyPWVDbwiDVbf89+1azLKam8tVvwm80Yk+
X-Gm-Gg: AYBFou1KrY/FzGLV4jfCxpaSAA6ld9M9wHZP6HPmynArccYpMDycBtL2FnuPLai8eEY
	+p6s+fLyCgdkEQEkEMzc9QE1XKwvK7Hcc6CSIoKeo144X33SxoaupUDQbz4plKyP0/4XY9krVl2
	9tBChjHRFh0Jv3ovf73P9leXWfPB9GGhjVJX7obx0zKaqic4sKwOR9ZMJYTIFxfa3xEL9NTTfpb
	iDxaW02eFYmL3bCvWqmU7W3tLRA2dFh9rtqnDT/WnHWNmBuxEZEzBJ2df4nxtj3S6A9nrGqFv3i
	oUORe7UI9nn4Fz69A1GofO80crrO1fnWPiZ+7dqlLL95yNIPib8k2W3wZJBLln1F6XaPsKUAms+
	9hY5GHawusFa0KICsNWhHla24SB2okTMIAHQk9VnRuXm59SRFMc1zlY78z+E7r/zBRA5doukNDW
	rro47AHIdHKmD0bEDucYjgudFt9mjxlsBCxiL7UJ3O2Xw606AMBTR7Te8/n79zf6C8TTUsyV/mv
	P2mOOnLB+X7bXSc0x0OIIWYWSbaF+4beEpHQ3SOe/CbQf6C1/Yu1Jv4GBoiQRTiE28sJCV9vG+Y
	7NlO7sRk+iNTPuRy51tXIyVB9l72lGKGRUzfXkT8Bpaz3aVr
X-Received: by 2002:a17:90b:388b:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a6fec5d128mr5479549a91.41.1791141044008;
        Sun, 04 Oct 2026 12:10:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7c64b1sm8318957a91.14.2026.10.04.12.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:10:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
Date: Sun,  4 Oct 2026 12:10:42 -0700
Message-ID: <20261004191042.143713-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
expander. "onnn,pca9655" is already used standalone by in-tree DTS
(armada-388-clearfog, armada-388-helios4) and has a dedicated entry in
the pca953x driver's OF match table, but was never documented, causing
dtbs_check failures.

Document it alongside the other standalone entries such as
onnn,pca9654, without an nxp,pca9555 fallback, so that the existing
DTS remain valid.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610021617.AlVUa9No-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rewrite description. Use tags from kernel test bot.
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
2.56.0

