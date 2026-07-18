Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B8F38237B
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784362486; cv=none; b=ZksbffHu5Ro+KoY0MSYN4DDUXKVF+qt0q2kB1dZTrZ1r1LQ3bbe5JiXGyd2/DtchBmPCPjQgNwZzZl9WyK2EMTiai2JHGtF7uRE+J9DjVbIVp3GcZlke6+1QNmiGOAg5hN9BZXfaJ7zXdPRLndrYCMO3do1vdpxthNtA3YLZdRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784362486; c=relaxed/simple;
	bh=26TxEaZXjVJo5tBGtmwTRSiqCE9SIgBq2GP3qLNfyYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P65dJq9bg4NprRqbKgafwlp6sS2GhxBGNNqk0p9vtkzbOq2qsLOmQEppWFOnbNHt72Wg+o0SoxOuKY9bbh1jSYrW76F9c+Vv2INBSzkxTLZT4IEmKMdB7Skqnq7latpjhGNHIiFRZE9F6IIRMtvap6PlIkNty+AkMfC1qYBL/B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBFAcBQw; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBFAcBQw"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-493f7c4152dso1799685e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784362481; x=1784967281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eQ6kK9yKWQDUj7jQssc4rdEfAQwIGwXXm+Ja37pL5TU=;
        b=tBFAcBQw1YlEoXdB8GCekJyIePirzb+sSQz4uCwZ71m1iwXv1cVC68jLlyZaecXJeX
         x9RuWAzE+bzRFnObAf8H9ubdH4yuq+I0G95K34WPBdSgcJURO0qEQyUpDwK54StsLDOf
         zaX769FOQgjAsi+UdiUB5XDuXVyIk12p3kimFoBwgWEr/O29IEZ/i6fSDEfLEqtvGghx
         Zmb/LjNGijTMyYBgeu9O59aU59nNPKIB5giFxvhaqLuRWEGFM395IBTQ0Sdht2+Boxup
         SJDFAFIokUl9tOxaWPh1Jx+xklhIC1hq4kY6EFCVklKlOomI0F/sko9JJ7td6A36Fd1d
         eksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784362481; x=1784967281;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQ6kK9yKWQDUj7jQssc4rdEfAQwIGwXXm+Ja37pL5TU=;
        b=REaDWjHJGPfxXbq6kDhM4Gl9Tmv3j1sNvulLGHzqSXLIMBY6DaQdXcSDo49Pae+aHY
         PB4+hkYBCuIu42Y/x8Qy6NVp183fxQqIX9+JBCCwDWVdAcjCK/Eb4LmLyGUxDTI/Y6LJ
         queEierIlAxn1YGamHvW2miLZ8ln5XhrZ1lyNvwdFJywoIHOu++fQcYhW/GO8afPzOBT
         wzk4gXl6MnsAcXyVJCP8mt0lViCp9CC0edlVyaMAKO4Rypl/lHwcqNk/QE1CYWZrrkoa
         fywbd2srNeHUja/5C5FjQPcnUuFIzfFUsds3aSlmg1tjtsSpPaXEU5epeICG/SAN8eZs
         fNeA==
X-Forwarded-Encrypted: i=1; AHgh+RrRZbZJ9R2XVnhk+9bcpdvsvY0sD5dzx+IH/qfVgiFSHfx/Mj+52dmHRTdFxybC7MRzhVb3HCLM54GW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw71oP6Pm0YgPgQLGsNkO6Nwpsk6l3bwMYhe/ElD6XdYag2XRZp
	iTAYislztt+6Tui5Pk6oPuyANvhZ1d1CXCzfKmpWmO7Z+3RkO5neGVo3
X-Gm-Gg: AfdE7clp4YYbBOkldVwqGSMrYr6Rq1b6A99kA5l6e92WP4dAiBNg705Vc9QHsVlrVIT
	ukQQpmBk4yMj8v+YKmq++rPHxserxaOTde4ONcDDzoZ7Wu65lMaOxR/xZR8h/x5CDCznr93TXBO
	bqe3KD1oA+pegEo9KQLnJrFMVE0iy6O7lDqYJLtpgmH+cjm6cJEJCUgYQ+1sCcIuDd0hmEhCN+O
	N39kYyfWkbyLknA5lZQ+EMF6lkLoJEuDyU6oXmYj42A2uobBM1DqFoNL1a+EA0uz/Yp+kDh8taB
	pjwhwltZH/J56/x2GjUzh7DdJzL2SBdmtiFzmP2ffT2XG/Z/B2mk/6TagGrRblqO3Ty35RvozXc
	yVUfK3NRuVd6tvfmYqxaByKhO1+18zBKtnocZtEMv8IoU0PqY6oOIKIJODham7tFeeUZqr3Meml
	XZmvkp+90Ku8qe
X-Received: by 2002:a05:600c:548a:b0:492:6e72:eee with SMTP id 5b1f17b1804b1-4954a50b65amr34547365e9.3.1784362481213;
        Sat, 18 Jul 2026 01:14:41 -0700 (PDT)
Received: from meto.local ([95.70.199.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm73234285e9.0.2026.07.18.01.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:14:40 -0700 (PDT)
From: =?UTF-8?q?Metehan=20G=C3=BCnen?= <metehangnen@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Metehan=20G=C3=BCnen?= <metehangnen@gmail.com>
Subject: [PATCH 4/4] MAINTAINERS: add entry for GXFP5130 fingerprint sensor driver
Date: Sat, 18 Jul 2026 11:14:31 +0300
Message-ID: <20260718081431.25456-5-metehangnen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718081431.25456-1-metehangnen@gmail.com>
References: <20260718081431.25456-1-metehangnen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add maintainer entry for the new Goodix GXFP5130 driver covering
the driver source tree, UAPI header, and documentation.

Signed-off-by: Metehan Günen <metehangnen@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a674e3652..7d18b5410 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11048,6 +11048,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/connector/gocontroll,moduline-module-slot.yaml
 
 GOODIX TOUCHSCREEN
+GOODIX GXFP5130 FINGERPRINT SENSOR DRIVER
+M:	Metehan Günen <metehangnen@gmail.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/misc-devices/gxfp5130.rst
+F:	drivers/misc/gxfp5130/
+F:	include/uapi/linux/gxfp_ioctl.h
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-- 
2.55.0

