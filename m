Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032178;
	b=3Lr4ujHcL4XgzjDUMiLiOmKDptkKBtU6H5bPo2pMtVdE+TNOk5jZukI/QyZNqMO+YcTs
	 XzNOZcMxnC8brFE6psYxIKi3p/CiGs2mA1hhlPdFlCcpooPO2ZlHaAWHXjFuFlN+qdgC3
	 r4ujEwtSwzffTr8rAq10j189TNBJv4hCmdHykM5jaif2+qBy5e6SHqva/S/o0IOWGZtaY
	 F0qF+MoC/1VjxWT1YoiRB0fG5qZa6Hz7GHL5+4iqP3nQU2P1hdV8R8no8PvZOobyY+6kg
	 9+KXE7q5Y7d17R0WCUCotpsVnT4uyefBsy30KlkFf00O+Hxh+3PEvX+V7Kj13O7x1gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
	b=LHNFOleduDPDgXEi6dZX2F3ZgEUbNiDiG3WlNHCDzRAaAma4gUQyafiG43Szf+bB3ORD
	 0NWjibrgouFWmaPoU4WMgQbAn4nBzsF7V1RHToBTI6k7aoFjieaJBEZdIBKmnrAH4yh5p
	 4iWd+zx2A+03QBU+rOuvPvhToS1qPe2oBuXt87ZlV1LRui8sYG5fw8h1/etAMynJghcl7
	 g1Cu3ktCxRfcFOONkI3zEtkUconU1pzby1T2XSaOlx+llpNikO9k4YhY4LPs2VtBFj+lD
	 CFs5O/qnTard/G4/WWLx5XaY6AFYuJQNbORAwHHs4PeXYN+eScBMFbauitBdQJAvz7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E0FtTemE;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A207606A33B
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A207606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E0FtTemE
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2050511f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032172; x=1793636972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
        b=E0FtTemEXX057tr9SgI3unFAxonc+HEyP0zeKgE2avK+1AkgKsWhuwCwsNUnK5idoU
         ctArH/iZC8z49XrEiY42bMaKr2Euk5zbd+YsUELX/H+vQvzT47RuA+AdYFv2CqzEyGLa
         qb2abk+U4PiUSsBHnW54TV2Nvtczsh77yT5wzJsGBd7+ee99TmL/WGI9iF8qY+HUKMYA
         SSwHs4qKbP3zlnLi2JJfE8ZelS+whXoHXWxMuN7qvqCRxhNzR/ycoSLyAtQSrp8MI6Ew
         2OFB+QCed9B/HgLMkilzUs364x52iRHWbvWbZyUVgP8kkz/PRuQbKE6SSvKE9axZoCP/
         PbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032172; x=1793636972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
        b=vsbMSEQtjrg27R9wU/VyuI9EdU8bexWjxwUczLEYraUhlOkCZyWNIQqrFZ5ZIBmO8e
         6IHd5RQXSHU3BaDmVOXdrWuhf99LSPyrYgJUUHpVt+cuuGXAF7XX1tMVh7t68C7xstjJ
         +GxgJU+Xqob8bibxGew1icKsEjdCkumLoGDHcrK2hueKgcL+NyTdVbVSaMs5wS9kssEo
         FeiBYfH6sOXp7yF2cA8gMU0q0Up1xZ/61IOrfK96s5AhX2iU65Ftls0yY0Kt4PBmURKD
         AGGBl/0eMi4N8s3mN0rJb1Wrnfu2zlnm7E/2G+u13I7eMBDYVMbKuM9SeWcvypdh9+hf
         GWNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXwaeD5VczRHyrW8/BazGmMLEmIBoI2nUMy9VksJXxJBVDokJ/Lmq2OXvtpJ5NTeClfzE9c0CV31gH@vger.kernel.org
