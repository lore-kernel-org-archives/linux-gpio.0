Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948940;
	b=h6t4HobbS9xY0O5LqdYeq85T72sbRhTZVXTtEG8jqSK2VNRhQe429xvZKazkaWzJ0xB3
	 RnO7/eh7qmweKZodNhVi06AdJyB3qxxz/eTLOigKaLii0duoOnC3ju6Y6kpMY/US2/PyI
	 vKIiHwPbXH6aA54pon4T9vpdBoNvLxxpDqWdjIXcYzmi5xImsPW3m8n03jFZBqkMM9Oi8
	 kdXeB72hwBt4bZa15fa74JIu/kUjOsEckigkz2zbIxeqq2Xa8aXHlenf3sbz7HAH1rXxZ
	 tyYR4b6DorJO7Z0bsPKWUO7BXNyD5eFOsKWIACXJ54YN1+aLg7DzLdjAWOihs7NC2Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948940;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sssGzgp6hfraRTjPaOuoMz/ydvUjxyv6U8CNhrczgQc=;
	b=rpR1X7BHBXegb3TafTzRSlei0Iwm4yTeBImnBP1KGZOQvPJG/VJ5m2z2RTTgIZbXaBNZ
	 prBsyYpMFM2sjxX3XIjP4RY9zZMePo8Nse2i6ip/gEpZ7Z0KKtgM8Pj6VoBHykywDmLXj
	 G/cvnjl2oP1//ZXV6SnGxtEyE9zHE58I8XO5bfBITnNfqKfsM4EU9zubsy1AHxsX56JGC
	 DFIK6etOYnGeUWBKea+0keB4fLa60vLSXGUWPDvKF69827XT/cLqOY3eJNHPofmhw/M07
	 w1OmmIQSp6Z6BS76otD5/J+pvIpaf1lJv0Ulun0zTqF9UOSLNLWsM/1Jqd0u/rEZraA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmTgMEiC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21089606A326;
	Fri,  6 Nov 2026 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmTgMEiC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793948939;
	b=zbWAaEPUHHoS10iRxwlAfYnVZEY400FBLMBedLqwiiRsCl6M9CAuRCrdrbTZWyh/Lp7z
	 xlKb/ydJTbl66WnQBGecGc7EgCknhldhy78MqS2/1jz3XerfE7nNzek6ZQJEKf9LyRCGk
	 MYVZLyRxqI3L6ZBd9xeQJEnpa1weJqtiMrb8zEa7846I31LOdanAct/FjAAHRy/5tkXyq
	 SfsfK2XrZ52dKarefSaJ04019h9SEKwMpBQQrLQXVKz+cI2S2j5YR1yiyH3N8HUE5cbnM
	 f0vSQsMCneD0qAj1JEhTTg9KJtPete8ccWB8ylLBHai8h9MK8OMKolJihRSy5OOScdg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793948939;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sssGzgp6hfraRTjPaOuoMz/ydvUjxyv6U8CNhrczgQc=;
	b=U/JE4jcRGwUJ0lMX4i4CgZJg50O11vt6uHoQD6T8gO2348U8Snd/qUfglIZJVHtlGxMF
	 BWgAeY82qEbJkEuDKm3Y0kms+JItm4icEFrZMMjblaQ/IV8N2GYjySaNcy+CvU5niMX+L
	 8756IRzIdSrwQuEiwYKK99F8d+2X5Z6phBOsAACqGiXsgKsadx3UxN//jVz43oJH0rbMh
	 eulOlubwgUGtTBsdFd1F8WFh9EpLU4z0sFBb3trRwTzTknaFSV9jCLRacVSeaP9gzvYCb
	 57rZ/POhU2V6jrXMFRhbJ1F9zsGg4kQuXm9j/8jvqxFHng9Eesfi6Eplm4tC3d3MchQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2A7F1F0089F;
	Fri,  6 Nov 2026 07:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793948939;
	bh=sssGzgp6hfraRTjPaOuoMz/ydvUjxyv6U8CNhrczgQc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=EmTgMEiCAR2x4GSZadNau2v3DnOTeD3OA/JvNiQgw96aHXlTPIeALuWaCT/br2GZq
	 UQGflvH6Eo8o7j80G+MQcL8d50PhMKkRIu3PG7BZXLyczM40yXjATzdzlhK2pME5tg
	 t/m5yzUi+W/1t72VorLv4DTz2ZY3V4GkNOsJ3drzzhMrIVuaSBwrFdMgxslUqvEjcq
	 e1S5inj3LqrYrs4huiA1fGQnaYwsgHJDkL6mPuS4hEro3uTPnwO7p9ZfPV2pxOoEVz
	 21w/zD5QuoWUdFYM7un2YwSocNlcAvsL35wTMKyrfNfjlTFCD5txca8exvkDRxompa
	 I+fi/r3B1x2fw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4BF9C45C1E;
	Fri,  6 Nov 2026 07:08:58 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 06 Nov 2026 07:08:46 +0000
