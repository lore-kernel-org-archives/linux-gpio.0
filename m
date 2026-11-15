Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739474;
	b=IVptioihm3i5LrGTpRqbRj1bg2yhkPNFsvfdlvPF9TsJ7dsS5RFo+wpM0+U+EgmApEmc
	 nnuu2P5rr5xISTQ43MydwqoYjzw9+w186xCiAyOjeDJdJG5qcRTE6lP1lezms8YVCnLF3
	 5LTN9IE+Iy18zJxMZMTiLhhfjbHJuMgUoDplHIMniEBSsonCGkx8iC70HFfWi+QWYqjoq
	 XqRANKyQajIqSRW9mrvvJiNjx3E9zi10/9DyuHeH5R8aP9x+sBVjWKZvvxu4YH9xh8kc2
	 JsULYZpT3BPVD2c9S+88WKKw5UOOcgVVSBWu3VegVY+R2umwqtTTYrJiTK9RmHhHfmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739474;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Y8iVf7T1ZTcwSUPptvA7v4646kUh4/1M9BGscHB+Et8=;
	b=MJLaIAFEvkBHzUZVfn7wjv3bLT1d86KbL5GGWAFflaIOoO9m7s5yrpzS10Yn1gDrydd8
	 ZsNee+RsgyeGW4RY3F8rP2FnJgXIvKnEKa6+ZpftLXpIosCg5DUjjtp/pIbpAFn8kY01F
	 8+a0IYOwTFQ3o0tFt0y6WwndXfMy5gp1PzUG4DJBYh/lWt8HbqXLm5vId5Cgd3JteGfZV
	 WQCdI1ce/56PJAXaDqu+C8A2HpRbstyPj8I4tQmRXOfQiKBmTa5+irbe6fm7tflajgkfB
	 kH9bg0VgcKwkfo/Wf0Z319ay8IwAm/mx/iPbUYjAmY4P426eWIUzw/2UzdC2EsGvE8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJ7mIZFM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FF9606A31E;
	Sun, 15 Nov 2026 10:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJ7mIZFM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6221F000C4;
	Sun, 15 Nov 2026 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739473;
	bh=Y8iVf7T1ZTcwSUPptvA7v4646kUh4/1M9BGscHB+Et8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LJ7mIZFMMk3KxIlLQug4IjnEPjHfIeDAi8/PTg7Kom41XNl2sU4JZ9V/0z07iQGBy
	 rC4Pnut0AEAPN4nM4HSJSoqliGKNmggZ86PJCVPqrrqw/NsoQc6M0mpTE0yUM4pz+v
	 OKGoWsK9bVVKgR/tvDcKzKY3YTnFmwLwIbM7FMNav2LP2wlmS/KgD3GHhvRDec7buY
	 8GQRUIxKW+ZQzpivUPjwQ8bBKfzJx/0NI4SDd4gtIiW6Lc++FE14DR/wJr4R3XNnJR
	 h1IXwVVu1iHUwfu8N8Xg/X6U6TxhlHsqki89PAc0Rm6cZQ7ZqEZJCPyaqLlmVqj7dR
	 08NT8j11q/eLg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 03/13] pinctrl: berlin: enable module build support
Date: Sun, 15 Nov 2026 18:23:42 +0800
Message-ID: <20261115102401.3520-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
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

For Android GKI + vendor_dlkm deployments, where vendor-specific
drivers must be kept separate from the GKI vmlinux and loaded as
modules from the vendor partition, we need to enable module build
support for berlin pinctrl drivers.

To acchive this goal:

1.Use devm_* APIs to alloc memory, so that we don't need to care free when
unloading.

2.Export two symbols which will be used by SoC pinctrl drivers.

3.Add MODULE_LICENSE and MODULE_DESCRIPTION

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/pinctrl/berlin/berlin.c | 27 ++++++++++++++-------------
 drivers/pinctrl/berlin/berlin.h | 15 +++++++++++++++
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 8a612ce2d1d3..a0ae75b1d705 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -215,7 +215,8 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	}
 
 	/* we will reallocate later */
-	pctrl->functions = kzalloc_objs(*pctrl->functions, max_functions);
+	pctrl->functions = devm_kcalloc(&pdev->dev, max_functions,
+					sizeof(*pctrl->functions), GFP_KERNEL);
 	if (!pctrl->functions)
 		return -ENOMEM;
 
@@ -230,13 +231,11 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 		}
 	}
 
-	new_functions = krealloc(pctrl->functions,
-				    pctrl->nfunctions * sizeof(*pctrl->functions),
-				    GFP_KERNEL);
-	if (!new_functions) {
-		kfree(pctrl->functions);
+	new_functions = devm_krealloc(&pdev->dev, pctrl->functions,
+				      pctrl->nfunctions * sizeof(*pctrl->functions),
+				      GFP_KERNEL);
+	if (!new_functions)
 		return -ENOMEM;
-	}
 
 	pctrl->functions = new_functions;
 	/* map functions to theirs groups */
@@ -257,20 +256,17 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 				function++;
 			}
 
-			if (!found) {
-				kfree(pctrl->functions);
+			if (!found)
 				return -EINVAL;
-			}
 
 			if (!function->groups) {
 				function->groups =
 					devm_kzalloc_objs(&pdev->dev,
 							  *function->groups,
 							  function->ngroups);
-				if (!function->groups) {
-					kfree(pctrl->functions);
+
+				if (!function->groups)
 					return -ENOMEM;
-				}
 			}
 
 			groups = (const char **)function->groups;
@@ -326,6 +322,7 @@ int berlin_pinctrl_probe_regmap(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(berlin_pinctrl_probe_regmap);
 
 int berlin_pinctrl_probe(struct platform_device *pdev,
 			 const struct berlin_pinctrl_desc *desc)
@@ -340,3 +337,7 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
 
 	return berlin_pinctrl_probe_regmap(pdev, desc, regmap);
 }
+EXPORT_SYMBOL_GPL(berlin_pinctrl_probe);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("pinctrl library for Synaptics SoCs");
diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index 7e7096842eda..8ff70d682593 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -20,6 +20,8 @@ struct berlin_desc_group {
 	u16				offset;
 	u8				bit_width;
 	u8				lsb;
+	u16				conf_offset;
+	u8				conf_bits;
 	struct berlin_desc_function	*functions;
 };
 
@@ -28,6 +30,19 @@ struct berlin_pinctrl_desc {
 	unsigned			ngroups;
 };
 
+#define BERLIN_PINCTRLCONF_GROUP(_name, _offset, _width, _lsb,		\
+		_conf_offset, _conf_bits, ...)				\
+	{								\
+		.name = _name,						\
+		.offset = _offset,					\
+		.bit_width = _width,					\
+		.lsb = _lsb,						\
+		.conf_offset = _conf_offset,				\
+		.conf_bits = _conf_bits,				\
+		.functions = (struct berlin_desc_function[]){		\
+			__VA_ARGS__, { } },				\
+	}
+
 #define BERLIN_PINCTRL_GROUP(_name, _offset, _width, _lsb, ...)		\
 	{								\
 		.name = _name,						\
-- 
2.55.0

