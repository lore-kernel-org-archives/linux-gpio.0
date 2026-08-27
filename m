Received: from mail11 (ip-86-49-165-115.net.vodafone.cz [86.49.165.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131134D2EF4;
	Thu, 27 Aug 2026 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.49.165.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856533; cv=none; b=KoXKtp7gXyTJBYryASsVgtfbTy6mz2EqHg8DfAjpfY2sOkaYhWYNoeKs7u8oZT5oJZD2N/47v9YCANi34VtweuPauuUVxJpLWeaovk4GTp3Mkew8iJnkxYEotv7TuGcIcor0oJ8/wxSvZ2HpGt1fKy2tuNOlPWc15hKrbKiNXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856533; c=relaxed/simple;
	bh=nitb5EMh8k4Be+o75U6wjF1Tyg5sfbNQco1tjgqCZtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H51HnHyEnnD/VsSDSnvRyqIFKpjGVtlvIS8t7HQwEDhTg8foE9sXPV/UiDiTNj8v5lZoKoLS9Oz9fSxE3QVlaeb2MnjY8YvkTh+UxjqKzrdklyN9x50vp9t5Wed6RStiLzHRpU7hgVCuaQ1jopGQFMQ9r8E+hy/lGHH31e3Hxx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lipicko.cz; spf=pass smtp.mailfrom=lipicko.cz; dkim=pass (2048-bit key) header.d=lipicko.cz header.i=@lipicko.cz header.b=PWax1bah; arc=none smtp.client-ip=86.49.165.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lipicko.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lipicko.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lipicko.cz header.i=@lipicko.cz header.b="PWax1bah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lipicko.cz; s=mail;
	t=1787856180; bh=nitb5EMh8k4Be+o75U6wjF1Tyg5sfbNQco1tjgqCZtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:From:
	 Sender:To:CC:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Reply-To;
	b=PWax1bah20tow2CTmHzuPKxrzehPuRyX8SUcSO67QIPgts5Zn+YHyPezjYbgye/mw
	 Wx3TC4uJBQSNrgHTZyN1z+v9iUHKI1w3DZsOGWher6+CaunKqjn9gSFvPS02fgZfdS
	 XDUkM6kwI5T6svSEHHc+zI0LmDf1cVxE9mJW6CITmrYJSRQ5ZeFQgUWJyFE3IGW/2E
	 FNYM7Vyl/nU22Sv4mv6YE+c1GB/cRjHXk0obWlomMFc75hqsZZTsBm01HIjC7T5AUl
	 O+u+YfaOQ8c8XcZ89PqamkSqzNdfcdNNkqocqXlh7cCryKDM+dTjXT9bzdCDrZFgE8
	 67kvMp2muJmGw==
Received: from nas.lipicko.cz (unknown [192.168.11.238])
	by mail11 (Postfix) with ESMTP id 1941A3E0248;
	Thu, 27 Aug 2026 20:43:00 +0200 (CEST)
From: =?UTF-8?q?Radek=20V=C3=A1lko?= <rvalko@lipicko.cz>
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: denverton: Fix probe of MFD-created platform device
Date: Thu, 27 Aug 2026 20:42:58 +0200
Message-ID: <20260827184259.32386-1-rvalko@lipicko.cz>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Denverton pinctrl device can be instantiated by the Intel LPC
driver as an MFD platform device named "denverton-pinctrl".

On affected systems the platform device does not carry the INTC3000
ACPI match data itself. As a result, intel_pinctrl_probe_by_hid()
fails to obtain the SoC data using device_get_match_data() and
returns -ENODATA.

This results in:

  denverton-pinctrl denverton-pinctrl.0:
  probe with driver denverton-pinctrl failed with error -61

Denverton has a single fixed intel_pinctrl_soc_data instance. Pass
dnv_soc_data directly to intel_pinctrl_probe() instead of requiring
firmware match data for the MFD-created platform device.

Tested on an Intel Atom C3000 system with LPC/eSPI device 8086:19dc.
Before this change the Denverton pinctrl driver failed to probe and
no Denverton GPIO controller was registered. After the change,
denverton-pinctrl.0 registers with pinmux and pinconf support and
exposes 154 GPIO lines.

Signed-off-by: Radek Válko <rvalko@lipicko.cz>
---
 drivers/pinctrl/intel/pinctrl-denverton.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -250,6 +250,11 @@ static const struct intel_pinctrl_soc_data dnv_soc_data = {
 	.ncommunities = ARRAY_SIZE(dnv_communities),
 };
 
+static int dnv_pinctrl_probe(struct platform_device *pdev)
+{
+	return intel_pinctrl_probe(pdev, &dnv_soc_data);
+}
+
 static const struct acpi_device_id dnv_pinctrl_acpi_match[] = {
 	{ "INTC3000", (kernel_ulong_t)&dnv_soc_data },
 	{ }
@@ -263,7 +268,7 @@ static const struct platform_device_id dnv_pinctrl_platform_ids[] = {
 MODULE_DEVICE_TABLE(platform, dnv_pinctrl_platform_ids);
 
 static struct platform_driver dnv_pinctrl_driver = {
-	.probe = intel_pinctrl_probe_by_hid,
+	.probe = dnv_pinctrl_probe,
 	.driver = {
 		.name = "denverton-pinctrl",
 		.acpi_match_table = dnv_pinctrl_acpi_match,
-- 
2.47.0
