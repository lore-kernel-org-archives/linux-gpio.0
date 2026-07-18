Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA672618
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 04:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784348005; cv=none; b=o2s0hdPNqJV27E2JQ9zyPKAN08lAYvK7ojcsMa+r028J14n7qJ3+xonQbm0QkTxaUoLxPdM1M4B6cSX8Ahxc1Ov1x9OItLC8VmKFR9C23INZDwd9olrifNGLTUtG4YDdbCvk7YOSGlV4pyiwkVt0eI05Sji/PlezhMyygE+pW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784348005; c=relaxed/simple;
	bh=+uOYVVqYSVF49V3ivMdPmt1gR/QDDpfL74KRQtf71V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKBQhdNO/zqtj8vZy1KKTNEioOJ5dpjZPE6jke8GmhKp3cCiboEQpGCsVTa5eeuMcYyQlG4M51SF++JgWLzJiF0ZAaeM9nDqN5lwwIhGu/mrorUMW1Lsjut9yBFH54HZEcWdFs3bFhvOU/ZofMQgy9z5O01odr+AnHKlz6OUh8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOQ6C3Ef; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOQ6C3Ef"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e1a9d9105so4288568a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 21:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784348004; x=1784952804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiD18qvQiDb3f+7zvIPLMish2fN1UCqqfWGwuyBWBb4=;
        b=lOQ6C3EfQDLB7ddktWk5nI+zpRaXtBbx7izNNsZlnbtdrwG/QRJFMnYvfeao/AqiST
         PnyZF2g2kLyQaAIi6PZUGtLs+JtNKe6wHEEaUjMcpg6OneAeekrqnHnEkDUD8W4ylNvz
         qV/eUsP90k1U954gY78Lm8jSlp6qLiGt2scsN4XC7gVnLtRzJUxY6jBBwolDQ72toYws
         Tx92tsr2mTs8jOG3GR3pQCyxwbqAehZSceAPc+grloI76v/RbXD1gczDy7MZHfLrYk+9
         tNlEu49O+oNLi09NGDtyJRo7LTL4GzDjcMsMIces9OcL5BWKKlxEgcVxj31+CGUsn0Rb
         bugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784348004; x=1784952804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiD18qvQiDb3f+7zvIPLMish2fN1UCqqfWGwuyBWBb4=;
        b=rN4iJbzoLKdQvllMYn5vDbzYUwOrh+vOVMm30BbR1XMnYShj0/AP8bvICiKCjCe+VW
         G8kqmmyOcXTQXN6nLC7/XUqMPnFzOKMee1PwApxAIMemBFrfhABQFZHW4nkjD30FmQOy
         PEpyvlDaHFTaWEup8pAcSQ8373nvp4JVH007RN9jhZsI2dSg5UlGYHsWgR+hlfMwG3ZU
         coi8tOrhXByURtK2bwFtt2Zjjj/ukaM4ccwR3vidyVlxRjubPLtixcc3bi/z/Plr9gNn
         SI7/MIv3Ck19xRcVcQocqmYw/76HEWi9w6eJZA+TOcHZNrikP92cxxbs2bTm5oLTeuAZ
         nasg==
X-Gm-Message-State: AOJu0YysNjzJFC55ja4HVhcybm8vktLma27bawvasxGIIUodc9CudQiz
	NdYHqbxcQgzO0AH42gp0I214If6RTwoLINU+5EdHiPHTt2I/DmuqC3+yqG6Mdw==
X-Gm-Gg: AfdE7cmT0+qlUFYngOqhuXVnEftHC+TlgLAzUy/d9OmQsECgK9F4Z/dLV1dFfV6XydL
	S54UUzorQwtKLZbqM1+D4YvBU8pVpwfmX8WLfPqtY6kzCWCnfWsz6v+dJPQq29Ty6katoSz7uS/
	buXbW3yB1faWyWl076GpKSqGarWOnK3x6SxeZYuw+67vD86fB11d0IoW10jqUtRwDu+42bvQYDY
	JObNw6mhMlsJvmBL8GJ98tFQoJisCAMz+A8dTqBZya6KEISRnUrK30hyaapBzNYlUvYjjyc9e/m
	i+I+/tSrnetA7oVBF+d/b1a/oLJRl9TqiVdIy4YMGj3f+LTO48tuP0TlDmn6aZ2PVXygE+jp69Y
	yTroN51nnGcej9OfdNBewHX8zQu20A6bL8BapSt5b+VJ1XTreGgAfIBCPVWMHIQvxWC3sg4Oslt
	G785xNwWug308OnCDEhrjhmVNfVkynZF/8H8TC7pC2dutNNX6eOfVRiaWYK/dYfeboPUVVxMFke
	ttg
