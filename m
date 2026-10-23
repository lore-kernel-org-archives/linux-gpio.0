Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756623;
	b=WCWyCGEMPpKXB1PogY1f4ql7v7g2CY+vEh7sJ3ybR5k/zWmKgSuc3f+XHfrE3uukGAOU
	 0m0XMeAoABGv7muiZPV2mP3ILdhp5wG+6aIw67mykgJOzagmbnGl4mf62u7Fme28I6cLv
	 VB8karIfSZpDJ/oMUpWjMfHRqBliZdKx4BMk2Ty0K1d2Rfjz3WU+JMdA5GiE/qN57AVoM
	 U9/8nA5Ujakc6BZo7I9XDiwIMmOBdfWOCAoPlw6OjUW6oYB5GaEqzbMDITP45HjBTEVQV
	 CbW07Iwowm/cjSrLcB6RJ9fFs1qrq1Sauw8CszNPRZYru6s6hie5F+RPkyVFpNuha6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=beziaboxHddHsV7QGLlhu7YZ0ZbytuRbl01hFg+RyZA=;
	b=ravignvtcmeP9BxT3N26VLFEUeOzcyFfdEh0JTbry15FvqCfxPTadSOP04uh731yU2Lo
	 gAzKPJKWb0BFKA4jEE005RRHfYxLT48WXDHuMLuam4KGqyr1PRVw5afidNnHHdhMDWWkS
	 mdG3Ivbm9I1iePwpp1wpJ5O6tjhVQ47Lb5Nw824t6/hw9gQIq+j315SLqvz+JGQ8fsHOc
	 LIWFKySZpG/EBRef9aNT4dokPdDW0ll2963knLmCWo1zeCkJ5gKqUABrbCK0GC2lakRYA
	 FQg2XV9aCoZD1uqgej8Jt6DWkcIhkO7AHYpomHBlX2VXOwzYEt5skolKsao6otRhy/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R08cRgVu;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4434606A323
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 11:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4434606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R08cRgVu
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df8fe8513so709245f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 04:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756621; x=1793361421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beziaboxHddHsV7QGLlhu7YZ0ZbytuRbl01hFg+RyZA=;
        b=R08cRgVujMYCNwwaSpezrXyElYrFbSSh50mjerNTeIqtEsPGDXCDoiaVW81rm/V5XQ
         Ypp/BF3NA/Ojg2QyCKijfD5JyVoXUKoWv3QzL4sENFXAx/8eYCiMNheesolwV90I71Na
         cXDj0Sv3uTq1LuNdI1iaSvWXkhsHgagppPTDfPnCVwIsiO9Ie54b3NBVvN1B21WNJw2s
         y3Y0YghLi69kp7XahCtWjLGBEZjRALyWT/AJCpHOPfNPYsdM78VF2mt+7rcNH0OLGfAb
         AKKIMgVYBrGNlrCMe6RjJ5EUIPxctV4eA06ITYqa+ueCX/qwhnpCS5iVgeDmucvM1Fnu
         YX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756621; x=1793361421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=beziaboxHddHsV7QGLlhu7YZ0ZbytuRbl01hFg+RyZA=;
        b=Rwg/02GX/bljY6XwdAtk1Cv+imcEmww8xhfu0eRllDzxDHYTSqlwyoIxxQhu0C3ari
         WimOgNl8ZIi4QqSQrOTaWlqPyQvpJVcovyDsJ+Qnvhdi92fRGLxeCVo0FHYoDA9mkAhW
         z2OvOwe1gzSQfnbrRu9amTGUyJU2zhi6wL8aOz+5/G7Uwg/AIfgkyVQYxkeQ3RoBgWqf
         lZh7Kus7MQFp0UJTnT2NaWp6Z8pHlCfWaa5R7B+7IyJLCR4qLH8ECIuPTS9K6xApOktV
         S04CB95NgqyNom/PNM84Id6S8dSU52GcHEpnGMf3gSTOmP3KPP1bUrjEalzkKbv0T0UG
         mi5w==
X-Forwarded-Encrypted: i=1; AKwUvBzX41HsZXtpPFMuB3QvWdpif3ELo/Ne05wdrhKEeTOSmys4RqxhecLY7HylNZdvFSZFAAlmDdhMn2Ct@vger.kernel.org
X-Gm-Message-State: AFq9FYJMrzn++dzE81Zktnq6DMk7R14Vu6hbroGvE7GHJAjqywj5PNmP
	+6o5QDaUWDaXY4a6aQtzp9RMd4zIjc/683n0nKpjjsEiLCaxyA4q7wYL
X-Gm-Gg: AYBFou1BfzV863viKpAfPt/nWUWOhJ9HrCshUsS3/2OtqSzNC6awJ4hesytOKbI3dkN
	PJKpj/g6Cxbmt/ogdbNVoPf1TLDnOxXnfsunkUaOhAmoWge5RVNgio9cEru/DHt6L4+jmQdXCsD
	NJXCQTgHDvyBYtxpZ04TXhLw/xQPa9dLqTJU3FkK5/QtSCKKtgDQ62V+WlxizVXWrbUfyzEg6PH
	+lkce3AgcPr+ifwwbig/0XmGBF3wsgHBAHEvIS2GyoKK+OAjSdBSvwoh9nT2dQuz/wsQUMzxz1C
	ob+Fj8Owc3l9JIVaVK5eV4eTgtqjSBZWocZEmJsplBK1pMqEZcnumqHHWkLEFA2GbxxN7opCzSp
	fiW/Ut1qYmqXFuHa6Qhw63SVudD0ozgu1g6k9+0BOnqC4KmbwUOE71MZYbcs9dyRuiXMzpUuOSl
	f4KFGY9rDWgyFQBSwVa3J6kjP4ARem7lQnO7SosOe5xiE5Q6GEjcGlvGKRyUDNHaqc2yUBMkPjH
	74FSlblLc29ycxePYouSGChecr86G5lRYlUQq1R7WqQHYStuT92grQ52Tt33Kl3cnfjjWLAneK5
	YLibfVNrbWYGE2P4WtEF3nCfQNZlZVbS843njZ3j7kqsmpb1M2UyqQCWuHwr
X-Received: by 2002:a5d:5f4c:0:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e3859f31dmr3069710f8f.18.1792756621040;
        Fri, 23 Oct 2026 04:57:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e380310b3sm5076321f8f.22.2026.10.23.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:57:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] gpio: 74x164: add support for 74lv164 shift register variant
Date: Fri, 23 Oct 2026 13:56:49 +0200
Message-ID: <20261023115652.700765-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023115652.700765-1-ansuelsmth@gmail.com>
References: <20261023115652.700765-1-ansuelsmth@gmail.com>
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

Add compatible and spi define to support 74lv164 shift register variant.
These work the same way as the 59x chip family with the only difference of
not having a "storage" feature by directly changing the outputs as bits are
shifted in without having to toggle extra pins.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/gpio/gpio-74x164.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 5ca61cf5206a..46562c348c9c 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -181,6 +181,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 
 static const struct spi_device_id gen_74x164_spi_ids[] = {
 	{ .name = "74hc595" },
+	{ .name = "74lv164" },
 	{ .name = "74lvc594" },
 	{},
 };
@@ -188,6 +189,7 @@ MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 
 static const struct of_device_id gen_74x164_dt_ids[] = {
 	{ .compatible = "fairchild,74hc595" },
+	{ .compatible = "nxp,74lv164" },
 	{ .compatible = "nxp,74lvc594" },
 	{},
 };
-- 
2.55.0

