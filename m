Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794287358;
	b=mjInCYTZqa5mpyXjklF1Vk+6TGR+1xcvyA0e6heXe72tSM+25DL5/jJEMhZTqs0yW+uq
	 yNHqDs4fdCGJLeC4Z5jrxvcEgVbFPhqSN61zMjIbVtH4c5G5UUN/xzoB/TNnsq68RxnPH
	 bDhxWHcQVlhLUdaXEefiJuEQINQTJ9kUswCxWDfDAJoeCKHOSYt1jo/UhaSSy9KC6pvHG
	 UuSSRZRimBrjRbPNMrjYmQc0OD2vlDUGF4JKr2Ix5De5gt5UQyWOw76xnm6nGyzBjvykm
	 kzsCG4x04GYkk+Z2nz3EeM/c7M5dPHJ/cBb87hdTJv+CDD9eTiQdiJFFkldWHxWYnxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287358;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5eh6B0MLrnUtM1Hc34WhByD1VEsYF+myuR17nVrgwTI=;
	b=W9FGtfeKDeIjIEfND/yLY7W6pIpwy0Igae3rqWUNmmyTcqS677+5YIxup9LhIS9oHmHB
	 455WTJYO6k5eWUJCI6hmqHBw5M8QZFwhnCcK1OTCR/R7Iu6OAdrEzudPMlKaWP5/rDvVg
	 hhT6dQEdEJYgtq2MnEDaKdKvjaQOTum53wYpwm7KbE6QQ1G+l0nohLLrTQf5+MuFMRqjY
	 Cs1ZVohABh+RcmmbYygMSs/zKlEgDIuf7/INaW5OWleGmbnjHlA46eVrHutEipTvmaDKt
	 BMtRAtsRk20J8q31K0yZEMIhYdDh2luwCsi/+GqBNVAZceN5ND4wWkun6XjWNgWPhbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlsumMSR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D791A606A326;
	Tue, 10 Nov 2026 05:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlsumMSR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794287357;
	b=yumHOzCRMs8sHBEz52MhzjBCbwtwhWf3OZ4lrjS6MtCiG7xRiN+9iJn9JavSPDVJzG5r
	 5x1xPp6njAEtbP+NVHlqrCs0VBXQ7cR2aIVZehff309GMDTsW0G3UH/Dv1ls3CrzAhOEv
	 rrLkWbA7PxydFz/TQO/b6jaBTqmbyirFJPJb9GVqf0/2Gc7RIytSOTpOaZ0QxfShwYtSI
	 GSXnEn3TzkPgwVIcC6tUQpOHmYKPlsneK4xB6By2s8NQtmumUazOgo3n6nd25EXtSfaPV
	 408UUchlkB25Y/GHz0gnFoLSm8OH165XH/hTl/1+R1q5l4Mp6GIJyVpxke8TJC/lL0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794287357;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5eh6B0MLrnUtM1Hc34WhByD1VEsYF+myuR17nVrgwTI=;
	b=naQDEH1GEbAUy8dNvQNV9pZBSOuE0tKkZOKU4YiQw0jmfhwbi8Fceut0Q5RUHtVSQvtB
	 XMxqjGJ6fhVpHqa38CLoDKUkRcRWxoNVx0izerlOGN3pVVfkPpEV8GtGI5ZiQcddqJSRW
	 DAEvaZ/CTWYCnjsSdLGdWRz6w6get8nPCOsIW3260p3LYANRKfl2FQFs2izA1o4RUNXBK
	 aVbBE5fnMBNjDpTGi0NzBo+esBsqZb3ZUAns9a/1TvJ2QgmeGlRNfae2+YxXuGrDIUyyk
	 iTbnKZsrQzyX5xhrk/+ph2pz5XXZi7Txo+ZvTlES84owhOLSaGkxF/urACzZANtyXfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 232881F008BC;
	Tue, 10 Nov 2026 05:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794287357;
	bh=5eh6B0MLrnUtM1Hc34WhByD1VEsYF+myuR17nVrgwTI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=HlsumMSRzOd8b/Ndw43VWODGK/zVLZFF7zluYWED7TqTzsgAkz3yGwarBtq1CQzc0
	 fedChpXXszO4rHuTRQj01v5R9CGmecR16dOFrXr2g2U+X6hGQNVC6Kb5P1+V/HUy0e
	 Ab/rjxxEXhclfIcIqVG7geQ36NF5HeWKPsBmKG0s0iL15aVT7wUd03XlD8d+RA2358
	 8N9JFrQ98b4h6xzHbowkuWtY8sAz28lb6QR9q5Bhn/uo3+8THyEppL+jn4DPGwlQx/
	 2KJ1/J/WP2coQ9g0BQ5XHLOshmRpssTx07i5VRCw+Esyrjx8+14j6QjEz1oTTdq64+
	 6C0oh2YHRozIg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7954848871;
	Tue, 10 Nov 2026 05:09:16 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 10 Nov 2026 05:09:12 +0000
Subject: [PATCH v2] pinctrl: amlogic: a4: Allow functions without groups
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
Message-Id: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAPim8moC/22MQQ6CMBAAv0L27Bq22hI9+Q/DgZYtbCKUtEo0p
 H+3cvY4k8xskDgKJ7hWG0ReJUmYC6hDBW7s5oFR+sKgamWIaoM929eAMvuA1uri+GQaaqAES2Q
 v7312bwuPkp4hfvb3Sj/7d7MSEtamcdppffYXunXTIwziji5M0Oacv4gh8L2mAAAA
X-Change-ID: 20261106-debug-info-bb5611e36717
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794287355; l=2644;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=sWD7zbg1mSXOEg9K8sOVvNf5EChgrS2CCVGEpGmu0uo=;
 b=Bn+UorY0bcUbavYtuQe7WCJiVKPEGNSMK8QgR2s6loKCX7ROkp3eRi8Rgestk9kEQdi97vDnV
 gPVKPwqjHjMCFU6ZIImK8Ma4yH99sq5pnmF1eeZVaotV47oXxU4ZJuA
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

This allows the driver to support function nodes without
groups and avoid treating unrelated device tree nodes as
pinctrl functions.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Add debugging information for error dts and Error pinctrl config not affect normal pin work.
---
Changes in v2:
- Reserve banks nfunctions and ngroups no-zero judgement and update commit message simultaneously.
- Link to v1: https://lore.kernel.org/r/20261106-debug-info-v1-1-067c5c554f91@amlogic.com
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 39eb8cc7fc0d..bd12f6fa3d4d 100644
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
@@ -1166,10 +1172,11 @@ static int aml_pctl_probe_dt(struct platform_device *pdev,
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


