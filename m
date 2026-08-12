Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396D53C5837;
	Wed, 12 Aug 2026 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529881; cv=none; b=V/UisxRpAevYCNyuINAM2h/h9xJ66kS+jCGuFPKIkibhqtSviFl8mv1tjx2Jb5XjBO7+Yb+g33dM7lUmMNx1XF0yFRYgyEE3IjRhkQq+7G84umSWb0Ya6MFLs0r0hwa2ScUF8LYmo3A7AChlHgiz4NQwChmAJp2WRQ9w/2RIkDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529881; c=relaxed/simple;
	bh=GmTbEPvkwJ5IHvxjuWI1y3VvjQ4yhh+Rh8rB8hiuHpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SBWGWx6RkPmA+aclXQwDbJTJb84qnQQKnxdOxwEo5utSKaclvJIMYhBBjFuEOjsbWCO0qK0HqbI/wQlULXxVsAb2D1kCD5tgMguV4kZHdfP3tOmWLx37OZBVmvn6ctxI9BziN2FmUfG8iMyL7xCuxdoQrgeBhVYRXq7TVqJmmzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olH0SctU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olH0SctU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BABD0C2BCB9;
	Wed, 12 Aug 2026 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786529880;
	bh=GmTbEPvkwJ5IHvxjuWI1y3VvjQ4yhh+Rh8rB8hiuHpE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=olH0SctUXdGKKkRp2o2Th9FpB9truE+eq8BkspfuknysL0rYrT4BFRDxYu/nwXryS
	 gi7y4nBapblXc4zHQGxzCY+tonmIDfaRUNbQP1Sk5gPquoumHmeqRuMmwjlM1ZpFOC
	 ZCUKy9heCHEgWj06gQOrKbOEnx1WJNLPwm6uFtgQYD5B+eK1Xvd+TrSFzG9jpb6tEA
	 eS27rBxO5bQ627g4Pz95wwaRVSvRc9JU8mH8CSQ+xSxB2AuUhhNIJTFtQh6VPIoYZd
	 jGG4sunfBbBxV/hmgjXt7WZHbO6rOhEq6dhi+HyFgISTcmcVczdAXYPl+0xNl+Uv9J
	 fGwx7Kahb+l7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F62C5CFDB;
	Wed, 12 Aug 2026 10:18:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:17:44 +0000
Subject: [PATCH] pinctrl: meson: a4: Add input enable pin configuration
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAEdIfGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Mj3cy8gtIS3dS8xKScVF1TQ0MzsyQTExMzS3MloJaCotS0zAqwcdG
 xtbUAY0ASUl4AAAA=
X-Change-ID: 20260812-input-enable-51166b444697
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786529877; l=2149;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=9SbIm6+8Ee1Yqah/Xj7ZLaezrMlBamtDl5jNdbzcGzc=;
 b=D7w+Kf1zPLXNaLWHPsaixnfXbBtvYYqUK5MBvXWe+kNz9Ckdy07+uAigRFK3asjPqxVVkefBm
 5oLbnS5j6n3Dfqk58YoCnHFz1xdZi88f7ZaNnuFs2Qg2iOAGA2c/0XX
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add support for PIN_CONFIG_INPUT_ENABLE in the Amlogic A4 pinctrl
driver.

Use the existing output enable control to configure the input enable
state, since the hardware uses the same control with inverse semantics.

Also update PIN_CONFIG_OUTPUT_ENABLE handling to return the actual
output enable state instead of treating any non-zero value as enabled.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 420f7915c010..39eb8cc7fc0d 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -469,9 +469,15 @@ static int aml_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		ret = aml_pinconf_get_output(info, pin);
-		if (ret <= 0)
+		if (ret < 0)
+			return -EINVAL;
+		arg = ret;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		ret = aml_pinconf_get_output(info, pin);
+		if (ret < 0)
 			return -EINVAL;
-		arg = 1;
+		arg = !ret;
 		break;
 	case PIN_CONFIG_LEVEL:
 		ret = aml_pinconf_get_output(info, pin);
@@ -619,6 +625,7 @@ static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
 		case PIN_CONFIG_OUTPUT_ENABLE:
+		case PIN_CONFIG_INPUT_ENABLE:
 		case PIN_CONFIG_LEVEL:
 			arg = pinconf_to_config_argument(configs[i]);
 			break;
@@ -643,6 +650,9 @@ static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			ret = aml_pinconf_set_output(info, pin, arg);
 			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			ret = aml_pinconf_set_output(info, pin, !arg);
+			break;
 		case PIN_CONFIG_LEVEL:
 			ret = aml_pinconf_set_output_drive(info, pin, arg);
 			break;

---
base-commit: 761af93c9f1a100b8d9f71aa744b8f9abbbbbfb2
change-id: 20260812-input-enable-51166b444697

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


