Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A433D8911
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 19:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367962; cv=none; b=tZb85ox+eOrPGVwB1T5yWpPpw1DNWcquru/5JF8QxJ7L/ljYjg8gxvEBuEYKVbbSzW0ngi8tnX6lY9ytlkGpvfYw8Jf8rm8paaYEbc81g0738EuVy4n9bcAMa7lVAWw1lEB+qNixFKtQQMXBzCyNfMouoidoNp+nXGnwub7UxNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367962; c=relaxed/simple;
	bh=HG/vvcE6mGXLyntQsY5DYfWZVPbqICPTaBsQ4HuEnG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWIHjDQBi9rP/EjoZFX3HU+mVp8WWrZJhmcWvWQp8RkWz4F3yzb3Q1mXTe2WAfrB1sYPQJZIFMqqDY8fb+RLPPasyYD44Us1AMDdjzURsfGvbnNPQyHCG8wPVElBGuwegD9017iROv1Sz1sUzOPM4g40FsddTTkzeDYur/PeWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GnzBFrgK; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GnzBFrgK"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso895896a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 12:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367956; x=1783972756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuhJj+HUo5Ktaz5cJIt67wPPHXjsVKySj5VwgZdB+yw=;
        b=GnzBFrgK4fTANISxcjXk6/QyY4BRZbYfxgQlE/fcRAqok1+pbCkuK8YW5ecdroGcpg
         MA/nv4gC53ubc/hbY2p+LvAriT8rlcatfwQlS1eBzML6VSsUBcaD4M08Wge59nnJht2E
         diwYPDnVD19fuBMAGw4N3DBIT+HB0v/E3oQE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367956; x=1783972756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IuhJj+HUo5Ktaz5cJIt67wPPHXjsVKySj5VwgZdB+yw=;
        b=JdKQBxjZ8XHgtkfApCcpTqy9kdJqqejyKfdQrk6ZK6dGNEeVj7FdeVrR4KKkIdSwch
         dckM99pdryl6b2nrjBeJL5UDR4cy63FUDJJKf6nYCnxylLz803bzdwhJxHycl2Dxc4pM
         VflrfeIvT0wvUeN+dftKcxHo81tw8V0K35PvWrzEOS9Y+Hyp2QtMrJEfhfJrTKnIid+G
         lEmwKbxES4I9MR5gqcvqw1jTn00jCm7y5R3taxBB1LPAM2qfajzSvhA9ZGe+4lyJwZQZ
         WbtGcS/WjWnG1O1X15A8PIYEvJTVDPqcpg+2ngiF52w53pGNHYrJlxigLb6Dibgiq1/Q
         eZDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ReOUOoeFAT3wxK3ino9Kf3sWt4mogRT4Nk8pSEUeB3IRgYnABWj9ddAmM+4KzH2vXoJwJYaItE19C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1l5WAis1LDNTe6D4KZrBdUHCSmy/zveHe5kO3IMUJTNfojI2v
	fw6uWRt1NdIRqIQ1b6FZXd/y76wGthM3WgnRaF7rbmDtTl59AT5btYm4DIqvEINv2Q==
X-Gm-Gg: AfdE7ckM8hi6ylS61XfJvffv5RfxnyWPE+d3/7QvNPiY4wF+g+vdcLDXQm1M/VMwB24
	7HLSZCkS31rSPe3UOXo5Avt030Mr/05o3eHD6bCW6MfIUcSa+KEdywGSXnjIksuPHu0QxuzpGuh
	74w5yt4VpsK69LfUfV5Rgrg5ncJuApOJ+g/BNCFt9xMv0JtF2RxGhBc/VWj5MX8IP6gKf4RTKqt
	S+uXR+Sys4vWf3Ks/g1/HZVKxPYih21UtAwB+7tZS5ug4mmn7laI2utlX5yBvx7xkFjk3e/oQ/H
	w6M/FsKJma2eLcgusU+nIxAKkZ+YvYIE6wmL7Um974qq2UNzUudVB30LFJNlaIqIzqDUuQoke2/
	eyHYlkT4RdeEd7gMipOHBOs7JTt0UQWT5k9vJTkkLOFw1ski/7+GOpC6TCT7H9js852sdMEIPdy
	pAfE7ERt4=
X-Received: by 2002:a05:6830:6ab4:b0:7e9:dbbe:5afc with SMTP id 46e09a7af769-7ebb23d1703mr1257460a34.32.1783367955684;
        Mon, 06 Jul 2026 12:59:15 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:15 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:57:59 -0600
Message-ID: <20260706195818.3906949-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 9b3cbeb54fed..81747bb53056 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1103b-pinctrl
+      - rockchip,rv1106-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.43.0