X-Received: by 2002:a17:90b:2496:b0:38e:6497:ca45 with SMTP id 98e67ed59e1d1-38e6497d57cmr305776a91.39.1784348003684;
        Fri, 17 Jul 2026 21:13:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7638:3cbc:f1c5:2eeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm11052109eec.17.2026.07.17.21.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 21:13:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] gpiolib: of: clean up formatting to pass checkpatch
Date: Fri, 17 Jul 2026 21:13:08 -0700
Message-ID: <20260718041311.2605172-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260718041311.2605172-1-dmitry.torokhov@gmail.com>
References: <20260718041311.2605172-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up parameter alignment, line wrapping, and parenthesis formatting
in drivers/gpio/gpiolib-of.c to make the module pass checkpatch --strict
without warnings or checks. This helps when one has checkpach configured
as a linter for their editor.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 46 +++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 67a36e3851a4..fb3b362744ec 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -135,8 +135,8 @@ of_find_gpio_device_by_xlate(const struct of_phandle_args *gpiospec)
 }
 
 static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
-					struct of_phandle_args *gpiospec,
-					enum of_gpio_flags *flags)
+						      struct of_phandle_args *gpiospec,
+						      enum of_gpio_flags *flags)
 {
 	int ret;
 
@@ -333,7 +333,7 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 		if (of_device_is_compatible(np_compat, gpios[i].compatible) &&
 		    !strcmp(propname, gpios[i].gpio_propname)) {
 			active_high = of_property_read_bool(np_propname,
-						gpios[i].polarity_propname);
+							    gpios[i].polarity_propname);
 			of_gpio_quirk_polarity(np, active_high, flags);
 			break;
 		}
@@ -415,7 +415,8 @@ static void of_gpio_flags_quirks(const struct device_node *np,
  * in flags for the GPIO.
  */
 static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
-		     const char *propname, int index, enum of_gpio_flags *flags)
+						  const char *propname, int index,
+						  enum of_gpio_flags *flags)
 {
 	struct of_phandle_args gpiospec;
 	struct gpio_desc *desc;
@@ -425,7 +426,7 @@ static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
 					     &gpiospec);
 	if (ret) {
 		pr_debug("%s: can't parse '%s' property of node '%pOF[%d]'\n",
-			__func__, propname, np, index);
+			 __func__, propname, np, index);
 		return ERR_PTR(ret);
 	}
 
@@ -967,8 +968,8 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		 * This is why we parse chip->of_gpio_n_cells + 1 cells
 		 */
 		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges",
-				chip->of_gpio_n_cells + 1,
-				index, &pinspec);
+						       chip->of_gpio_n_cells + 1,
+						       index, &pinspec);
 		if (ret)
 			break;
 
@@ -993,7 +994,7 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		 * right instance.
 		 */
 		if (chip->of_node_instance_match &&
-		    (chip->of_gpio_n_cells == 3) &&
+		    chip->of_gpio_n_cells == 3 &&
 		    !chip->of_node_instance_match(chip, pinspec.args[0]))
 			continue;
 
@@ -1006,12 +1007,11 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		if (count) {
 			/* npins != 0: linear range */
 			if (has_group_names) {
-				of_property_read_string_index(np,
-						group_names_propname,
-						index, &name);
+				of_property_read_string_index(np, group_names_propname,
+							      index, &name);
 				if (strlen(name)) {
 					pr_err("%pOF: Group name of numeric GPIO ranges must be the empty string.\n",
-						np);
+					       np);
 					break;
 				}
 			}
@@ -1028,41 +1028,35 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 			if ((offset + count) > chip->ngpio)
 				count = chip->ngpio - offset;
 
-			ret = gpiochip_add_pin_range(chip,
-					pinctrl_dev_get_devname(pctldev),
-					offset,
-					pin,
-					count);
+			ret = gpiochip_add_pin_range(chip, pinctrl_dev_get_devname(pctldev),
+						     offset, pin, count);
 			if (ret)
 				return ret;
 		} else {
 			/* npins == 0: special range */
 			if (pin) {
-				pr_err("%pOF: Illegal gpio-range format.\n",
-					np);
+				pr_err("%pOF: Illegal gpio-range format.\n", np);
 				break;
 			}
 
 			if (!has_group_names) {
 				pr_err("%pOF: GPIO group range requested but no %s property.\n",
-					np, group_names_propname);
+				       np, group_names_propname);
 				break;
 			}
 
-			ret = of_property_read_string_index(np,
-						group_names_propname,
-						index, &name);
+			ret = of_property_read_string_index(np, group_names_propname,
+							    index, &name);
 			if (ret)
 				break;
 
 			if (!strlen(name)) {
 				pr_err("%pOF: Group name of GPIO group range cannot be the empty string.\n",
-				np);
+				       np);
 				break;
 			}
 
-			ret = gpiochip_add_pingroup_range(chip, pctldev,
-						offset, name);
+			ret = gpiochip_add_pingroup_range(chip, pctldev, offset, name);
 			if (ret)
 				return ret;
 		}
-- 
2.55.0.229.g6434b31f56-goog

