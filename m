Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADD9433E8C
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783234967; cv=none; b=Ndx38dQp+gZhHjT3wDTl2IU+VprmQBzYzbh+Q+n1sp6StBPwasJLB1fRBxkK/LvBmxSnKFFj6s9vnEO4WHbFYcHhaNe1hI2ewlnsjx4m653w9dZx3x9qFvpMRis2bDoX5/8D0mZPTVTbt/5cVYrUeUumNIgdwWhXzAfEJKnhJtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783234967; c=relaxed/simple;
	bh=rVUEl79PoXlXUwAmZC2UErhUtKZCSu0B1xf6Wz6IFuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R258uOPuP9xX/yOCKfuhRhUWj/t6Q2BaxMrlKylFrknB1AIwL/c8K6TcGiDzTy2ZKo6fJpJGal87HhGLAKf21nNoiKveMmihPP50w5bg++mF7TNcdmgDBtWPvVuNXq+4sLD4/w5M0sQT4OVyHMmCdgaXwiM0YtzoDqZyVK17A2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD4MP3xm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD4MP3xm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8454160043aso1858819b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783234965; x=1783839765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=FD4MP3xmf2amGYa88Zwhd1TZbi9eFbJsmiWocjcfOc56atZkS+hH9c4Rx54/JaAB2+
         +Doi6k5lXinca5pDR2QdoGc8dxTVUAlc02WNZQRJDwP2LP5O9Zb2NnCMmnWlxsFg1Gz2
         8C6/4ZZcS3T6jZWHhugWIn0ofOPaTidWmw81804ukzpl6/yUQ1P/DWjfTVNZjqZJd7Iy
         2D08oVbaEQJ6d2GmzC1Ez8lo0jwkEQz4Aam8HWD853ps3m8TA28vua+W2tNYrnmJHnfV
         as82UAJHVkkzsVIPl6NHvwH4gwkIFlMU8hSxKLorjRTBD2FT+IYUIQ4LJMW57gyNc6GU
         po1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783234965; x=1783839765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=ZBZGR64VXo8BtP9O6cw5BjJ3RraXKWNpEn331f0B/+3JXA6qsqLPXFllQz0vniUTFG
         rXLrFPVtOLw+r06aYiekNwvKrC/2O/wahkxb3e2B0BYgIQlOZIqrmZcMAOCLkQNGQ8P5
         9IpNsBloQAGu8bOGQJizalzB62pO0IxhuoOb4o+MLVjBA/c26KZM7BbFrAJuWZQyyIMX
         gOEuLmuSGwrdQHQrMVAP2vMIom4pGgSdwqw7k1fJ0KZ6D8ORoeme46nGrmTBdcguAFsg
         gbtduVAzeIlZjc6I+46MvNzjmNk3StW7g2KWM13gM54AfNKy0/aFg9oGmAeSI4tky0+0
         +CuA==
X-Gm-Message-State: AOJu0Yw6sfau2WVcOaKZKIXPBTjuD9jVcIoXnEQAgYbmVi2+989TKmKW
	Lgpnq71DlEWx3hECP51CV1DxS//LrWbGsn717DI57AXGhBIuB4M2hS+xHPxohuELtnRh1w==
X-Gm-Gg: AfdE7cn73Dc/qp7/m1Ta5Ky+8fxGWBRCaYyrgzwMCsX1KUWFINsfV6rfXQUQrle+uVZ
	+NliMl9tLJrpnK0A9OKvDLuPj3PGud0nTiy61mHHMni2CPCrs8xUEff3bEUcdTNsExWocmxQsIC
	pPj0auJ5tL0FdaVhk0754b1ihpwft0Z0kGM+gUsAi24+VtqFFTJolzO78618Ql7Vzz71N16gyQf
	CDmCnYW3A60XCK6VoitxdwRf2WFd5Z4TbgpcAmbx/i1cbIAQRS5RwbeSN6fh++3a6pZNumEPkYy
	7IBd89gbPq4Ny9o0PdZHNgQ05NeoDsGySfpngZtNqMCGyT1E8zptKhJMELSyjKM7cknr5/Zl34F
	HUWHqfEYTZyVRJOvVJUiosWK5pjs8MLBsIgDB/GYGdCqwGZOtTGXlwjDXc0s8Kr4HxBOpeQ+87z
	vIXSKjqXFMIMPLnIT53fR7
X-Received: by 2002:a05:6a00:3c88:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-847f6d6785cmr5452983b3a.12.1783234965144;
        Sun, 05 Jul 2026 00:02:45 -0700 (PDT)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm1998071b3a.46.2026.07.05.00.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:02:44 -0700 (PDT)
From: Yuhong Cheng <ceohunk@gmail.com>
To: linus.walleij@linaro.org,
	corbet@lwn.net
Cc: linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yuhong Cheng <ceohunk@gmail.com>
Subject: [PATCH] docs: driver-api: pin-control: fix spelling of below
Date: Sun,  5 Jul 2026 15:02:12 +0800
Message-ID: <20260705070212.1123-1-ceohunk@gmail.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the spelling of 'bellow' to 'below' in the PM API section.

Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>
---
 Documentation/driver-api/pin-control.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index 1f585ecca..80106e44a 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1175,7 +1175,7 @@ Possible standard state names are: "default", "init", "sleep" and "idle".
   selected after the driver probe.
 
 - the ``sleep`` and ``idle`` states are for power management and can only
-  be selected with the PM API bellow.
+  be selected with the PM API below.
 
 PM interfaces
 =================
-- 
2.46.0.windows.1