Subject: [PATCH] pinctrl: amlogic: a4: Allow functions without groups
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
Message-Id: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAP187WoC/x2MQQqAIBAAvyJ7bkGNFPpKdMhcbS8aShGEf086z
 sDMC5UKU4VZvFDo5so5dVCDgP3YUiRk3xm01EYpadCTuyJyChmdm7qj0VhloQdnocDPP1vW1j7
 7Vr3yXAAAAA==
X-Change-ID: 20261106-debug-info-bb5611e36717
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793948933; l=2986;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=38GizBhLDTW4i/GAT4DbimPes3s2Ei64bmXiM44p6dM=;
 b=Zp2hrVUInW3tmySD+qP23c2GiuMu7cuWGPE7KpTaGQtXN3rnWgNGaDXPPlqLObAPZOi7+XzRa
 Me9xUYBVdZ5BwnG79tTvNzKV6JE2Az0cijnFmwxSoHYLJFkY+nj7+s7
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
Content-Transfer-Encoding: 7bit

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Allow function nodes without child groups during device tree
parsing instead of returning an error.

Only count and parse nodes with the "func-" prefix as pinctrl
functions, ignoring other non-GPIO child nodes.

Also handle zero-sized allocations when no groups are defined
by checking for ZERO_SIZE_PTR in addition to NULL.

This allows the driver to support function nodes without
groups and avoid treating unrelated device tree nodes as
pinctrl functions.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Add debugging information for error dts and Error pinctrl config not affect normal pin work.
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 39eb8cc7fc0d..d0e3cec3ead0 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -821,8 +821,10 @@ static int aml_pctl_parse_functions(struct device_node *np,
 	func = &info->functions[index];
 	func->name = np->name;
 	func->ngroups = of_get_child_count(np);
-	if (func->ngroups == 0)
-		return dev_err_probe(dev, -EINVAL, "No groups defined\n");
+	if (func->ngroups == 0) {
+		dev_dbg(dev, "func %s No groups defined\n", func->name);
+		return  0;
+	}
 
 	func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups), GFP_KERNEL);
 	if (!func->groups)
@@ -899,8 +901,12 @@ static void aml_pctl_dt_child_count(struct aml_pinctrl *info,
 		if (of_property_read_bool(child, "gpio-controller")) {
 			info->nbanks++;
 		} else {
-			info->nfunctions++;
-			info->ngroups += of_get_child_count(child);
+			if (!strncmp(child->name, "func-", 5)) {
+				info->nfunctions++;
+				info->ngroups += of_get_child_count(child);
+			} else {
+				dev_dbg(info->dev, "func node defined err %s\n", child->name);
+			}
 		}
 	}
 }
@@ -1128,7 +1134,8 @@ static int aml_pctl_probe_dt(struct platform_device *pdev,
 
 	info->banks = devm_kcalloc(dev, info->nbanks, sizeof(*info->banks), GFP_KERNEL);
 
-	if (!info->functions || !info->groups || !info->banks)
+	if (IS_ERR_OR_NULL(info->functions) || IS_ERR_OR_NULL(info->groups) ||
+	    IS_ERR_OR_NULL(info->banks))
 		return -ENOMEM;
 
 	info->data = (struct aml_pctl_data *)of_device_get_match_data(dev);
@@ -1166,10 +1173,11 @@ static int aml_pctl_probe_dt(struct platform_device *pdev,
 			}
 			bank++;
 		} else {
-			ret = aml_pctl_parse_functions(child, info,
-						       i++, &grp_index);
-			if (ret)
-				return ret;
+			if (!strncmp(child->name, "func-", 5)) {
+				ret = aml_pctl_parse_functions(child, info, i++, &grp_index);
+				if (ret)
+					return ret;
+			}
 		}
 	}
 

---
base-commit: 89edcad9f23925f5706b7555b02165d1990444d5
change-id: 20261106-debug-info-bb5611e36717

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


