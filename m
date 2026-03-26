Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748E39FCD6;
	Thu, 26 Mar 2026 18:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549035; cv=none; b=uyaUnrol7ZAgPmWBku5sqdlz8uVIHPmFyx95NtoesBWELudkG0D3KG0ASEdnUSNumLUAl91bDy75d5nz9HsafT4QJSrgPrfHbXV3FimK98tNzfA85lybCfrjOmUXOO490qxMq+5QcbRoa7s4LhTp6KNClNgEXICT8x8qoVTiWUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549035; c=relaxed/simple;
	bh=sh7M5XyszLbsJx8gGbubNLWtnEUw46EqXttj0YbyTQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fv18NOtCXQ9UBXqReZa9D3U9GvNTYURvAdpVAXLbqf0t16tM/HebmZwT+sd9+PZ+JFk9O1avjtEErCgDg6PHs3ZoTHWwcPbp0tiyhyY8vBcWxQYMh3VrZmhT0cUxlxAF5suzUI9taxSXQ0GkPedJsKGvyUtS2sUzbK0gF3GAx44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12FCC19423;
	Thu, 26 Mar 2026 18:17:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: rzg2l: Drop superfluous blank line
Date: Thu, 26 Mar 2026 19:17:11 +0100
Message-ID: <7bfa105cf72d3b3e72a45d6218b5d88c8a7f520f.1774548955.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need for a blank line after a "case" statement.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queue in renesas-pinctrl for v7.1.

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda028551..b9f85da308a0f363 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1475,7 +1475,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		arg = pinconf_to_config_argument(_configs[i]);
 		switch (param) {
 		case PIN_CONFIG_INPUT_ENABLE:
-
 			if (!(cfg & PIN_CFG_IEN))
 				return -EINVAL;
 
-- 
2.43.0

