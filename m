Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC742124C;
	Wed, 12 Aug 2026 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530135; cv=none; b=QEbbNrzWiixTDSVJK7dgwj6Vp54frh8p29DaFZ6p7DJHk7YqEccodhZvgoT25Tq53r+Ts6HFqniWeixcX2pUZupmxt7AMjh62HSI4Ojq/gw3U1coWO5Rigs5CwyyjpeGQYQei0IMKlm+GuROpXnA9Oj1CZahWQBxxgcL28l/K3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530135; c=relaxed/simple;
	bh=FsFkACjzxhmjjBFuJr7WRdIrgV1ZzFunR+1J4ZbzPDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V4k1ifx0DQ9uJeUO7Cf7hdfpD+7dPW835jnpPeaHqjNsVb5j2RrpaYxnFkMQKxOTS5gFILE0bad9X/Kxr68tVT/EjaftZpqIiJ/IMV+pYSHoYQS3qzwhhdwa/7ORWEnCnn6bS2kRriHYInBVM1g2LgC8Y7+Xdzqsiq3EqbKBT+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwt33dr1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwt33dr1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 519D8C2BCF4;
	Wed, 12 Aug 2026 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786530134;
	bh=FsFkACjzxhmjjBFuJr7WRdIrgV1ZzFunR+1J4ZbzPDY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nwt33dr1S6z55+7n7X9+vQZOVdsucGH613Uqigpnp38GBUJDHrLe53ZbeU2+uY3Pd
	 MGiyKbWQ6n/u0GZoGnYbbxsw0lIeAf/wumcR516uD128AssTZikKmUwfftSZBsdmlI
	 TaOmpsf4X6Sz5UiI+lg2GT1HIIF6gw967d8Lpc7mrYeC6WGid475C+5g3A1/YnE7+J
	 KRc7nlZzUe8xSGHCvbOFBQsdCUnyA+uj5y0n7dvMxGW377q1mMQHa3iTRjdhthNux4
	 U3XuBYBiinwuUM2/PkeeY5AicSkxDC6Bbai9M2XjeNschR2lWe3Co5H84Tt0oHAVXw
	 aQglxwgL22Uxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3050EC5B56A;
	Wed, 12 Aug 2026 10:22:14 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:22:12 +0000
Subject: [PATCH] pinctrl: meson: sync some modify from A4
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAFNJfGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Mj3eLKvOT4RBNdA0PDxFQjg7Q0Y8NkJaDqgqLUtMwKsEnRsbW1ADs
 3+W5ZAAAA
X-Change-ID: 20260812-sync_a4-011ae20ff31c
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786530133; l=1591;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=e/6sQWJ1ygoCKacBsI4pbgOSo29ZSl5fN1COhUhv2b0=;
 b=+npSTpTZcyUHwNQKfVQMSVMkn7ZL/7EmlBUcCciWqI0ADTvpgZxjGNIPFljysn5gww3Skd8T9
 qvIhywPAjIADP8eZEf03v8d3ZxXYnHfIBxR600Yn+YSA1nkayfJfNlj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Set the drive strength before enabling the output to avoid enabling
the output with an unintended drive strength.

Also return the actual output enable state from
PIN_CONFIG_OUTPUT_ENABLE instead of always reporting it as enabled.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Sync some fixes from  A4.
---
 drivers/pinctrl/meson/pinctrl-meson.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 4507dc8b5563..1eea3e9d1cb2 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -252,11 +252,11 @@ static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
 {
 	int ret;
 
-	ret = meson_pinconf_set_output(pc, pin, true);
+	ret = meson_pinconf_set_drive(pc, pin, high);
 	if (ret)
 		return ret;
 
-	return meson_pinconf_set_drive(pc, pin, high);
+	return meson_pinconf_set_output(pc, pin, true);
 }
 
 static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
@@ -498,9 +498,9 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		ret = meson_pinconf_get_output(pc, pin);
-		if (ret <= 0)
+		if (ret < 0)
 			return -EINVAL;
-		arg = 1;
+		arg = ret;
 		break;
 	case PIN_CONFIG_LEVEL:
 		ret = meson_pinconf_get_output(pc, pin);

---
base-commit: 761af93c9f1a100b8d9f71aa744b8f9abbbbbfb2
change-id: 20260812-sync_a4-011ae20ff31c

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