X-Gm-Message-State: AFq9FYJnHAxqpwd3JnxutKpsbNBBnUdbxkaIHpOY3MLW/MTs931T11ef
	y6tKUohMdv/XGwxeH1rIEYJsA1YU/9Ol63T00qxKQ8omd4glgsr/wIAGvsHye5PGREU=
X-Gm-Gg: AYBFou2TYWkZ99am0/SuExW0BsquQT7VD2PDc6BCmrB5posBPpnFwrYI4IFUSB9cWNR
	ek2sYMAVyeZjy5KfSxwFPwEPgcXKzkaQYE5lVLCruymgccDL1Ndm6kYdsKACmDwggrg+bJb62JQ
	UZsnlUtoZuVvKIIzxs5Shcm3OwKgWVXP/oaiAc83PoFJqCgHJFhzpCCeoRR9GiJohS0VfzuZvtO
	ue2MwbTg2GZV+IwyVfaDm0cFP3wz1rar2zl6fioGQFv1pj1+7hVNpnvSoWJ1PJefx5cTG+L2o01
	SCoN4c4XWWcFYsnQqc+jeZGLiHlkkEdKlEjaGpwG0EKkRDiW8LVOLurGHJZ6iAQWO/q59XzN3FZ
	CvSPh09qQtbGObAwNCS43wRp80IfDKzbCb3M+1CSwC1B7WOnfoupvNQNTN3gMh2dU6c7oz3RVJd
	AI6rQAhNRXRFyP/cQfoY1qu5E+el7OV6Km4cpey3rmGVWGl30iyM5ucxRT47JQrNEJS/cQas88z
	hu+OIwdfWSGceLCjupaeXKVp8m84kDSAzc4idvWZhdZMZdRBlnu5Ff80qszJi0pxc9bf0dvjnYi
	/ouZXQ+z++vMIEGcTaPrj17/hHSZEYayiJHzK0xO2cM=
X-Received: by 2002:a5d:6881:0:b0:48d:f14a:917e with SMTP id ffacd0b85a97d-48e3eb7e54bmr10139771f8f.11.1793032171585;
        Mon, 26 Oct 2026 09:29:31 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb9cesm18148057f8f.27.2026.10.26.09.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/22] gpio: mmio: Drop unused assignment of platform_device_id driver data
Date: Mon, 26 Oct 2026 17:28:16 +0100
Message-ID:  <cd5c33b74b630f31841f4c570d61c3bf47ec712a.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=874; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6ijQYwjczGie5kQc8ROmUpQycONZ/hY8dLBsJPtE8rg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+oqOpj8Oq2dnINrnmjMCAZEAXq9JE8ombgX lTj6fI6s0mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/qAAKCRCPgPtYfRL+ TtUWB/9QrH/LdSed2CsRA2n+Dgpg20IphUxMyZLYPYEx/UpH295YbPWSvVcWjoObO4lNJZCBSup Icukqbi5Q602/PJPktuTA7xpKvTpQhSbyTLRPBP7VMFJPwP1uH2OOTrlyKnzbzAFwRn7s9aaVV2 6npGor9MmJkWL94qRIq9vMd+sMxqi4qMLokI6J+gSl0eY7VaZtJKjmdGvFu7d4vOUlMWwlVNg4s cMIpsaK+WlJoAGCmUcQEwCKAuOrjlCxoQ1IlmWPbDtDHvxM/tBS/gDkUSpAI1fSLvnTgFAOKcQj dFMDTs9h2lKZ9LDPMeomNYdYQmvwY9B+0QryuuHLV2lPg/AK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mmio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 0709ffaab4de..ec7c2b73f2f6 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -870,8 +870,7 @@ static int gpio_mmio_pdev_probe(struct platform_device *pdev)
 
 static const struct platform_device_id gpio_mmio_id_table[] = {
 	{
-		.name		= "basic-mmio-gpio",
-		.driver_data	= 0,
+		.name = "basic-mmio-gpio",
 	},
 	{ }
 };
-- 
2.56.0.rc1

