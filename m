Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A632A4A2634;
	Thu, 10 Sep 2026 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047344; cv=none; b=HU9EB79fJFQXt1xahoBsKSncX3+e9FNk5qZEKDdF2oilQOIaXek2FeoZkgJq87wF00lYOXwGDMLF9wFbgD6JRl87yvOmaQubeolZ+tneFyOxXTzZN7OPGu3sF0MykARbY6HvibjnKC/cD+KR9ytKz9shSMqp/nMFgB33mGGuAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047344; c=relaxed/simple;
	bh=vFiGko9W5vY2zPx9uystmT+pgsJatJ921+bOqjDFnsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8IqKXK89WPasUFWPBRLaGGORy1YNNvc97AezAE6nNYQCvx3P63KH6x7HMwKJb9F9svfqs/Z5GVmJNdJoCX6DcQFZRKs9I7b8DlRuqL3lFaBejc+S0GQ5SpGZQmvpeZA9cdZHpL2lG77Uc2t8kkai1EelOKCSF9tTvBaIMDXzLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TMigpWmV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TMigpWmV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BD5322C8;
	Thu, 10 Sep 2026 06:35:39 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801593F528;
	Thu, 10 Sep 2026 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047343; bh=vFiGko9W5vY2zPx9uystmT+pgsJatJ921+bOqjDFnsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TMigpWmVs+gqlwFfSICdSaAmeo6lDUIvUP6cV9HfrbQt55FN6fTzomymOP19U3v9J
	 f6VS/cUdGXCOgakdg9hL8rw6vkvhAOCtOPHpv2tmQbRYrLHCKE3+EGZOdPbMKr6CaC
	 Njqm5G9HmtqPDwAg+e3/s/nDqc31iNGz9UqrHa3A=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 6/7] pinctrl: sunxi: a523-r: add a733-r compatible string
Date: Thu, 10 Sep 2026 15:35:17 +0200
Message-ID: <20260910133519.459011-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The secondary Allwinner A733 pincontroller ("-r") is interestingly not
using the same new MMIO frame layout as the main controller, but is in
fact very similar to the A523-r one: it has two banks, with 14 and 6 pins
each. From the driver's perspective, this is all we care about, so we can
re-use the a523-r pinctrl driver for the a733-r, too.

The individual pinmux settings are different, so we must not use the
a523-r compatible string as a fallback, but we can surely let the same
driver care for both the a523-r and a733-r IP, as the pinmux values will
be provided by the DT.

Add the a733-r compatible string to the match list, without further
distinguishing between the two. Should differences be discovered later,
we can easily split this up then.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 9e07fbb5be7cb..dfdcfa740ecc9 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -40,6 +40,7 @@ static int a523_r_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
 	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
 	{}
 };
 
-- 
2.47.3

