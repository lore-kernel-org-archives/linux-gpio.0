Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375920;
	b=Vzr20aQNqBYe5OT+4p3j2zUD8vmR6s9AvozQr7mSb34kva42Ap8A2Hd8eSENTx/CM7hM
	 vMc5DL/MCIQKtyO2pTZ0sy6nCY/+9nqTJmQ0dv+du8D0r3g+OfaxFFaVWNsNaumXTzGNm
	 LyfxQgZ2OElIlI9uSDRGlVctA7ul+bcIz6wh/aPtnqzd/hW4AKfZOOd8cYSIW7C9gNn3E
	 G3c6032ziCyH7alKGSo/FFEUn40V+CzRNMmwQ39+SUGFx8kIzvLWMNr72s56JsOCmfv1Y
	 dIgszRzErtalkI6vkr/axORdg1z8wpzIIWbQFz3rbFrPeduW3aPoKybsuAzVBTK/5pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
	b=ezryArFiJqUUMiUOL+3k8wpwezeTscOe89Twl/dGQNcFClWSfUwtQ6TCTIH8g0xEebUZ
	 gwsMzVJYMNtDMB2eo+1/dedAplZDxvornOapV7cJnKfh2oJ9iWwylDlxR6j7gTwZ5r/lC
	 LwsEWrRRam6ZU0TKPWdN+joJeaZJrvBUmki0QIh2NT5Cd+K+Tprd6FCHCZGwM5YSwAU0V
	 hQwgYZ/Mr6BVA/y0ytIr8GBtZNDwyX45PUm0/Lnr0c3EaOxPK9wURaoD2tX6GCIOERqlO
	 upT1HDLY0GeuDXELyMJhMH7e9IgRoBoJwdKEXW+VRYb6/spTZdJXKuNEi32D5nFpTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHKc6JGE;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212A3606A324
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212A3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHKc6JGE
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so6811385e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375917; x=1793980717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
        b=jHKc6JGEZVWZTPtTYYYbeWeH2YF1NuhdK4SJtLGDhA3i7MhWpq/5IDywla/yY/QQz7
         6jdVRkfBC7JjD7XbtNTHO/JTeElQjtOl4wdxSBFr4BWzeua+R8VoxnvAadd+FdVKLOC/
         kKGoQpuWkOP9UgDLhwnXfMl5omPFkIBb4NaxBIQcdMUU+0HOszP5sm9ve6dgoj54ESkr
         z3JLgB/DRvf9cVQjWY7PheQsKoMEzk7MMxx+l3jNFuN7lDOj7lxq9pRbPmfdJor11ZZh
         EtnXnEbXUs5lD+Icn/rZpel19qqba8ZSpr+ruhBpi+E9HYMWZgxAsKBdOYBMG2lGDgl/
         Q0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375917; x=1793980717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
        b=N7CIdYbs2rtca0RCSmmrqnera8qXoeCfl7SEJO/TgM3MWaNGJfJkF3h8Pzt5mSHkt5
         NeXgCgAkWhjsVzOYR6MSNDJspOh5C03/IC+Ktz4x+a+DMkxLWZl84aGfWbg5U/fM86PU
         Qyo9G+YboinJd2OQPM/aWTpksRwv2fjFfs6ukrJ8jz1iQxRhy8c3p30VEsnDMes9hXcP
         TKp7gMGiUJruRWsXmpoNf7LMJEFk1pNuphG6XV/8ou4BEeA7ablzo6rJ5NYBT2AG++6T
         /wviq5Jo6C1u/ad/kbQoiduSmLQiOqWiXQ01pvioxFK4Tlo+4CCBoKSVMPu+t7Bjs2e0
         P3Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxN3WPQCEbJ61WmBAjP379R4p6q7RymGvyCq3Cn8bM/a1lzNXn0mbHF4rhLGzeCreDqlN1HkTfBaYT6@vger.kernel.org
X-Gm-Message-State: AFq9FYLmygsr77iu8M4WpRwDia6p1964kvqNPL3AsOWZZMY6jZd3nkYL
	6JPCnrGuRiACd7uLGmMndL5hXXGj/a9Lks5Rr/8LL2DEPptFBtoWW4fgK/jsDXt5D+E=
X-Gm-Gg: AYBFou0lESgXTN4kDUwgYyGms0LrxwwyGw4USEkwV+ypMJhN4RP/hMTaKcNjxJG04KG
	0binKfPouLlnehxgSqeuUOuvTNdsluSTpr8WrB9lGAW0U+vmzmPr+PVcReK9TQBnmlIL1ghfOsl
	dvyICvLlD4O78Mw5IdT0Idz8hZZfQIU17pWEqplV50qk/DsQ/fJq3B+smqdxGHV41sJ8rnmqE+m
	ImGlzieOheoZM00dqGygkKQJr5N7RzqNa5SLB9eerMuoazPS3+ZzziZvAsx64/qYj4hBSygtwZM
	VAuCYy2jq/sxObIqg3+O5YpKFLZxQCbb1nvduEfyu+R/pdjSbQh4pIhFBB4v5RMP8C3629hnbCT
	Dm+t+bDDZEb0zUXOIx20umdg7TBaJmlS9tjeXfBu4ZSXLeT6vYE0zIIZqyD4yxhtei4/m+NIag9
	fVJwd5Wb72+ZZ6I49HV3DPaRW6LcrY/kUUizibyeyNj+TFlBbfMnvjxiOAOkswlr8IJM+6AnH1u
	AxAZ7FitDEDGtUvd8wcijK7Bcf7oALHrZN77u75S5P+K5QPGsjmR/hnyQN5NRmqTKFWEHEEtacI
	wGQpUjREhK2Rgw52Vovc+OcaD3mKk0ex7toxwzkFUufQRZs6nrTWE8s1HELOPHvMwzEzIPnc
X-Received: by 2002:a05:600c:e543:b0:4ac:ab43:b50b with SMTP id 5b1f17b1804b1-4acab43b5f3mr32931495e9.26.1793375917487;
        Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09fadb75sm40803375e9.3.2026.10.30.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:33 +0100
Subject: [PATCH 02/11] pinctrl: scmi: map the schmitt trigger enable to its
 SCMI type
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
INPUT_SCHMITT and refuse the threshold, the protocol has no type for
it.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6bc94c68e89a..5de47e060e8c 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -128,11 +128,8 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
-	case PIN_CONFIG_INPUT_SCHMITT:
-		*type = SCMI_PIN_INPUT_SCHMITT;
-		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		*type = SCMI_PIN_INPUT_MODE;
+		*type = SCMI_PIN_INPUT_SCHMITT;
 		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;

-- 
2.56.0

